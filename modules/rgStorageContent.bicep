targetScope = 'subscription'


@description('base name of resources')
param baseName string

@description('Azure Location e.g. westeurope')
param location string

param storagespecificPrefefix string

param rgName string

// Create Storage Account
module st 'mainstorage.bicep' = {
  name: 'storageaccount'
  scope: resourceGroup(rgName)
  params: {
    baseName: baseName
    storagespecificPrefefix : storagespecificPrefefix
    location: location  
   
  }
}


