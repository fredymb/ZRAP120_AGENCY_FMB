@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.semanticKey: ['AgencyId']
@Search.searchable: true
define root view entity ZC_AGENCYFMB
  provider contract transactional_query
  as projection on ZR_AGENCYFMB
{
  key Uuid,
      @Consumption.valueHelpDefinition: [{
           entity : {name: '/DMO/I_Agency_StdVH', element: 'AgencyID'  },
           additionalBinding: [ { localElement: 'AgencyName',  element: 'Name',         usage: #RESULT },
                                { localElement: 'Street',      element: 'Street',       usage: #RESULT },
                                { localElement: 'PostalCode',  element: 'PostalCode',   usage: #RESULT },
                                { localElement: 'City',        element: 'City',         usage: #RESULT } ],
           useForValidation: true }]
      AgencyId,
      @Search: {
      defaultSearchElement: true,
      fuzzinessThreshold:  0.8
      }
      AgencyName,
      Street,
      PostalCode,
      City,
      CountryCode,
      PhoneNumber,
      EmailAddress,
      WebAddress,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
