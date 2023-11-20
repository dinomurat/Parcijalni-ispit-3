USE tvrtka;

-- Racunanje prosjecne place voditelja. Koristen je subquery kako u tablici zaposlenici_odjeli nebi racunali istu osobu dva puta koja je voditelj dva odjela.
-- Subquery izlista tablicu svih zaposlenika i njihovih placa koji su voditelji ali samo jednom.
SELECT ROUND(AVG(placa), 2) AS 'Prosjecna placa voditelja' FROM (
  SELECT DISTINCT ime, placa FROM zaposlenici 
  INNER JOIN zaposlenici_odjeli ON zaposlenici.id_zaposlenici = zaposlenici_odjeli.id_zaposlenici
  WHERE uloga = 'voditelj'
) AS posjecna_placa_voditelja;