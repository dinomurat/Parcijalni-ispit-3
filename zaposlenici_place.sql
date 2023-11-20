USE tvrtka;

-- query koji izlistava sve zposlenike i njihove place
SELECT ime, CONCAT(placa, ' EUR') AS placa FROM zaposlenici;