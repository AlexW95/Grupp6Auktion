use auktion;
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