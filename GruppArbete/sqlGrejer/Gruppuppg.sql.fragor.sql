use auktion;

drop procedure if exists Registerarprodukt;

-- FRÅGA 1
DELIMITER //
CREATE PROCEDURE Registerarprodukt (Namn VARCHAR(50), Beskrivning VARCHAR(150), utgångspris int , kategoriId int ,leverantörId int)
BEGIN 
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN 
ROLLBACK;
END;
START TRANSACTION;
INSERT INTO produkt  (Namn, Beskrivning, utgångspris , kategoriId,leverantörId) 
VALUES  (Namn, Beskrivning, utgångspris , kategoriId, leverantörId);
COMMIT;
END // 
DELIMITER ; 


-- FRÅGA 2

INSERT INTO auktion (ProduktId, acceptpris,`start`,slut, slutpris) VALUES (?,?,?,?,?);

-- FRÅGA 3
drop event if exists arkiveraAuktion;
delimiter $$
create event arkiveraAuktion
on schedule every 15 second
starts current_timestamp()
ends current_timestamp + interval 10 minute
on completion preserve
enable
	do        
		begin
		declare no_more_rows1 boolean default false;
	declare id,existerar int;
	declare vSlut datetime;
	declare aukCursor cursor for select auktionId, slut FROM auktion;
	declare continue handler for not found set no_more_rows1 := TRUE;
			open aukCursor;
				loop1: loop
				fetch aukCursor into id,vSlut;
			if no_more_rows1 then 
				close aukCursor;
				leave loop1;
					end if;
					begin
						if (vSlut < now()) then
							select count(*) into existerar from auktionhistorik where id = auktionHistorik.auktionId;
					if (existerar = 0) then
						select @slutpriset := max(bud.belopp) from bud where bud.auktionId = id limit 1;
						select @budet := kundId from bud where id = bud.auktionId AND bud.belopp = @highBid limit 1;
						insert into auktionhistorik(auktionId, slutpris, vinnandebudId) values (id, @slutpriset, @budet);
						insert into epost (innehåll) values ('Auction ' + id +' är avslutad');
					end if;
				end if;
			end;
		end loop loop1;
	close aukCursor;
	end$$
delimiter ;

-- FRÅGA 4
SELECT  bud.budId, kund.förnamn, kund.efternamn, auktioner.auktionId, bud.`timestamp`, bud.belopp FROM kund
INNER JOIN bud ON bud.kundId = kund.personnummer
INNER JOIN auktioner ON auktioner.auktionId = bud.auktionId
WHERE bud.auktionId = 1
GROUP BY bud.budId;

-- FRÅGA 5

drop procedure if exists auktionInomTid;
delimiter //
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


-- FRÅGA 6 OCH 7

drop event if exists arkiveraAuktion;
delimiter $$
create event arkiveraAuktion
on schedule every 60 second
starts current_timestamp()
ends current_timestamp + interval 10 minute
on completion preserve
enable
	do	
		begin
		declare no_more_rows1 boolean default false;
		declare id,existerar int;
		declare vSlut datetime;
		declare aukCursor cursor for select auktionId, slut FROM auktioner;
		declare continue handler for not found set no_more_rows1 := TRUE;
		open aukCursor;
			loop1: loop
				fetch aukCursor into id,vSlut;
				if no_more_rows1 then 
					close aukCursor;
					leave loop1;
				end if;
				begin
					if (vSlut < now()) then
						select count(*) into existerar from auktionhistorik where id = auktionHistorik.auktionId;
						if (existerar = 0) then
							select @slutpriset := max(bud.belopp) from bud where bud.auktionId = id limit 1;
							select @budet := kundId from bud where id = bud.auktionId AND bud.belopp = @highBid limit 1;
							insert into auktionhistorik(auktionId, slutpris, vinnandebudId) values (id, @slutpriset, @budet);
							insert into epost (innehåll) values ('Auction ' + id +' är avslutad. Slutpriset är ' + @slutpriset);
						end if;
					end if;
				end;
			end loop loop1; 
		close aukCursor;
	end$$
delimiter ;


-- fråga 8

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
delimiter ;

-- FRÅGA 9
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