# 🔧 Banco de Dados - Oficina Mecânica (MySQL)

## 📖 Sobre o projeto

Este projeto consiste na modelagem e implementação de um banco de dados relacional para uma oficina mecânica utilizando MySQL.

O objetivo foi simular um ambiente real de gestão de serviços automotivos, aplicando conceitos de modelagem lógica, integridade referencial e consultas SQL avançadas.

---

## 🧱 Modelagem do banco de dados

O sistema foi estruturado com as seguintes entidades:

- Cliente
- Veículo
- Mecânico
- Equipe
- Ordem de Serviço (OS)
- Serviços
- Peças
- Pagamentos
- Relações N:N entre OS, serviços e peças

---

## 🛠️ Tecnologias utilizadas

- MySQL 8
- MySQL Workbench
- SQL (DDL e DML)

---

## ⚙️ Funcionalidades do sistema

### 👤 Clientes e veículos
- Cadastro de clientes
- Clientes com múltiplos veículos

### 🔧 Oficina
- Equipes de mecânicos
- Mecânicos com especialidades
- Atribuição de equipes às OS

### 📦 Ordens de serviço
- Criação de OS
- Status (Aberta, Em andamento, Concluída, Cancelada)
- Associação com veículos e equipes

### 🧰 Serviços e peças
- Registro de serviços realizados
- Controle de peças utilizadas
- Relacionamento N:N com OS

### 💳 Pagamentos
- Registro de pagamentos por OS
- Controle de valor e forma de pagamento

---

## 📊 Consultas SQL implementadas

O projeto inclui consultas com:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOINs (INNER e LEFT)
- Subqueries
- Funções agregadas (COUNT, SUM, AVG)
- CASE (em análises futuras, se expandido)

---

## 📈 Perguntas respondidas pelo banco

- Quais clientes possuem veículos cadastrados?
- Quais equipes atendem mais ordens de serviço?
- Quais peças são mais utilizadas?
- Quais serviços são mais realizados?
- Qual o faturamento total da oficina?
- Quais ordens de serviço estão acima da média de valor?
- Relação completa entre cliente, veículo, OS e equipe

---

## 📁 Estrutura do projeto

```text
dio-oficina-mecanica-database/

01_create_database.sql
02_create_tables.sql
03_insert_data.sql
04_queries.sql
oficina-der.png
README.md
