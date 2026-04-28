@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TRAVEL_RAP_LGL
  provider contract transactional_interface
  as projection on ZR_TRAVEL_RAP_LGL
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      //@Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Currency,
      _Customer,
      _OverallStatus
}
