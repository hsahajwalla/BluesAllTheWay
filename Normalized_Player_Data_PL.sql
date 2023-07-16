-- SELECT `Player`,`Prog Passing Distance` now ppd, `Passes into Final Third` now ptof3, `Key Passes` now keypasses, `Mid 3rd` now mid3tckl, `Blocks`, `Interceptions`, `PrgC`, `PrgP`
-- FROM test2.pltable;


select player, ppd, `Prog Passing Distance`/max(`Prog Passing Distance`) as normprogressivepassdist
From test2.pltable
group by  normprogressivepassdist  
desc
order by normprogressivepassdist 

alter table pltable add normppd double;
set @maxppd as double 
set @maxppd = (select max(ppd) from pltable); 
update pltable 
set normppd = (ppd / @maxppd) ;

----------

alter table pltable
add normptof3 double 
set @maxptof3 = (select max(ptof3) from pltable)
update pltable 
set normptof3 = (ptof3 / @maxptof3);

----------

alter table pltable
add normkeypasses double;
set @maxkeypasses = (select max(keypasses) from pltable);
update pltable 
set normkeypasses = (keypasses / @maxkeypasses);


select normkeypasses from pltable

 

alter table pltable
add `normmid3tckl` double ;
set @maxmid3tckl = (select max(mid3tckl) from pltable);
update pltable
set `normmid3tckl` = (mid3tckl / @maxmid3tckl);

select normmid3tckl from pltable

--------

alter table pltable
add normblocks double ;
set @maxblocks = (select max(blocks) from pltable);
update pltable
set normblocks = (blocks / @maxblocks);

select normblocks from pltable

------- 

alter table pltable
add normInterceptions double ;
set @maxInterceptions = (select max(Interceptions) from pltable);
update pltable
set normInterceptions = (Interceptions / @maxInterceptions);

select normInterceptions from pltable


--------

alter table pltable
add normPrgC double ;
set @maxPrgC = (select max(PrgC) from pltable);
update pltable
set normPrgC = (PrgC / @maxPrgC);

select normPrgC from pltable

-------


alter table pltable
add normPrgP double ;
set @maxPrgP = (select max(PrgP) from pltable);
update pltable
set normPrgP = (PrgP / @maxPrgP);

select normprgp from pltable
select * from pltable
