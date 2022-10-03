select cast(dbo.ToBdt(tt.CreatedOn)as date) [Date],
	   w.Id 								[WarehouseID],
	   w.Name 								[Warehouse],
	   pv.Id 								[PVID],
	   pv.Name 								[Product],
	   Count(Case when tt.ToState in (16) 
			 then pv.Id 
			 else null end
	   )									[MissingQTY]

from thing t
join ThingEvent te on t.id = te.ThingId 
join ThingTransaction tt on tt.Id = te.ThingTransactionId 
join Warehouse w on w.Id = t.WarehouseId 
join ProductVariant pv on pv.Id = t.ProductVariantId 

where tt.CreatedOn >= '2022-06-08 00:00 +06:00'
and tt.CreatedOn < '2022-06-15 00:00 +06:00'
--and pv.ShelfType in (5,9)
and tt.ToState in (16)
and pv.Id in (27863)
--and w.Id in (7)
--and t.Id >= 38603735
--and t.Id <= 137573013

Group by cast(dbo.ToBdt(tt.CreatedOn)as date),
	     w.Id,
	     w.Name,
	     pv.Id,
	     pv.Name

order by 1


----====================================================-----
select Max(te.ThingId) [MaximumThingID],
       Min(te.ThingId) [MinimumThingID]

from ThingEvent te
join ThingTransaction tt on tt.Id = te.ThingTransactionId 

where tt.CreatedOn >= '2022-03-17 00:00 +06:00'
and tt.CreatedOn < '2022-03-18 00:00 +06:00'
----====================================================-----