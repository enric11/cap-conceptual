# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

# Steps

## Init
cds init
cds add hana
cds add mta

## Testing
npx jest

### O

afegir a devDependencies del fitxer package.json
    "chai": "^4.3.0",
    "chai-as-promised": "^7.1.1",
    "chai-subset": "^1.6.0",
    "jest": "^27.1.0",

npm install -D
npm run test ->  Afegir script  "test": "jest",


# Odata V2
npm add @sap/cds-odata-v2-adapter-proxy
npm install

Afegir al server.js

# Persisntencia
npm add sqlite3 -D
cds deploy --to sqlite:sqlite.db

>>> cds deploy --to hana

## Preparar per multiples entorns

Afegir al package.json

  "cds": {
    "requires": {
      "db": {
        "[development]": { 
            "kind": "sqlite",
            "credentials": {
                "database": "database.db"
            } 
        },
        "[production]": { 
            "kind": "hana" 
        }
      }
    },


# Security

cds compile srv/service-task.cds --to xsuaa > xs-security.json

afegir al fitxer mta.yaml un nou RESORUSE

 - name: cap-console-uaa
   type: org.cloudfoundry.managed-service
   parameters:
    service: xsuaa
    service-plan: application
    path: ./xs-security.json  # include cds managed scopes and role templates

Afegir al srv el requires

- Afegri a llibreria    "passport": "^0.4.1"

- Afegir al package .json per tener le metadata desprotegit cds.env.runtime.protectMetadata = false 

- Afegir al package.json, dins de requires el salt d'autoritzacions per dev

  "cds": {
    "env":{
        "runtime": {
            "protectMetadata": false
        }
    },
    "requires": {
     "[development]":{
        "auth": { 
            "kind": "dummy-auth"
         }
     },
     "[development2]":{
        "auth": {
            "kind": "basic-auth",
            "users": {
              "test": { 
                "password": "test", 
                "roles": [ "user" ]
              }
            }
          }},

cds run --profile development2
cds watch --profile development2

Per que el client crendetials tingui els scopes,els hem de forçar afegint al security.json els authorities

  "authorities":
    [
        "$ACCEPT_GRANTED_AUTHORITIES","$XSAPPNAME.user"
    ]

No caldra!  "engines" : { "node" : "8.3.2" } ,


----------------------------------------------------------

"capconsole!t54068.user"
"$XSAPPNAME.InternalApiUser"

"authorities":
[
  "$XSAPPNAME.user"
]

Generador instancia
{
    "grant-types": [
        "client_credentials"
    ],
    "redirect-uris": [],
    "roles": [
        "ESBMessaging.send"
    ]
}


{
    "grant-types": [
        "client_credentials"
    ],
    "redirect-uris": [],
    "roles": [
        "ESBMessaging.send"
    ],
    "scopes":[
        "sb-capconsole!t54068.user"
    ]
}

