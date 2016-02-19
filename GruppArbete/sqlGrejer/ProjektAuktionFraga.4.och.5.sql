USE auktion;
drop procedure if exists auktionInomTid;
delimiter //
-- FRÅGA 5
create procedure auktionInomTid(in datumstart datetime, in datumslut datetime)
        begin
                select auktioner.auktionId, produkt.namn as 'Produktnamn', sum(auktionhistorik.slutpris * leverantör.provisionsnivå) as 'Provision' from auktioner
                inner join produkt on produkt.produktId = auktioner.produktID
                inner join leverantör on produkt.leverantörId = leverantör.leverantörId
                inner join auktionhistorik on auktioner.auktionId = auktionhistorik.auktionId
                where auktioner.`start` > datumstart and auktioner.slut < datumslut
                group by auktioner.auktionId;
        end//
delimiter ;

call auktionInomTid('2016-01-01','2016-12-01');


-- FRÅGA 4


SELECT  bud.budId, kund.förnamn, kund.efternamn, auktioner.auktionId, bud.`timestamp`, bud.belopp FROM kund
INNER JOIN bud ON bud.kundId = kund.personnummer
INNER JOIN auktioner ON auktioner.auktionId = bud.auktionId
WHERE bud.auktionId = 1
GROUP BY bud.budId;