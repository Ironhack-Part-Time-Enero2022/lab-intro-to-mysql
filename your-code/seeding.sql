INSERT INTO coche(idCoche, Fabricante, Modelo, Año, Color)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'
		'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'
        'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'
        'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'
        'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'
        'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO clientes(idClientes, Nombre, Telefono, Direccion, Ciudad, Provincia, Pais)
VALUES ('10001', 'Pablo Picasso', 636176382, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Espana'
		'20001', 'Abraham Lincoln', 305907708, '120 SW 8th St', 'Miami', 'Florida', 'Estados Unidos'
        '30001', 'Napoléon Bonaparte', 179754000, '40 Rue du Colisée', 'Paris', 'Ille de France', 'Francia');
        
INSERT INTO vendedor(idVendedor, Nombre, Tienda)
VALUES ('00001', 'Petey Cruisir', 'Madrid'
		'00002', 'Anna Sthesia', 'Barcelona'
        '00003', 'Paul Molive', 'Berlin'
        '00004', 'Gail Forcewind', 'Paris'
        '00005', 'Paige Turner', 'Mimia'
        '00006', 'Bob Frapples', 'Mexico City'
        '00007', 'Walter Melon', 'Amsterdam'
        '00008', 'Shonda Leer', 'Sao Paulo');
        
INSERT INTO factura(idFactura, Fecha, Coche, Cliente, Vendedor)
VALUES ('852399038', 22-08-2018, '0', '1', '3'
		'731166526', 31-12-2018, '3', '0', '5'
        '271135104', 22-01-2019, '2', '2', '7');
        

        
        