-- Atividade 02 
-- NOME: Deivison Rodrigues jordao
-- MATRICULA: 20200023728

-- Analise todas as restrições de integridade violadas em cada operação, se houver alguma, e os
-- diferentes mecanismos para impor essas restrições. Escreva o comando DML adequado
-- (mesmo que ‘erros’ sejam gerados em função da falta de restrição).


-- a) Insira >‘943775543’, ‘Roberto’, ‘F’, ‘Silva’, ‘M’, ‘Rua X, 22 – Araucária – PR’, ‘1952-06-21’,
-- ‘888665555’, ‘1’, 58000< em EMPREGADO.

INSERT INTO EMPREGADO VALUES ('943775543', 'Roberto', 'F', 'Silva', 'M', 'Rua X, 22 – Araucária – PR', '1952-06-21', '888665555', '1', 58000);



-- b) Insira >‘4’, ProdutoA’, ‘Araucaria’, ‘2’< em PROJETO.

INSERT INTO PROJETO VALUES ('4', 'ProdutoA', 'Araucaria', '2');

-- Essa operação geraria um erro de violação da chave estrangeira, uma vez que '2' não corresponde a um departamento válido baseado nos registros existentes.
-- Para permitir a inserção do projeto ProdutoA poderia criar previamente um departamento com dnumero '2' para então proceder com a inserção.



-- c) Insira >‘4’, ‘Produção’, ‘943775543’, ‘1998-10-01’< em DEPARTAMENTO.

INSERT INTO DEPARTAMENTO VALUES ('4', 'Produção', '943775543', '1998-10-01');



-- d) Insira >‘677678989’, null, 40.0< em TRABALHA.

--Irá dar errado pela tentativa de inserir um valor nulo (null) em um campo que é parte de uma chave primária.

INSERT INTO TRABALHA VALUES ('677678989', 'null', 40.0);



-- e) Insira >‘453453453’, ‘Joao’, ‘M’, ‘1970-12-12’, ‘CONJUGE’< em DEPENDENTE.

INSERT INTO DEPENDENTE VALUES ('453453453', 'Joao', 'M', '1970-12-12', 'CONJUGE');



-- f) Remova as tuplas de TRABALHA com ESSN = ‘333445555’.

DELETE FROM TRABALHA WHERE essn = '333445555';



-- g) Remova a tupla de EMPREGADO com SSN = ‘987654321’.

DELETE FROM EMPREGADO WHERE ssn = '987654321';



-- h) Remova a tupla de PROJETO com PJNOME = ‘ProdutoX’

-- A tentativa de remover um projeto que está sendo referenciado por outra tabela resultará em um erro de violação de chave estrangeira.

DELETE FROM PROJETO WHERE pjnome = 'ProdutoX';

-- Voce pode:

-- Remover ou Atualizar Referências Antes da Remoção: Antes de remover o projeto 'ProdutoX',
-- você pode remover ou atualizar as tuplas na tabela TRABALHA que referenciam o projeto, para evitar violações de integridade referencial.

-- Uso de Cascade Delete (Caso Configurado): Se o banco de dados estiver configurado para usar a ação CASCADE na deleção para a chave estrangeira
-- que referencia PROJETO em TRABALHA, a remoção do projeto 'ProdutoX' automaticamente deletaria as tuplas correspondentes em TRABALHA. No entanto,
-- dado o esquema e as instruções fornecidas, essa configuração específica não foi mencionada.



-- i) Modifique o GERSSN e GERDATAINICIO da tupla de DEPARTAMENTO com DNUMERO = 5
-- para ‘123456789’ e ‘1999-01-10’, respectivamente.

UPDATE DEPARTAMENTO SET GERSSN = '123456789', GERDATAINICIO = '1999-01-10' WHERE DNUMERO = 5;

-- j) Modifique o atributo SUPERSSN da tupla EMPREGADO com SSN = ‘999887777’ para
-- ‘943775543’.

UPDATE EMPREGADO SET SUPERSSN = '943775543' WHERE SSN = '999887777';

-- l) Modifique o atributo HORAS da tupla de TRABALHA com ESSN = ‘999887777’ e PNO = ‘10’
-- para 5,0


UPDATE TRABALHA SET HORAS = 5.0 WHERE ESSN = '999887777' AND PNO = '10';
