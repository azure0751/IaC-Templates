@description('static app name')
param staticAppName string

resource staticWebSite 'Microsoft.Web/staticSites@2022-03-01' = {
  location: resourceGroup().location
  name: staticAppName 
  sku: {
    name: 'Free' 
    tier: 'Free'
  }  
}
