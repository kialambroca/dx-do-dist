# @dx-do/cli

#### Command-line execution of DXO2 SaaS operations

***

## Usage

:warning: Using npm install for this package is highly discouraged.

The first time you run, an interactive setup will create <USER_HOME>/.dxdo/default.dxo2.config.json; you can have multiple configurations.  the "--config=<config>" has the following resolution:


| variation                                 | resolution                             |
|-------------------------------------------|----------------------------------------|
| No Config Specified                       | `~/.dxdo/default.dx02.config.json`     |
| `--config=tenant-name`                    | `~/.dxdo/tenant-name.dx02.config.json` |
| `--config=tenant-name.dx02.config.json`   | `~/.dxdo/tenant-name.dx02.config.json` |                                      |
| `--config=./tenant-name.dx02.config.json` | `<CWD>/tenant-name.dx02.config.json`   |                                     

### Full configuration options are available by running 

```dx-do --no-config help configuration```

### via binary

1. Download the binary for your platform
2. rename to "dx-do" and add to path

```
dx-do <--config=<config-file>> command-group command <parameter>=<value>
```

# via npx

```
npx @dx-do/cli@<version> <--config=<config-file>> command-group command <parameter>=<value>
```
# via bunx

```
bunx @dx-do/cli@<version> <--config=<config-file>> command-group command <parameter>=<value>
```



#### Output

```
ℹ  info      dx-do v6.1.1 on node v22.21.0 on darwin-arm64 via node (ssl: 3.5.4)
⚠  warning   Not loading configuration
✖  error     Usage: dx-do --option[=value]... <command-group> <command> <command-param>=<value>...
ℹ  info      Available command-groups: acc, agent, agentic, alarm, alert, apm-universe, asm, attribute, audit, auth, axa, blob, channel, config, dashboard, diagnose, event, experience, graph, help, inventory, jsextension, log, managementmodule, metrex, metric, metricgrouping, nass, o2-alert, o2-managementmodule, o2-metricgrouping, o2-universe, perspective, service, situation, sql, tas, topographer, trace, ui, vertex
```


### Command Groups

#### agent
```agent
⤜ vertices..........................................: gets vertices for agent
⤜ trace.............................................: starts trace on specified agents
⤜ query-by-regex....................................: query by regex
⤜ query-by-name.....................................: ensure a specific agent exists.
⤜ metric-count-summary..............................: retrieves metric counts for agents as csv
⤜ count-via-atc.....................................: count agents using the /atc/agents request.
⤜ statuses..........................................: lists all agents statuses
⤜ list..............................................: lists all agents
⤜ licensing-beta....................................: generate licensing report with configuration
⤜ licensing.........................................: generate licensing report
⤜ licensing-config-generate.........................: creates a default licensingConfigFile to be modified for licensing-beta command.
⤜ attributes........................................: gets attributes for agent vertex
⤜ get-agent-traces..................................: retrieves traces
⤜ trace-summaries...................................: retrieves trace summaries for an agent
```
#### vertex
```vertex
⤜ vertex-type-metric-mapping........................: dumps metric mapping for a vertex type
⤜ get-vertex-traces.................................: retrieves traces
⤜ get-vertex-trace-summaries........................: retrieves trace summaries for vertices
⤜ vertex-definitions................................: dumps all metric mappings for all vertices
⤜ vertex-definition.................................: dumps vertex definition for a single vertex type
⤜ attributes........................................: list ATC attributes
⤜ state.............................................: provides state on a single vertex
⤜ search............................................: search for matching vertices in a universe
⤜ search-all........................................: search for matching vertices in all universes
⤜ query-mapped-metrics..............................: executes metric query for a vertex's mapped metrics.
⤜ patch-universe....................................: patch matching vertices in a universe
⤜ override-vertex-metric-mapping....................: dumps performance specifier and metric root for a vertex type
⤜ generate-patch-from-csv...........................: generates a bulk-patch file from a CSV
⤜ detail............................................: provides detail on a single vertex
⤜ bulk-patch-schema.................................: generates the bulk-patch schema
⤜ bulk-patch-rollback...............................: rolls back a bulk-patch with a rollback file.
⤜ bulk-patch........................................: patches mutiple vertices using the bulk-patch file.
⤜ attribute-values..................................: gets values for an attribute
⤜ all-metric-mappings...............................: dumps all metric mappings for all vertices
⤜ add-vertex-definition.............................: add vertex definition from a file
```
#### auth
```auth
⤜ validate-configuration-keys.......................: validates keys
⤜ user-search.......................................: searches for users
⤜ list-groups.......................................: shows all authentication group names
⤜ current...........................................: shows auth of current token
```
#### dashboard
```dashboard
⤜ user-list.........................................: looks up a user by email
⤜ summarize-dashboard-tags..........................: shows a summary of all dashboards' tags.
⤜ set-theme.........................................: sets the current theme
⤜ set-folder-refresh-options........................: sets refresh options for all dashboards in folder
⤜ set-dashboard-refresh-options.....................: sets dashboard refresh options
⤜ replace-folder-tags...............................: replaces tags for all dashboards in a folder
⤜ replace-dashboard-tags............................: replaces tags for a dashboard
⤜ folder-list.......................................: show id/uid/title of all folders.
⤜ get-theme.........................................: shows the current theme
⤜ folder-permissions................................: gets permissions for a folder
⤜ get-dashboard-tags................................: shows current dashboard tags
⤜ get-dashboard-refresh-options.....................: shows current dashboard refresh options
⤜ folder-import.....................................: imports a folder and its dashboards from an export file.
⤜ folder-export.....................................: exports a folder and all dashboards in it.
⤜ folder-details....................................: show details for folder
⤜ dashboard-variables-list..........................: shows current values of dashboard variables
⤜ user-search.......................................: finds dashboard users
⤜ dashboard-update..................................: updates a dashboard from an export file.
⤜ dashboard-search..................................: finds dashboards
⤜ dashboard-list-by-folder..........................: lists dashboards in folder
⤜ dashboard-import..................................: creates a new dashboard from an export file.
⤜ dashboard-export..................................: exports a single dashboard
⤜ folder-create.....................................: creates a folder
⤜ add-folder-tags...................................: adds tags to all dashboards in a folder
⤜ folder-add-permission.............................: adds folder permission for a user by email or userId
⤜ add-dashboard-tags................................: adds tags to a dashboard
```
#### jsextension
```jsextension
⤜ upload............................................: upload a js extension file
⤜ list..............................................: list
⤜ enable............................................: enable js extension
⤜ disable...........................................: disable js extension
⤜ delete............................................: delete js extension
```
#### axa
```axa
⤜ upload-application-ba-extension...................: upload new custom AXA BrowserAgent extension javascript.
⤜ update-profile....................................: updates a AXA data collection profile
⤜ show-application-service-mapping..................: lists all AXA application names and their associated services
⤜ show-activity-tree................................: shows activity tree from session events
⤜ set-application-profile...........................: sets the profile by id for an AXA Application
⤜ servicify-application.............................: creates service and universe for 'orphaned' AXA applications
⤜ list-sessions.....................................: dumps filtered AXA session events
⤜ list-screens......................................: lists the screens available for business activities defined for an AXA Application
⤜ list-profiles.....................................: lists all AXA data collection profiles
⤜ list-applications.................................: lists all AXA application names/keys
⤜ list-activities...................................: lists the business activities defined for an AXA Application
⤜ import-profile....................................: import a AXA data collection profile
⤜ get-application-snippet...........................: gets AXA BrowserAgent snippet for an application
⤜ get-application-profile...........................: gets the profile/id for an AXA Application
⤜ get-application-ba-extension......................: gets AXA BrowserAgent extension javascript.
⤜ export-profile....................................: exports a AXA data collection profile
⤜ dump-sessions-events..............................: dumps filtered AXA session events
⤜ delete-application................................: delete an existing AXA application.
⤜ create-application................................: creates a new AXA application definition.
⤜ create-activity...................................: create a business activity for an AXA Application
⤜ crash-summary.....................................: summary of crashes
⤜ crash-list-by-group...............................: list crashes by group
⤜ crash-detail......................................: get details for a crash
⤜ crash-all.........................................: list all crashes
⤜ bulk-servicify....................................: creates service and universe for 'orphaned' AXA applications
```
#### config
```config
⤜ upgrade...........................................: upgrade legacy dx-do configuration to current version
⤜ generate-user-token...............................: generates an user token
⤜ generate-agent-token..............................: generates an agent token
⤜ debug-token.......................................: shows decoded token
⤜ debug.............................................: shows configuration details
⤜ connector.........................................: shows connector config for tenant
⤜ create............................................: create new configuration interactively
```
#### channel
```channel
⤜ update-template...................................: update an existing channel message template
⤜ policy-detail.....................................: describes details for policy
⤜ list-templates....................................: lists all channel templates
⤜ list-policies.....................................: lists all channel policies
⤜ list..............................................: lists all channels
⤜ import............................................: imports channels/templates from file
⤜ export............................................: exports all channels/templates to file
⤜ enable-channel....................................: enable a channel
⤜ disable-channel...................................: disable a channel
⤜ create-velocity-maps-from-csv.....................: creates multiple velocity maps for use for advanced templates
⤜ create-velocity-map-from-csv......................: creates a velocity map for use for advanced templates
⤜ create-template...................................: create a channel message template
```
#### alert
```alert
⤜ update-summary....................................: update a summary alert.
⤜ update-simple.....................................: update a simple alert.
⤜ list-by-management-module.........................: lists all alerts in a management module.
⤜ list..............................................: lists all alerts.
⤜ enable-all........................................: enable all alerts for a management module
⤜ enable............................................: enable an alert.
⤜ disable-all.......................................: disable all alerts for a management module
⤜ disable...........................................: disable an alert.
⤜ debug-by-management-module........................: debug all alerts in a management module.
⤜ copy..............................................: copy an alert
⤜ copy-with-metric-grouping.........................: copy an alert with it's metric grouping
⤜ analyze...........................................: analyzes an alert and it's threshold
⤜ detail............................................: get alert definition
⤜ delete............................................: deletes an APM alert (dry-run by default)
⤜ create............................................: creates a new APM simple alert (dry-run by default)
```
#### nass
```nass
⤜ update-metadata-attribute.........................: update a single metadata attribute on a metric
⤜ report-metric-value...............................: register a metric and store a single value for it at the current time
⤜ register-metric...................................: register a metric in the NASS metadata store
⤜ query-metric-data.................................: executes a nass metric data query
⤜ query-metadata....................................: executes a nass metadata query
⤜ query-metadata-by-ids.............................: executes a nass metadata query
⤜ query.............................................: executes a nass query from file containing nassql query json
```
#### alarm
```alarm
⤜ update-field......................................: updates an alarm field
⤜ unacknowledge.....................................: unacks an alarm
⤜ list..............................................: lists alarms
⤜ queue-detail......................................: dumps queue details
⤜ list-queues.......................................: lists alarm queues
⤜ list-enrichment-rules.............................: lists alarm enrichment rules
⤜ explain-enrichment-rules..........................: gives an simplified explanation of enrichment rules
⤜ clear.............................................: clears an alarm
⤜ bulk-lifecycle....................................: shows alarm lifecycle
⤜ assign............................................: assigns an alarm to a troubleshooter
⤜ analyze...........................................: shows counts of alarm by [source product] and managementmodule / type
⤜ trigger-webhook...................................: triggers a webhook for an alarm
⤜ related...........................................: gets related alarms
⤜ lifecycle.........................................: shows alarm lifecycle
⤜ detail............................................: dumps alarm details
⤜ create-alarm......................................: creates an alarm via jarvis ingestion
⤜ acknowledge.......................................: acknowledges an alarm
```
#### apm-universe
```apm-universe
⤜ stats.............................................: provides detail on all APM universes
⤜ sanity-check......................................: ensures APM universes are not set up exceptionally badly.
⤜ list..............................................: lists all APM universes
⤜ export............................................: dumps a single APM universe json
⤜ detail............................................: provides detail on a single APM universe
⤜ delete............................................: deletes an APM universe
⤜ create............................................: creates an APM universe
⤜ add-metric-source.................................: adds an agent / regex to an APM universe definition.
```
#### o2-universe
```o2-universe
⤜ services..........................................: lists services associated with a universe
⤜ list..............................................: lists all O2 universes
⤜ export............................................: dumps a single O2 universe JSON
⤜ create............................................: creates a o2 universe
```
#### ui
```ui
⤜ start.............................................: Start the dx-do query builder UI server (Fastify + MCP) and open the browser [experimental]
```
#### help
```help
⤜ ui................................................: Explains `dx-do ui start` — the browser-based visual query builder for TAS / NASSQL / Metrics-Metadata queries.
⤜ time-formats......................................: explains time formats for 'metric data' and 'agent get-trace-sumaries'.
⤜ metric-types......................................: explains numericMetricType and enumMetricType for 'nass register-metric' and 'nass report-metric-value'.
⤜ bulk-patch........................................: explains vertex bulk-patch
⤜ dashboard.........................................: explains dashboard command setup.
⤜ configuration.....................................: explains configuration
⤜ commands-md.......................................: explains commands in md format
⤜ commands..........................................: explains commands.
⤜ agentic-mcp.......................................: Explains the `dx-do agentic mcp` stdio MCP server and how to wire it into Claude Code / Cursor / mcp-inspector.
```
#### trace
```trace
⤜ inject-simple.....................................: inject a synthetic APM transaction trace into the tracestore using CLI arguments
⤜ inject............................................: inject APM transaction trace(s) from a JSON file into the tracestore
⤜ trace-details.....................................: get trace details for traceId
⤜ query-threaddumps.................................: find threaddumps for an agent
⤜ get-threaddump....................................: retrieve a previously collected threaddump
⤜ collect-threaddump................................: trigger a trace on an agent
⤜ get-agent-traces..................................: retrieves traces
```
#### topographer
```topographer
⤜ test-configuration................................: test a topographer configuration
⤜ generate-sample...................................: generate a sample topographer configuration
⤜ dump-schema.......................................: dumps the topographer configuration schema (for use in IDE)
```
#### service
```service
⤜ top-level-services................................: shows top level services
⤜ search............................................: show services matching search term
⤜ slis..............................................: show the service SLIs (and child service SLIs)
⤜ overview..........................................: dump the service overview as json
⤜ metrics...........................................: dump the service metrics as json
⤜ inventory-overlap.................................: shows inventory overlaps for services
⤜ inventory.........................................: shows inventory for a service
⤜ dependency-graph..................................: shows a dependency graph for a service
⤜ delete-service....................................: deletes service (and optionally it's subservices)
⤜ create-empty-service..............................: creates a simple empty service
⤜ all-services......................................: shows all services
```
#### graph
```graph
⤜ test-vertex-type-mapping..........................: tests vertexes for type mapping
⤜ summary...........................................: summarizes vertices & edges
⤜ summary-at........................................: summarizes vertices & edges at a specific time
⤜ store.............................................: stores vertexes and edges using the (legacy) APM interface
⤜ status-check......................................: summarizes vertices alerts
⤜ export............................................: exports universe graph at a configurable time
⤜ summarize-edges...................................: summarizes application edges
```
#### metric
```metric
⤜ test-time-format..................................: allows testing of time parsing
⤜ data-metric.......................................: gets metric values for a single metric.
⤜ id................................................: gets metric id for a single metric.
⤜ data..............................................: gets metric values
⤜ attributes........................................: gets attributes for metric (or metric's agent, if metric doesn't belong to a vertex)
```
#### metrex
```metrex
⤜ test-configuration................................: test a metrex configuration
⤜ generate-vertex-definition........................: generate a vertex definition from a metrex configuration
⤜ generate-sample...................................: generate a sample metrex configuration schema
⤜ dump-schema.......................................: dumps the metrex configuration schema (for use in IDE)
⤜ associate-vertex-metrics..........................: associate metrics to vertices using the output of test-configuration command.
```
#### tas
```tas
⤜ store-graph.......................................: store vertices and edges in the TAS topology store from a JSON file
⤜ query-json........................................: executes a query defined in a json file
⤜ query-all.........................................: finds everything
⤜ query-agents......................................: finds everything
```
#### experience
```experience
⤜ summarize.........................................: summarizes an experience
⤜ list..............................................: lists Experience names & ids 
⤜ import............................................: imports an experience configuration from file 
⤜ export............................................: exports an experience configuration
⤜ settings..........................................: lists Experience settings
⤜ report............................................: reports on various parts of an experience hierarchy.
⤜ mapping...........................................: shows mapping from Experience Top-Level to Settings ID
⤜ delete............................................: delete an experience carefully
⤜ dashboard.........................................: summarizes experience dashboard
⤜ create............................................: creates an experience
```
#### situation
```situation
⤜ trigger-webhook...................................: triggers a webhook for a situation
⤜ summary...........................................: show the generative AI summary for a situation
⤜ inspect-alarms....................................: provides alarms from situation inspection 
⤜ inspect...........................................: provides entire situation inspection json
⤜ detail............................................: show details for situation
⤜ alarm-data........................................: provides the situation alarm data
⤜ query.............................................: finds situations
```
#### acc
```acc
⤜ set-bundle-property...............................: sets a property override on a bundle within a package (single PATCH)
⤜ package-required-bundles..........................: lists bundles required by a package (always-shipped framework set)
⤜ package-property-overrides........................: lists property overrides applied on top of bundle defaults for a package
⤜ package-details...................................: gets package details
⤜ package-compatible-bundles........................: lists bundles compatible with a package (candidate add-bundle set)
⤜ package-bundles...................................: gets package bundles
⤜ package-bundle-profile............................: fetches a single bundle's profile (property catalog + overrides) within a package
⤜ package-builder-options...........................: lists valid environment combinations for create-package (UI 'new package' wizard data)
⤜ list-packages.....................................: lists acc packages
⤜ list-bundles......................................: lists acc bundles
⤜ initialize-bundle-directory.......................: initialize a prepared bundle directory
⤜ import-packages...................................: import packages from an export file
⤜ import-bundle.....................................: import bundle from a bundle tar.gz file
⤜ export-packages...................................: exports packages to a file
⤜ download-package..................................: downloads a server-assembled tenant-stamped agent package tarball
⤜ download-bundle...................................: downloads bundle
⤜ delete-package....................................: deletes a package
⤜ create-package....................................: creates a new ACC package from typed args (UI new-package wizard equivalent)
⤜ bundle-details....................................: gets bundle details
⤜ add-package-bundles...............................: attaches bundles to a package (single PATCH, no draft/publish dance)
```
#### sql
```sql
⤜ examples..........................................: shows example queries
⤜ query.............................................: executes an APM sql query
⤜ date-to-timestamp.................................: converts dates to timestamps for use in queries
```
#### o2-metricgrouping
```o2-metricgrouping
⤜ update............................................: updates a platform metric grouping
⤜ list..............................................: lists platform metric groupings, optionally filtered by management module
⤜ detail............................................: shows full detail of a platform metric grouping
⤜ delete............................................: deletes a platform metric grouping (dry-run by default)
⤜ create............................................: creates a new platform metric grouping (dry-run by default)
```
#### o2-managementmodule
```o2-managementmodule
⤜ update............................................: updates a platform management module
⤜ list..............................................: lists all platform management modules
⤜ delete............................................: deletes a platform management module (dry-run by default)
⤜ create............................................: creates a new platform management module (dry-run by default)
```
#### o2-alert
```o2-alert
⤜ update............................................: updates a platform alert spec (dry-run by default)
⤜ list..............................................: lists platform alert specs, optionally filtered by management module
⤜ detail............................................: shows full detail of a platform alert spec
⤜ delete............................................: deletes a platform alert spec (dry-run by default)
⤜ create............................................: creates a new platform alert spec (dry-run by default)
```
#### managementmodule
```managementmodule
⤜ update............................................: updates a management module.
⤜ list-calculators..................................: lists calculators in a management module
⤜ download..........................................: downloads a management module
⤜ delete............................................: delete a management module
⤜ create............................................: creates a management module.
⤜ copy..............................................: copy a management module.
⤜ list..............................................: lists all management modules.
⤜ import............................................: imports a management module from json
⤜ export............................................: exports a management module and its metric groupings, alerts and calculators.
```
#### metricgrouping
```metricgrouping
⤜ update............................................: updates an existing APM metric grouping (dry-run by default)
⤜ detail............................................: get full detail of an APM metric grouping
⤜ delete............................................: deletes an APM metric grouping (dry-run by default)
⤜ create............................................: creates a new APM metric grouping (dry-run by default)
⤜ list-by-managementmodule..........................: lists all metric groupings in management modules.
⤜ list-metrics......................................: lists all live metrics in metric grouping
```
#### log
```log
⤜ query.............................................: queries DXO2 Log analytics
⤜ ingest............................................: ingest one or more log entries directly into the DXO2 log analytics gateway
```
#### blob
```blob
⤜ list-schemas......................................: list current blob schemas
⤜ list-blobs........................................: list blobs for a schema
⤜ fetch.............................................: fetches the content of a blob
```
#### perspective
```perspective
⤜ list..............................................: List Map View Perspectives
⤜ import............................................: Import Map View Perspective
⤜ export............................................: Export Map View Perspective
⤜ delete............................................: Delete Map View Perspective
```
#### asm
```asm
⤜ list-folders......................................: lists asm folders
```
#### inventory
```inventory
⤜ sources...........................................: lists all sources of inventory items
⤜ search............................................: searches inventory
⤜ metrics...........................................: finds metrics associated with inventory
⤜ lookup............................................: searches inventory using free text search, be aware that this may not support all product sources
⤜ layers............................................: lists all topology layers with a count of entities on each layer
⤜ list-inventorize-rules............................: shows rules for creating inventory from metrics
⤜ delete-inventorize-rule...........................: deletes an inventorize rule
⤜ create-inventorize-rule...........................: creates a rule for creating inventory from metrics, dryrun mode by default, set mode=create to execute.
⤜ attributes........................................: list all available attributes
```
#### event
```event
⤜ query-change-events...............................: execute lucene query for change events
⤜ create-event......................................: creates a plain event
⤜ create-change-event...............................: creates a change event
```
#### attribute
```attribute
⤜ dump..............................................: dumps all attributes by layer
```
#### diagnose
```diagnose
⤜ services..........................................: Audit the bound tenant's DXO2 service organization. Returns severity-tagged findings (errors / warnings / recommendations) per service. Optionally scope by serviceName (with or without descendants). [experimental]
⤜ explain...........................................: Explain every diagnostic rule (or filter to one scope). Pure metadata — no tenant binding required. [experimental]
```
#### audit
```audit
⤜ query.............................................: query data-store audit events
```
#### agentic
```agentic
⤜ schema............................................: Emit the canonical JSON Schema for a DataStore query payload (TAS / NASSQL / Metrics-Metadata), optionally narrowed to one op. [experimental]
⤜ mcp...............................................: Run a stdio MCP server for the bound tenant. Wire into Claude Code / Cursor with `claude mcp add` (or equivalent). [experimental]
⤜ learn-tenant......................................: Reserve the per-tenant corpus storage at ~/.dxdo/<alias>/corpus/ (no-op stub; full learning logic is forthcoming). [experimental]
⤜ extract-claude-marketplace........................: Extract the embedded Claude Code marketplace + plugins to disk. Writes `<base-directory>/dx-do-claude-marketplace/` containing the marketplace.json and one subdir per plugin. Prints the `/plugin` slash-command sequence to install them. [experimental]
⤜ corpus-sections...................................: List the sections of the dx-do catalog (queries, cookbooks, entities, …). [experimental]
⤜ corpus-section-index..............................: List entries in a catalog section. Each row is labelled `<section>/<id>` for copy-paste into `agentic corpus-entry`. [experimental]
⤜ corpus-entry......................................: Print a catalog entry. `document=<section>/<id>` (e.g. `entities/host`, `cookbooks/tas-quickstart`, `queries/01-discover-vertices`). [experimental]
```
### Options


#### Insecure HTTPS for Non-Proxied On-Prem

You may set the ALLOW_INSECURE_HTTPS environment variable to true in order to use self-signed or expired certificates

```
export ALLOW_INSECURE_HTTPS=true
npx @dx-do/cli alert list
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

When an MCP client (Claude Code, Cursor, mcp-inspector) spawns `dx-do` as a subprocess for a currently-experimental command (e.g. `agentic mcp`), set the env var in the spawn config so the gate is open for the child process. The bundled `investigate@dx-do` Claude Code plugin already does this in its `plugin.json`.


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



