targetScope = 'resourceGroup'

// --- Parameters

@description('base name of resources')
param baseName string

@description('Azure Location e.g. westeurope')
param location string

param accessTier string ='Hot'

param storagespecificPrefefix string

// --- Variables

var storagename ='${storagespecificPrefefix}${baseName}'

// --- Resources

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storagename
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
    publicNetworkAccess: 'Disabled'
    allowBlobPublicAccess: false
    encryption: {
      requireInfrastructureEncryption: true
    }
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: []
      resourceAccessRules: []
      virtualNetworkRules: []
    }
  }
}
 
// --- Outputs

output storageName string = storageaccount.name
output StorageAccountID string=storageaccount.id
output storageAccount object = storageaccount
