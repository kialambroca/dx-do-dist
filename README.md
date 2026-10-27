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
   * **Windows**: `Unblock-File dx-do-windows-x64.exe` (or `dx-do-windows-arm64.exe` on Windows on ARM) in PowerShell, if SmartScreen objects
   * **Linux**: nothing to clear

## Usage

Create the default tenant profile first:

```
dx-do config create alias=default
```

On a terminal this prompts for the gateway host, user token and cohort id and writes `~/.dxdo/default.dxo2.config.json`; pass `gatewayHost=... userToken=... cohortId=...` to skip the prompts (scripts, agents). If you skip this step, the first command that needs a tenant asks for the same three values on a terminal, and fails with a pointer to `config create` when stdin is not a terminal.

One profile per tenant — `dx-do config create alias=<name>` adds another, and `--config=<value>` picks it. The value is tried in this order; the first file that exists wins:

| `--config=` value | tried, in order |
|---|---|
| omitted | `~/.dxdo/default.dxo2.config.json` (environment overrides: see `help configuration`) |
| `tenant-name` | `./tenant-name.dxo2.config.json`, then `~/.dxdo/tenant-name.dxo2.config.json`, then `~/.dxo2/configurations/tenant-name.dxo2.config.json` |
| `./tenant-name.dxo2.config.json` — any path ending in `.dxo2.config.json` | that path only, relative to the current directory or absolute; it is never looked up under `~/.dxdo` |

### Full configuration options are available by running 

```dx-do --no-config help configuration```

```
dx-do [--config=<alias|path>] <command-group> <command> <parameter>=<value>...
```

#### Output

```
ℹ  info      dx-do v7.17.0 on node v26.3.0 on linux-x64 via node (ssl: 1.1.0)
⚠  warning   Not loading configuration
✖  error     Usage: dx-do --option[=value]... <command-group> <command> <command-param>=<value>...
⚠  warning   no tenant profile configured — run 'dx-do config create alias=default gatewayHost=... userToken=... cohortId=...'
```


### Command Groups

#### alarm
##### General
```alarm
⤜ acknowledge.......................................: acknowledges an alarm
⤜ analyze...........................................: shows counts of alarm by [source product] and managementmodule / type
⤜ assign............................................: assigns an alarm to a troubleshooter
⤜ bulk-lifecycle....................................: shows alarm lifecycle
⤜ clear.............................................: clears an alarm
⤜ create-alarm......................................: creates an alarm via jarvis ingestion
⤜ detail............................................: dumps alarm details
⤜ export............................................: exports every alarm of a time range to JSONL or CSV, streaming
⤜ lifecycle.........................................: shows alarm lifecycle
⤜ list..............................................: lists alarms
⤜ related...........................................: gets related alarms
⤜ trigger-webhook...................................: triggers a webhook for an alarm
⤜ unacknowledge.....................................: unacks an alarm
⤜ update-field......................................: updates an alarm field
```
##### Enrichment rules
```alarm
⤜ create-enrichment-rule............................: creates an alarm enrichment rule (dry-run by default, previewing what it would match)
⤜ delete-enrichment-rule............................: permanently deletes an alarm enrichment rule (dry-run by default)
⤜ enrichment-attributes.............................: lists the topology vertex types, or the attributes of one, that enrichment can read
⤜ enrichment-fields.................................: lists the alarm fields an enrichment rule can match on
⤜ enrichment-rule-detail............................: shows one alarm enrichment rule, its match filter, mappings and evaluation position
⤜ explain-enrichment-rules..........................: gives an simplified explanation of enrichment rules
⤜ list-enrichment-custom-fields.....................: lists the custom alarm slots enrichment can write to and what each one holds
⤜ list-enrichment-rules.............................: lists alarm enrichment rules in evaluation order
⤜ register-enrichment-custom-field..................: binds a custom alarm slot to an attribute name so enrichment rules can use it (dry-run by default)
⤜ reorder-enrichment-rule...........................: moves an alarm enrichment rule in the evaluation order (dry-run by default)
```
##### Filters
```alarm
⤜ create-filter.....................................: creates a saved filter for the Service Alarms or Situations view (dry-run by default)
⤜ delete-filter.....................................: permanently deletes a service / situation filter (dry-run by default)
⤜ filter-detail.....................................: dumps one service / situation filter definition
⤜ filter-fields.....................................: lists the fields (and closed vocabularies) a service or situation filter can match on
⤜ list-filters......................................: lists the saved filters of the Service Alarms and Situations views
⤜ update-filter.....................................: updates a service / situation filter: omitted fields keep their values (dry-run by default)
```
##### Queues
```alarm
⤜ create-queue......................................: creates an alarm queue: a saved alarm filter with display preferences (dry-run by default)
⤜ delete-queue......................................: permanently deletes an alarm queue (dry-run by default)
⤜ list-queues.......................................: lists alarm queues
⤜ queue-detail......................................: dumps queue details
⤜ queue-fields......................................: lists the alarm fields (and closed vocabularies) an alarm queue filter can match on
⤜ set-queue-preferences.............................: pins / unpins an alarm queue or makes it your default: per-user preferences (dry-run by default)
⤜ update-queue......................................: updates an alarm queue: omitted fields keep their values (dry-run by default)
```
##### Ticket enrichment rules
```alarm
⤜ create-ticket-enrichment-rule.....................: creates a ticket enrichment rule for an ITSM channel (dry-run by default)
⤜ delete-ticket-enrichment-rule.....................: permanently deletes a ticket enrichment rule (dry-run by default)
⤜ list-ticket-enrichment-rules......................: lists the ticket enrichment rules that fill service-desk fields from alarms
⤜ ticket-enrichment-fields..........................: lists the service-desk fields of an ITSM channel, or the alarm fields a ticket rule can read
⤜ ticket-enrichment-rule-detail.....................: shows one ticket enrichment rule and the field maps it applies
```
#### dashboard
##### General
```dashboard
⤜ get-theme.........................................: shows the current theme
⤜ set-theme.........................................: sets the current theme
```
##### Dashboards
```dashboard
⤜ dashboard-export..................................: exports a single dashboard
⤜ dashboard-import..................................: creates a new dashboard from an export file.
⤜ dashboard-list-by-folder..........................: lists dashboards in folder
⤜ dashboard-list-by-meta............................: lists every dashboard whose meta.<field> matches one of the given values
⤜ dashboard-search..................................: finds dashboards
⤜ dashboard-update..................................: updates a dashboard from an export file.
⤜ dashboard-variables-list..........................: shows current values of dashboard variables
⤜ get-dashboard-refresh-options.....................: shows current dashboard refresh options
⤜ set-dashboard-refresh-options.....................: sets dashboard refresh options
```
##### Folders
```dashboard
⤜ folder-add-permission.............................: adds folder permission for a user by email or userId
⤜ folder-create.....................................: creates a folder
⤜ folder-details....................................: show details for folder
⤜ folder-export.....................................: exports a folder and all dashboards in it.
⤜ folder-import.....................................: imports a folder and its dashboards from an export file.
⤜ folder-list.......................................: show id/uid/title of all folders.
⤜ folder-permissions................................: gets permissions for a folder
⤜ set-folder-refresh-options........................: sets refresh options for all dashboards in folder
```
##### Tags
```dashboard
⤜ add-dashboard-tags................................: adds tags to a dashboard
⤜ add-folder-tags...................................: adds tags to all dashboards in a folder
⤜ get-dashboard-tags................................: shows current dashboard tags
⤜ replace-dashboard-tags............................: replaces tags for a dashboard
⤜ replace-folder-tags...............................: replaces tags for all dashboards in a folder
⤜ summarize-dashboard-tags..........................: shows a summary of all dashboards' tags.
```
##### Users
```dashboard
⤜ user-list.........................................: looks up a user by email
⤜ user-search.......................................: finds dashboard users
```
#### acc
##### Bundles
```acc
⤜ bundle-details....................................: gets bundle details
⤜ download-bundle...................................: downloads bundle
⤜ import-bundle.....................................: import bundle from a bundle tar.gz file
⤜ initialize-bundle-directory.......................: initialize a prepared bundle directory
⤜ list-bundles......................................: lists acc bundles
```
##### Package contents
```acc
⤜ add-package-bundles...............................: attaches bundles to a package (single PATCH, no draft/publish dance)
⤜ package-bundle-profile............................: fetches a single bundle's profile (property catalog + overrides) within a package
⤜ package-bundles...................................: gets package bundles
⤜ package-compatible-bundles........................: lists bundles compatible with a package (candidate add-bundle set)
⤜ package-property-overrides........................: lists property overrides applied on top of bundle defaults for a package
⤜ package-required-bundles..........................: lists bundles required by a package (always-shipped framework set)
⤜ set-bundle-property...............................: sets a property override on a bundle within a package (single PATCH)
```
##### Packages
```acc
⤜ create-package....................................: creates a new ACC package from typed args (UI new-package wizard equivalent)
⤜ delete-package....................................: deletes a package
⤜ download-package..................................: downloads a server-assembled tenant-stamped agent package tarball
⤜ export-packages...................................: exports packages to a file
⤜ import-packages...................................: import packages from an export file
⤜ list-packages.....................................: lists acc packages
⤜ package-builder-options...........................: lists valid environment combinations for create-package (UI 'new package' wizard data)
⤜ package-details...................................: gets package details
```
#### vertex
```vertex
⤜ add-vertex-definition.............................: add vertex definition from a file
⤜ all-metric-mappings...............................: dumps all metric mappings for all vertices
⤜ bulk-patch........................................: patches mutiple vertices using the bulk-patch file.
⤜ bulk-patch-rollback...............................: rolls back a bulk-patch with a rollback file.
⤜ bulk-patch-schema.................................: generates the bulk-patch schema
⤜ generate-patch-from-csv...........................: generates a bulk-patch file from a CSV
⤜ get-vertex-trace-summaries........................: retrieves trace summaries for vertices
⤜ get-vertex-traces.................................: retrieves traces
⤜ patch-universe....................................: patch matching vertices in a universe
⤜ vertex-definition.................................: dumps vertex definition for a single vertex type
⤜ vertex-definitions................................: dumps all metric mappings for all vertices
⤜ vertex-type-metric-mapping........................: dumps metric mapping for a vertex type
```
#### agent
```agent
⤜ get-agent-traces..................................: retrieves traces
⤜ licensing.........................................: generate licensing report
⤜ licensing-beta....................................: generate licensing report with configuration
⤜ licensing-config-generate.........................: creates a default licensingConfigFile to be modified for licensing-beta command.
⤜ list..............................................: lists all agents
⤜ list-lifecycle-events.............................: lists when the processes behind agents started, restarted, or changed identity (concurrent instances, name reassignments)
⤜ metric-count-summary..............................: retrieves metric counts for agents as csv
⤜ query-by-name.....................................: ensure a specific agent exists.
⤜ query-by-regex....................................: query by regex
⤜ statuses..........................................: lists all agents statuses
⤜ trace.............................................: starts trace on specified agents
⤜ trace-summaries...................................: retrieves trace summaries for an agent
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
⤜ setup-agy.........................................: One-command Antigravity onboarding: extract the agy plugin to ~/.dxdo/agy/plugins, manage readOnly profile marks, print the `agy plugin install` block, run doctor.
⤜ setup-claude......................................: One-command Claude Code onboarding: extract the Claude Code plugin to ~/.dxdo/claude/marketplace, manage readOnly profile marks, print the /plugin install block, run doctor.
```
#### help
##### General
```help
⤜ commands..........................................: explains commands.
⤜ commands-json.....................................: dumps every command as a machine-readable JSON manifest (safety, usage, args)
⤜ commands-md.......................................: explains commands in md format
⤜ commands-safety-md................................: emits a per-group command safety reference (markdown)
⤜ describe..........................................: dumps one command as its full machine-readable manifest entry
⤜ find..............................................: searches the command surface by task phrase and returns ranked candidates
```
##### Topics
```help
⤜ agentic-mcp.......................................: Explains the `dx-do agentic mcp` stdio MCP server and how to wire it into Claude Code / Cursor / mcp-inspector.
⤜ alarm-enrichment..................................: explains how vertex attributes, the custom-field registry, and enrichment rules line up, the order that decides which rule wins, and the preview-backed dry run.
⤜ bulk-patch........................................: explains vertex bulk-patch
⤜ channels..........................................: explains notification channels vs policies vs templates, the supported channel kinds, and the dry-run / test / save flow of the channel write commands.
⤜ configuration.....................................: explains configuration
⤜ custom-situations.................................: explains situations as alarm clusters, the filter / root-cause / clustering parts of a custom situation policy, the dry-run preview flow, and why an update replaces the policy id.
⤜ dashboard.........................................: explains dashboard command setup.
⤜ inventorize.......................................: explains inventorize (Topology Creator) rules: when to create one, the sourceName matching dialect, folders and nesting, external IDs, and the JEXL context for custom attributes.
⤜ metric-types......................................: explains numericMetricType and enumMetricType for 'nass register-metric' and 'nass report-metric-value'.
⤜ slis..............................................: explains the SLI group / SLI / SLO / alert model and how to drive it with the sli commands.
⤜ ticket-enrichment.................................: explains the ITSM channel prerequisite, the two field catalogs on either side of a map, and why the alarm type decides which alarm fields a rule may use.
⤜ time-formats......................................: explains time formats for 'metric data' and 'agent get-trace-sumaries'.
⤜ ui................................................: Explains `dx-do ui start` — the browser-based visual query builder for TAS / NASSQL / Metrics-Metadata queries.
```
#### alert
```alert
⤜ analyze...........................................: analyzes an alert and it's threshold
⤜ copy..............................................: copy an alert
⤜ copy-with-metric-grouping.........................: copy an alert with it's metric grouping
⤜ create............................................: creates a new APM simple alert (dry-run by default)
⤜ debug-by-management-module........................: debug all alerts in a management module.
⤜ delete............................................: deletes an APM alert (dry-run by default)
⤜ detail............................................: get alert definition
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
⤜ collect-threaddump................................: trigger a trace on an agent
⤜ get-agent-traces..................................: retrieves traces
⤜ get-threaddump....................................: retrieve a previously collected threaddump
⤜ inject............................................: inject APM transaction trace(s) from a JSON file into the tracestore
⤜ inject-simple.....................................: inject a synthetic APM transaction trace into the tracestore using CLI arguments
⤜ query-threaddumps.................................: find threaddumps for an agent
⤜ trace-details.....................................: get trace details for traceId
```
#### service
##### General
```service
⤜ all-services......................................: shows all services
⤜ dependency-graph..................................: shows a dependency graph for a service
⤜ detail............................................: retrieves a service (optionally with its subservices) as json
⤜ inventory.........................................: shows inventory for a service
⤜ inventory-overlap.................................: shows inventory overlaps for services
⤜ metrics...........................................: dump the service metrics as json
⤜ overview..........................................: dump the service overview as json
⤜ search............................................: show services matching search term
⤜ slis..............................................: show the service SLIs (and child service SLIs)
⤜ top-level-services................................: shows top level services
```
##### Create and edit
```service
⤜ add-content.......................................: adds content queries to an existing service (dry-run by default)
⤜ bulk-update.......................................: applies one set of edits (tags, custom properties, location, description) to every service a selector picks, in one save (dry-run by default)
⤜ create............................................: creates a service with content queries (dry-run by default; dry-run previews matching entities)
⤜ delete-service....................................: deletes service (and optionally it's subservices)
⤜ set-content.......................................: replaces an existing service’s content queries (dry-run by default; no content clears all)
⤜ update-service....................................: updates a service’s attributes — description, location, tags, properties (dry-run by default; name and type are fixed at creation)
```
##### Hierarchy
```service
⤜ associate.........................................: associates a child service under a parent (AggregateOf edge; dry-run by default)
⤜ dissociate........................................: removes a parent→child association, keeping the child as a detached service (dry-run by default)
```
##### Import and export
```service
⤜ export............................................: exports a single service to a re-importable JSON file
⤜ export-hierarchy..................................: exports a service and its entire subtree (descendants + association edges) to a re-importable JSON file
⤜ import............................................: imports a service export file (from export / export-hierarchy) into this tenant or another one (dry-run by default)
```
#### inventory
##### General
```inventory
⤜ attributes........................................: list all available attributes
⤜ layers............................................: lists all topology layers with a count of entities on each layer
⤜ lookup............................................: searches inventory using free text search, be aware that this may not support all product sources
⤜ metrics...........................................: finds metrics associated with inventory
⤜ search............................................: searches inventory
⤜ sources...........................................: lists all sources of inventory items
```
##### Inventorize rules
```inventory
⤜ create-inventorize-rule...........................: saves (creates or updates) a rule that materializes inventory from metrics; dryrun mode by default, set mode=create to execute.
⤜ create-inventorize-rule-from-file.................: installs a locally saved inventorize rule draft onto the bound tenant; dryrun mode by default, set mode=create to execute.
⤜ delete-inventorize-rule...........................: deletes an inventorize rule
⤜ list-inventorize-rules............................: shows rules for creating inventory from metrics
```
##### Queues
```inventory
⤜ create-queue......................................: creates an inventory queue: a saved Monitored Inventory filter with grouping and columns (dry-run by default)
⤜ delete-queue......................................: permanently deletes an inventory queue (dry-run by default)
⤜ list-queues.......................................: lists the inventory queues (saved filters of the Monitored Inventory page)
⤜ queue-detail......................................: dumps one inventory queue definition
⤜ queue-fields......................................: lists the attributes an inventory queue can match on (all=true: every attribute usable as a column)
⤜ queue-groups......................................: lists the group-by choices of the Monitored Inventory page
⤜ set-queue-preferences.............................: pins / unpins an inventory queue or makes it the default (dry-run by default)
⤜ update-queue......................................: updates an inventory queue: omitted fields keep their values (dry-run by default)
```
#### audit
```audit
⤜ query.............................................: query data-store audit events
⤜ store.............................................: store an audit record in the tenant audit store
```
#### auth
```auth
⤜ current...........................................: shows auth of current token
⤜ list-groups.......................................: shows all authentication group names
⤜ list-users........................................: lists user accounts for the tenant
⤜ user-search.......................................: searches for users
⤜ validate-configuration-keys.......................: validates keys
```
#### config
```config
⤜ base64............................................: prints the bound tenant configuration as the base64 value DXDO_CONFIGURATION expects (the output is a credential)
⤜ connector.........................................: shows connector config for tenant
⤜ create............................................: create a new tenant configuration profile (interactive on a TTY, or non-interactive via gatewayHost=/userToken=/cohortId=)
⤜ debug.............................................: shows configuration details
⤜ debug-token.......................................: shows decoded token
⤜ doctor............................................: Health checks for this installation: binary version and PATH, tenant profiles, shell completion.
⤜ generate-agent-token..............................: generates an agent token
⤜ generate-user-token...............................: generates an user token
⤜ upgrade...........................................: upgrade legacy dx-do configuration to current version
```
#### axa
##### Applications
```axa
⤜ create-application................................: creates a new AXA application definition.
⤜ delete-application................................: delete an existing AXA application.
⤜ get-application-ba-extension......................: gets AXA BrowserAgent extension javascript.
⤜ get-application-snippet...........................: gets AXA BrowserAgent snippet for an application
⤜ list-applications.................................: lists all AXA application names/keys
⤜ upload-application-ba-extension...................: upload new custom AXA BrowserAgent extension javascript.
```
##### Business activities
```axa
⤜ create-activity...................................: create a business activity for an AXA Application
⤜ list-activities...................................: lists the business activities defined for an AXA Application
⤜ list-screens......................................: lists the screens available for business activities defined for an AXA Application
⤜ show-activity-tree................................: shows activity tree from session events
```
##### Crashes
```axa
⤜ crash-all.........................................: list all crashes
⤜ crash-detail......................................: get details for a crash
⤜ crash-list-by-group...............................: list crashes by group
⤜ crash-summary.....................................: summary of crashes
```
##### Profiles
```axa
⤜ export-profile....................................: exports a AXA data collection profile
⤜ get-application-profile...........................: gets the profile/id for an AXA Application
⤜ import-profile....................................: import a AXA data collection profile
⤜ list-profiles.....................................: lists all AXA data collection profiles
⤜ set-application-profile...........................: sets the profile by id for an AXA Application
⤜ update-profile....................................: updates a AXA data collection profile
```
##### Service mapping
```axa
⤜ bulk-servicify....................................: creates service and universe for 'orphaned' AXA applications
⤜ servicify-application.............................: creates service and universe for 'orphaned' AXA applications
⤜ show-application-service-mapping..................: lists all AXA application names and their associated services
```
##### Sessions
```axa
⤜ dump-sessions-events..............................: dumps filtered AXA session events
⤜ list-sessions.....................................: dumps filtered AXA session events
```
#### channel
##### General
```channel
⤜ export-all........................................: exports every channel, policy, and template to a file (the input of `channel import`)
⤜ import............................................: imports channels, templates, and policies from a `channel export-all` file — into the same or another tenant (dry-run by default)
```
##### Channels
```channel
⤜ create-email-channel..............................: creates an email (SMTP) notification channel (dry-run by default)
⤜ create-service-now-integration....................: creates a ServiceNow ticketing (ITSM) integration (dry-run by default)
⤜ create-webhook-channel............................: creates a generic webhook notification channel (dry-run by default)
⤜ delete-channel....................................: permanently deletes a notification channel of any protocol (dry-run by default)
⤜ disable-channel...................................: disable a channel
⤜ enable-channel....................................: enable a channel
⤜ export............................................: exports one channel as JSON, optionally with the policies that deliver to it
⤜ list..............................................: lists all channels
⤜ update-email-channel..............................: updates an email (SMTP) notification channel — omitted fields keep their values (dry-run by default)
⤜ update-service-now-integration....................: updates a ServiceNow ticketing (ITSM) integration — omitted fields keep their values (dry-run by default)
⤜ update-webhook-channel............................: updates a generic webhook notification channel — omitted fields keep their values (dry-run by default)
```
##### Policies
```channel
⤜ create-policy.....................................: creates a notification policy: which alarms go to which channels (dry-run by default)
⤜ delete-policy.....................................: permanently deletes a notification policy (dry-run by default)
⤜ list-policies.....................................: lists all channel policies
⤜ list-policy-fields................................: lists the alarm fields (and closed vocabularies) a policy filter can match on, per alarm category
⤜ policy-detail.....................................: describes details for policy
⤜ update-policy.....................................: updates a notification policy — omitted fields keep their values (dry-run by default)
```
##### Templates
```channel
⤜ create-template...................................: creates a message template for channels (dry-run by default)
⤜ create-velocity-map-from-csv......................: creates a velocity map for use for advanced templates
⤜ create-velocity-maps-from-csv.....................: creates multiple velocity maps for use for advanced templates
⤜ delete-template...................................: permanently deletes a message template (dry-run by default; refuses templates in use)
⤜ list-template-variables...........................: lists the ${variable} placeholders message templates and webhook payloads can use, per alarm category
⤜ list-templates....................................: lists all channel templates
⤜ update-template...................................: updates a message template — omitted fields keep their values (dry-run by default)
```
#### completion
```completion
⤜ disable...........................................: Remove shell tab-completion: delete ~/.dxdo/completion and the marker block from your shell rc file.
⤜ enable............................................: Install shell tab-completion: write ~/.dxdo/completion and add a marker block to your shell rc file.
⤜ script............................................: Print the shell tab-completion script for zsh or bash (the manual install route).
⤜ status............................................: Report the installed shell completion: shells, rc files, and whether the files match this dx-do version.
```
#### experience
```experience
⤜ create............................................: creates an experience
⤜ dashboard.........................................: summarizes experience dashboard
⤜ delete............................................: delete an experience carefully
⤜ export............................................: exports an experience configuration
⤜ import............................................: imports an experience configuration from file 
⤜ list..............................................: lists Experience names & ids 
⤜ mapping...........................................: shows mapping from Experience Top-Level to Settings ID
⤜ report............................................: reports on various parts of an experience hierarchy.
⤜ settings..........................................: lists Experience settings
⤜ summarize.........................................: summarizes an experience
```
#### sql
```sql
⤜ date-to-timestamp.................................: converts dates to timestamps for use in queries
⤜ examples..........................................: shows example queries
⤜ query.............................................: executes an APM sql query
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
#### event
```event
⤜ create-change-event...............................: creates a change event
⤜ create-event......................................: creates a plain event
⤜ query-change-events...............................: execute lucene query for change events
```
#### metricgrouping
```metricgrouping
⤜ create............................................: creates a new APM metric grouping (dry-run by default)
⤜ delete............................................: deletes an APM metric grouping (dry-run by default)
⤜ detail............................................: get full detail of an APM metric grouping
⤜ list-by-managementmodule..........................: lists all metric groupings in management modules.
⤜ list-metrics......................................: lists all live metrics in metric grouping
⤜ update............................................: updates an existing APM metric grouping (dry-run by default)
```
#### asm
```asm
⤜ list-folders......................................: lists asm folders
```
#### log
```log
⤜ import............................................: imports exported log data (OpenSearch Dashboards CSV, NDJSON/JSON hits, or any CSV) into DXO2 Log Analytics — dry-run by default
⤜ ingest............................................: ingest one or more log entries directly into the DXO2 log analytics gateway
⤜ list-fields.......................................: lists the indexed fields of one log analytics logtype with their index type
⤜ list-logtypes.....................................: lists the tenant's log analytics logtypes — one per log index family *_logs_<logtype>_*
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
⤜ copy..............................................: copy a management module.
⤜ create............................................: creates a management module.
⤜ delete............................................: delete a management module
⤜ download..........................................: downloads a management module
⤜ export............................................: exports a management module and its metric groupings, alerts and calculators.
⤜ import............................................: imports a management module from json
⤜ list..............................................: lists all management modules.
⤜ list-calculators..................................: lists calculators in a management module
⤜ update............................................: updates a management module.
```
#### metric
##### Anomaly detection
```metric
⤜ create-anomaly-detection-group....................: creates a metric anomaly-detection group from product-scoped metric filters, previewing the matching metrics (dry-run by default)
⤜ delete-anomaly-detection-group....................: permanently deletes a metric anomaly-detection group (dry-run by default)
⤜ disable-anomaly-detection-group...................: turns anomaly detection off for an anomaly-detection group, keeping its definition
⤜ enable-anomaly-detection-group....................: turns anomaly detection on for an anomaly-detection group
⤜ list-anomaly-detection-groups.....................: lists the metric anomaly-detection groups and the tenant anomaly-detection metric budget
⤜ update-anomaly-detection-group....................: changes an anomaly-detection group's name, description, product or filters, previewing the matching metrics (dry-run by default)
```
##### Data description
```metric
⤜ describe-behavior.................................: describes one metric over a range: resolution, coverage, normal range, character, structure (day levels, weekly profile, sustained departures) and excursions, as facts in units
⤜ roll-up...........................................: returns one metric rolled up at query time to a bounded number of buckets, with the min / max envelope
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
⤜ query-metadata....................................: executes a nass metadata query
⤜ query-metadata-by-ids.............................: executes a nass metadata query
⤜ query-metric-data.................................: executes a nass metric data query
⤜ register-and-report...............................: register a metric and store a single datapoint for it at the current time
⤜ register-metric...................................: register a metric in the NASS metadata store
⤜ report-by-id......................................: store a single datapoint for an already-registered metric at the current time
⤜ report-metric-value...............................: register a metric and store a single value for it at the current time
⤜ update-metadata-attribute.........................: update a single metadata attribute on a metric
```
#### situation
##### General
```situation
⤜ alarm-data........................................: provides the situation alarm data
⤜ detail............................................: show details for situation
⤜ inspect...........................................: provides entire situation inspection json
⤜ inspect-alarms....................................: provides alarms from situation inspection 
⤜ query.............................................: finds situations
⤜ summary...........................................: show the generative AI summary for a situation
⤜ trigger-webhook...................................: triggers a webhook for a situation
```
##### Algorithmic situations
```situation
⤜ disable-algorithmic-situations....................: turns OFF tenant-wide algorithmic situations so custom situation policies take effect (dry-run by default)
⤜ enable-algorithmic-situations.....................: turns ON tenant-wide algorithmic situations, which overrides custom situation policies (dry-run by default)
⤜ show-clustering-config............................: shows the tenant-wide clustering configuration that governs how situations are formed
```
##### Custom situation policies
```situation
⤜ create-custom-situation-policy....................: creates a custom situation policy controlling how alarms cluster into situations (dry-run by default)
⤜ delete-custom-situation-policy....................: permanently deletes a custom situation policy (dry-run by default)
⤜ detail-custom-situation-policy....................: shows one custom situation policy: its filter, root-cause filter, clustering fields and windows
⤜ export-custom-situation-policies..................: exports custom situation policies to a re-importable JSON file (or stdout)
⤜ import-custom-situation-policies..................: imports custom situation policies from an export file, checking each against this tenant (dry-run by default)
⤜ list-custom-situation-policies....................: lists the custom situation policies that control how alarms are clustered into situations
⤜ list-policy-fields................................: lists the alarm fields, clustering fields and naming operations a custom situation policy can use
⤜ preview-custom-situation-policy...................: replays an existing custom situation policy over recent alarms: how many matched and what it would have clustered
⤜ update-custom-situation-policy....................: updates a custom situation policy; an update can replace the policy id (dry-run by default)
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
##### General
```sli
⤜ export............................................: exports a single SLI group to a raw, re-importable JSON file (or stdout)
⤜ filter-test.......................................: read-only filter workbench: lists the filterable metric attributes for services and previews what a filter combination matches
⤜ import............................................: imports a raw SLI group export into the tenant, substituting ${serviceName} and binding it to serviceName (dry-run by default)
⤜ list-groups.......................................: lists the SLI groups (of SLIs, SLOs, and related alerts) configured in the tenant
⤜ status............................................: surfaces SLI groups with registration problems (sliStatusCode != 0)
```
##### Groups
```sli
⤜ create-group......................................: creates an SLI group with its first SLI: metric filters, a service binding, and the SLI computation (dry-run by default)
⤜ delete-group......................................: permanently deletes an SLI group and everything in it: its SLIs, SLOs, and alerts (dry-run by default)
⤜ exclude-service...................................: removes a service from an existing SLI group's bound services (dry-run by default)
⤜ include-service...................................: adds a service to an existing SLI group's bound services (dry-run by default)
⤜ set-group-filter..................................: replaces an SLI group's metric filters, previewing the resulting metric matches (dry-run by default)
```
##### SLIs
```sli
⤜ add-sli...........................................: adds an SLI (a computed service-level metric) to an existing SLI group (dry-run by default)
⤜ remove-sli........................................: removes an SLI from a group, cascading to its SLO and alerts (dry-run by default)
⤜ set-sli-filter....................................: replaces one SLI's refinement filter, previewing the resulting metric matches (dry-run by default)
```
##### SLOs and alerts
```sli
⤜ add-alert.........................................: adds an alert on one of an SLI's produced metrics: the SLI itself, its SLO percentage, or its error budget (dry-run by default)
⤜ add-slo...........................................: adds an SLO (objective + error budget) derived from an existing SLI (dry-run by default)
⤜ remove-alert......................................: removes an alert from an SLI (dry-run by default)
⤜ remove-slo........................................: removes an SLI's SLO (objective, percentage, and error budget) from a group (dry-run by default)
```
#### tenant
```tenant
⤜ maintenance.......................................: checks the Broadcom status page for DXO2 SaaS platform maintenance affecting the configured tenant (not user-configured maintenance windows)
⤜ products..........................................: lists the tenant's products (AXA, APM, DOI, LA, DXDASHBOARD, …) and their provisioning status
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
  "dxLogIngestionURL": "<optional: uim_logs log gateway base URL for the 'legacy' transport, no trailing slash. Omit on DXO2 SaaS tenants with Log Analytics provisioned — it is derived as https://logs-gateway.dxi-<na1|eu1>.saas.broadcom.com from dxGatewayHost; set it for on-premise gateways or to override>",
  "dxCustomLogIngestionURL": "<optional: host serving the Log Analytics custom JSON ingestion API (la/v2/api/ingestion/logs) for the 'custom' transport, no trailing slash. Omit on DXO2 SaaS — dxGatewayHost itself serves it; set it only for an on-premise OI host>",
  "dxLogIngestionTransport": "<optional: auto | custom | legacy — the transport 'log ingest' / 'log import' use when the command gives no transport= (default auto). custom = the Log Analytics custom JSON API on the gateway host, only for logtypes 'log list-logtypes' shows as cust_<logtype> (anything else is accepted and dropped silently, so the CLI refuses it); legacy = the uim_logs pipeline on the logs-gateway host, the path to the generic index; auto = custom when the logtype is enabled for it, else legacy>"
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



