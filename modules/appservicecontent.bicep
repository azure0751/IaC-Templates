targetScope = 'subscription'


@description('Azure Location e.g. westeurope')
param location string



param rgName string

// Create Storage Account
module st '../appservice.bicep' = {
  name: 'storageaccount'
  scope: resourceGroup(rgName)
  params: {
     location: location  
   
  }
}
