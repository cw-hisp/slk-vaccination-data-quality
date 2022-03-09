with dose1 as (
    select psi.programinstanceid, psi.executiondate
    from programstageinstance psi
    where psi.deleted = false
      and psi.programstageid = 17648),
     dose2 as (
         select psi.programinstanceid, psi.executiondate
         from programstageinstance psi
         where psi.deleted = false
           and psi.programstageid = 17810
     ),
     dose3 as (
         select psi.programinstanceid, psi.executiondate
         from programstageinstance psi
         where psi.deleted = false
           and psi.programstageid = 55182266
     ),
     dose4 as (
         select psi.programinstanceid, psi.executiondate
         from programstageinstance psi
         where psi.deleted = false
           and psi.programstageid = 59610758
     )
select tv.value
from dose2
         join dose1 on dose1.programinstanceid = dose2.programinstanceid
         left join dose3 on dose2.programinstanceid = dose3.programinstanceid
         left join dose4 on dose2.programinstanceid = dose4.programinstanceid
         join programinstance pi on pi.programinstanceid = dose2.programinstanceid
         join trackedentityattributevalue tv on tv.trackedentityinstanceid = pi.trackedentityinstanceid
where tv.trackedentityattributeid = 17633
  and length(tv.value) = 12
  and dose3.programinstanceid is null
  and dose4.programinstanceid is null
  and (now()::date - dose2.executiondate::date ) < 90
limit 20;
