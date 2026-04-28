@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consumption'
@Search.searchable: true
@Metadata.allowExtensions: true 
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_TRAVEL_RAP_LGL
  provider contract transactional_query
  as projection on ZR_TRAVEL_RAP_LGL
{
  key TravelUUID,
      TravelID,

      //Capacidad de busqueda avanzada
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8 //Tipo de exactitud de la busqueda (0.1 Poco exacto = mas resultados | 1.0 mas exacto = menos resultados)
      @Search.ranking: #MEDIUM
      //Object Model Text Element
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,
      _Agency.Name              as AgencyName,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #MEDIUM
      @ObjectModel.text.element: [ 'CustomerName' ] //, 'CustomerLastName' ]
      CustomerID,
      _Customer.FirstName       as CustomerName,
      //_Customer.LastName        as CustomerLastName,

      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      //_OverallStatus._Text[1: Language = $session.system_language].Text as Text,
      _OverallStatus._Text.Text as OverallStatusText : localized,

      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Currency,
      _Customer,
      _OverallStatus
}
