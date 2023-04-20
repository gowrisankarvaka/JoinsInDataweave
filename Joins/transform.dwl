%dw 2.0
import * from dw::core::Arrays
var lookup = [
  {
    "AccountId__c": "1202378",
    "RecordId": "0124W000001hC6BQA1",
    "Company": "1570"
  },
  {
    "AccountId__c": "1202379",
    "RecordId": "0124W000001hC6BQ2U",
    "Company": "1570"
  },
  {
    "AccountId__c": "1202380",
    "RecordId": "0124W000001hC6BQ3AU",
    "Company": "1570"
  }
]
output application/json  
---
//updating the input values of RecordId and Company based on AccountId, with variable values of RecordId and company
//join used to update data and printing only matching values like in database
/*join(payload,lookup, (payload)-> payload.AccountId, (lookup)-> lookup.AccountId__c) map (item,index) ->
{
  (item.l  update {
    case .RecordId -> item.r.RecordId  default $
    case .Company -> item.r.Company  default $
  })
}*/

//outerJoin used to update data and printing all updated data and with an extra empty object
/*outerJoin(payload,lookup, (payload)-> payload.AccountId, (lookup)-> lookup.AccountId__c) map (item,index) ->
{
   (item.l  update {
       case .RecordId -> item.r.RecordId  default $
       case .Company -> item.r.Company  default $
   })
} 
*/
//leftJoin used to update data and printing all updated data
leftJoin(payload, lookup, (payload)->payload.AccountId, (lookup)-> lookup.AccountId__c) map ((item, index) ->
    item.l  update {
        case .RecordId -> item.r.RecordId default $
        case .Company -> item.r.Company default $
    }
 )

