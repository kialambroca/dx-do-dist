# dx-do-mono: monorepo for dx-do 

✨ long overdue dependency, test, publishing cleanup to accelerate AI development ✨.

* new single file `dx-do` binary for multiple platforms (no more node / npm dependency)
* preserves npx execution with `@dx-do/cli` 
* splits high-level model & service API into it's own ESM/CJS package: `@dx-do/client`
* drastically improved tests (author's note: I had no idea what I was doing 4 years ago when I started dx-do)
* cursor/gemini AI-friendly structure


## Overall project structure

| package                | description                                               | build notes             |
|------------------------|-----------------------------------------------------------|-------------------------|
| `@dx-do/util`          | common utility classes used by multiple upstream packages | nx build                |
| `@dx-do/client`        | hybrid CJS/ESM client API                                 | nx build                |
| `@dx-do/cli`           | bun and npx CLI client                                    | nx build / nx build-dev |
| `@dx-do/cli-e2e`       | external tests for current platform binary                | nx build                |
| `@dx-do/metrex-api`    | hybrid CJS/ESM implementation of metrex API               | nx build                |

## TODO: How to use

### Should cover build, test and release + commit messages and feature 
