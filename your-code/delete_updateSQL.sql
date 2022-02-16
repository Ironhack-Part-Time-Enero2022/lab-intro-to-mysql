USE labsqldb;

INSERT INTO automovil VALUES ("1", "987654321", "peugeot", "2019", "rojo", "24");

INSERT INTO automovil VALUES ("2", "134679852", "Vado", "2018", "blanco", "25");

INSERT INTO automovil VALUES ("3", "7946138", "toyota", "2018", "plata", "26");

INSERT INTO automovil VALUES ("4", "7946145", "volvo", "2018", "plata", "27");

INSERT INTO automovil VALUES ("5", "35795182", "", "2019", "gris", "28");

USE labsqldb;

DELETE FROM automovil WHERE  Idproducto = 5

UPDATE automovil SET año = 2020 WHERE Idproducto = 3

SELECT * FROM automovil;  