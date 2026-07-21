#!/usr/bin/env bash
#
# dx-do installer — installs the dx-do CLI binary from GitHub Releases.
#
#   curl -fsSL https://raw.githubusercontent.com/kialambroca/dx-do-dist/main/install.sh | bash
#
#   ... | bash -s -- --beta              newest beta pre-release instead of GA
#   ... | bash -s -- --version 7.0.2     exact version
#   ... | bash -s -- --dir "$HOME/bin"   install directory (default /usr/local/bin;
#                                        Windows Git Bash default: $HOME/bin)
#
# Works on macOS (Apple silicon), Linux (x64), and Windows via Git Bash.
# Downloads with curl, so the binary never receives the browser quarantine
# flags (macOS Gatekeeper "damaged" dialog, Windows SmartScreen mark).
#
# Source of truth: packages/cli/src/resources/installer/install.sh in
# dx-do-mono; published to the dx-do-dist repo by the release workflows.

set -euo pipefail

REPO="kialambroca/dx-do-dist"
API="https://api.github.com/repos/${REPO}"

FLAVOR="ga"
VERSION=""
OPT_DIR=""

usage() {
  grep '^#   ' "$0" 2>/dev/null || true
  echo "usage: install.sh [--beta] [--version <v>] [--dir <install-dir>]" >&2
}

while [ $# -gt 0 ]; do
  case "$1" in
    --beta) FLAVOR="beta"; shift ;;
    --version) VERSION="${2:?--version needs a value}"; shift 2 ;;
    --version=*) VERSION="${1#--version=}"; shift ;;
    --dir) OPT_DIR="${2:?--dir needs a value}"; shift 2 ;;
    --dir=*) OPT_DIR="${1#--dir=}"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage; exit 2 ;;
  esac
done

OS="$(uname -s)"
ARCH="$(uname -m)"
PLATFORM="${OS}-${ARCH}"
EXE=""
case "$PLATFORM" in
  Darwin-arm64)  ASSET="dx-do-macos-arm64" ;;
  Darwin-x86_64)
    # An Apple-silicon Mac running a Rosetta-translated shell reports
    # x86_64; the native arm64 binary is still the right install there.
    if [ "$(sysctl -n sysctl.proc_translated 2>/dev/null)" = "1" ]; then
      ASSET="dx-do-macos-arm64"
    else
      echo "unsupported: Intel Mac — dx-do ships for Apple silicon (arm64) only" >&2
      exit 1
    fi ;;
  Linux-x86_64)  ASSET="dx-do-linux-x64" ;;
  Linux-aarch64|Linux-arm64)
    echo "unsupported: Linux ${ARCH} — dx-do ships for Linux x64 only" >&2
    exit 1 ;;
  MINGW*x86_64|MSYS*x86_64|CYGWIN*x86_64) ASSET="dx-do-windows-x64.exe"; EXE=".exe" ;;
  MINGW*|MSYS*|CYGWIN*)
    echo "unsupported: Windows ${ARCH} — dx-do ships for Windows x64 only" >&2
    exit 1 ;;
  *) echo "unsupported platform: ${PLATFORM} (supported: macOS arm64, Linux x64, Windows x64 via Git Bash)" >&2
     exit 1 ;;
esac

if [ -n "$VERSION" ]; then
  # current tag scheme is release/<v>; releases before 7.0.1-beta.4 used v<v>
  TAG=""
  for cand in "release/${VERSION}" "v${VERSION}"; do
    enc="$(printf '%s' "$cand" | sed 's|/|%2F|g')"
    if curl -fsSL -o /dev/null "${API}/releases/tags/${enc}" 2>/dev/null; then
      TAG="$cand"
      break
    fi
  done
  if [ -z "$TAG" ]; then
    echo "version ${VERSION} not found on ${REPO} — see https://github.com/${REPO}/releases" >&2
    exit 1
  fi
elif [ "$FLAVOR" = "beta" ]; then
  # newest pre-release; tag_name precedes prerelease in each release object.
  # awk must consume the full stream (found-flag, no early exit) — exiting
  # early SIGPIPEs curl mid-response, which pipefail turns into a failure.
  TAG="$(curl -fsSL "${API}/releases?per_page=30" \
    | awk -F'"' '/"tag_name":/ { tag = $4 } /"prerelease": *true/ && !found { print tag; found = 1 }')"
else
  TAG="$(curl -fsSL "${API}/releases/latest" \
    | awk -F'"' '/"tag_name":/ && !found { print $4; found = 1 }')"
fi
if [ -z "${TAG:-}" ]; then
  echo "could not resolve a ${FLAVOR} release from ${API}" >&2
  exit 1
fi
VERSION="${TAG#release/}"
VERSION="${VERSION#v}"

echo "installing dx-do v${VERSION} (${ASSET})"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

curl -fL --progress-bar -o "${WORKDIR}/${ASSET}" \
  "https://github.com/${REPO}/releases/download/${TAG}/${ASSET}"

if curl -fsSL -o "${WORKDIR}/SHA256SUMS" \
     "https://github.com/${REPO}/releases/download/${TAG}/SHA256SUMS" 2>/dev/null; then
  if command -v sha256sum >/dev/null 2>&1; then SHACMD="sha256sum"; else SHACMD="shasum -a 256"; fi
  (cd "$WORKDIR" && grep "[[:space:]]${ASSET}\$" SHA256SUMS | $SHACMD -c -)
else
  echo "WARNING: ${TAG} publishes no SHA256SUMS — skipping checksum verification" >&2
fi

chmod +x "${WORKDIR}/${ASSET}"
OUTPUT="$("${WORKDIR}/${ASSET}" --no-config 2>&1 || true)"
case "$OUTPUT" in
  *"dx-do v${VERSION} "*) ;;
  *) echo "downloaded binary failed its smoke test (expected 'dx-do v${VERSION}'):" >&2
     echo "$OUTPUT" | head -3 >&2
     exit 1 ;;
esac

if [ -n "$OPT_DIR" ]; then
  DEST_DIR="$OPT_DIR"
elif [ -n "$EXE" ]; then
  DEST_DIR="$HOME/bin"
else
  DEST_DIR="/usr/local/bin"
fi
DEST="${DEST_DIR}/dx-do${EXE}"

mkdir -p "$DEST_DIR" 2>/dev/null || true
if [ -w "$DEST_DIR" ]; then
  cp "${WORKDIR}/${ASSET}" "$DEST"
  chmod 755 "$DEST"
elif command -v sudo >/dev/null 2>&1; then
  echo "(sudo required to write ${DEST_DIR})"
  sudo install -m 0755 "${WORKDIR}/${ASSET}" "$DEST"
else
  echo "${DEST_DIR} is not writable and sudo is unavailable — re-run with --dir <writable-dir>" >&2
  exit 1
fi

if [ "$OS" = "Darwin" ]; then
  xattr -c "$DEST" 2>/dev/null || true
  command -v codesign >/dev/null 2>&1 && codesign --force --sign - "$DEST" 2>/dev/null || true
fi

echo "installed: ${DEST}"
case ":$PATH:" in
  *":${DEST_DIR}:"*) ;;
  *) echo "NOTE: ${DEST_DIR} is not on your PATH — add it, or re-run with --dir" >&2 ;;
esac
"$DEST" --no-config 2>&1 | head -1 || true
