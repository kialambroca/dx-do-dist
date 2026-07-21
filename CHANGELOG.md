## 7.0.1 (2026-07-21)

### 🚀 Features

- **agentic-gen:** isOneOf ratchet — imperative enum sites only move down
- **agentic-gen:** tool-manifest extraction + validate-grounding-refs (warn)
- **agentic-gen:** routing corpus section — the MCP-vs-Bash rule as data
- **agentic-gen:** unified dxdo:gen marker blocks
- **ci:** single-builder release workflows — build once, smoke exact, publish everywhere
- **claude:** one coherent dx-do plugin — hooks, foundation skill, tenant_info, queries module
- **cli:** agent-trustworthy CLI — guard verdict engine, tenant readOnly floor, non-TTY + pipe fixes
- **cli:** frictionless agentic onboarding — agentic setup, agentic doctor, config create fix
- **cli:** registry enrichment seams — invokeStructured, declarative args, lifecycle
- **cli:** identity cache — cold-start banner RPC eliminated on cache hit
- **cli:** command-search engine + search-quality fixture suite
- **cli:** help find / help describe + cli MCP module (cli_find, cli_describe)
- **cli:** queries list / get / run — saved-query store access from the CLI
- **cli:** deprecatedNote — the sunset + replacement pointer on deprecated commands
- **client:** SLI composition model — builders, invariants, previews, delete
- **corpus:** the operate activity — operator flow, operations cookbooks, alert-linkage lexicon, operator skill
- **corpus:** entity-type→metrics bridge — the missing recipe behind 'which X is slowest?'
- **corpus:** metric.attr.metric_name in the entity-type→metrics bridge — exact-match, no regex
- **corpus:** lexicon synonyms[] + commandGroups[] — task vocabulary for command search
- **harness:** e2e catalogs for the 6 uncovered groups + group↔catalog parity check
- **harness:** the release gate — versioned prompt suite + fatal drift validators
- **harness:** model observability + pinning
- **harness:** config-coherent assertion — the split-brain regression guard
- **harness:** projection A/B machinery — env arm lever + arm-verified cell driver
- **harness:** projection A/B burn 1 — transcript-based arm verification + report
- **harness:** direct-demand suite prompts for projection burn 2
- **harness:** projection A/B burn 2 — direct demand yields full adoption
- **harness+cli:** AGR-P6 groundwork — audit lint rules, effort metrics, upcoming-maintenance prompt
- **mcp:** external-module seam + cli module id
- **mcp+cli:** in-process projection runner behind surface=experiment
- **release:** verify-release preflight — predicts complete-cli-(ga|beta) success
- **release:** tool-manifest freshness check + dist-less gate harness — #181 #201
- **release:** bin/duplicate-release.sh — internal release = download + republish
- **release:** bin/ship.sh — one-command release day with a typed post-CI challenge
- **release:** bin/install-release.sh — install a released binary from zoobroker
- **release:** one-line curl installer for the customer channel
- **sli:** full group lifecycle — compose, tune, inspect, remove, delete
- **sli:** zero-match filter diagnosis — exonerate real uncataloged fields, flag likely typos
- **tenant:** new command group — tenant maintenance reads the Broadcom status page
- **tooling:** per-group CLI test shortcut — npm run test-command-group
- **uapd:** unified-alert-pipeline-driver premise probe — 15s metric publisher with stepped values
- **uapd:** full driver — scenario-encoded matrix with setup/publish/verify/teardown phases
- **uapd:** tier N — NEQ escalation-hypothesis discrimination cells
- **uapd:** package-local tools + thin phase scripts — residue checker and alarm inspector
- **uapd:** HTML run report + full execution-process README
- **uapd:** tier S — closeWithNoData / silence semantics
- **uapd:** tier K — ANY/ALL combineOperator over 3-metric groupings
- **uapd:** recovery phase — every run now drives its alarms closed before ending

### 🩹 Fixes

- **agentic-gen:** release gate validates COMMITTED state — #189 beta-publish failure
- **agentic-gen:** gate resolves workspace imports from committed src — #189 round 3
- **cli:** Claude-interaction polish — json purity, listing exit codes, guard redirects, tenant line
- **cli:** plugin tenant binding — read persisted pluginConfigs when spawn env lacks the dialog value; rename dialog to 'dx-do profile'
- **cli:** typecheck burn-down — workspace goes green
- **cli:** truthful existence checks + targeted retries for the gate flake
- **cli:** retry marks via a typed wrapper — bun's options object vs jest-style types
- **cli:** DXDO_CONFIG_ALIAS honored by the config loader + tenant selection surfaced to agents
- **cli:** bun bundle targets depend on session-core:build — #189 round 4
- **cli:** bare-group usage listing no longer advertises deprecated commands
- **cli:** valid MutationClass in group-listing test — unblocks the gate typecheck
- **corpus:** un-orphan universe/service/application entity docs + extend the leak guard
- **corpus:** route named-service state questions to the service management surface
- **deps:** npm audit → 0 vulnerabilities — hey-api 0.99 + scoped js-yaml override
- **deps:** resolve npm audit advisories (6 high, 1 low -> 0)
- **harness:** release-gate report travels with the push
- **harness:** harness-now guards tracked changes only
- **harness:** empty MODEL_ARGS expansion under set -u on bash 3.2
- **harness:** release gate enforces suite coverage; per-unit time/token deltas
- **harness:** stem lexer no longer parses shell redirections as commands
- **harness:** tenant-stated-first no longer counts grounding reads as tenant work
- **installer:** per-architecture detection with Rosetta handling
- **mcp:** single writer per dist + typecheck ordering; session-core publish guard — #210 #207
- **release:** verify-release checks node_modules sync — #189 round 2
- **release:** job timeouts on all workflows + explicit tag-push remote — #223 #205
- **release:** explicit release.projects — session-core rejoins lockstep versioning
- **release:** duplicate-release resume message says what it does
- **sli:** finish the column↔filter-field alignment — sourceName and attributeName
- **uapd:** verify severity from alarm lifecycle events — NEQ 'never escalates' was a measurement artifact
- **uapd:** match alarms by alert-name prefix — ALL-combine alarms carry no host field
- **ui:** dead validation display, dropped --unknown styling, CSS comment swallowing; warning-clean build — #212 #213

### 🔥 Performance

- **harness:** concurrent suite fan-out + evaluator manifest cache + codesign skip

### 💅 Refactors

- **build:** graph-native ordering — ^build targetDefaults + edge diet
- **build:** cacheable generation targets with complete inputs
- **build:** single writer per dist + dist-less gate green — #217 #201
- **build:** npmjs-native lockfile — the registry split-brain ends
- **build:** retire install-npmjs — plain npm ci everywhere; gate guards the lockfile registry
- **ci:** delete workflow Build-lists — the graph orders the build
- **claude-plugin:** skills thin rewrite — generated routing table + discoverability contract
- **cli:** rename agent.readOnly → top-level readOnly on tenant profiles
- **cli:** declarative-enum retrofit sweep 1 — 33 isOneOf sites become enumValues
- **cli:** AGR-P3 curation marks — 41 agent-hidden + 29 deprecated
- ⚠️  **cli:** rename agentic setup → agentic setup-claude
- **cli:** bundle.mjs version injection + graph-native build bodies
- ⚠️  **mcp:** 7.0 MCP breaking window — curated-core cleanup
- **release:** complete-cli-* ends at the tag push — publishing leaves the laptop
- **session-core:** extract session + handlers + query store from ui
- **sli:** SLI-group nomenclature — the top-level construct is a group of SLIs/SLOs/alerts
- **uapd:** single shared source per run — cells differentiated by attribute name

### 📖 Documentation

- three stale-claim fixes from the audit (AGR-P0)
- dependency diagrams + package docs for @dx-do/session-core
- base docs learn the AGR-P2..P5 surface + nightly launchd installer
- add @dx-do/analytics to the root CLAUDE.md packages table
- **agr:** record the projection hybrid decision + detector playbook
- **build:** verify-release preflight section
- **build:** BUILD.md rewritten wholesale for the single-builder topology
- **corpus:** lexicon commandGroups repoint graph → tas
- **harness:** how to add an agentic integration test
- **internal:** Service Universe design note — HAR-grounded API surface for 7.0
- **internal:** BUSR design intent draft — single-builder + graph-native target design
- **internal:** BUSR design doc approved — phases filed (P2 #214, P3 #215, P4 #216)
- **plans:** README self-references updated to docs/plans
- **release:** regenerate the release anatomy from the live beta.4 run
- **skills:** repoint dead packages/client/bin/queries refs (AGR-P0)
- **skills:** replace python3 extraction examples with jq (AGR-P0)
- **skills:** cli-commands learns the AGR-P1/TSG-P1 authoring rules
- **uapd:** alerting-pipeline test matrix — 62 cells across type/operator/resolution/periods/lifecycle tiers
- **uapd:** ground the matrix in live API shapes — resolution=frequency(ms), MAJOR=warningThreshold, CRITICAL=errorThreshold
- **uapd:** metric attributes schema — waveform behavior in description, verified round-trip
- **uapd:** tier B answered — 15s data evaluates correctly at 60s and 6m alert resolutions
- **uapd:** HIGHLIGHTS.md — shareable campaign summary incl. the NEQ severity discovery
- **uapd:** closeWithNoData answered — tier S 4/4 green with measured close timing
- **uapd:** combo1 findings — ANY is per-metric alarms; ALL never fires (candidate pipeline bug)
- **uapd:** ALL false-fires re-attributed to new-metric membership-resolution lag
- **uapd:** package CLAUDE.md — tier-authoring recipe, empirical rules, and the debug order
- **uapd:** spell out the build model — nothing to build, one client-build prerequisite, no typecheck gate
- **uapd:** original plan document for the unified alert-pipeline driver
- **ui:** PrimeNG version ceiling — 21.x is the MIT line, never cross it

### ✅ Tests

- **cli:** agentic e2e catalog — read-only smokes (AGR-P0)
- **cli:** search fixtures robust to suite-order registry drift

### ⚠️  Breaking Changes

- **cli:** rename agentic setup → agentic setup-claude
- **mcp:** 7.0 MCP breaking window — curated-core cleanup
  the MCP tool discovery_services is removed (use
  discovery_service_hierarchy — its byName keys are the flat name list)
  and module.ui no longer parses (use module.queries). After upgrading:
  re-run 'dx-do agentic setup', then reconnect the MCP in your host.
  'dx-do agentic doctor' flags stale installs.
  Closes #76, #77, #78, #79, #80, #81 (AGR-P4, epic #33) — manual close
  on merge, base is beta.
  Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
  Claude-Session: https://claude.ai/code/session_01HEihYZXXukKsckLFp6rcP9

### ❤️ Thank You

- Claude Fable 5
- z

## 7.0.1-beta.6 (2026-07-18)

This was a version bump only, there were no code changes.

## 7.0.1-beta.5 (2026-07-18)

### 🚀 Features

- **release:** bin/ship.sh — one-command release day with a typed post-CI challenge
- **release:** bin/install-release.sh — install a released binary from zoobroker
- **release:** one-line curl installer for the customer channel

### 🩹 Fixes

- **release:** duplicate-release resume message says what it does

### 💅 Refactors

- **build:** retire install-npmjs — plain npm ci everywhere; gate guards the lockfile registry

### 📖 Documentation

- **build:** BUILD.md rewritten wholesale for the single-builder topology
- **release:** regenerate the release anatomy from the live beta.4 run
- **ui:** PrimeNG version ceiling — 21.x is the MIT line, never cross it

### ❤️ Thank You

- Claude Fable 5
- z

## 7.0.1-beta.4 (2026-07-17)

### 🚀 Features

- **ci:** single-builder release workflows — build once, smoke exact, publish everywhere
- **release:** tool-manifest freshness check + dist-less gate harness — #181 #201
- **release:** bin/duplicate-release.sh — internal release = download + republish

### 🩹 Fixes

- **cli:** bare-group usage listing no longer advertises deprecated commands
- **cli:** valid MutationClass in group-listing test — unblocks the gate typecheck
- **harness:** stem lexer no longer parses shell redirections as commands
- **mcp:** single writer per dist + typecheck ordering; session-core publish guard — #210 #207
- **release:** job timeouts on all workflows + explicit tag-push remote — #223 #205
- **release:** explicit release.projects — session-core rejoins lockstep versioning
- **ui:** dead validation display, dropped --unknown styling, CSS comment swallowing; warning-clean build — #212 #213

### 💅 Refactors

- **build:** graph-native ordering — ^build targetDefaults + edge diet
- **build:** cacheable generation targets with complete inputs
- **build:** single writer per dist + dist-less gate green — #217 #201
- **build:** npmjs-native lockfile — the registry split-brain ends
- **ci:** delete workflow Build-lists — the graph orders the build
- **cli:** bundle.mjs version injection + graph-native build bodies
- **release:** complete-cli-* ends at the tag push — publishing leaves the laptop

### 📖 Documentation

- **internal:** BUSR design intent draft — single-builder + graph-native target design
- **internal:** BUSR design doc approved — phases filed (P2 #214, P3 #215, P4 #216)

### ❤️ Thank You

- Claude Fable 5
- z

## 7.0.1-beta.3 (2026-07-16)

This was a version bump only, there were no code changes.

## 7.0.1-beta.2 (2026-07-15)

### 🚀 Features

- **agentic-gen:** isOneOf ratchet — imperative enum sites only move down
- **agentic-gen:** tool-manifest extraction + validate-grounding-refs (warn)
- **agentic-gen:** routing corpus section — the MCP-vs-Bash rule as data
- **agentic-gen:** unified dxdo:gen marker blocks
- **cli:** registry enrichment seams — invokeStructured, declarative args, lifecycle
- **cli:** identity cache — cold-start banner RPC eliminated on cache hit
- **cli:** command-search engine + search-quality fixture suite
- **cli:** help find / help describe + cli MCP module (cli_find, cli_describe)
- **cli:** queries list / get / run — saved-query store access from the CLI
- **cli:** deprecatedNote — the sunset + replacement pointer on deprecated commands
- **corpus:** lexicon synonyms[] + commandGroups[] — task vocabulary for command search
- **harness:** e2e catalogs for the 6 uncovered groups + group↔catalog parity check
- **harness:** the release gate — versioned prompt suite + fatal drift validators
- **harness:** model observability + pinning
- **harness:** config-coherent assertion — the split-brain regression guard
- **harness:** projection A/B machinery — env arm lever + arm-verified cell driver
- **harness:** projection A/B burn 1 — transcript-based arm verification + report
- **harness:** direct-demand suite prompts for projection burn 2
- **harness:** projection A/B burn 2 — direct demand yields full adoption
- **harness+cli:** AGR-P6 groundwork — audit lint rules, effort metrics, upcoming-maintenance prompt
- **mcp:** external-module seam + cli module id
- **mcp+cli:** in-process projection runner behind surface=experiment
- **release:** verify-release preflight — predicts complete-cli-(ga|beta) success

### 🩹 Fixes

- **agentic-gen:** release gate validates COMMITTED state — #189 beta-publish failure
- **agentic-gen:** gate resolves workspace imports from committed src — #189 round 3
- **cli:** typecheck burn-down — workspace goes green
- **cli:** truthful existence checks + targeted retries for the gate flake
- **cli:** retry marks via a typed wrapper — bun's options object vs jest-style types
- **cli:** DXDO_CONFIG_ALIAS honored by the config loader + tenant selection surfaced to agents
- **cli:** bun bundle targets depend on session-core:build — #189 round 4
- **corpus:** un-orphan universe/service/application entity docs + extend the leak guard
- **corpus:** route named-service state questions to the service management surface
- **deps:** npm audit → 0 vulnerabilities — hey-api 0.99 + scoped js-yaml override
- **harness:** release-gate report travels with the push
- **harness:** harness-now guards tracked changes only
- **harness:** empty MODEL_ARGS expansion under set -u on bash 3.2
- **harness:** release gate enforces suite coverage; per-unit time/token deltas
- **release:** verify-release checks node_modules sync — #189 round 2

### 🔥 Performance

- **harness:** concurrent suite fan-out + evaluator manifest cache + codesign skip

### 💅 Refactors

- **claude-plugin:** skills thin rewrite — generated routing table + discoverability contract
- **cli:** declarative-enum retrofit sweep 1 — 33 isOneOf sites become enumValues
- **cli:** AGR-P3 curation marks — 41 agent-hidden + 29 deprecated
- ⚠️  **cli:** rename agentic setup → agentic setup-claude
- ⚠️  **mcp:** 7.0 MCP breaking window — curated-core cleanup
- **session-core:** extract session + handlers + query store from ui

### 📖 Documentation

- three stale-claim fixes from the audit (AGR-P0)
- dependency diagrams + package docs for @dx-do/session-core
- base docs learn the AGR-P2..P5 surface + nightly launchd installer
- **agr:** record the projection hybrid decision + detector playbook
- **build:** verify-release preflight section
- **corpus:** lexicon commandGroups repoint graph → tas
- **harness:** how to add an agentic integration test
- **plans:** README self-references updated to docs/plans
- **skills:** repoint dead packages/client/bin/queries refs (AGR-P0)
- **skills:** replace python3 extraction examples with jq (AGR-P0)
- **skills:** cli-commands learns the AGR-P1/TSG-P1 authoring rules

### ✅ Tests

- **cli:** agentic e2e catalog — read-only smokes (AGR-P0)
- **cli:** search fixtures robust to suite-order registry drift

### ⚠️  Breaking Changes

- **cli:** rename agentic setup → agentic setup-claude
- **mcp:** 7.0 MCP breaking window — curated-core cleanup
  the MCP tool discovery_services is removed (use
  discovery_service_hierarchy — its byName keys are the flat name list)
  and module.ui no longer parses (use module.queries). After upgrading:
  re-run 'dx-do agentic setup', then reconnect the MCP in your host.
  'dx-do agentic doctor' flags stale installs.
  Closes #76, #77, #78, #79, #80, #81 (AGR-P4, epic #33) — manual close
  on merge, base is beta.

### ❤️ Thank You

- Claude Fable 5
- z

## 7.0.1-beta.1 (2026-07-12)

### 🚀 Features

- **claude:** one coherent dx-do plugin — hooks, foundation skill, tenant_info, queries module
- **cli:** agent-trustworthy CLI — guard verdict engine, tenant readOnly floor, non-TTY + pipe fixes
- **cli:** frictionless agentic onboarding — agentic setup, agentic doctor, config create fix
- **client:** SLI composition model — builders, invariants, previews, delete
- **corpus:** the operate activity — operator flow, operations cookbooks, alert-linkage lexicon, operator skill
- **corpus:** entity-type→metrics bridge — the missing recipe behind 'which X is slowest?'
- **corpus:** metric.attr.metric_name in the entity-type→metrics bridge — exact-match, no regex
- **sli:** full group lifecycle — compose, tune, inspect, remove, delete
- **sli:** zero-match filter diagnosis — exonerate real uncataloged fields, flag likely typos
- **tenant:** new command group — tenant maintenance reads the Broadcom status page
- **tooling:** per-group CLI test shortcut — npm run test-command-group
- **uapd:** unified-alert-pipeline-driver premise probe — 15s metric publisher with stepped values
- **uapd:** full driver — scenario-encoded matrix with setup/publish/verify/teardown phases
- **uapd:** tier N — NEQ escalation-hypothesis discrimination cells
- **uapd:** package-local tools + thin phase scripts — residue checker and alarm inspector
- **uapd:** HTML run report + full execution-process README
- **uapd:** tier S — closeWithNoData / silence semantics
- **uapd:** tier K — ANY/ALL combineOperator over 3-metric groupings
- **uapd:** recovery phase — every run now drives its alarms closed before ending

### 🩹 Fixes

- **cli:** Claude-interaction polish — json purity, listing exit codes, guard redirects, tenant line
- **cli:** plugin tenant binding — read persisted pluginConfigs when spawn env lacks the dialog value; rename dialog to 'dx-do profile'
- **sli:** finish the column↔filter-field alignment — sourceName and attributeName
- **uapd:** verify severity from alarm lifecycle events — NEQ 'never escalates' was a measurement artifact
- **uapd:** match alarms by alert-name prefix — ALL-combine alarms carry no host field

### 💅 Refactors

- **cli:** rename agent.readOnly → top-level readOnly on tenant profiles
- **sli:** SLI-group nomenclature — the top-level construct is a group of SLIs/SLOs/alerts
- **uapd:** single shared source per run — cells differentiated by attribute name

### 📖 Documentation

- **internal:** Service Universe design note — HAR-grounded API surface for 7.0
- **uapd:** alerting-pipeline test matrix — 62 cells across type/operator/resolution/periods/lifecycle tiers
- **uapd:** ground the matrix in live API shapes — resolution=frequency(ms), MAJOR=warningThreshold, CRITICAL=errorThreshold
- **uapd:** metric attributes schema — waveform behavior in description, verified round-trip
- **uapd:** tier B answered — 15s data evaluates correctly at 60s and 6m alert resolutions
- **uapd:** HIGHLIGHTS.md — shareable campaign summary incl. the NEQ severity discovery
- **uapd:** closeWithNoData answered — tier S 4/4 green with measured close timing
- **uapd:** combo1 findings — ANY is per-metric alarms; ALL never fires (candidate pipeline bug)
- **uapd:** ALL false-fires re-attributed to new-metric membership-resolution lag
- **uapd:** package CLAUDE.md — tier-authoring recipe, empirical rules, and the debug order
- **uapd:** spell out the build model — nothing to build, one client-build prerequisite, no typecheck gate
- **uapd:** original plan document for the unified alert-pipeline driver

### ❤️ Thank You

- Claude Fable 5
- z

## 7.0.1-beta.0 (2026-07-07)

This was a version bump only, there were no code changes.

# 7.0.0 (2026-07-07)

### 🚀 Features

- **cli:** add command safety/usage frontmatter, safe-mode gate, and help commands-json
- **cli:** classify all commands with safety/usage frontmatter
- **cli:** add help commands-safety-md generator + committed safety reference
- **cli:** add service-universe command group (list/get/create/update/delete/export)
- ⚠️  **cli:** replace o2-universe command group with service-universe
- **cli:** verify services exist before service-universe create/update
- **cli:** add service-universe add-access / remove-access (user & group access)
- **cli:** verify user exists before service-universe add-access (users only)
- **client:** add ServiceUniverseService + Zod models (service universes)

### ⚠️  Breaking Changes

- **cli:** replace o2-universe command group with service-universe
  the `o2-universe` command group (list/create/export/services)
  is removed. Use the new `service-universe` group instead:
    o2-universe list      → service-universe list
    o2-universe export    → service-universe get / export
    o2-universe services  → service-universe get
    o2-universe create    → service-universe create
  The O2UniverseService client + models are kept (axa servicify + ui discovery
  still depend on them). Corpus cookbooks/entities and the safety reference are
  updated to point at service-universe; the o2-universe e2e test is removed.
  Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
  Claude-Session: https://claude.ai/code/session_01HEihYZXXukKsckLFp6rcP9

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z

## 6.4.0 (2026-07-06)

### 🩹 Fixes

- **cli:** change onlyLatest to default true flag argument
- **cli:** correct acc list-bundles latest-version ordering across the YYYY->YY change
- **cli:** change arguments  default false flag arguments
- **deps:** resolve npm audit vulnerabilities (14 high -> 0)
- **security:** redact auth tokens from HTTP error logging

### 💅 Refactors

- **cli:** port channel and dashboard commands to buildCommand
- **cli:** port axa, vertex, experience, apm-universe commands to buildCommand
- **cli:** port managementmodule, help, graph, config commands to buildCommand
- **cli:** port service, metric, metrex, trace, perspective, o2-universe, nass to buildCommand
- **cli:** port auth, topographer, tas, sql, jsextension, situation, attribute, asm to buildCommand

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z
- zoobroker

## 6.3.5 (2026-07-01)

### 🩹 Fixes

- **cli:** de-duplicate repeated validation error messages

### 💅 Refactors

- **cli:** port acc/agent/alarm commands to buildCommand

### ❤️ Thank You

- Claude Sonnet 5
- Ki Alam

## 6.3.4 (2026-06-30)

### 🚀 Features

- **cli:** add `wql analyze` command + ts() selector extractor
- **nassql:** add WQL source op (model, query editor, cookbook)
- **nassql:** query-range editor + `wql query` CLI command

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- Ki Alam

## 6.3.3 (2026-06-27)

### 🚀 Features

- **maintenance:** add DXO2 maintenance window commands and MaintenanceService

### ❤️ Thank You

- Claude Opus 4.8
- z

## 6.3.2 (2026-06-26)

### 🚀 Features

- **sli:** add SLI list/export/import commands and SLIService
- **sli:** add include-service and exclude-service commands

### 🩹 Fixes

- **sli:** block import of SLIs bound to multiple services

### ❤️ Thank You

- Claude Opus 4.8
- z

## 6.3.1 (2026-06-25)

### 🚀 Features

- **auth:** add 'auth list-users' command
- **auth:** model ess users v2 and switch list-users to it

### 📖 Documentation

- **all:** create claude resources from cursor skills/rules and improve contributing.md

### ❤️ Thank You

- Claude Opus 4.8
- z

## 6.3.0 (2026-06-24)

### 🚀 Features

- **service:** add create/associate/dissociate/export/import + content editing commands

### 📖 Documentation

- **cli:** fix copy-pasted help text in alarm/event create commands

### ❤️ Thank You

- Claude Opus 4.8
- Claude Opus 4.8 (1M context)
- z

## 6.2.3 (2026-06-14)

### 🩹 Fixes

- **client:** treat empty-string log fields as omitted in temp_fields

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z

## 6.2.2 (2026-06-12)

### 🚀 Features

- **cli:** add dashboard-list-by-meta command

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z

## 6.2.1 (2026-06-08)

### 🚀 Features

- **cli:** add nass register-and-report and report-by-id commands

### ❤️ Thank You

- Claude Sonnet 4.6 (1M context)
- Ki Alam

## 6.2.0 (2026-06-06)

### 🚀 Features

- add blob file store/fetch/delete commands

### 🩹 Fixes

- **cli:** enforce requiredArgument presence in command validation
- **cli:** require message for log ingest

### 💅 Refactors

- **client:** zod-ify NASS store + log-ingest models/services

### 📖 Documentation

- make Zod the documented route for DataStore models/services
- **client:** add .describe() field docs to audit + features models
- **client:** add .describe() field docs to views + tokens models
- **client:** add .describe() field docs to states + blobstorage models

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z
- zoobroker

## 6.1.1 (2026-06-05)

### 💅 Refactors

- **client,cli:** improve log ingest API with typed LogIngestOptions

### ❤️ Thank You

- Claude Sonnet 4.6 (1M context)
- Ki Alam

## 6.1.0 (2026-06-05)

### 🚀 Features

- log ingestion and DataStore write operations
- **client,cli:** DataStore write client for NASS, Metrics Metadata, and TAS store-graph; port nass/tas write commands to buildCommand
- **client,cli:** add direct log ingestion via DXO2 uim_logs pipeline

### 🩹 Fixes

- **deps:** npm audit fix

### 📖 Documentation

- **cli:** add dxLogIngestionURL to configuration help and readme fragment
- **cli:** add dxLogIngestionURL to readme footer fragment

### ❤️ Thank You

- Claude Sonnet 4.6
- Claude Sonnet 4.6 (1M context)
- Ki Alam

## 6.0.4 (2026-06-04)

### 🩹 Fixes

- **ci:** avoid pipefail SIGPIPE in publish-payload guard
- **deps:** resolve npm audit vulnerabilities

### 💅 Refactors

- **cli:** port dashboard-list-by-folder to buildCommand
- **cli:** port folder-list to buildCommand
- **cli:** port dashboard-variables-list and dashboard-search to buildCommand
- **cli:** port high-benefit dashboard commands to buildCommand
- **cli:** add resolveFolderFromArgs utility; port folder commands to 3-way lookup
- **cli:** spread resolveFolderArguments in all folder-scoped commands
- **cli:** move resolveFolderArguments into folder.util and spread in add-folder-tags

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- Claude Sonnet 4.6
- Ki Alam
- z

## 6.0.3 (2026-06-04)

### 🚀 Features

- **cli:** rewrite embedded dashboard links on folder-import for cross-tenant moves

### 🩹 Fixes

- **ci:** publish-payload guard inspects the real tarball, not npm pack --json

### ❤️ Thank You

- Claude Opus 4.8 (1M context)
- z

## 6.0.2 (2026-06-04)

### 🚀 Features

- **cli:** add flagArgument with defaults, default-value note, auto-boolean
- **cli,client:** APM alert + metricgrouping CRUD parity
- **cli/output:** inter-row separators when any row wraps in wrap mode
- **client,corpus,ui:** ground metric typeEnum bitmask + metricId↔entity round-trips
- **corpus,client,mcp:** teach investigator to size + project minimally before authoring
- **mcp,ui,corpus,client:** read-only alarm surface for the investigator agent
- **ui:** query-editor UX pass — copy path, dirty guard, add-above, field help, FILTER_EXPR + WINDOW_CALENDAR + MM SERVICE pickers
- **ui:** column suggestions for standalone aggregate ops
- **ui:** dedicated ORDER op editor
- **ui:** keep home page alive across navigation; unblock main thread during cose
- **ui:** smarter defaults + load-from-saved-query for NASSQL source ops
- **ui,cli:** surface build version in the sidebar

### 🩹 Fixes

- **cli:** correct misleading "optional argument" error for missing required args
- **cli:** repair alert update-simple/update-summary + add field-by-field tests
- **cli:** emit canonical bare-REGEX shape for APM metricgrouping create
- **cli:** use non-conflicting bundle in acc lifecycle test
- **cli/build:** scope README auto-commit + repair broken exit-code checks
- **client:** drop accidental @dx-do/source export re-add
- **release:** publish-{beta,ga} only ship util/client/cli, not corpus/analytics/metrex-api
- **release:** post-release-push uses 'git push -u all HEAD'
- **ui:** page no longer leaves a blank band below the viewport

### 💅 Refactors

- **cli/managementmodule:** port create + delete to buildCommand
- **ui:** cleanup pass — shared discovery widget, op-helpers, centralized EMPTY_COLUMN_HINTS

### 📖 Documentation

- mirror analytics build into GA workflow + new-package checklist
- restore Build analytics in beta + workflow-mirror invariant
- **cli:** add createCommand→buildCommand porting guide + tenant/testing/util sections
- **plans:** migrate v6 wrap-up plan into plans/z (inaugural committed plan)

### 📦 Build

- **repo:** commit plan-mode plans in-repo, per-user via plansDirectory
- **repo:** replace postinstall with explicit `npm run setup-development`

### ✅ Tests

- **cli:** replace __dirname fixture path with JSON-import + tmp materializer
- **cli:** fail-closed approved-tenant guard for e2e (bun test preload)

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- Claude Opus 4.8 (1M context)
- Duane Nielsen
- z

## 6.0.1-beta.7 (2026-05-15)

### 🚀 Features

- **client,corpus,ui:** ground metric typeEnum bitmask + metricId↔entity round-trips
- **corpus,client,mcp:** teach investigator to size + project minimally before authoring
- **mcp,ui,corpus,client:** read-only alarm surface for the investigator agent
- **ui:** query-editor UX pass — copy path, dirty guard, add-above, field help, FILTER_EXPR + WINDOW_CALENDAR + MM SERVICE pickers
- **ui:** column suggestions for standalone aggregate ops
- **ui:** dedicated ORDER op editor
- **ui:** keep home page alive across navigation; unblock main thread during cose
- **ui:** smarter defaults + load-from-saved-query for NASSQL source ops
- **ui,cli:** surface build version in the sidebar

### 🩹 Fixes

- **release:** remove npm publish from beta, rename publish to prepublish
- **ui:** page no longer leaves a blank band below the viewport

### 💅 Refactors

- **ui:** cleanup pass — shared discovery widget, op-helpers, centralized EMPTY_COLUMN_HINTS

### 📖 Documentation

- restore Build analytics in beta + workflow-mirror invariant

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- Ki Alam
- z

## 6.0.1-beta.6 (2026-05-12)

### 📖 Documentation

- mirror analytics build into GA workflow + new-package checklist

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- z

## 6.0.1-beta.5 (2026-05-12)

This was a version bump only, there were no code changes.

## 6.0.1-beta.4 (2026-05-12)

This was a version bump only, there were no code changes.

## 6.0.1-beta.3 (2026-05-12)

This was a version bump only, there were no code changes.

## 6.0.1-beta.2 (2026-05-12)

### 🚀 Features

- **cli:** add flagArgument with defaults, default-value note, auto-boolean
- **cli,client:** APM alert + metricgrouping CRUD parity
- **cli/output:** inter-row separators when any row wraps in wrap mode

### 🩹 Fixes

- **cli:** correct misleading "optional argument" error for missing required args
- **cli:** repair alert update-simple/update-summary + add field-by-field tests
- **cli:** emit canonical bare-REGEX shape for APM metricgrouping create
- **cli:** use non-conflicting bundle in acc lifecycle test
- **client:** drop accidental @dx-do/source export re-add

### 💅 Refactors

- **cli/managementmodule:** port create + delete to buildCommand

### 📖 Documentation

- **cli:** add createCommand→buildCommand porting guide + tenant/testing/util sections

### ✅ Tests

- **cli:** replace __dirname fixture path with JSON-import + tmp materializer

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- Duane Nielsen
- z

## 6.0.1-beta.1 (2026-05-10)

This was a version bump only, there were no code changes.

## 6.0.1-beta.0 (2026-05-10)

### 🚀 Features

- **cli/output:** inter-row separators when any row wraps in wrap mode

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- z

# 6.0.0 (2026-05-10)

### 🚀 Features

- **analytics+ui+mcp+cli:** DXO2 Service Diagnostics
- **catalog:** F1+F2+F3 from agentic foray #1
- **catalog:** M4.1 first wave — investigator-flow grounding (3 entities + 4 cookbooks)
- **catalog:** M3.8 — backfill descriptions on all 29 catalog queries
- **catalog,cli-ui:** move bundled cookbooks into @dx-do/catalog as section #2 (M3.6 commit #5)
- **catalog,cli-ui:** metric-source-names cookbook + scope-axis precedence + run_query reconnaissance nudge
- **catalog,client:** move queries into @dx-do/catalog/queries/all + register section (M3.6 commit #4)
- **claude+mcp:** /test-dxdo-claude-integration harness + DXDO_BIN override + summarize_query_result + lenient run_query.payload
- **claude/investigate:** set DXDO_ENABLE_EXPERIMENTAL_COMMANDS in MCP-server spawn env
- **cli:** add agentic catalog-{sections,section-index,entry} commands
- **cli:** experimental command gate (Stage 4 of 4)
- **cli:** width-aware table output with key spanning + per-column color
- **cli,claude:** embed plugins + agentic extract-claude-plugins command
- **cli,cli-ui:** M3.7 — `dx-do agentic mcp` standalone (stdio MCP server)
- **cli,cli-ui:** per-module MCP permissions (replaces mcpUi=read|write)
- **cli,cli-ui,catalog:** embed SPA + catalog data into the Bun binary
- **cli-ui:** scaffold M1 UI server shell — Fastify + Angular tenant picker
- **cli-ui:** M2.1 backend — query store + TAS execute + layers discovery
- **cli-ui:** M2.2 frontend shell + configAlias rename + config switcher
- **cli-ui:** auto-switch to Run tab when run is triggered
- **cli-ui:** M2.3 visual TAS editor — zod-form + recursive op tree
- **cli-ui:** per-layer attribute discovery + IN-operator value picker
- **cli-ui:** chip-style values input + number serialization for ATTRIBUTE
- **cli-ui:** SERVICE op editor with discovery-driven multiselect
- **cli-ui:** all 31 TAS filter ops in the visual editor
- **cli-ui:** JSON5 query files with inline /* */ descriptions
- **cli-ui:** list rows show description above id, right-rail shows pure JSON
- **cli-ui:** M2.4 — Metadata tab, new-query dialog, Cmd+S, polish
- **cli-ui:** rename Run→Results tab, dim when empty, flag stale results
- **cli-ui:** M2 polish — validation errors, orphan layers, dialogs, comment hint
- **cli-ui:** M2.5 — folder support in left rail (storage + UI)
- **cli-ui:** M3.1 — Metrics Metadata editor end-to-end
- **cli-ui:** MM results table — show metric id as the first column
- **cli-ui:** M3.2 — NASSQL editor end-to-end
- **cli-ui:** M3.3 — partial-run primitive + right-pane Source/Results/Debug
- **cli-ui:** extend run_query preflight guard to NASSQL + Metrics Metadata
- **cli-ui,catalog:** generic catalog_* MCP tools (3) replace per-section tools (4) (M3.6 commit #6)
- **cli-ui,catalog:** M3.8 remainder — empty-payload guard, capability probe, cookbook reorg
- **cli-ui,catalog:** discovery_universes MCP tool — APM + O2 in one call, name-first
- **cli-ui,catalog:** discovery_service_hierarchy MCP tool — DAG view of services
- **cli-ui,cli:** cookbooks dir + agentic CLI group with log-gotcha
- **cli-ui,cli:** M3.5 — MCP server with 18 tools (single-tenant)
- **cli-ui,plugin:** M3.9 + M4.2 + M4.4 — deferred-tool front door, investigator skill, plugin scaffold
- **client:** add acc delete-package command
- **client:** add six read-only acc package commands
- **client:** add typed acc create-package command
- **client:** add acc add-package-bundles and set-bundle-property
- **corpus+cli+mcp:** grounding improvements — entities catalog, lexicon section, investigation cookbooks + schema/learn-tenant CLI
- **corpus/queries:** TAS analytics — COLLECT_COUNTS + COLLECT_ATTRIBUTES patterns
- **home-graph:** scale to large tenants — entity-count gate + service picker
- **home-graph:** per-type random outline+border, drop underlays, new shapes
- **mcp:** expose three UI shortcuts as MCP tools
- **skills:** add datastore-query-author skill with shared knowledge cookbooks
- **ui:** home-page TAS graph viz + sidebar shell + style editor
- **ui/home-graph:** SUBSERVICE + MONITORED_BY edges, TYPE:NAME labels, cose layout
- **ui/home-graph:** canvas PNG download + hide DXO2_SERVICE labels by default
- **ui/nassql-editor:** GROUP / AGG / KEEP / TOP / BOTTOM dedicated visual editors
- **ui/nassql-editor:** hybrid static + empirical column-name hints for GROUP / KEEP / TOP / BOTTOM / AGG inner rows
- **ui/nassql-editor:** alias-prefixed column variants in hints + dedicated SCRIPT op editor
- **ui/nassql-editor:** pipeline-based attribute probe for FROM / FROM_DATA + metric.id in static cols
- **ui/nassql-editor:** "Run JUST this step" button on FROM / FROM_METADATA + default SCRIPT template
- **ui/output:** Raw response tab + per-attribute multiselect columns in TAS results table
- **ui/queries-list:** filter input + scrollable list + 2-line description clamp + type-tag-first layout
- **ui/queries-list:** sort by mtime desc per folder + refresh button
- **ui/queries-list:** per-row mtime next to the id footer
- **ui/tas-editor:** wrap-in-parent-op affordance + op-note moved below selector
- **ui/tas-editor:** numeric chips for array<number> fields + top-level options expansion
- **ui/tas-editor:** STATUS op visual editor + corpus gotcha for state-filter no-op
- **ui/tas-editor:** TRAVERSE op visual editor (per-step recipe + recursive next-chain + inner vertex/edge filter editors)

### 🩹 Fixes

- **build:** postinstall seeds packages/cli/src/generated/embedded-assets.ts on fresh clones
- **build:** generate-embedded-assets ensures OUT_DIR exists before write
- **claude/investigate:** plugin.json `author` must be an object, not a string
- **cli:** getVersion() type-guards BUILD_VERSION substitution against non-string values
- **cli,claude:** extract a self-contained marketplace, install via /plugin slash commands
- **cli-ui:** unfreeze the visual editor on array-field ops + LAYER multiselect
- **cli-ui:** default MM clamp=500 + results-table overflow no longer pushes panes
- **cli-ui:** embedded SPA mime type derived from file path, not URL
- **client:** correct acc createPackage URL and accPostFile path resolution
- **client:** strip server-managed fields from createPackage payload
- **client:** correct acc createPackage URL and accPostFile path resolution
- **client:** strip server-managed fields from createPackage payload
- **ui/nassql-editor:** import NgTemplateOutlet so the alias field actually renders + surface alias on FROM_TABLE / JOIN_DATA

### 💅 Refactors

- **claude:** @dx-do/claude — one package, marketplace + per-activity plugins
- **cli:** migrate acc package-lifecycle commands to buildCommand
- **cli:** rename extract-claude-plugins → extract-claude-marketplace
- **cli-ui:** extract <dx-string-chips> and replace every p-autocomplete chip input
- **corpus:** rename @dx-do/catalog → @dx-do/corpus (Stage 1 of 4)
- **mcp:** extract MCP infrastructure to @dx-do/mcp package (Stage 3 of 4)
- **ui:** rename @dx-do/cli-ui → @dx-do/ui (Stage 2 of 4)

### 📖 Documentation

- rewrite BUILD.md with current build, release & publishing topology
- clarify public remote role and common dev build command in BUILD.md
- post-M3.6/M3.7 cleanup pass — fix stale refs
- **all:** create claude resources from cursor skills/rules and improve contributing.md
- **cli:** document experimental gate in help configuration + README script opens gate
- **cli:** refine help configuration + README invocation patterns + experimental gate section
- **cli,cli-ui:** add `dx-do help agentic-mcp` + dev/testing notes
- **cli,cli-ui:** add `dx-do help ui` + help-doc update rules
- **cli-ui:** capture M2.3 patterns + PrimeNG 21 gotchas in CLAUDE.md
- **cli-ui:** rewrite MCP section for the @dx-do/catalog era (M3.6 commit #7)
- **cli-ui:** tighten CLAUDE.md — drop drift + condense overlap
- **corpus:** sanitize cookbooks for "universal only" + expand published catalog + symlink-pair skills
- **corpus:** NASSQL grounding refresh — alias-as-reference-scope, GROUP context-dependent collapse, FROM-isolation diagnostic, SCRIPT signature, metric.id everywhere, TOP/BOTTOM defaults
- **corpus/gotchas:** NASSQL — `alias` does NOT prefix output column names
- **corpus/tas:** includeStatus + states[] response shape — full reference + numeric mapping + sa://sa_status rollup
- **cursor-research:** capture May 2026 Cursor 2.5 plugin findings + refresh docs index
- **datastore/cookbooks:** refresh all three cookbooks with authoritative JSDoc pointers and schema corrections
- **datastore/metrics-metadata:** comprehensive JSDoc + .describe() for all Metrics Metadata schemas
- **datastore/nassql:** comprehensive JSDoc + .describe() for all NASSQL operation and predicate schemas
- **datastore/tas:** comprehensive JSDoc + .describe() for all TAS filter, query, and response schemas
- **ui:** hard-won conventions from the home-graph build, ready for reuse

### ✅ Tests

- **cli:** add acc package lifecycle e2e and smoke entries

### ❤️ Thank You

- Claude Opus 4.7 (1M context)
- Cursor
- Duane Nielsen
- Ki Alam
- z

## 5.2.44 (2026-05-01)

### 🚀 Features

- **client+cli:** implement audit query endpoint with proper schema and add audit query CLI command

### ❤️ Thank You

- Ki Alam

## 5.2.43 (2026-05-01)

### 🚀 Features

- **client,cli:** add layer discovery to DataStoreTASService and inventory layers command

### 🩹 Fixes

- **ci:** reset LASTEXITCODE after Windows smoke test binary invocation

### ❤️ Thank You

- Ki Alam

## 5.2.42 (2026-05-01)

### 🩹 Fixes

- **cli:** pass --no-config to dx-do in generate-readme.sh to prevent CI hang

### ❤️ Thank You

- Ki Alam

## 5.2.41 (2026-04-30)

### 🚀 Features

- add datastore-query-library skill for iterative query authoring
- **client:** add deep query library for demo-prod tenant
- **client:** add 6 DataStore service clients (states, views, audit, blob storage, tokens, features)
- **client+cli:** expose DataStore TAS/NASSQL/MetricsMetadata in monolith and migrate tas query-json + nass query commands

### 🩹 Fixes

- **cli:** include previousMMId in o2-alert update save body
- **client+cli:** correct o2-alert delete body shape and add chained o2 e2e test

### 📖 Documentation

- **rules:** add release-and-publishing rule capturing dual-remote/dual-publish topology
- **skill:** augment datastore-query-library with discovery-first workflow
- **skill:** clarify query-org rules in datastore-query-library

### ❤️ Thank You

- Duane Nielsen
- Ki Alam

## 5.2.40 (2026-04-30)

### 🩹 Fixes

- **ci:** write build.env to workspace root for standalone Nx target invocation

### 📖 Documentation

- **cli:** add step-by-step comments to o2-* command execution functions

### ❤️ Thank You

- Ki Alam

## 5.2.39 (2026-04-30)

### 📖 Documentation

- **client:** add JSDoc for datastore services to aid AI coding assistants

### 📦 Build

- add cross-platform binary smoke tests to CI

### ❤️ Thank You

- Ki Alam

## 5.2.38 (2026-04-30)

### 🚀 Features

- **client:** restrict PlatformAlert resolution, operator, and combinationMode types

### 🩹 Fixes

- **cli:** missing e2e tests added

### ❤️ Thank You

- Ki Alam

## 5.2.37 (2026-04-30)

### 🚀 Features

- **cli:** add o2-managementmodule CRUD commands and buildCommand cursor rule
- **cli:** add o2-metricgrouping and o2-alert CRUD commands
- **client:** add DataStore Zod models, services, JSON schemas, and validation driver
- **client:** add platform management module, metric grouping, and alert models and services

### 📖 Documentation

- **client:** api docs generation v1
- **client:** api docs generation v1
- **client:** regenerate API documentation

### ❤️ Thank You

- Ki Alam

## 5.2.36 (2026-04-25)

### 🚀 Features

- **build:** added gh distribution command
- **cli:** lexicological improvement for usage with claude

### ❤️ Thank You

- Ki Alam

## 5.2.35 (2026-04-25)

### 🩹 Fixes

- **build:** disable tui for project entirely

### ❤️ Thank You

- Ki Alam

## 5.2.34 (2026-04-25)

### 🩹 Fixes

- **client:** missing comma in package.json

### 📖 Documentation

- **client:** add README with configuration and usage patterns

### ❤️ Thank You

- Ki Alam

## 5.2.33 (2026-04-25)

This was a version bump only, there were no code changes.

## 5.2.32 (2026-04-25)

### 🚀 Features

- **build:** prepare for github.com release chapter 2, improve diagnostics for test.
- **build:** prepare for github.com release chapter 2, improve diagnostics for test.
- **build:** prepare for github.com release chapter 2, improve diagnostics for test.
- **build:** prepare for github.com release chapter 2, improve diagnostics for test.
- **build:** prepare for github.com release chapter 2, improve diagnostics for test.
- **build:** fixing nx complete publish and github action build dependencies.

### ❤️ Thank You

- Ki Alam

## 5.2.31 (2026-04-24)

### 🚀 Features

- **build:** prepare for github.com release chapter 2, improve diagnostics for test.

### ❤️ Thank You

- Ki Alam

## 5.2.30 (2026-04-24)

### 🚀 Features

- **build:** prepare for github.com release chapter 2, improve diagnostics for test.

### ❤️ Thank You

- Ki Alam

## 5.2.29 (2026-04-24)

### 🚀 Features

- **build:** prepare for github.com release chapter 2
- **build:** prepare for github.com release chapter 2
- **build:** prepare for github.com release chapter 2
- **build:** prepare for github.com release chapter 2
- **build:** prepare for github.com release chapter 2, improve diagnostics for test.

### ❤️ Thank You

- Ki Alam

## 5.2.28 (2026-04-24)

### 🚀 Features

- **build:** prepare for github.com release
- **cli+client:** add simple inventory/service lookup functions

### ❤️ Thank You

- Ki Alam

## 5.2.27 (2026-04-01)

### 🚀 Features

- **cli+client:** add inventorize crud

### ❤️ Thank You

- Ki Alam

## 5.2.26 (2026-03-22)

### 🚀 Features

- **cli:** new service slis list command
- **client:** new service sli api

### ❤️ Thank You

- Ki Alam

## 5.2.25 (2026-03-18)

### 🚀 Features

- **cli:** new inventory attributes and metrics commands
- **client:** new inventory attributes and metrics methods for InventoryService

### ❤️ Thank You

- Ki Alam

## 5.2.24 (2026-03-10)

### 🚀 Features

- **cli:** new inventory search command
- **client:** new inventory service with initial search

### ❤️ Thank You

- Ki Alam

## 5.2.23 (2026-03-08)

### 🚀 Features

- **cli:** service overview and metrics commands
- **client:** service overview and metrics surface

### ❤️ Thank You

- Ki Alam

## 5.2.22 (2026-02-28)

### 🚀 Features

- **cli:** situation summary command to show ai summary
- **client:** provided access to situation ai summary

### ❤️ Thank You

- Ki Alam

## 5.2.21 (2026-02-18)

### 🚀 Features

- **cli:** improve user search results

### ❤️ Thank You

- Ki Alam

## 5.2.20 (2026-02-14)

### 🚀 Features

- **cli:** add create (non-change) event command
- **client:** add create (non-change) event

### 🩹 Fixes

- **cli:** fix spurious warnings for ignored prefix arguments from new command builder

### 📖 Documentation

- **client:** basic jsdoc

### ❤️ Thank You

- Ki Alam

## 5.2.19 (2026-02-13)

### 🚀 Features

- **cli:** add custom and custom_num field support
- **client:** add create alarm via jarvis to event service
- **client:** add create alarm and added custom field support to create change event also.

### ❤️ Thank You

- Ki Alam

## 5.2.18 (2026-02-13)

### 🚀 Features

- **cli:** added commands for creating and querying change events
- **client:** create change events v1
- **client:** model and service for creating and querying change events
- **client:** added additional header support to oiPost

### 🩹 Fixes

- **cli:** ensure command builder respects argument changes for output handler

### ❤️ Thank You

- Ki Alam

## 5.2.17 (2026-02-10)

### 🩹 Fixes

- **client:** more reliable postman output on exit even if error

### ❤️ Thank You

- Ki Alam

## 5.2.16 (2026-02-07)

### 🩹 Fixes

- **client:** add id to LogEntry union

### ❤️ Thank You

- Ki Alam

## 5.2.15 (2026-02-05)

### ✅ Tests

- **cli:** split tests for axa

### ❤️ Thank You

- Ki Alam

## 5.2.14 (2026-02-05)

This was a version bump only, there were no code changes.

## 5.2.13 (2026-02-04)

### 🩹 Fixes

- **cli:** treat log query severities as optional

### ❤️ Thank You

- Ki Alam

## 5.2.12 (2026-02-01)

### 🩹 Fixes

- **util:** simplified / clarified frequency calcuation

### ❤️ Thank You

- Ki Alam

## 5.2.11 (2026-02-01)

### 🚀 Features

- **cli:** added related alarm frequency analysis

### 🩹 Fixes

- **build:** added clarification of audit skipping

### ❤️ Thank You

- Ki Alam

## 5.2.10 (2026-02-01)

### 🚀 Features

- **cli:** get related alarms for alarm

### ❤️ Thank You

- Ki Alam

## 5.2.9 (2026-01-31)

### 🚀 Features

- **cli:** get related alarms for alarm

### ❤️ Thank You

- Ki Alam

## 5.2.8 (2026-01-29)

### 🩹 Fixes

- **cli:** use severities argument for log query

### ❤️ Thank You

- Ki Alam

## 5.2.7 (2026-01-29)

This was a version bump only, there were no code changes.

## 5.2.6 (2026-01-28)

### 🩹 Fixes

- **client:** improve situation alarm type

### ❤️ Thank You

- Ki Alam

## 5.2.5 (2026-01-28)

### 🩹 Fixes

- **client:** annotate webhook trigger body with alarmType="situation"

### ❤️ Thank You

- Ki Alam

## 5.2.4 (2026-01-28)

### 🚀 Features

- **cli:** add alarm webhook triggerring

### ❤️ Thank You

- Ki Alam

## 5.2.3 (2026-01-28)

### 🩹 Fixes

- **cli:** test deadline extension

### ❤️ Thank You

- Ki Alam

## 5.2.2 (2026-01-28)

### 🚀 Features

- **cli:** trigger webhook notification for situations

### ❤️ Thank You

- Ki Alam

## 5.2.1 (2026-01-27)

### 🩹 Fixes

- **test:** increase timeout for alert tests because of API slowness

### ❤️ Thank You

- Ki Alam

## 5.2.0 (2026-01-27)

This was a version bump only, there were no code changes.

## 5.1.26 (2026-01-27)

### 🩹 Fixes

- **cli): use v2 services for mm, mg, alert, calculator feat(core:** implement v2 services for mm, mg, alert, calculator

### ❤️ Thank You

- Ki Alam

## 5.1.25 (2026-01-25)

### 🚀 Features

- **cli): added service dependency-graph v1 feat(client:** added service.getDependencyGraph

### ❤️ Thank You

- Ki Alam

## 5.1.24 (2026-01-18)

### 🩹 Fixes

- **cli): use latest APIs for alerts and managementmodules fix(client:** use latest APIs for alerts and managementmodules

### ❤️ Thank You

- Ki Alam

## 5.1.23 (2026-01-15)

### 🩹 Fixes

- **cli:** make audit skipping flag compatible with mac version of bash

### ❤️ Thank You

- Ki Alam

## 5.1.22 (2026-01-14)

### 🚀 Features

- **cli): added blob fetch fix(cli:** better optional argument support

### ❤️ Thank You

- Ki Alam

## 5.1.21 (2026-01-14)

### 🚀 Features

- **cli): added blob query and blob schema list feat(client:** added initial blob metadata support

### ❤️ Thank You

- Ki Alam

## 5.1.20 (2026-01-13)

### 🩹 Fixes

- **cli): change rfc to iso for 8601 Duration references fix(cli:** remove spurious file extension from report command

### ❤️ Thank You

- Ki Alam

## 5.1.19 (2026-01-11)

### 🚀 Features

- **cli:** better default duration for time parsing for more commands

### ❤️ Thank You

- Ki Alam

## 5.1.18 (2026-01-10)

### 🚀 Features

- **cli:** added relativeStartDuration only parsing

### ❤️ Thank You

- Ki Alam

## 5.1.17 (2026-01-09)

### ✅ Tests

- **cli:** updated tests for user search

### ❤️ Thank You

- Ki Alam

## 5.1.16 (2026-01-09)

### 🚀 Features

- **cli:** user search output fix + better logging, and added continuation

### 📖 Documentation

- **core:** moved nest projects to @dx-nest

### 📦 Build

- **core:** update publish mechanics with better naming
- **core:** update publish mechanics with correct command
- **core:** remove alternate public publish commands

### ❤️ Thank You

- Ki Alam

## 5.1.15 (2026-01-07)

### 📦 Build

- **core:** update publish mechanics

### ❤️ Thank You

- Ki Alam

## 5.1.14 (2026-01-07)

### 📖 Documentation

- **util:** removed default README

### ❤️ Thank You

- Ki Alam

## 5.1.13 (2026-01-07)

This was a version bump only, there were no code changes.

## 5.1.12 (2026-01-07)

This was a version bump only, there were no code changes.

## 5.1.11 (2026-01-04)

This was a version bump only, there were no code changes.

## 5.1.10 (2026-01-04)

### 🩹 Fixes

- **cli:** fix and add tests for skip prefix arguments
- **cli:** fix test from broken refactoring

### 📦 Build

- **core): add npm whoami to pre-version fix(cli:** re-home sample command to test
- **main:** fix automated artifact release / upload

### ✅ Tests

- **cli:** moved new sample for buildCommand to test and ignored in barrel generation.
- **cli:** more complete sample

### ❤️ Thank You

- Ki Alam

## 5.1.10-beta.2 (2026-01-03)

### 🩹 Fixes

- **cli:** fix and add tests for skip prefix arguments

### ✅ Tests

- **cli:** more complete sample

### ❤️ Thank You

- Ki Alam

## 5.1.10-beta.1 (2025-12-27)

### 📦 Build

- **core): add npm whoami to pre-version fix(cli:** re-home sample command to test

### ❤️ Thank You

- Ki Alam

## 5.1.10-beta.0 (2025-12-27)

### 📦 Build

- **main:** fix automated artifact release / upload

### ✅ Tests

- **cli:** moved new sample for buildCommand to test and ignored in barrel generation.

### ❤️ Thank You

- Ki Alam

## 5.1.9 (2025-12-24)

### 📦 Build

- **main:** flushing out build control
- **main:** first streamlined build and release

### ❤️ Thank You

- Ki Alam

## 5.1.9-beta.0 (2025-12-24)

### 📦 Build

- **main:** flushing out build control

### ❤️ Thank You

- Ki Alam

## 5.1.8 (2025-12-23)

### 📦 Build

- **main:** adding build control to package.json for posterity

### ❤️ Thank You

- Ki Alam

## 5.1.7 (2025-12-23)

### 🚀 Features

- **cli:** removed command groups and introduced barrel initialization for commands
- **cli:** removed command groups and introduced barrel initialization for commands
- **metrex:** repatriated metrex + topographer from uber repo.

### 🩹 Fixes

- **cli:** Ensure barrel generation doesn't go badly

### 📖 Documentation

- **cli:** documented cross platform build download stuff

### ✅ Tests

- **metrex:** completed e2e test with sample data

### ❤️ Thank You

- Ki Alam

## 5.1.7-beta.0 (2025-12-23)

### 🚀 Features

- **cli:** removed command groups and introduced barrel initialization for commands
- **cli:** removed command groups and introduced barrel initialization for commands
- **metrex:** repatriated metrex + topographer from uber repo.

### 🩹 Fixes

- **cli:** Ensure barrel generation doesn't go badly

### ✅ Tests

- **metrex:** completed e2e test with sample data

### ❤️ Thank You

- Ki Alam

## 5.1.6 (2025-12-21)

### 📦 Build

- **cli:** updated package contents

### ❤️ Thank You

- Ki Alam

## 5.1.5 (2025-12-21)

### 📦 Build

- **cli:** generate readme re-enabled from uber repo
- **cli:** updated readme generation resources

### ❤️ Thank You

- Ki Alam

## 5.1.4 (2025-12-20)

### 📦 Build

- **core:** Add conventional commits types

### ❤️ Thank You

- Ki Alam

## 5.1.3 (2025-12-20)

### 🚀 Features

- **core:** Added context to readme + other documentation

### ❤️ Thank You

- Ki Alam

