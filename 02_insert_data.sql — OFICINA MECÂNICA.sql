USE OficinaMecanica;

-- =====================================================
-- CLIENTES (20)
-- =====================================================

INSERT INTO Client (Fname, Lname, CPF, Phone, Address) VALUES
('João','Silva','11111111111','21990000001','Rua A, 100'),
('Maria','Souza','22222222222','21990000002','Rua B, 200'),
('Pedro','Oliveira','33333333333','21990000003','Rua C, 300'),
('Ana','Costa','44444444444','21990000004','Rua D, 400'),
('Carlos','Pereira','55555555555','21990000005','Rua E, 500'),
('Juliana','Lima','66666666666','21990000006','Rua F, 600'),
('Rafael','Almeida','77777777777','21990000007','Rua G, 700'),
('Bruna','Ferreira','88888888888','21990000008','Rua H, 800'),
('Lucas','Rodrigues','99999999999','21990000009','Rua I, 900'),
('Patrícia','Gomes','10101010101','21990000010','Rua J, 1000'),
('Thiago','Martins','12121212121','21990000011','Rua K, 1100'),
('Fernanda','Barros','13131313131','21990000012','Rua L, 1200'),
('Eduardo','Ribeiro','14141414141','21990000013','Rua M, 1300'),
('Camila','Nascimento','15151515151','21990000014','Rua N, 1400'),
('Diego','Araujo','16161616161','21990000015','Rua O, 1500'),
('Amanda','Melo','17171717171','21990000016','Rua P, 1600'),
('Gustavo','Teixeira','18181818181','21990000017','Rua Q, 1700'),
('Larissa','Cardoso','19191919191','21990000018','Rua R, 1800'),
('Vitor','Rezende','20202020202','21990000019','Rua S, 1900'),
('Beatriz','Moreira','21212121212','21990000020','Rua T, 2000');

INSERT INTO Vehicle (idClient, Plate, Model, Brand, Year) VALUES
(1,'ABC1A11','Civic','Honda',2018),
(2,'DEF2B22','Corolla','Toyota',2020),
(3,'GHI3C33','Onix','Chevrolet',2019),
(4,'JKL4D44','Gol','Volkswagen',2017),
(5,'MNO5E55','HB20','Hyundai',2021),
(6,'PQR6F66','Argo','Fiat',2022),
(7,'STU7G77','Kwid','Renault',2020),
(8,'VWX8H88','Uno','Fiat',2016),
(9,'YZA9I99','Compass','Jeep',2021),
(10,'BCD1J10','Sandero','Renault',2018),
(11,'EFG2K11','Hilux','Toyota',2022),
(12,'HIJ3L12','Ranger','Ford',2020),
(13,'KLM4M13','Fit','Honda',2019),
(14,'NOP5N14','Fox','Volkswagen',2016),
(15,'QRS6O15','C3','Citroen',2018),
(16,'TUV7P16','Creta','Hyundai',2021),
(17,'WXY8Q17','Toro','Fiat',2022),
(18,'ZAB9R18','Spin','Chevrolet',2017),
(19,'CDE1S19','Kicks','Nissan',2020),
(20,'FGH2T20','City','Honda',2021);

INSERT INTO Mechanic (Name, Specialty, Phone) VALUES
('Roberto','Motor','21980000001'),
('Carlos','Suspensão','21980000002'),
('Marcos','Freios','21980000003'),
('João','Elétrica','21980000004'),
('Lucas','Transmissão','21980000005'),
('Pedro','Ar Condicionado','21980000006'),
('Rafael','Injeção Eletrônica','21980000007'),
('Bruno','Motor','21980000008'),
('Diego','Suspensão','21980000009'),
('Felipe','Freios','21980000010'),
('André','Elétrica','21980000011'),
('Thiago','Motor','21980000012'),
('Vinicius','Suspensão','21980000013'),
('Eduardo','Freios','21980000014'),
('Gustavo','Elétrica','21980000015');

INSERT INTO Team (TeamName) VALUES
('Equipe Alpha'),
('Equipe Beta'),
('Equipe Gama'),
('Equipe Delta'),
('Equipe Omega');

USE OficinaMecanica;

INSERT INTO TeamMechanic (idTeam, idMechanic) VALUES
(1,1),(1,2),(1,3),
(2,4),(2,5),(2,6),
(3,7),(3,8),(3,9),
(4,10),(4,11),(4,12),
(5,13),(5,14),(5,15);

INSERT INTO Service (ServiceName, Price) VALUES
('Troca de óleo',120),
('Alinhamento',80),
('Balanceamento',70),
('Revisão completa',500),
('Troca de freios',300),
('Troca de embreagem',900),
('Suspensão',600),
('Diagnóstico eletrônico',150),
('Troca de bateria',250),
('Limpeza de bicos',200),
('Troca de pneus',400),
('Ar condicionado',350),
('Troca de correia',280),
('Troca de filtro de ar',90),
('Troca de velas',110),
('Reparo motor',1200),
('Troca de amortecedor',650),
('Scanner automotivo',180),
('Troca de fluido de freio',130),
('Revisão preventiva',450);

INSERT INTO Part (PartName, Price, Stock) VALUES
('Filtro de óleo',30,50),
('Pastilha de freio',120,40),
('Amortecedor',300,20),
('Correia dentada',250,25),
('Bateria 60Ah',450,15),
('Velas de ignição',80,60),
('Pneu aro 15',400,30),
('Disco de freio',180,35),
('Radiador',600,10),
('Sensor ABS',220,20),
('Óleo motor 5W30',40,100),
('Filtro de ar',35,80),
('Filtro de combustível',50,70),
('Embreagem kit',900,10),
('Bomba de combustível',500,12),
('Alternador',700,8),
('Motor de partida',650,10),
('Fluido de freio',25,90),
('Correia alternador',90,40),
('Válvula termostática',120,30);

INSERT INTO ServiceOrder (idVehicle, idTeam, OSDate, Status, LaborCost) VALUES
(1,1,'2026-01-01','Concluída',200),
(2,2,'2026-01-02','Em Andamento',150),
(3,3,'2026-01-03','Aberta',100),
(4,4,'2026-01-04','Concluída',300),
(5,5,'2026-01-05','Em Andamento',250),
(6,1,'2026-01-06','Aberta',180),
(7,2,'2026-01-07','Concluída',220),
(8,3,'2026-01-08','Aberta',140),
(9,4,'2026-01-09','Em Andamento',260),
(10,5,'2026-01-10','Concluída',310),
(11,1,'2026-01-11','Aberta',190),
(12,2,'2026-01-12','Concluída',230),
(13,3,'2026-01-13','Em Andamento',210),
(14,4,'2026-01-14','Aberta',160),
(15,5,'2026-01-15','Concluída',270),
(16,1,'2026-01-16','Em Andamento',240),
(17,2,'2026-01-17','Aberta',150),
(18,3,'2026-01-18','Concluída',280),
(19,4,'2026-01-19','Em Andamento',220),
(20,5,'2026-01-20','Concluída',350);

INSERT INTO OSService (idOS, idService, Quantity) VALUES
(1,1,1),(1,2,1),
(2,3,1),(2,4,1),
(3,5,1),(3,6,1),
(4,7,1),(4,8,1),
(5,9,1),(5,10,1),
(6,11,1),(6,12,1),
(7,13,1),(7,14,1),
(8,15,1),(8,16,1),
(9,17,1),(9,18,1),
(10,19,1),(10,20,1),
(11,1,1),(11,3,1),
(12,2,1),(12,4,1),
(13,5,1),(13,6,1),
(14,7,1),(14,8,1),
(15,9,1),(15,10,1);

INSERT INTO OSPart (idOS, idPart, Quantity) VALUES
(1,1,2),(1,2,1),
(2,3,1),(2,4,1),
(3,5,1),(3,6,4),
(4,7,2),(4,8,2),
(5,9,1),(5,10,1),
(6,11,3),(6,12,2),
(7,13,1),(7,14,1),
(8,15,2),(8,16,1),
(9,17,1),(9,18,2),
(10,19,1),(10,20,1),
(11,1,1),(11,2,2),
(12,3,1),(12,4,1),
(13,5,1),(13,6,2),
(14,7,1),(14,8,1),
(15,9,1),(15,10,1);

INSERT INTO Payment (idOS, PaymentMethod, Value) VALUES
(1,'PIX',350),
(2,'Cartão Crédito',500),
(3,'Dinheiro',200),
(4,'PIX',800),
(5,'Cartão Débito',450),
(6,'PIX',300),
(7,'Cartão Crédito',600),
(8,'Dinheiro',250),
(9,'PIX',700),
(10,'Cartão Crédito',900),
(11,'PIX',400),
(12,'Cartão Débito',500),
(13,'Dinheiro',350),
(14,'PIX',420),
(15,'Cartão Crédito',650),
(16,'PIX',520),
(17,'Dinheiro',300),
(18,'Cartão Débito',750),
(19,'PIX',480),
(20,'Cartão Crédito',1000);