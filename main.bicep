targetScope = 'subscription'


@description('Azure location name as returned by az account list-locations -o table')
param location 'eastus'


// Variables

var baseName = 'abc'

// Module for loganalytics workspace and related resources
module rgloganalyticsworkspace 'modules/resource-group/main.bicep' = {
  name: 'rgloganalyticsworkspace'
  params: {
    baseName: baseName
    location: location
    suffix: 'log'
  }
}


module rgStorageContent 'modules/rgStorageContent.bicep' = {
  name: 'rgAtorageContentModule'
  params: {
    baseName: baseName
    location: location
    rgName: rgloganalyticsworkspace.outputs.resourceGroupName
    storagespecificPrefefix:'st'
   
  }
}
