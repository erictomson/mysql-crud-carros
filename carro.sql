# criando schema/database carro
create schema carro;

# tornar o schema carro ativo
use carro;

# criando tabela carro
create table carro.Carro (
	id int primary key auto_increment,
    marca varchar(25) not null,
    modelo varchar(25) not null,
    ano varchar(4) not null,
    preco decimal(10,2) not null
);

# tabela carro foi criada erroneamente no schema ecommerce
# excluindo tabela carro de ecommerce
drop table Carro;

# verificando a estrutura da tabela Carro
describe carro.carro;

# populando (inserindo dados) a tabela carro
# inserindo selecionando todos os campos
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Ford","Fiesta","2010",12000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("GM","Opalla","1973",65000);

UPDATE carro.carro SET modelo='Opala' WHERE id=4;

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("GM","Opalla","1973",65000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","147","1971",55000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Ford","Landau","1976",80000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","2002",11000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","1970",11000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","1979",11000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Harley Davidson","V-Rod","2013",50000);

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Harley Davidson","Sportster Iron 883","2017",60000);

INSERT INTO carro.carro 
VALUES (default,"Volkswagen","Fusca","1963",120000);

INSERT INTO carro.carro 
VALUES (default,"Volkswagen","Kombi","1965",80000);

# inserindo omitindo todos os campos
INSERT INTO carro.carro
VALUES (default,"Fiat","Palio","2015",22000);

# alterar campo ano para gravar valor default 2015
ALTER TABLE carro.carro CHANGE COLUMN ano ano varchar(4) not null default '2015';

# inserindo omitindo o valor do campo ano
INSERT INTO carro.carro (marca, modelo, preco)
VALUES ("Volkswagen","Gol",23000);

# cliente que gostaria de saber se existe um algum carro da década de 1970
SELECT * FROM carro.carro
WHERE carro.ano BETWEEN '1970' and '1979'
ORDER BY carro.ano;

# cliente deseja veículo da Ford com preço máximo de 15000,00
SELECT * FROM carro.carro
WHERE carro.marca='Ford' AND preco <= 15000;

# cliente deseja carro dos anos 2000 OU com preço até 12000,00
SELECT * FROM carro.carro
WHERE carro.ano BETWEEN '2000' AND '2009' OR carro.preco <= 12000;

# CLIENTE DESEJA OS 3 CARROS MAIS BARATOS independente de marca
SELECT * FROM carro.carro
ORDER BY carro.preco ASC LIMIT 3;

# cliente excêntrica deseja os 5 carros mais caros
SELECT * FROM carro.carro
ORDER BY carro.preco DESC LIMIT 5;

UPDATE carro.carro 
SET carro.ano='2009' 
WHERE carro.id=9; 

UPDATE carro.carro SET carro.ano='2011' WHERE carro.id=8;

# consultando todos os dados cadastrados na tabela Carro
SELECT * FROM carro.carro
ORDER BY carro.preco DESC, carro.marca;

# todos os produtos Harley Davidson tiveram um aumento de 10%
UPDATE carro.carro 
SET carro.preco=carro.preco*1.1 
WHERE carro.marca="Harley Davidson";

# todos os produtos Harley Davidson tiveram um aumento de 10%
UPDATE carro.carro 
SET carro.preco=carro.preco*1.1 
WHERE carro.marca="Harley Davidson";

SELECT * FROM carro.carro
WHERE carro.ano < "1970"
ORDER BY carro.ano;

SELECT * FROM carro.carro
ORDER BY carro.marca;

START TRANSACTION;
SET autocommit = OFF;
	DELETE FROM carro.carro
	WHERE carro.marca="Fiat";
COMMIT;
    
# excluir carros fabricados na década de 1930
DELETE FROM carro.carro
WHERE carro.ano < "1940";
# WHERE carro.ano BETWEEN "1930" AND "1939";