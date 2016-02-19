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