@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approval CDS Consumption View'

@UI: {
 headerInfo: { typeName: 'Approval', typeNamePlural: 'Approvals', title: { type: #STANDARD, value: 'AppID' } } }

@Search.searchable: true

define root view entity Zc_Approval
  as projection on Zi_Approval
{

      @UI.facet: [ {      id:            'AppID',
                          importance: #HIGH,
                         purpose:         #STANDARD,
                         type:            #IDENTIFICATION_REFERENCE,
                         label:           'Approval',
                         position:        10 } ]

      @UI: {
          lineItem: [ { position: 10, importance: #HIGH, label: 'Approval ID' },
                      { type: #FOR_ACTION,dataAction: 'accept',label: 'ACCEPT' },
                      { type: #FOR_ACTION,dataAction: 'reject',label: 'Reject' },
                      { type: #FOR_ACTION,dataAction: 'pending',label: 'Pending' } ],
          identification: [ { position: 10, label: 'Approval ID' },
                            { type: #FOR_ACTION,dataAction: 'accept',label: 'ACCEPT' },
                            { type: #FOR_ACTION,dataAction: 'reject',label: 'Reject' },
                            { type: #FOR_ACTION,dataAction: 'pending',label: 'Pending' } ] }
      @Search.defaultSearchElement: true
  key appid  as AppID,

      @UI: {
         lineItem:       [ { position: 20, importance: #HIGH, label: 'Requestor' } ],
         identification: [ { position: 20, label: 'Requestor' } ] }
      reqtr  as Requtr,

      @UI: {
        lineItem:       [ { position: 30, importance: #HIGH, label: 'Approval Status',criticality: 'StatusCriticality' } ],
        identification: [ { position: 30, label: 'Approval Status',criticality: 'StatusCriticality' } ] }
      status as Status,

      @UI.hidden: true
      StatusCriticality

}
