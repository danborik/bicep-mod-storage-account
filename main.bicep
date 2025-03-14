
@description('Optional. Azure region where the resource should be created. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Required. The name of the storage account.')
param name string

@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
@description('Optional. The SKU of the storage account. Defaults to Standard_LRS.')
param skuName string = 'Standard_ZRS'

@allowed([
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
  'StorageV2'
])
param kind string = 'StorageV2'


resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: name
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  identity: {
    type: 'SystemAssigned'
  }
}
