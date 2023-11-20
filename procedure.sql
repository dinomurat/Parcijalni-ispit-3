USE tvrtka;

-- Kreiranje procedure
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS prosjecnaPlaca()
BEGIN
SELECT ROUND(AVG(placa), 2) AS 'Prosjecna placa zaposlenika' FROM zaposlenici;
END //
DELIMITER ;

-- Pozivanje procedure
CALL prosjecnaPlaca();