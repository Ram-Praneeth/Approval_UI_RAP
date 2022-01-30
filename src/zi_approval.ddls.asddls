@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approval CDS Interface View'
define root view entity Zi_Approval
  as select from zapproval
{
  key appid,
      reqtr,
      status,

      @Semantics.text: true
      case when status = 'APPROVED' then 3
           when status = 'AWAITING' then 2
           when status = 'REJECTED' then 1
      //           when status = 'B' then 5
      //           when status = '3' then 0
           else 4
           end as StatusCriticality

}
