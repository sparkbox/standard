# Server Naming Conventions

Servers should be named consistently and in a manner in which they can be easily identifiable with regard to the client/property and purpose that they serve. We recommend the following naming conventions when creating/building new servers:

```
<domain-or-client-name>-<server-type-xx>-<environment>
```

- `domain-or-client-name`: this should be the name of the domain or client name the server will support, i.e. `seesparkbox.com`, `merchantssecurity` or `dpandl`
- `server-type`: this should be an acronym or short description of the type of server it is, which should typically be one of the following:
  - `web`: web server
  - `db`: database server
  - `lb`: load balancer
  - `app`: dedicated application server
- `xx`: the two-digit server instance number, starting with `01` and increasing by 1 incrementally
- `environment`: this should be the environment designation for the server, should typically be one of the following:
  - `prod`: production servers
  - `qa`: QA servers
  - `staging`: staging and client testing servers
  - `dev`: development and testing servers

### Examples

- `seesparkbox.com-lb01-prod`
- `seesparkbox.com-db01-prod`
- `seesparkbox.com-web01-prod`
- `seesparkbox.com-web02-prod`
- `seesparkbox.com-lb01-qa`
- `seesparkbox.com-db01-qa`
- `seesparkbox.com-web01-qa`
- `seesparkbox.com-web02-qa`
- `merchantssecurity-lb01-prod`
- `merchantssecurity-db01-prod`
- `merchantssecurity-web01-prod`
- `merchantssecurity-web02-prod`
