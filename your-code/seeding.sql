USE Lab_1;

INSERT INTO vehiculos (idvehiculos, fabricante, modelo, color, año)
VALUES 
		(0, "volkswagen", "tiguan", "azul", 2019),
        (1, "peugeot", "Rifter", "rojo", 2019),
        (2, "Vado", "fusión", "blanco", 2018),
        (3, "toyota", "RAV4", "plata", 2018),
        (4, "volvo", "V60", "gris", 2019),
        (5, "volvo", "V60 a campo traviesa", "gris", 2019);
        
SELECT * FROM vehiculos;
	
INSERT INTO clientes (idclientes, nombre, telefono, email, direccion, ciudad, provincia, c.p, pais)
VALUES
		(10001, "Pablo Picasso", 636176382, null, "paseo de la chopera, 14", "Madrid", "Madrid", 28045, "España"),
        (20001, "Abraham Lincoln", 059077086, null, "120 SW calle 8", "miami", "Florida", 33130, "Estados Unidos"),
        (30001, "Napoleon Bonaparte", 179754000, null, "40 Ruedu Colisee", "Paris", "Isla de Francia", 75008, "Francia");
        
INSERT INTO vendedores (idvendedores, nombre, tienda)
VALUES
		(00001, "crucero petey", "Madrid"),
        (00002, "ana estesia", "Barcelona"),
        (00003, "Pablo Molive", "Berlina"),
        (00004, "Gail Fuerzaviento", "Paris"),
        (00005, "paige turner", "Mimia"),
        (00006, "Bob Frapples", "Ciudad de Mexico"),
        (00007, "walter melón", "Amsterdam"),
        (00008, "shonda leer", "Sau Paulo");
        
INSERT INTO facturas (idfacturas, fecha, vehiculo, idclientes, idvendedores)
VALUES
		(852399038, "22-08-2018", 0, 20001, 00003),
        (731166526, "31-12-2018", 1, 10001, 00005),
        (271135104, "22-01-2019", 2, 30001, 00007);