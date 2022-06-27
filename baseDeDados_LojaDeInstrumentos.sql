DROP DATABASE IF EXISTS LojaDeInstrumentos;
CREATE DATABASE IF NOT EXISTS LojaDeInstrumentos;
USE LojaDeInstrumentos;

CREATE TABLE IF NOT EXISTS Cliente
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    celular VARCHAR(25) NOT NULL,
    cpf VARCHAR(45) NOT NULL UNIQUE
);

--
-- Dumping data for table `Cliente`
--
INSERT INTO Cliente (id, nome, sobrenome, email, celular, cpf) VALUES 
 (default, 'Antonio', 'Moreira', 'antonio.moreira@mail.com', '51991116423', '256.123.302-14'),
 (default, 'Julia', 'Siriani', 'juju.sf@mail.com', '51985456423', '300.546.930-15'),
 (default, 'Claudio', 'Lague', 'craudin.br@mail.com', '51999856423', '045.251.410-22'),
 (default, 'Maria', 'Berenice', 'joao.p@mail.com', '51985556423', '026.885.756-14'),
 (default, 'Pedro', 'Silva', 'silva.p@mail.com', '51999231423', '039.234.852-45'),
 (default, 'Luiz', 'Soares', 'luiz.s@mail.com', '51985456423', '552.445.123-20'),
 (default, 'Cleiton', 'de Souza', 'cleitin@mail.com', '51985458883', '521.222.947-56'),
 (default, 'Francisco', 'Cafruni', 'frcafruni@mail.com', '51999123423', '521.123.987-56'),
 (default, 'Luana', 'Menezes', 'luanameneze@mail.com', '51985526423', '752.885.451-33'),
 (default, 'Bruna', 'Azambuja', 'bazamb@mail.com', '51988446423', '023.123.856-33')
 ;
 
 CREATE TABLE IF NOT EXISTS Cartoes
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clienteID INT DEFAULT NULL,
    numero BIGINT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    validade VARCHAR(5) NOT NULL,
    cvc INT NOT NULL,
    funcao VARCHAR(10) NOT NULL,
    CONSTRAINT FK_Cartoes_Cliente_clienteID FOREIGN KEY (clienteID) REFERENCES Cliente (id)
);
--
-- Dumping data for table `Cartoes`
--
INSERT INTO Cartoes (id, clienteID, numero, nome, validade, cvc, funcao) VALUES 
 (default, 4, 4485871459120580, 'Maria Berenice', '05/23', 123, 'credito'),
 (default, 5, 4539949228812657, 'Pedro Silva', '08/25', 554, 'debito'),
 (default, 6, 4024007133993815, 'Luiz Soares', '11/22', 965, 'credito'),
 (default, 7, 4556848003027713, 'Cleiton de Souza', '04/23', 443, 'debito'),
 (default, 7, 4556840230027713, 'Cleiton de Souza', '04/24', 222, 'credito'),
 (default, 8, 4539900447927099, 'Luana Menezes', '09/22', 543, 'debito'),
 (default, 9, 4485141698771704, 'Bruna Kenne', '11/24', 289, 'credito'),
 (default, 9, 4485141694578704, 'Bruna Kenne', '11/26', 122, 'debito'),
 (default, 1, 4485141694545122, 'Antonio Moreira', '05/24', 336, 'debito');

CREATE TABLE IF NOT EXISTS Endereco
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipoEndereco VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
	complemento VARCHAR(20),
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    clienteID INT DEFAULT NULL,
    CONSTRAINT FK_Endereco_Cliente_clienteID FOREIGN KEY (clienteID) REFERENCES Cliente(id)
);
--
-- Dumping data for table `Endereco`
--
INSERT INTO Endereco (id, tipoEndereco, rua, numero, complemento, bairro, cidade, estado, clienteID) VALUES 
 (default, 'Residencial', 'Rua Chacara Das Pedras', 300, 'Perto do mercado', 'Santana', 'Porto Alegre', 'RS', 1),
 (default, 'Comercial', 'Rua Fonseca Ramos', 1008, 'Em frente a farmacia', 'Barra Funda', 'Sao Paulo', 'SP', 2),
 (default, 'Residencial', 'Rua Eurico Lara', 201, 'Perto do mercado', 'Getulio Vargas', 'Rio de Janeiro', 'RJ', 3),
 (default, 'Comercial', 'Rua Santo Antonio', 444, 'Do lado do Shopping', 'Ipiranga', 'Rio de Janeiro', 'RJ', 3),
 (default, 'Residencial', '24 de outubro', 777, null, 'Auxiliadora', 'Recife', 'PE', 4),
 (default, 'Comercial', 'Barao de Teffe', 900, 'Na rua da padaria', 'Menino Deus', 'Florianopolis', 'SC', 5),
 (default, 'Residencial', 'Erico Verissimo', 26, null, 'Cidade Baixa', 'Florianopolis', 'SC', 5),
 (default, 'Comercial', 'Estrada do Lami', 302, null, 'Belém novo', 'Brasilia', 'DF', 6),
 (default, 'Residencial', 'Machado de Assis', 1008, null, 'Bairro Alto', 'Tubarão', 'SC', 7),
 (default, 'Residencial', 'Estrada Norte', 920, null, 'Vila Conceição', 'Tres Coroas', 'RS', 8),
 (default, 'Comercial', 'Pedro Alvares Cabaral', 300, null, 'Partenon', 'Brasilia', 'DF', 9)
 ;
 
 CREATE TABLE IF NOT EXISTS RegistroCompras
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    valorCompra DECIMAL(10,2) NOT NULL,
    dataPedido DATETIME NOT NULL,
    formaPagamento VARCHAR(30) NOT NULL,
    clienteID INT DEFAULT NULL,
    CONSTRAINT FK_RegistroCompras_Cliente_clienteID FOREIGN KEY (clienteID) REFERENCES Cliente(id)
);

--
-- Dumping data for table `Registros Compras`
--
INSERT INTO RegistroCompras (id, valorCompra, dataPedido, formaPagamento, clienteID) VALUES 
 (default, 6520.00, '2022-03-23 09:05:41', 'cartão', 1),
 (default, 6799.00, '2021-08-05 15:30:02', 'boleto', 2),
 (default, 14900.00, '2022-01-08 12:45:56', 'pix', 3),
 (default, 980.00, '2022-06-26 12:45:56', 'pix', 3),
 (default, 25.30, '2022-01-08 12:45:56', 'pix', 3),
 (default, 25.30, '2022-01-08 12:45:56', 'pix', 3),
 (default, 1599.00, '2022-05-31 10:00:05', 'cartão', 4),
 (default, 980.00, '2022-04-12 17:25:23', 'cartão', 5),
 (default, 8000.00, '2022-05-05 16:33:23', 'boleto', 6),
 (default, 1599.00, '2022-05-05 16:33:23', 'boleto', 6);

 CREATE TABLE IF NOT EXISTS Produtos
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL,
    qtdEstoque INT DEFAULT NULL
);

--
-- Dumping data for table `Produto`
--
INSERT INTO Produtos (id, nomeProduto, valorUnitario, qtdEstoque) VALUES 
 (2344, 'Guitarra Fender Squier Stratocaster Lrl 40th Anniversary', 6520.00, 2),
 (2345, 'Bateria Nagano Work Series Artic Sparkle 22', 6799.00, 16),
 (2346, 'Contra Baixo Jazz Bass 4 Cordas Jbs-50 Twr - Strinberg', 1599.00, 23),
 (2347, 'Trompete King Silver Flare 2055tla', 8000.00, 5),
 (2348, 'Flauta Transversal Shelter', 980.00, 40),
 (2349, 'Bateria Eletrônica Dtx6k2-x Yamaha', 14900.00, 13),
 (2350, 'Caixa de palhetas-10 unidades', 25.90, 500),
 (2351, 'Par De Baquetas De Fibra - Torelli * Inquebráveis *', 38.90, 250),
 (2352, 'Violão acústico GianniniPerformance GD-1 EQ para destros translucent dark wine', 612.87, 100),
 (2353, 'Teclado musical Queens D157281M 54', 277.99, 50);

 CREATE TABLE IF NOT EXISTS Produtos_RegistrosCompras
(
	produtosID INT NOT NULL,
	registroComprasID INT NOT NULL,
	PRIMARY KEY (produtosID, registroComprasID),
	INDEX FK_produtos_registrocompras_registrocompras_idx (registroComprasID ASC) VISIBLE,
	INDEX FK_produtos_registrocompras_produtos_idx (produtosID ASC) VISIBLE,
	CONSTRAINT FK_produtos_registrocompras_produtos
	FOREIGN KEY (produtosID) REFERENCES produtos(id),
	CONSTRAINT FK_produtos_registrocompras_registrocompras
	FOREIGN KEY (registroComprasID) REFERENCES registrocompras(id)
);

--
-- Dumping data for table `Produtos_RegistrosCompras`
--
INSERT INTO Produtos_RegistrosCompras (produtosID, registroComprasID) VALUES 
 (2344, 1),
 (2345, 2),
 (2349, 3),
 (2348, 4),
 (2350, 5),
 (2350, 6),
 (2346, 7),
 (2348, 8),
 (2347, 9),
 (2346, 10);
    
-- --------------------------------------C R U D------------------------------------------ #

-- #   Atualização de dados em uma das tabelas.
 -- Updates
update endereco
set numero = 402
where id = 2;


-- # ● Exclusão de dados em uma das tabelas.
DELETE FROM endereco
WHERE id = 5;
select * from endereco;

-- # ● Seleção de dados de uma das tabelas.
-- Select address updated
select * from endereco where id = 2;

-- # Utilize Alter Table para acrescentar uma coluna a uma tabela.
-- Altering table -  add column `CEP`
alter table endereco add column cep VARCHAR(10) null;
select * from endereco;


-- # ȁ. Crie uma procedure que, dado um número como parâmetro, retorne dados
-- # de duas ou mais tabelas.
-- DELIMITER $$

CREATE PROCEDURE seleciona_enderecos_pelo_numero(IN numeroInput INT)
	BEGIN
		SELECT 
			cl.nome,
			e.rua,
			e.numero,
			e.complemento
		FROM 
			cliente as cl
		INNER JOIN
		endereco as e
		ON
			cl.id = e.clienteID
		HAVING numero LIKE numeroInput;
	END $$
DELIMITER ;

CALL seleciona_enderecos_pelo_numero(300);

-- # Ȃ. Crie uma view que contemple os principais dados do banco, de forma que
-- # qualquer usuário possa manipular os dados apenas pela view criada
CREATE VIEW viewProdutosPorMenorPreco AS
SELECT p.nomeProduto,
       p.valorUnitario
FROM Produtos as p
ORDER BY
p.valorUnitario asc;

SELECT * FROM viewProdutosPorMenorPreco;

CREATE VIEW viewDadosClientesPedidosMaisRecentes AS
SELECT 
	cl.nome,
    cl.sobrenome,
    cl.email,
    cl.cpf,
    rc.valorCompra,
    rc.dataPedido,
    rc.formaPagamento,
    rc.clienteID
FROM 
	cliente as cl
INNER JOIN
	registrocompras as rc
ON
	rc.clienteID = cl.id
ORDER BY
rc.dataPedido desc;

SELECT * FROM viewDadosClientesPedidosMaisRecentes;

    