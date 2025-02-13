SELECT * from Vevo --YEUEUN

Select distinct Termek.Nev 
from Termek, MegrendelesTetel
where TermekID = Termek.ID --YEUEUN

Select  COUNT(*)
from Statusz as s, Megrendeles as m
where m.StatuszID = s.ID 
and s.nev != 'Kiszállítva'  --YEUEUN

Select  f.Mod
from Megrendeles m 
right outer join 
FizetesMod f on m.FizetesModID = f.ID
where m.ID is null --YEUEUN

Insert into Vevo Values('Jánoska',
				'123123123-54435345',
				'jancsika',
				'12345',
				'jancsika@jancsi.com',4) --YEUEUN

Select @@IDENTITY

Update Kategoria
set Nev = 'Fakocka'
where Nev = 'Fajáték' --YEUEUN
 
Select k.Nev, count(*) from Termek t, Kategoria k
where t.KategoriaID = k.ID
Group by t.KategoriaID, k.Nev
having count(t.id) = (
	Select MAX(db) from (
	Select count(*)as db from Termek t, Kategoria k
	where t.KategoriaID = k.ID
	Group by t.KategoriaID, k.Nev) as sub
) --YEUEUN


Select t.Nev from Termek t, AFA a
where t.AFAID = a.ID and a.Kulcs = 15 --YEUEUN

Select count(*) as db from Megrendeles m, Telephely t
where m.TelephelyID = t.ID 
group by m.TelephelyID --YEUEUN

Select t.Varos ,count(*)as darab from Megrendeles m, Telephely t
where m.TelephelyID = t.ID 
Group by t.Varos
having count(t.id) = (
	Select MAX(db) from 
	(
	Select t.Varos ,count(*) as db from Megrendeles m, Telephely t
	where m.TelephelyID = t.ID 
	Group by t.Varos) as sub
	) --YEUEUN

Select m.TelephelyID, v.Nev from Megrendeles m, Telephely t, Vevo v
where m.TelephelyID = t.ID and t.VevoID = v.ID
group by m.TelephelyID, v.Nev
having count(m.TelephelyID) >= 2 --YEUEUN

Select * from Szamla 
where TeljesitesDatum != KiallitasDatum --YEUEUN

Select * from Megrendeles 
where Datum Between '2008.02.01' 
			and '2008.02.29' --YEUEUN

Select * from Megrendeles 
where (Hatarido - Datum) < 5 --YEUEUN

Select * from Vevo 
where Email like '%@gmail%' --YEUEUN


Select v.Nev,count(*) as db from Vevo v, Telephely t
where v.ID = t.VevoID 
group by v.id, v.Nev
having Count(*) > 1--YEUEUN


SELECT v.Nev, Count(mt.MegrendelesID)
from Megrendeles m, MegrendelesTetel mt, Telephely t, Vevo v
where m.ID = mt.MegrendelesID and m.TelephelyID = t.ID
	and t.VevoID = v.ID
group by mt.MegrendelesID, v.Nev
having count(mt.MegrendelesID) = (
	Select MAX(db) from 
	(
	SELECT v.Nev, Count(mt.MegrendelesID) as db 
	from Megrendeles m, MegrendelesTetel mt, Telephely t, Vevo v
	where m.ID = mt.MegrendelesID and m.TelephelyID = t.ID
		and t.VevoID = v.ID
	group by mt.MegrendelesID, v.Nev
	) as sub
) --YEUEUN