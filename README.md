# dx-do

#### Command-line execution of DXO2 SaaS operations

***

## Install

**One-line install** (macOS Apple silicon, Linux x64, Windows via Git Bash):

```
curl -fsSL https://raw.githubusercontent.com/kialambroca/dx-do-dist/main/install.sh | bash
```

* Latest beta instead of GA: `curl -fsSL https://raw.githubusercontent.com/kialambroca/dx-do-dist/main/install.sh | bash -s -- --beta`
* Exact version: `... | bash -s -- --version 7.0.2`
* Custom install directory (no sudo needed): `... | bash -s -- --dir "$HOME/bin"`

The installer picks the right binary from [GitHub Releases](https://github.com/kialambroca/dx-do-dist/releases), verifies its SHA-256 checksum, and installs it as `dx-do` on your PATH. Because it downloads with `curl`, the binary arrives without the browser quarantine flag that would otherwise make macOS report it as "damaged".

### Manual download

1. Download the binary for your platform from the [releases page](https://github.com/kialambroca/dx-do-dist/releases)
2. Rename it to `dx-do` (`dx-do.exe` on Windows), make it executable (`chmod +x` on macOS/Linux), and put it on your PATH
3. Browser-downloaded binaries are quarantined by the OS — clear that **before** the first launch:
   * **macOS**: `xattr -d com.apple.quarantine ./dx-do-macos-arm64` — otherwise Gatekeeper reports the binary as "damaged and can't be opened" (the download is fine; if you already launched it once, delete the file and re-download)
   * **Windows**: `Unblock-File dx-do-windows-x64.exe` in PowerShell, if SmartScreen objects
   * **Linux**: nothing to clear

## Usage

The first time you run, an interactive setup will create <USER_HOME>/.dxdo/default.dxo2.config.json; you can have multiple configurations.  the "--config=<config>" has the following resolution:


| variation                                 | resolution                             |
|-------------------------------------------|----------------------------------------|
| No Config Specified                       | `~/.dxdo/default.dx02.config.json`     |
| `--config=tenant-name`                    | `~/.dxdo/tenant-name.dx02.config.json` |
| `--config=tenant-name.dx02.config.json`   | `~/.dxdo/tenant-name.dx02.config.json` |                                      |
| `--config=./tenant-name.dx02.config.json` | `<CWD>/tenant-name.dx02.config.json`   |                                     

### Full configuration options are available by running 

```dx-do --no-config help configuration```

```
dx-do <--config=<config-file>> command-group command <parameter>=<value>
```



#### Output

```
ℹ  info      dx-do v7.3.0 on node v26.3.0 on linux-x64 via node (ssl: 1.1.0)
⚠  warning   Not loading configuration
✖  error     Usage: dx-do --option[=value]... <command-group> <command> <command-param>=<value>...
⚠  warning   no tenant profile configured — run 'dx-do config create alias=default gatewayHost=... userToken=... cohortId=...'
```


### Command Groups

#### alarm
```alarm
⤜ acknowledge.......................................: acknowledges an alarm
⤜ create-alarm......................................: creates an alarm via jarvis ingestion
⤜ detail............................................: dumps alarm details
⤜ lifecycle.........................................: shows alarm lifecycle
⤜ related...........................................: gets related alarms
⤜ trigger-webhook...................................: triggers a webhook for an alarm
⤜ analyze...........................................: shows counts of alarm by [source product] and managementmodule / type
⤜ assign............................................: assigns an alarm to a troubleshooter
⤜ bulk-lifecycle....................................: shows alarm lifecycle
⤜ clear.............................................: clears an alarm
⤜ explain-enrichment-rules..........................: gives an simplified explanation of enrichment rules
⤜ list-enrichment-rules.............................: lists alarm enrichment rules
⤜ list-queues.......................................: lists alarm queues
⤜ queue-detail......................................: dumps queue details
⤜ list..............................................: lists alarms
⤜ unacknowledge.....................................: unacks an alarm
⤜ update-field......................................: updates an alarm field
```
#### dashboard
```dashboard
⤜ add-dashboard-tags................................: adds tags to a dashboard
⤜ folder-add-permission.............................: adds folder permission for a user by email or userId
⤜ add-folder-tags...................................: adds tags to all dashboards in a folder
⤜ folder-create.....................................: creates a folder
⤜ dashboard-export..................................: exports a single dashboard
⤜ dashboard-import..................................: creates a new dashboard from an export file.
⤜ dashboard-list-by-meta............................: lists every dashboard whose meta.<field> matches one of the given values
⤜ dashboard-list-by-folder..........................: lists dashboards in folder
⤜ dashboard-search..................................: finds dashboards
⤜ dashboard-update..................................: updates a dashboard from an export file.
⤜ user-search.......................................: finds dashboard users
⤜ dashboard-variables-list..........................: shows current values of dashboard variables
⤜ folder-details....................................: show details for folder
⤜ folder-export.....................................: exports a folder and all dashboards in it.
⤜ folder-import.....................................: imports a folder and its dashboards from an export file.
⤜ get-dashboard-refresh-options.....................: shows current dashboard refresh options
⤜ get-dashboard-tags................................: shows current dashboard tags
⤜ folder-permissions................................: gets permissions for a folder
⤜ get-theme.........................................: shows the current theme
⤜ folder-list.......................................: show id/uid/title of all folders.
⤜ replace-dashboard-tags............................: replaces tags for a dashboard
⤜ replace-folder-tags...............................: replaces tags for all dashboards in a folder
⤜ set-dashboard-refresh-options.....................: sets dashboard refresh options
⤜ set-folder-refresh-options........................: sets refresh options for all dashboards in folder
⤜ set-theme.........................................: sets the current theme
⤜ summarize-dashboard-tags..........................: shows a summary of all dashboards' tags.
⤜ user-list.........................................: looks up a user by email
```
#### acc
```acc
⤜ add-package-bundles...............................: attaches bundles to a package (single PATCH, no draft/publish dance)
⤜ bundle-details....................................: gets bundle details
⤜ create-package....................................: creates a new ACC package from typed args (UI new-package wizard equivalent)
⤜ delete-package....................................: deletes a package
⤜ download-bundle...................................: downloads bundle
⤜ download-package..................................: downloads a server-assembled tenant-stamped agent package tarball
⤜ export-packages...................................: exports packages to a file
⤜ import-bundle.....................................: import bundle from a bundle tar.gz file
⤜ import-packages...................................: import packages from an export file
⤜ initialize-bundle-directory.......................: initialize a prepared bundle directory
⤜ list-bundles......................................: lists acc bundles
⤜ list-packages.....................................: lists acc packages
⤜ package-builder-options...........................: lists valid environment combinations for create-package (UI 'new package' wizard data)
⤜ package-bundle-profile............................: fetches a single bundle's profile (property catalog + overrides) within a package
⤜ package-bundles...................................: gets package bundles
⤜ package-compatible-bundles........................: lists bundles compatible with a package (candidate add-bundle set)
⤜ package-details...................................: gets package details
⤜ package-property-overrides........................: lists property overrides applied on top of bundle defaults for a package
⤜ package-required-bundles..........................: lists bundles required by a package (always-shipped framework set)
⤜ set-bundle-property...............................: sets a property override on a bundle within a package (single PATCH)
```
#### vertex
```vertex
⤜ add-vertex-definition.............................: add vertex definition from a file
⤜ all-metric-mappings...............................: dumps all metric mappings for all vertices
⤜ bulk-patch........................................: patches mutiple vertices using the bulk-patch file.
⤜ bulk-patch-rollback...............................: rolls back a bulk-patch with a rollback file.
⤜ bulk-patch-schema.................................: generates the bulk-patch schema
⤜ generate-patch-from-csv...........................: generates a bulk-patch file from a CSV
⤜ patch-universe....................................: patch matching vertices in a universe
⤜ vertex-definition.................................: dumps vertex definition for a single vertex type
⤜ vertex-definitions................................: dumps all metric mappings for all vertices
⤜ get-vertex-trace-summaries........................: retrieves trace summaries for vertices
⤜ get-vertex-traces.................................: retrieves traces
⤜ vertex-type-metric-mapping........................: dumps metric mapping for a vertex type
```
#### agent
```agent
⤜ trace-summaries...................................: retrieves trace summaries for an agent
⤜ get-agent-traces..................................: retrieves traces
⤜ licensing-config-generate.........................: creates a default licensingConfigFile to be modified for licensing-beta command.
⤜ licensing.........................................: generate licensing report
⤜ licensing-beta....................................: generate licensing report with configuration
⤜ list..............................................: lists all agents
⤜ statuses..........................................: lists all agents statuses
⤜ metric-count-summary..............................: retrieves metric counts for agents as csv
⤜ query-by-name.....................................: ensure a specific agent exists.
⤜ query-by-regex....................................: query by regex
⤜ trace.............................................: starts trace on specified agents
```
#### agentic
```agentic
⤜ corpus-entry......................................: Print a catalog entry. `document=<section>/<id>` (e.g. `entities/host`, `cookbooks/tas-quickstart`, `queries/01-discover-vertices`).
⤜ corpus-section-index..............................: List entries in a catalog section. Each row is labelled `<section>/<id>` for copy-paste into `agentic corpus-entry`.
⤜ corpus-sections...................................: List the sections of the dx-do catalog (queries, cookbooks, entities, …).
⤜ doctor............................................: Health checks for the agentic surface: profiles, auth, extracted Claude marketplace freshness, guard classifier, MCP tool registration.
⤜ extract-claude-marketplace........................: Extract the embedded Claude Code marketplace + plugins to disk. Writes `<base-directory>/dx-do-claude-marketplace/`. Prefer `agentic setup-claude` for the standard onboarding flow.
⤜ guard.............................................: classifies a Bash command line as a PreToolUse hook decision (allow/ask/deny, silence = defer)
⤜ learn-tenant......................................: Reserve the per-tenant corpus storage at ~/.dxdo/<alias>/corpus/ (no-op stub; full learning logic is forthcoming). [experimental]
⤜ mcp...............................................: Run a stdio MCP server for the bound tenant. Wire into Claude Code / Cursor with `claude mcp add` (or equivalent).
⤜ schema............................................: Emit the canonical JSON Schema for a DataStore query payload (TAS / NASSQL / Metrics-Metadata), optionally narrowed to one op.
⤜ setup-claude......................................: One-command Claude Code onboarding: extract the Claude Code plugin to ~/.dxdo/claude/marketplace, manage readOnly profile marks, print the /plugin install block, run doctor.
```
#### help
```help
⤜ agentic-mcp.......................................: Explains the `dx-do agentic mcp` stdio MCP server and how to wire it into Claude Code / Cursor / mcp-inspector.
⤜ commands..........................................: explains commands.
⤜ commands-json.....................................: dumps every command as a machine-readable JSON manifest (safety, usage, args)
⤜ commands-md.......................................: explains commands in md format
⤜ commands-safety-md................................: emits a per-group command safety reference (markdown)
⤜ configuration.....................................: explains configuration
⤜ dashboard.........................................: explains dashboard command setup.
⤜ describe..........................................: dumps one command as its full machine-readable manifest entry
⤜ find..............................................: searches the command surface by task phrase and returns ranked candidates
⤜ bulk-patch........................................: explains vertex bulk-patch
⤜ metric-types......................................: explains numericMetricType and enumMetricType for 'nass register-metric' and 'nass report-metric-value'.
⤜ slis..............................................: explains the SLI group / SLI / SLO / alert model and how to drive it with the sli commands.
⤜ time-formats......................................: explains time formats for 'metric data' and 'agent get-trace-sumaries'.
⤜ ui................................................: Explains `dx-do ui start` — the browser-based visual query builder for TAS / NASSQL / Metrics-Metadata queries.
```
#### alert
```alert
⤜ create............................................: creates a new APM simple alert (dry-run by default)
⤜ delete............................................: deletes an APM alert (dry-run by default)
⤜ detail............................................: get alert definition
⤜ analyze...........................................: analyzes an alert and it's threshold
⤜ copy-with-metric-grouping.........................: copy an alert with it's metric grouping
⤜ copy..............................................: copy an alert
⤜ debug-by-management-module........................: debug all alerts in a management module.
⤜ disable...........................................: disable an alert.
⤜ disable-all.......................................: disable all alerts for a management module
⤜ enable............................................: enable an alert.
⤜ enable-all........................................: enable all alerts for a management module
⤜ list..............................................: lists all alerts.
⤜ list-by-management-module.........................: lists all alerts in a management module.
⤜ update-simple.....................................: update a simple alert.
⤜ update-summary....................................: update a summary alert.
```
#### trace
```trace
⤜ get-agent-traces..................................: retrieves traces
⤜ collect-threaddump................................: trigger a trace on an agent
⤜ get-threaddump....................................: retrieve a previously collected threaddump
⤜ query-threaddumps.................................: find threaddumps for an agent
⤜ trace-details.....................................: get trace details for traceId
⤜ inject............................................: inject APM transaction trace(s) from a JSON file into the tracestore
⤜ inject-simple.....................................: inject a synthetic APM transaction trace into the tracestore using CLI arguments
```
#### service
```service
⤜ all-services......................................: shows all services
⤜ delete-service....................................: deletes service (and optionally it's subservices)
⤜ add-content.......................................: adds content queries to an existing service (dry-run by default)
⤜ associate.........................................: associates a child service under a parent (AggregateOf edge; dry-run by default)
⤜ create............................................: creates a service with content queries (dry-run by default; dry-run previews matching entities)
⤜ dependency-graph..................................: shows a dependency graph for a service
⤜ detail............................................: retrieves a service (optionally with its subservices) as json
⤜ dissociate........................................: removes a parent→child association, keeping the child as a detached service (dry-run by default)
⤜ export............................................: exports a single service to a re-importable JSON file
⤜ export-hierarchy..................................: exports a service and its entire subtree (descendants + association edges) to a re-importable JSON file
⤜ import............................................: imports a service export file (from export / export-hierarchy) into the tenant (dry-run by default)
⤜ inventory.........................................: shows inventory for a service
⤜ inventory-overlap.................................: shows inventory overlaps for services
⤜ metrics...........................................: dump the service metrics as json
⤜ overview..........................................: dump the service overview as json
⤜ slis..............................................: show the service SLIs (and child service SLIs)
⤜ search............................................: show services matching search term
⤜ set-content.......................................: replaces an existing service’s content queries (dry-run by default; no content clears all)
⤜ top-level-services................................: shows top level services
```
#### inventory
```inventory
⤜ attributes........................................: list all available attributes
⤜ create-inventorize-rule...........................: saves (creates or updates) a rule that materializes inventory from metrics; dryrun mode by default, set mode=create to execute.
⤜ create-inventorize-rule-from-file.................: installs a locally saved inventorize rule draft onto the bound tenant; dryrun mode by default, set mode=create to execute.
⤜ delete-inventorize-rule...........................: deletes an inventorize rule
⤜ list-inventorize-rules............................: shows rules for creating inventory from metrics
⤜ layers............................................: lists all topology layers with a count of entities on each layer
⤜ lookup............................................: searches inventory using free text search, be aware that this may not support all product sources
⤜ metrics...........................................: finds metrics associated with inventory
⤜ search............................................: searches inventory
⤜ sources...........................................: lists all sources of inventory items
```
#### audit
```audit
⤜ query.............................................: query data-store audit events
```
#### auth
```auth
⤜ list-users........................................: lists user accounts for the tenant
⤜ current...........................................: shows auth of current token
⤜ list-groups.......................................: shows all authentication group names
⤜ user-search.......................................: searches for users
⤜ validate-configuration-keys.......................: validates keys
```
#### axa
```axa
⤜ bulk-servicify....................................: creates service and universe for 'orphaned' AXA applications
⤜ crash-all.........................................: list all crashes
⤜ crash-detail......................................: get details for a crash
⤜ crash-list-by-group...............................: list crashes by group
⤜ crash-summary.....................................: summary of crashes
⤜ create-activity...................................: create a business activity for an AXA Application
⤜ create-application................................: creates a new AXA application definition.
⤜ delete-application................................: delete an existing AXA application.
⤜ dump-sessions-events..............................: dumps filtered AXA session events
⤜ export-profile....................................: exports a AXA data collection profile
⤜ get-application-ba-extension......................: gets AXA BrowserAgent extension javascript.
⤜ get-application-profile...........................: gets the profile/id for an AXA Application
⤜ get-application-snippet...........................: gets AXA BrowserAgent snippet for an application
⤜ import-profile....................................: import a AXA data collection profile
⤜ list-activities...................................: lists the business activities defined for an AXA Application
⤜ list-applications.................................: lists all AXA application names/keys
⤜ list-profiles.....................................: lists all AXA data collection profiles
⤜ list-screens......................................: lists the screens available for business activities defined for an AXA Application
⤜ list-sessions.....................................: dumps filtered AXA session events
⤜ servicify-application.............................: creates service and universe for 'orphaned' AXA applications
⤜ set-application-profile...........................: sets the profile by id for an AXA Application
⤜ show-activity-tree................................: shows activity tree from session events
⤜ show-application-service-mapping..................: lists all AXA application names and their associated services
⤜ update-profile....................................: updates a AXA data collection profile
⤜ upload-application-ba-extension...................: upload new custom AXA BrowserAgent extension javascript.
```
#### config
```config
⤜ create............................................: create a new tenant configuration profile (interactive on a TTY, or non-interactive via gatewayHost=/userToken=/cohortId=)
⤜ connector.........................................: shows connector config for tenant
⤜ debug.............................................: shows configuration details
⤜ debug-token.......................................: shows decoded token
⤜ generate-agent-token..............................: generates an agent token
⤜ generate-user-token...............................: generates an user token
⤜ upgrade...........................................: upgrade legacy dx-do configuration to current version
```
#### experience
```experience
⤜ create............................................: creates an experience
⤜ dashboard.........................................: summarizes experience dashboard
⤜ delete............................................: delete an experience carefully
⤜ mapping...........................................: shows mapping from Experience Top-Level to Settings ID
⤜ report............................................: reports on various parts of an experience hierarchy.
⤜ settings..........................................: lists Experience settings
⤜ export............................................: exports an experience configuration
⤜ import............................................: imports an experience configuration from file 
⤜ list..............................................: lists Experience names & ids 
⤜ summarize.........................................: summarizes an experience
```
#### channel
```channel
⤜ create-template...................................: create a channel message template
⤜ create-velocity-map-from-csv......................: creates a velocity map for use for advanced templates
⤜ create-velocity-maps-from-csv.....................: creates multiple velocity maps for use for advanced templates
⤜ disable-channel...................................: disable a channel
⤜ enable-channel....................................: enable a channel
⤜ export............................................: exports all channels/templates to file
⤜ import............................................: imports channels/templates from file
⤜ list..............................................: lists all channels
⤜ list-policies.....................................: lists all channel policies
⤜ list-templates....................................: lists all channel templates
⤜ policy-detail.....................................: describes details for policy
⤜ update-template...................................: update an existing channel message template
```
#### sql
```sql
⤜ date-to-timestamp.................................: converts dates to timestamps for use in queries
⤜ query.............................................: executes an APM sql query
⤜ examples..........................................: shows example queries
```
#### blob
```blob
⤜ delete............................................: deletes a blob (all versions) from a schema
⤜ fetch.............................................: fetches a blob; restores a stored file to disk, or prints content for other blobs
⤜ list-blobs........................................: list blobs for a schema
⤜ list-schemas......................................: list current blob schemas
⤜ store.............................................: stores a local file as a blob (restore it later with `blob fetch`)
```
#### jsextension
```jsextension
⤜ delete............................................: delete js extension
⤜ disable...........................................: disable js extension
⤜ enable............................................: enable js extension
⤜ list..............................................: list
⤜ upload............................................: upload a js extension file
```
#### perspective
```perspective
⤜ delete............................................: Delete Map View Perspective
⤜ export............................................: Export Map View Perspective
⤜ import............................................: Import Map View Perspective
⤜ list..............................................: List Map View Perspectives
```
#### diagnose
```diagnose
⤜ explain...........................................: Explain every diagnostic rule (or filter to one scope). Pure metadata — no tenant binding required. [experimental]
⤜ services..........................................: Audit the bound tenant's DXO2 service organization. Returns severity-tagged findings (errors / warnings / recommendations) per service. Optionally scope by serviceName (with or without descendants). [experimental]
```
#### attribute
```attribute
⤜ dump..............................................: dumps all attributes by layer
```
#### topographer
```topographer
⤜ dump-schema.......................................: dumps the topographer configuration schema (for use in IDE)
⤜ generate-sample...................................: generate a sample topographer configuration
⤜ test-configuration................................: test a topographer configuration
```
#### event
```event
⤜ create-change-event...............................: creates a change event
⤜ create-event......................................: creates a plain event
⤜ query-change-events...............................: execute lucene query for change events
```
#### metricgrouping
```metricgrouping
⤜ list-metrics......................................: lists all live metrics in metric grouping
⤜ list-by-managementmodule..........................: lists all metric groupings in management modules.
⤜ create............................................: creates a new APM metric grouping (dry-run by default)
⤜ delete............................................: deletes an APM metric grouping (dry-run by default)
⤜ detail............................................: get full detail of an APM metric grouping
⤜ update............................................: updates an existing APM metric grouping (dry-run by default)
```
#### asm
```asm
⤜ list-folders......................................: lists asm folders
```
#### log
```log
⤜ ingest............................................: ingest one or more log entries directly into the DXO2 log analytics gateway
⤜ query.............................................: queries DXO2 Log analytics
```
#### maintenance
```maintenance
⤜ create-for-agents.................................: creates a maintenance window targeting agents matched by a pattern (dry-run by default)
⤜ create-for-alarms.................................: creates a maintenance window targeting raw alarms by alarm-name match (dry-run by default)
⤜ create-for-entities...............................: creates a maintenance window targeting devices/entities by a field match (dry-run by default)
⤜ create-for-services...............................: creates a maintenance window targeting one or more services (dry-run by default)
⤜ delete............................................: deletes a maintenance window by id (dry-run by default)
⤜ detail............................................: shows a maintenance window: its target members/filter, schedule, and upcoming windows
⤜ list..............................................: lists the maintenance windows (schedules) configured in the tenant
```
#### managementmodule
```managementmodule
⤜ export............................................: exports a management module and its metric groupings, alerts and calculators.
⤜ import............................................: imports a management module from json
⤜ list..............................................: lists all management modules.
⤜ copy..............................................: copy a management module.
⤜ create............................................: creates a management module.
⤜ delete............................................: delete a management module
⤜ download..........................................: downloads a management module
⤜ list-calculators..................................: lists calculators in a management module
⤜ update............................................: updates a management module.
```
#### o2-alert
```o2-alert
⤜ create............................................: creates a new platform alert spec (dry-run by default)
⤜ delete............................................: deletes a platform alert spec (dry-run by default)
⤜ detail............................................: shows full detail of a platform alert spec
⤜ list..............................................: lists platform alert specs, optionally filtered by management module
⤜ update............................................: updates a platform alert spec (dry-run by default)
```
#### o2-managementmodule
```o2-managementmodule
⤜ create............................................: creates a new platform management module (dry-run by default)
⤜ delete............................................: deletes a platform management module (dry-run by default)
⤜ list..............................................: lists all platform management modules
⤜ update............................................: updates a platform management module
```
#### o2-metricgrouping
```o2-metricgrouping
⤜ create............................................: creates a new platform metric grouping (dry-run by default)
⤜ delete............................................: deletes a platform metric grouping (dry-run by default)
⤜ detail............................................: shows full detail of a platform metric grouping
⤜ list..............................................: lists platform metric groupings, optionally filtered by management module
⤜ update............................................: updates a platform metric grouping
```
#### queries
```queries
⤜ get...............................................: reads one saved query triplet (payload + tmd + md) from the local query store
⤜ list..............................................: lists saved queries (or folders) from the local query store
⤜ run...............................................: executes a saved query against the bound tenant and prints the result
```
#### tas
```tas
⤜ query-agents......................................: finds everything
⤜ query-all.........................................: finds everything
⤜ query-json........................................: executes a query defined in a json file
⤜ store-graph.......................................: store vertices and edges in the TAS topology store from a JSON file
```
#### nass
```nass
⤜ query.............................................: executes a nass query from file containing nassql query json
⤜ query-metadata-by-ids.............................: executes a nass metadata query
⤜ query-metadata....................................: executes a nass metadata query
⤜ query-metric-data.................................: executes a nass metric data query
⤜ register-and-report...............................: register a metric and store a single datapoint for it at the current time
⤜ register-metric...................................: register a metric in the NASS metadata store
⤜ report-by-id......................................: store a single datapoint for an already-registered metric at the current time
⤜ report-metric-value...............................: register a metric and store a single value for it at the current time
⤜ update-metadata-attribute.........................: update a single metadata attribute on a metric
```
#### situation
```situation
⤜ query.............................................: finds situations
⤜ alarm-data........................................: provides the situation alarm data
⤜ detail............................................: show details for situation
⤜ inspect...........................................: provides entire situation inspection json
⤜ inspect-alarms....................................: provides alarms from situation inspection 
⤜ summary...........................................: show the generative AI summary for a situation
⤜ trigger-webhook...................................: triggers a webhook for a situation
```
#### service-universe
```service-universe
⤜ add-access........................................: grants a user or group access to a service universe (dry-run by default)
⤜ create............................................: creates a service universe scoped to a list of services (dry-run by default)
⤜ delete............................................: deletes a service universe (dry-run by default)
⤜ export............................................: writes a service universe definition to a JSON file
⤜ get...............................................: shows the full definition of one service universe
⤜ list..............................................: lists service universes (OI-owned)
⤜ remove-access.....................................: revokes a user or group access from a service universe (dry-run by default)
⤜ update............................................: updates a service universe (dry-run by default)
```
#### sli
```sli
⤜ add-alert.........................................: adds an alert on one of an SLI's produced metrics: the SLI itself, its SLO percentage, or its error budget (dry-run by default)
⤜ add-sli...........................................: adds an SLI (a computed service-level metric) to an existing SLI group (dry-run by default)
⤜ add-slo...........................................: adds an SLO (objective + error budget) derived from an existing SLI (dry-run by default)
⤜ create-group......................................: creates an SLI group with its first SLI: metric filters, a service binding, and the SLI computation (dry-run by default)
⤜ delete-group......................................: permanently deletes an SLI group and everything in it: its SLIs, SLOs, and alerts (dry-run by default)
⤜ exclude-service...................................: removes a service from an existing SLI group's bound services (dry-run by default)
⤜ export............................................: exports a single SLI group to a raw, re-importable JSON file (or stdout)
⤜ filter-test.......................................: read-only filter workbench: lists the filterable metric attributes for services and previews what a filter combination matches
⤜ import............................................: imports a raw SLI group export into the tenant, substituting ${serviceName} and binding it to serviceName (dry-run by default)
⤜ include-service...................................: adds a service to an existing SLI group's bound services (dry-run by default)
⤜ list-groups.......................................: lists the SLI groups (of SLIs, SLOs, and related alerts) configured in the tenant
⤜ remove-alert......................................: removes an alert from an SLI (dry-run by default)
⤜ remove-sli........................................: removes an SLI from a group, cascading to its SLO and alerts (dry-run by default)
⤜ remove-slo........................................: removes an SLI's SLO (objective, percentage, and error budget) from a group (dry-run by default)
⤜ set-group-filter..................................: replaces an SLI group's metric filters, previewing the resulting metric matches (dry-run by default)
⤜ set-sli-filter....................................: replaces one SLI's refinement filter, previewing the resulting metric matches (dry-run by default)
⤜ status............................................: surfaces SLI groups with registration problems (sliStatusCode != 0)
```
#### tenant
```tenant
⤜ maintenance.......................................: checks the Broadcom status page for DXO2 SaaS platform maintenance affecting the configured tenant (not user-configured maintenance windows)
⤜ version...........................................: reports the tenant product versions and the implied DXO2 platform version
```
#### ui
```ui
⤜ start.............................................: Start the dx-do query builder UI (React) server (Fastify + MCP) and open the browser
```
#### apm-universe
```apm-universe
⤜ add-metric-source.................................: adds an agent / regex to an APM universe definition.
⤜ create............................................: creates an APM universe
⤜ delete............................................: deletes an APM universe
⤜ detail............................................: provides detail on a single APM universe
⤜ export............................................: dumps a single APM universe json
⤜ list..............................................: lists all APM universes
⤜ sanity-check......................................: ensures APM universes are not set up exceptionally badly.
⤜ stats.............................................: provides detail on all APM universes
```
#### wql
```wql
⤜ analyze...........................................: extract ts() selectors from a WQL query, resolve their metrics, and show attribute value histograms
⤜ query.............................................: run a WQL expression as a NASSQL query over a time range
```
### Options


#### Insecure HTTPS for Non-Proxied On-Prem

You may set the ALLOW_INSECURE_HTTPS environment variable to true in order to use self-signed or expired certificates

```
export ALLOW_INSECURE_HTTPS=true
dx-do alert list
```

## current version 4 configuration file format

```
{
  "configurationVersion": "4",
  "cohortId": "<cohortId from Settings -> Connector Parameters>",
  "userToken": "<DX User Token from Settings -> Manage Tokens -> New Token -> User>",
  "dxGatewayHost": "https://apmgw.dxi-na1.saas.broadcom.com/",
  "dxASMToken": "<optional: token for ASM API usage>",
  "dxLogIngestionURL": "<optional: log gateway base URL for 'log ingest' (e.g. https://logs-gateway.dxi-na1.saas.broadcom.com)>"
}
```


#### config

```
--config=<configFilename>
```


***

## proxyConfig

```
--proxyConfig=<proxyConfigFilename>
```

#### proxy config File Format

```
{
  "protocol": "http", // or https
  "host": "localhost",
  "port": 8888,
  "auth": {
    "username": "myuser",
    "password": "mypass"
  }
}
```

***

### non interactive mode (suitable for running from a script)

```
--noninteractive
```

### Experimental commands

Some `dx-do` commands are marked **experimental** — they're being designed, may change shape between releases, or are only safe to run on test tenants. They're hidden from `dx-do help commands` and refused at runtime by default. Open the gate either way:

* **Per-invocation flag**: `dx-do --enable-experimental-commands <group> <command> ...`
* **Env var**: `export DXDO_ENABLE_EXPERIMENTAL_COMMANDS=true`

Both forms behave identically; pick whichever fits your workflow. The env var is the better choice when you need experimental commands repeatedly (CI, scripts, an MCP-server-spawn config in Claude Code / Cursor).

To see which commands are experimental, run any of:

* `DXDO_ENABLE_EXPERIMENTAL_COMMANDS=true dx-do help commands` — list with `[experimental]` tag.
* The `README.md` shipped with the binary — generated with experimental commands always included; each is suffixed with `[experimental]`.

When an MCP client (Claude Code, Cursor, mcp-inspector) spawns `dx-do` as a subprocess for a currently-experimental command (e.g. `ui start`), set the env var in the spawn config so the gate is open for the child process. (`agentic mcp` and the other `agentic` commands graduated in 7.0 and need no gate.)


#### version 3 configuration

Please upgrade version 3 configurations using "config upgrade"

```
{
    "hostUrl":"https://apmgw.dxi-na1.saas.broadcom.com/",
    "apiKey":"<APM_API_TOKEN>",
    "tenantCN":"TENANT_NAME",
    "tenantId":"000"
    "oiUserKey": "<OI_USER_TOKEN>",
    "axaHostUrl": "https://axa.dxi-na1.saas.broadcom.com/",
    "oiHostUrl": "https://oi.dxi-na1.saas.broadcom.com/",
}
```



