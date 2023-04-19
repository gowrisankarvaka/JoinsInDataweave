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
outerJoin(payload,lookup, (payload)-> payload.AccountId, (lookup)-> lookup.AccountId__c) map (item,index) ->
{
   (item.l  update {
       case .RecordId -> item.r.RecordId  default $
       case .Company -> item.r.Company  default $
   })
}

/*outerJoin(payload,lookup, (payload)-> payload.AccountId, (lookup)-> lookup.AccountId__c) map (item,index) ->
{
   (item.l  update {
       case .RecordId -> item.r.RecordId  default $
       case .Company -> item.r.Company  default $
   })
} 
*/
/*
leftJoin(payload, lookup, (payload)->payload.AccountId, (lookup)-> lookup.AccountId__c) map ((item, index) ->
    item.l  update {
        case .RecordId -> item.r.RecordId default $
        case .Company -> item.r.Company default $
    }
 )
*/