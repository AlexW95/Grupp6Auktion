use auktion;

drop procedure if exists kundLista;
delimiter //
create procedure kundLista()
Begin
SELECT 
    auktionhistorik.auktionId, kund.personnummer, kund.efternamn, kund.förnamn, SUM(auktionhistorik.slutpris) AS totalordervärde
    FROM kund
    INNER JOIN bud ON kund.personnummer = bud.kundId
	INNER JOIN auktionhistorik ON bud.budId = auktionhistorik.vinnandebudId
GROUP BY kund.personnummer;

end //

-- FRÅGA 9
delimiter ;

drop procedure if exists totalProvPerMån;
delimiter //

create procedure totalProvPerMån(in månStart date, in månslut date)
begin
select sum(auktionhistorik.slutpris * leverantör.provisionsnivå) as 'TotalProvision' from auktionhistorik
inner join auktioner on auktionhistorik.auktionId = auktioner.auktionId
inner join produkt on auktioner.produktId = produkt.produktId
inner join leverantör on produkt.leverantörId = leverantör.leverantörId
where auktioner.slut >= månStart and auktioner.slut <= månslut
order by TotalProvision;

end//

delimiter ;

call totalProvPerMån('2016-01-01','2016-12-31');
