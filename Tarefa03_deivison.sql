-- Atividade 2) Comandos DML: Considerando o banco de dados "empresa” apresentado na Atividade 1, escreva o comando DML adequado que:

-- a) Mostre o número de segurança social do empregado, o nome do dependente e o parentesco, ordenado por ssn ascendente e parentesco descendente.

SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

-- b) Mostre o nome e endereço de todos os empregados que trabalham para o departamento Pesquisa.

SELECT pnome, endereco
FROM EMPREGADO
WHERE dno IN (SELECT dnumero FROM DEPARTAMENTO WHERE dnome = 'Pesquisa');

-- c) Para todo projeto localizado em Araucaria, liste o nome do projeto, o nome do departamento de controle e o último nome, endereço e data de nascimento do gerente do departamento.


SELECT PROJETO.pjnome, DEPARTAMENTO.dnome, EMPREGADO.unome, EMPREGADO.endereco, EMPREGADO.datanasc
FROM PROJETO
JOIN DEPARTAMENTO ON PROJETO.dnum = DEPARTAMENTO.dnumero
JOIN EMPREGADO ON DEPARTAMENTO.gerssn = EMPREGADO.ssn
WHERE PROJETO.plocal = 'Araucaria';

-- d) Recupere os nomes de todos os empregados que trabalhem mais de 10 horas por semana no projeto Automatizacao.

SELECT EMPREGADO.pnome
FROM EMPREGADO
JOIN TRABALHA ON EMPREGADO.ssn = TRABALHA.essn
JOIN PROJETO ON TRABALHA.pno = PROJETO.pnumero
WHERE PROJETO.pjnome = 'Automatizacao' AND TRABALHA.horas > 10;

-- e) Mostre o nome dos empregados que têm os três maiores salários.

SELECT pnome
FROM EMPREGADO
ORDER BY salario DESC
LIMIT 3;

-- f) Mostre o nome e o salário dos supervisores com aumento de 20%.

SELECT pnome, salario * 1.20 AS novo_salario
FROM EMPREGADO
WHERE ssn IN (SELECT DISTINCT superssn FROM EMPREGADO WHERE superssn IS NOT NULL);

-- g) Mostre os departamentos e suas localidades.

SELECT DEPARTAMENTO.dnome, LOCALIZACAO.dlocalizacao
FROM DEPARTAMENTO
JOIN LOCALIZACAO ON DEPARTAMENTO.dnumero = LOCALIZACAO.dnum;

-- h) Mostre os departamentos e seus projetos.


SELECT DEPARTAMENTO.dnome, PROJETO.pjnome
FROM DEPARTAMENTO
JOIN PROJETO ON DEPARTAMENTO.dnumero = PROJETO.dnum;

-- i) Mostre os empregados do sexo feminino e a data de nascimento cujo salário é maior que 30.000.

SELECT pnome, datanasc
FROM EMPREGADO
WHERE sexo = 'F' AND salario > 30000;

-- j) Mostre os projetos em que o empregado 'Fábio' trabalha.

SELECT PROJETO.pjnome
FROM PROJETO
JOIN TRABALHA ON PROJETO.pnumero = TRABALHA.pno
JOIN EMPREGADO ON TRABALHA.essn = EMPREGADO.ssn
WHERE EMPREGADO.pnome = 'Fabio';






-- Atividade 3) Joins: Dadas as tabelas A e B e seus registros (abaixo):

-- Mostre como ficariam as pesquisas (SELECT's) com os JOIN's ( INNER, [LEFT| RIGHT | FULL] OUTER). Para tais pesquisas vamos usar a seguinte linguagem:
-- SELECT [CAMPOS]
-- FROM "TABELA_A"
-- [INNER] JOIN | {LEFT | RIGHT | FULL } [OUTER]} JOIN "TABELA_B"

-- Observação: Para a relação entre as tabelas, tem-se:
-- 3 registros para a empresa 1 (que existe na tabela A);
-- 2 registros para a empresa 2 (que existe na tabela A);
-- 1 registros para a empresa 3 (que existe na tabela A);
-- 0 registros para a empresa 4 (que existe na tabela A);
-- 1 registros para a empresa 5 (que existe na tabela A);
-- 1 registros para a empresa 8 (que NÃO existe na tabela A)


-- INNER JOIN
-- O INNER JOIN retornará todas as linhas nas quais haja uma correspondência entre as tabelas A e B.


SELECT A.codigo, A.nome, B.id, B.valor
FROM A
INNER JOIN B ON A.codigo = B.codigo;

-- LEFT OUTER JOIN
-- O LEFT OUTER JOIN retornará todas as linhas da tabela A, e as linhas correspondentes da tabela B. Se não houver correspondência, o resultado será nulo do lado de B.

SELECT A.codigo, A.nome, B.id, B.valor
FROM A
LEFT JOIN B ON A.codigo = B.codigo;

-- RIGHT OUTER JOIN
-- O RIGHT OUTER JOIN retornará todas as linhas da tabela B, e as linhas correspondentes da tabela A. Se não houver correspondência, o resultado será nulo do lado de A.


SELECT A.codigo, A.nome, B.id, B.valor
FROM A
RIGHT JOIN B ON A.codigo = B.codigo;

-- FULL OUTER JOIN
-- O FULL OUTER JOIN retornará todas as linhas quando houver uma correspondência em uma das tabelas. Este tipo de join não é suportado diretamente pelo MySQL. Em outros sistemas de gerenciamento de banco de dados que suportam FULL OUTER JOIN, a consulta seria:


SELECT A.codigo, A.nome, B.id, B.valor
FROM A
FULL OUTER JOIN B ON A.codigo = B.codigo;



-- Atividade 4) Operações CRUD (Complementar)


-- a) Empregados cujo supervisor está em um departamento diferente
-- Para encontrar todos os empregados cujo supervisor está alocado em um departamento diferente, precisamos comparar os departamentos dos empregados com os departamentos de seus supervisores. Isso pode ser feito juntando a tabela EMPREGADO consigo mesma baseada no número de segurança social do supervisor (superssn).


SELECT e1.ssn, CONCAT(e1.pnome, ' ', e1.inicialm, '. ', e1.unome) AS NomeCompleto
FROM EMPREGADO e1
JOIN EMPREGADO e2 ON e1.superssn = e2.ssn
WHERE e1.dno != e2.dno;

-- b) Número de segurança social do empregado, nome do dependente e parentesco
-- Para listar o número de segurança social do empregado, nome do dependente, e parentesco, ordenados por SSN ascendente e parentesco descendente, podemos usar a seguinte consulta, similar à fornecida anteriormente:


SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

-- c) Empregados supervisionados diretamente por “Joaquim E Brito”
-- Encontrar os empregados que são diretamente supervisionados por "Joaquim E Brito" envolve a seleção de registros na tabela EMPREGADO baseados no nome do supervisor. Será necessário primeiro encontrar o SSN de “Joaquim E Brito” e então buscar os empregados que têm esse SSN como superssn.

SELECT e.pnome AS Nome, e.ssn
FROM EMPREGADO e
JOIN EMPREGADO sup ON e.superssn = sup.ssn
WHERE sup.pnome = 'Joaquim' AND sup.inicialm = 'E' AND sup.unome = 'Brito';
