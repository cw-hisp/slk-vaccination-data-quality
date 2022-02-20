with psis as (
    select (psi.created::date -
            coalesce(psi.eventdatavalues -> 'WcMFAfaJ46U' ->> 'value',
                     psi.eventdatavalues -> 'rocYT951Ynw' ->> 'value',
                     psi.eventdatavalues -> 'CNF9cqJGsj2' ->> 'value',
                     psi.eventdatavalues -> 'QYXLddL9ouI' ->> 'value',
                     psi.executiondate::text)::date) as date_gap
    from programstageinstance psi
    where programstageid in (17648, 17810, 55182266, 59610758))
select count(psis.date_gap), psis.date_gap
from psis
group by psis.date_gap
order by psis.date_gap;
