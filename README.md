### Azure Durable Functions

Project structure
```
azure-functions
-- functions
-- infrastructure
```

See `functions/README.md` for app details
See `infrastructure/README.md` for infra details

#### Deployment
Below env variables must be defined in the process 
```
ARM_CLIENT_SECRET=...
ARM_CLIENT_ID=...
ARM_TENANT_ID=...
ARM_SUBSCRIPTION_ID=...
TF_VAR_func_name=...
```
##### Infra
Run 
```
/infrastructure/deploy.sh` 
```
to create infra for functions

##### Functions
Run
```
cd functions
npm install
npm run dist
./deploy.sh
```
to deploy functions on azure
