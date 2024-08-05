targetScope = 'subscription'

@description('the location of the resource group')
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'my-resource-group'
  location: location
}

module staticAppDeployment './modules/static-web-app-module.bicep' = {
  name: 'static-web-app-deployment'
  scope: resourceGroup
  params: {
    staticAppName: 'vikasabc06july'
  }
}
