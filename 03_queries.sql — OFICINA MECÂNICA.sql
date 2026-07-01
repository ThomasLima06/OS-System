USE OficinaMecanica;

-- =====================================================
-- 01. LISTAR TODOS OS CLIENTES
-- =====================================================

SELECT * FROM Client;


-- =====================================================
-- 02. CLIENTES E SEUS VEÍCULOS
-- =====================================================

SELECT
c.idClient,
c.Fname,
c.Lname,
v.Plate,
v.Model,
v.Brand
FROM Client c
INNER JOIN Vehicle v
ON c.idClient = v.idClient;


-- =====================================================
-- 03. ORDENS DE SERVIÇO POR CLIENTE
-- =====================================================

SELECT
c.Fname,
c.Lname,
o.idOS,
o.Status,
o.LaborCost
FROM Client c
INNER JOIN Vehicle v ON c.idClient = v.idClient
INNER JOIN ServiceOrder o ON v.idVehicle = o.idVehicle;


-- =====================================================
-- 04. TOTAL DE OS POR STATUS
-- =====================================================

SELECT
Status,
COUNT(*) AS Total
FROM ServiceOrder
GROUP BY Status;


-- =====================================================
-- 05. EQUIPES E QUANTIDADE DE MECÂNICOS
-- =====================================================

SELECT
t.TeamName,
COUNT(tm.idMechanic) AS TotalMechanics
FROM Team t
LEFT JOIN TeamMechanic tm
ON t.idTeam = tm.idTeam
GROUP BY t.TeamName;


-- =====================================================
-- 06. MECÂNICOS POR ESPECIALIDADE
-- =====================================================

SELECT
Specialty,
COUNT(*) AS Total
FROM Mechanic
GROUP BY Specialty;


-- =====================================================
-- 07. SERVIÇOS MAIS UTILIZADOS
-- =====================================================

SELECT
s.ServiceName,
SUM(os.Quantity) AS TotalUsado
FROM Service s
INNER JOIN OSService os
ON s.idService = os.idService
GROUP BY s.ServiceName
ORDER BY TotalUsado DESC;


-- =====================================================
-- 08. PEÇAS MAIS UTILIZADAS
-- =====================================================

SELECT
p.PartName,
SUM(op.Quantity) AS TotalUsado
FROM Part p
INNER JOIN OSPart op
ON p.idPart = op.idPart
GROUP BY p.PartName
ORDER BY TotalUsado DESC;


-- =====================================================
-- 09. VALOR TOTAL POR ORDEM DE SERVIÇO
-- =====================================================

SELECT
o.idOS,
o.LaborCost,
SUM(s.Price * os.Quantity) AS TotalServicos,
SUM(p.Price * op.Quantity) AS TotalPecas
FROM ServiceOrder o
LEFT JOIN OSService os ON o.idOS = os.idOS
LEFT JOIN Service s ON s.idService = os.idService
LEFT JOIN OSPart op ON o.idOS = op.idOS
LEFT JOIN Part p ON p.idPart = op.idPart
GROUP BY o.idOS, o.LaborCost;


-- =====================================================
-- 10. FATURAMENTO TOTAL DA OFICINA
-- =====================================================

SELECT
SUM(p.Value) AS Faturamento_Total
FROM Payment p;


-- =====================================================
-- 11. MÉDIA DE VALOR DAS ORDENS DE SERVIÇO
-- =====================================================

SELECT
AVG(LaborCost) AS Media_Mao_Obra
FROM ServiceOrder;


-- =====================================================
-- 12. ORDENS ACIMA DA MÉDIA DE VALOR
-- =====================================================

SELECT *
FROM ServiceOrder
WHERE LaborCost >
(SELECT AVG(LaborCost) FROM ServiceOrder);


-- =====================================================
-- 13. CLIENTES COM MAIS DE 1 VEÍCULO
-- =====================================================

SELECT
c.Fname,
c.Lname,
COUNT(v.idVehicle) AS TotalVeiculos
FROM Client c
INNER JOIN Vehicle v
ON c.idClient = v.idClient
GROUP BY c.idClient
HAVING COUNT(v.idVehicle) > 1;


-- =====================================================
-- 14. EQUIPES MAIS ATIVAS (MAIS OS)
-- =====================================================

SELECT
t.TeamName,
COUNT(o.idOS) AS TotalOS
FROM Team t
INNER JOIN ServiceOrder o
ON t.idTeam = o.idTeam
GROUP BY t.TeamName
ORDER BY TotalOS DESC;


-- =====================================================
-- 15. RELAÇÃO COMPLETA: OS + CLIENTE + VEÍCULO + EQUIPE
-- =====================================================

SELECT
o.idOS,
c.Fname,
c.Lname,
v.Model,
v.Brand,
t.TeamName,
o.Status
FROM ServiceOrder o
INNER JOIN Vehicle v ON o.idVehicle = v.idVehicle
INNER JOIN Client c ON v.idClient = c.idClient
INNER JOIN Team t ON o.idTeam = t.idTeam;