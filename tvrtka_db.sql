-- Kreiranje databaze
CREATE DATABASE IF NOT EXISTS tvrtka;
USE tvrtka;

DROP TABLE IF EXISTS zaposlenici_odjeli;
DROP TABLE IF EXISTS zaposlenici;
DROP TABLE IF EXISTS odjeli;

-- Kreiranje 3 tablice

CREATE TABLE IF NOT EXISTS zaposlenici(
  id_zaposlenici INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ime VARCHAR(255) NOT NULL,
  oib CHAR(11) NOT NULL UNIQUE,
  spol CHAR(1) NOT NULL,
  godina_zaposlen INT UNSIGNED NOT NULL,
  placa FLOAT(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS odjeli(
  id_odjeli INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  naziv VARCHAR(255) NOT NULL UNIQUE,
  broj_clanova INT UNSIGNED DEFAULT 0
);

CREATE TABLE IF NOT EXISTS zaposlenici_odjeli(
  id_zaposlenici INT UNSIGNED NOT NULL,
  id_odjeli INT UNSIGNED NOT NULL,
  pozicija VARCHAR(255) NOT NULL,
  uloga VARCHAR(50) DEFAULT 'clan',
  PRIMARY KEY (id_zaposlenici, id_odjeli),
  CONSTRAINT fk1 FOREIGN KEY(id_zaposlenici) REFERENCES zaposlenici(id_zaposlenici)
  ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT fk2 FOREIGN KEY(id_odjeli) REFERENCES odjeli(id_odjeli)
  ON DELETE CASCADE ON UPDATE RESTRICT
);

-- Unos podataka u tablice

INSERT INTO zaposlenici(ime, oib, spol, godina_zaposlen, placa)
VALUES('Dino Murat', '10377704358', 'M', 7, 1200.73),
('Bruno Canjuga', '99146168102', 'M', 3, 1100.74),
('Jelena Klaric', '62923923028', 'Z', 2, 1000.00),
('Martina Gerec', '93972628883', 'Z', 12, 1310.21),
('Hrvoje Horvat', '88659552994', 'M', 9, 1230.12),
('Ines Harapin', '66640552672', 'Z', 1, 970.89),
('Marijan Maric', '35340597241', 'M', 18, 2000.00),
('Enis Svetec', '69192692201', 'M', 8, 1421.14),
('Andrea Filipovic', '61932768576', 'Z', 16, 2100.00),
('Mirko Hrulj', '46836613619', 'M', 2, 940.00),
('Mara Pasalic', '14852521882', 'Z', 6, 1300.00),
('Kreso Perkovic', '48405070930', 'M', 7, 1320.00),
('Jaksa Smolic', '17046142819', 'M', 2, 1120.00),
('Marina Jagustovic', '08379006486', 'Z', 4, 1420.00);

INSERT INTO odjeli(naziv)
VALUES('financije'),
('proizvodnja'),
('marketing'),
('informatika'),
('prodaja');


INSERT INTO zaposlenici_odjeli(id_zaposlenici, id_odjeli, pozicija, uloga)
VALUES(1, 4, 'junior dev', 'clan'),
(1, 3, 'web dev', 'clan'),
(3, 4, 'senior dev', 'voditelj'),
(2, 4, 'junior dev', 'clan'),
(5, 3, 'direktor marketinga', 'voditelj'),
(4, 3, 'voditelj drustvenih mreza', 'voditelj'),
(9, 5, 'voditelj/direktor prodaje', 'voditelj'),
(8, 1, 'direktor financija', 'voditelj'),
(6, 2, 'direktor proizvodnje', 'voditelj'),
(7, 2, 'skladisni radnik', 'clan'),
(10, 2, 'skladisni radnik', 'clan'),
(11, 1, 'financijski strucnjak', 'clan'),
(12, 1, 'financijski strucnjak', 'clan'),
(13, 4, 'junior dev', 'clan'),
(14, 3, 'marketinski strucnjak', 'clan'),
(2, 5, 'web prodaja', 'clan');