use auktion;

INSERT INTO kategori (Namn) VALUES ('Kl�der');
INSERT INTO kategori (Namn) VALUES ('M�bler');
INSERT INTO kategori (Namn) VALUES ('Skor');
INSERT INTO kategori (Namn) VALUES ('Bil');
INSERT INTO kund (personnummer, efternamn, f�rnamn, gatuadress, postnummer, ort, telefon, epost) VALUES ('199003067683', 'Granqvist', 'Andreas', 'Vasagatan 25B', '12354', 'Sollentuna', '0701232456', 'andreas@granqvist.com');
INSERT INTO kund (personnummer, efternamn, f�rnamn, gatuadress, postnummer, ort, telefon, epost) VALUES ('197808298349', 'Svensson', 'Bj�rn', 'Grizzlyv�gen 7A', '15544', 'Uppsala', '0764087321', 'bj�rn@svensson.com');
INSERT INTO kund (personnummer, efternamn, f�rnamn, gatuadress, postnummer, ort, telefon, epost) VALUES ('198310024958', 'Andersson', 'Linda', 'All�v�gen 19B', '15567', 'Rotebro', '070865639', 'linda@andersson.com');
INSERT INTO kund (personnummer, efternamn, f�rnamn, gatuadress, postnummer, ort, telefon, epost) VALUES ('199006062859', 'Andersson', 'Kristina', 'Kyrkogatan 2', '18374', 'Stockholm', '070983757', 'kristina@andersson.com');
INSERT INTO kund (personnummer, efternamn, f�rnamn, gatuadress, postnummer, ort, telefon, epost) VALUES ('199512243853', 'Silverstedt', 'Kim', 'All�v�gen 25A', '23852', 'Rotebro', '070234987', 'kim@silverstedt.com');

INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('Star AB', 'Star@Tosh.com' ,'6059283123', 'Tomtev�gen 13', '70213' , 'Lindesberg' , 0.15);
INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('Creepy Movie', 'Creep@Movie.com' ,'54223102', 'Godaftonsgatan 7', '33260' , 'Kalkudden' , 0.25);
INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('Today AB', 'Today@Tomorrow.com' ,'906832489', 'Ekv�gen 33', '23012' , 'Kaggeboda' , 0.10);
INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('Vaping AB', 'Vaping@Taping.com' ,'555444222', 'Str�mgatan 50', '33441' , 'Lerb�ck' , 0.05);
INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('Bayer AB', 'Bayer@Layer.com' ,'323013200', 'Lokabordsgatan 3', '12345' , 'Laxne' , 0.07);
INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES ('PitchPerfect AB', 'Pitch@Perfect.com' ,'987654321', 'Laxforsen 45', '89652' , 'Laxsj�' , 0.15);

INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Tr�ja', 'Bl�Tr�ja',100,1,1);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Byxor', 'Slitna Byxor',50,1,2);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Soffa', 'Vintage Soffa Gr�n',1000,2,3);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Bord', 'Ek-Bord',100,2,4);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Converse', 'Vita',30,3,5);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Ballerina', 'Svart',10,3,6);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Volvo 740 -00', 'Rosigt Bl�',10000,4,6);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Saab 900 -94', 'Vit',5000,4,1);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('T-Shirt', 'Orange',20,1,2);
INSERT INTO produkt (Namn, Beskrivning, utg�ngspris , kategoriId,leverant�rId) VALUES ('Sk�p', 'Vintrinsk�p',250,2,3);

INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (1,250,'2016-02-15 14:44:00', '2016-02-17 14:44:00');
INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (2,0,'2016-02-16 15:44:00', '2016-02-18 15:44:00');
INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (3,0,'2016-02-17 14:44:00', '2016-02-19 14:44:00');
INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (4,300,'2016-02-15 14:44:00', '2016-02-17 14:44:00');
INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (5,170,'2016-02-19 14:44:00', '2016-02-21 14:44:00');
INSERT INTO auktioner (ProduktId, acceptpris,`start`,slut) VALUES (6,170,'2016-02-16 11:03:00', '2016-02-16 11:05:00');

INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-15 15:00:15', '199003067683', 1, 100);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-16 16:00:15','197808298349', 2, 60);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-16 15:00:15', '198310024958', 1, 110);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-16 18:00:15', '199003067683', 1, 120);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-17 15:00:15', '199006062859', 2, 70);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-17 19:00:15', '199003067683', 3, 1100);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-18 15:00:15','199512243853', 3, 1200);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-16 15:00:15', '198310024958', 4, 260);
INSERT INTO bud (`timestamp`, kundId, auktionId, belopp) VALUES ('2016-02-20 15:00:15', '197808298349', 5, 80);

INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 1 �r avslutad', 'Avslutad auktion');
INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 2 �r avslutad', 'Avslutad auktion');
INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 3 �r avslutad', 'Avslutad auktion');
INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 4 �r avslutad', 'Avslutad auktion');
INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 5 �r avslutad', 'Avslutad auktion');
INSERT INTO epost (inneh�ll, �mne) VALUES ('Auction 6 �r avslutad', 'Avslutad auktion');