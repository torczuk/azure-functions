### Azure Durable Functions

#### Run locally
One of the dissadvanage of servelerss applications are/were problems with running them outside of the cloud provider infrastructure.
Fortunatelly MS provided storage account emulator called azurite that sumulates underlying storage for the functions.

For local development use below configuration for `local.settings.json` file. Account key is well known secret for azure storage emulator and can be found on the official
MS [documentation](https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string#connect-to-the-emulator-account-using-the-shortcut)
```
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;TableEndpoint=http://127.0.0.1:10002/devstoreaccount1",
    "FUNCTIONS_WORKER_RUNTIME": "node"
  }
}
```

Install `func`
```$bash
brew install azure-functions-core-tools@4
```


#### Authentication agains storage emulator.
Currently azurite doesn't provide anonymous way to access storages. In case you'd like to have access to HTTP api you can generate token for authentication
Generate SAS token
```
az storage account generate-sas --account-key Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw== --account-name devstoreaccount1 --expiry 2023-01-01 --permissions cdlruwap --services qt --resource-types sco
```
List all avaviable tables agains
```
➜  ~ curl -v \
http://127.0.0.1:10002/devstoreaccount1/Tables\?se\=2023-01-01\&sp\=rwdlacup\&sv\=2018-03-28\&ss\=qt\&srt\=sco\&sig\=OL3XURxR63hnw5hb2LuJma3lf/2VMvGi5h8Ssa%2BB0t8%3D \
-H "Accept: application/json;odata=fullmetadata"
```

Running locally or for the testing purpose