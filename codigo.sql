-- O seguinte trabalho foi realizado pelas alunas Camille Rodrigues e Luizy Pruss

-- As ferramentas que utilizamos foi o SQLite e DBeaver.
-- Começamos a criação de tabelas pelo SQLite, 
-- depois fizemos a conexão do SQLite com o DBeaver para poder continuar o desenvolvimento do trabalho com o que já tinha sido desenvolvido.

-- 4. Crie o comando SQL para a criação do banco de dados ACADEMIA.

-- CREATE DATABASE ACADEMIA; -- Criação do banco de dados ACADEMIA. Não é necessário o CREATE DATABASE, pois estamos utilizando o SQLite. Para criar um banco de dados, basta criar um arquivo DB (extensão).

-- 5. Crie o comando SQL para a criação das tabelas solicitadas (exercícios, alunos, avaliações, frequência). 

CREATE TABLE "PERSONAL" ( -- Criação da tabela "PERSONAL".
	"NOME" TEXT NOT NULL, -- Nome da coluna, tipo de dado e restrição.
	"ID_PERSONAL" INTEGER NOT NULL,
	PRIMARY KEY("ID_PERSONAL")); -- Define ID_PERSONAL como a chave primária.

CREATE TABLE "EXERCICIOS" ( -- Criação da tabela "EXERCICIOS"
	"NOME_EXERCICIO" TEXT NOT NULL, -- Nome da coluna, tipo de dado e restrição.
	"ID_GRUPO_MUSC" INTEGER NOT NULL,
	"GRUPO_MUSC" TEXT NOT NULL,
	"ORDEM"	INTEGER NOT NULL,
	"SERIES" INTEGER NOT NULL,
	"REPETICOES" INTEGER NOT NULL,
	PRIMARY KEY("ID_GRUPO_MUSC")); -- Define ID_GRUPO_MUSC como a chave primária.

CREATE TABLE "TREINOS" ( -- Criação da tabela "TREINOS"
	"ID_TREINO" INTEGER NOT NULL, -- Nome da coluna, tipo de dado e restrição.
	"ID_GRUPO_MUSC" INTEGER NOT NULL,
    "ID_PERSONAL" INTEGER NOT NULL,
	PRIMARY KEY("ID_TREINO"), -- Define ID_TREINO como a chave primária.
	FOREIGN KEY("ID_PERSONAL") REFERENCES "PERSONAL"("ID_PERSONAL"), -- ID_PERSONAL está relacionado à tabela PERSONAL. 
	FOREIGN KEY("ID_GRUPO_MUSC") REFERENCES "EXERCICIOS"("ID_GRUPO_MUSC")); -- ID_GRUPO_MUSC está relacionado à tabela EXERCICIOS.

CREATE TABLE "ALUNO" ( -- Criação da tabela "ALUNO"
	"NOME" TEXT NOT NULL, -- Nome da coluna, tipo de dado e restrição
	"PESO" REAL NOT NULL,
	"ALTURA" REAL NOT NULL,
	"PESO_META" REAL NOT NULL,
	"IDADE"	INTEGER NOT NULL,
	"DATA_INICIAL" TEXT NOT NULL,
	"DATA_FINAL" TEXT NOT NULL,
	"OBJETIVO" TEXT NOT NULL,
	"OBSERVACOES" TEXT NOT NULL,
	"FREQUENCIA_TREINOS" TEXT NOT NULL,
	"ID_ALUNO" INTEGER NOT NULL,
	"DURACAO_PLANEJAMENTO" TEXT NOT NULL,
	"ID_PERSONAL" INTEGER NOT NULL,
	"ID_TREINO" INTEGER,
	PRIMARY KEY("ID_ALUNO"), -- Define ID_ALUNO como a chave primária. 
	FOREIGN KEY("ID_TREINO") REFERENCES "TREINOS"("ID_TREINO")); -- ID_TREINO está relacionado à tabela TREINO.  

CREATE TABLE "AVALIACOES_FISICAS" ( -- Criação da tabela "AVALIACOES_FISICAS"
	"ID_AVALIACAO" INTEGER NOT NULL, -- Nome da coluna, tipo de dado e restrição
	"ID_ALUNO" INTEGER NOT NULL,
	"DATA_AVALIACAO" TEXT NOT NULL,
	"AQUECIMENTO" TEXT NOT NULL,
	"PAUSA_SERIES" TEXT NOT NULL,
	"COND_TEMP_BIC" TEXT NOT NULL,
	"COND_VEL_BIC" TEXT NOT NULL,
	"COND_TEMP_EST"	TEXT NOT NULL,
	"COND_VEL_EST" TEXT NOT NULL,
	"COND_TEMP_OUT" TEXT NOT NULL,
	"COND_VEL_OUT" TEXT NOT NULL,
	PRIMARY KEY("ID_AVALIACAO"), -- Define ID_AVALIACAO como a chave primária.
	FOREIGN KEY("ID_ALUNO") REFERENCES "ALUNO"("ID_ALUNO")); -- ID_ALUNO está relacionado à tabela ALUNO.  

CREATE TABLE "FREQUENCIA" (
	"ID_FREQ" INTEGER NOT NULL,
	"ID_ALUNO" INTEGER NOT NULL,
	"CONTROLE_FREQ_DIAS" TEXT NOT NULL,
	PRIMARY KEY("ID_FREQ"),
	FOREIGN KEY("ID_ALUNO") REFERENCES "ALUNO"("ID_ALUNO"));

-- 6. Crie o comando SQL para inserção de pelo menos 10 registros em cada uma das tabelas necessárias. 

INSERT INTO PERSONAL (NOME, ID_PERSONAL) 
VALUES ('Julia', 11),
       ('Jorge', 12),
       ('Maria', 13),
       ('José', 14),
       ('Mario', 15),
       ('Pedro', 16),
       ('Nicole', 17),
       ('Sofia', 18),
       ('Kleber', 19),
       ('Herysson', 20);

INSERT INTO EXERCICIOS (NOME_EXERCICIO, ID_GRUPO_MUSC, GRUPO_MUSC, ORDEM, SERIES, REPETICOES) 
VALUES ('cross-over', 1, 'peitoral', 1, 3, 8),
       ('crucifixo', 2, 'peitoral', 2, 3, 8),
       ('flexão de braço', 3, 'peitoral', 3, 3, 8),
       ('pec-deck', 4, 'peitoral', 4, 3, 8),
       ('pull over', 5, 'peitoral', 5, 3, 8),
       ('supino reto', 6, 'peitoral', 6, 3, 8),
       ('supino inclinado', 7, 'peitoral', 7, 3, 8),
       ('supino declinado', 8, 'peitoral', 8, 3, 8),
       ('supino vertical', 9, 'peitoral', 9, 3, 8),
       ('sup. art. inclinado', 10, 'peitoral', 10, 3, 8),
       ('fly', 11, 'peitoral', 11, 3, 8),
       ('pulley', 12, 'tríceps', 1, 3, 10),
       ('pulley uni', 13, 'tríceps', 2, 3, 10),
       ('pulley corda', 14, 'tríceps', 3, 3, 10),
       ('pulley sup.', 15, 'tríceps', 4, 3, 10),
       ('coice', 16, 'tríceps', 5, 3, 10),
       ('francês', 17, 'tríceps', 6, 3, 10),
       ('supinado', 18, 'tríceps', 7, 3, 10),
       ('testa', 19, 'tríceps', 8, 3, 10),
       ('tríceps banco', 20, 'tríceps', 9, 3, 10),
       ('cruc. invertido', 21, 'ombro', 1, 4, 12),
       ('des. barra', 22, 'ombro', 2, 4, 12),
       ('elev. lateral', 23, 'ombro', 3, 4, 12),
       ('elev. barra sup.', 24, 'ombro', 4, 4, 12),
       ('elev. frantal', 25, 'ombro', 5, 4, 12),
       ('remada alta', 26, 'ombro', 6, 4, 12),
       ('encolhimento', 27, 'ombro', 7, 4, 12),
       ('arnold', 28, 'ombro', 8, 4, 12),
       ('agachamento', 29, 'membros inferiores', 1, 3, 6),
       ('avanço', 30, 'membros inferiores', 2, 3, 6),
       ('leg press', 31, 'membros inferiores', 3, 3, 6),
       ('passada', 32, 'membros inferiores', 4, 3, 6),
       ('abdução', 33, 'membros inferiores', 5, 3, 6),
       ('adução', 34, 'membros inferiores', 6, 3, 6),
       ('afundo', 35, 'membros inferiores', 7, 3, 6),
       ('elevação pélvica', 36, 'membros inferiores', 8, 3, 6),
       ('extensora', 37, 'membros inferiores', 9, 3, 6),
       ('flexora deitada', 38, 'membros inferiores', 10, 3, 6),
       ('flexora sentada', 39, 'membros inferiores', 11, 3, 6),
       ('hack', 40, 'membros inferiores', 12, 3, 6),
       ('levant. terra', 41, 'membros inferiores', 13, 3, 6),
       ('stiff', 42, 'membros inferiores', 14, 3, 6),
       ('barra fixa', 43, 'dorsal', 1, 3, 8),
       ('pulley frente', 44, 'dorsal', 2, 3, 8),
       ('pulldown', 45, 'dorsal', 3, 3, 8),
       ('remada sentado', 46, 'dorsal', 4, 3, 8),
       ('remada pulley', 47, 'dorsal', 5, 3, 8),
       ('remada uni.', 48, 'dorsal', 6, 3, 8),
       ('cavalinho', 49, 'dorsal', 7, 3, 8),
       ('remada curvada', 50, 'dorsal', 8, 3, 8),
       ('pulley triangulo', 51, 'dorsal', 9, 3, 8),
       ('rosca direta', 52, 'bíceps', 1, 4, 12),
       ('rosca scott', 53, 'bíceps', 2, 4, 12),
       ('rosca alternada', 54, 'bíceps', 3, 4, 12),
       ('ros. concentrada', 55, 'bíceps', 4, 4, 12),
       ('martelo', 56, 'bíceps', 5, 4, 12),
       ('polia cross', 57, 'bíceps', 6, 4, 12),
       ('curto', 58, 'abdomen', 1, 4, 10),
       ('canivete', 59, 'abdomen', 2, 4, 10),
       ('canoa', 60, 'abdomen', 3, 4, 10),
       ('rodinha', 61, 'abdomen', 4, 4, 10),
       ('elev. de pernas', 62, 'abdomen', 5, 4, 10),
       ('prancha', 63, 'abdomen', 6, 4, 10),
       ('prancha lateral', 64, 'abdomen', 7, 4, 10),
       ('remador', 65, 'abdomen', 8, 4, 10);
	   
INSERT INTO TREINOS (ID_TREINO, ID_GRUPO_MUSC, ID_PERSONAL) 
VALUES (21, 1, 11),
       (22, 2, 12),
       (23, 3, 13),
       (24, 4, 14),
       (25, 5, 15),
       (26, 6, 16),
       (27, 7, 17),
       (28, 1, 18),
       (29, 2, 19),
       (30, 3, 20);

INSERT INTO ALUNO (NOME, PESO, ALTURA, PESO_META, IDADE, DATA_INICIAL, DATA_FINAL, OBJETIVO, OBSERVACOES, FREQUENCIA_TREINOS, ID_ALUNO, DURACAO_PLANEJAMENTO, ID_PERSONAL, ID_TREINO) 
VALUES ('Camille ', 65.0, 1.65, 60.0, 23, '02/06/2025', '02/10/2025', 'Emagrecimento', 'Fazendo acompanhamento com nutricionista', '3 vezes por semana', 1, '2 meses', 16, 21),
       ('Luizy ', 53.0, 1.55, 58.0, 27, '03/06/2025', '03/10/2025', 'Ganho de massa muscular', 'Comem mais calorias do que gastam', '4 vezes por semana', 2, '2 meses', 20, 22),
       ('Marlon ', 80.0, 1.75, 75.0, 31, '04/06/2025', '04/10/2025', 'Emagrecimento', 'Fazendo acompanhamento com nutricionista', '6 vezes por semana', 3, '3 meses', 11, 23),
       ('Ramon ', 73.0, 1.73, 80.0, 26, '05/06/2025', '05/10/2025', 'Ganho de massa muscular', 'Comem mais calorias do que gastam', '5 vezes por semana', 4, '3 meses', 15, 24),
       ('Diogo ', 98.0, 1.68, 70.0, 24, '06/06/2025', '06/10/2025', 'Emagrecimento', 'Fazendo acompanhamento com nutricionista', '7 vezes por semana', 5, '6 meses', 18, 25),
       ('Camila', 68.0, 1.53, 65.0, 55, '07/06/2025', '07/10/2025', 'Emagrecimento', 'Fazendo acompanhamento com nutricionista', '3 vezes por semana ', 6, '2 meses', 12, 26),
       ('Franciele', 55.0, 1.62, 60.0, 24, '08/06/2025', '08/10/2025', 'Ganho de massa muscular', 'Comem mais calorias do que gastam', '4 vezes por semana ', 7, '3 meses', 17, 27),
       ('Marcos', 70.0, 1.70, 70.0, 55, '09/06/2025', '09/10/2025', 'Manter o peso', '-', '2 vezes por semana ', 8, '4 meses', 19, 28),
       ('Leonardo', 70.0, 1.72, 75.0, 23, '10/06/2025', '10/10/2025', 'Ganho de massa muscular', 'Comem mais calorias do que gastam', '6 vezes por semana', 9, '3 meses', 13, 29), 
       ('Ana Paula', 52.0, 1.50, 57.0, 23, '11/06/2025', '11/10/2025', 'Ganho de massa muscular', 'Comem mais calorias do que gastam', '5 vezes por semana', 10, '3 meses', 14, 30);

INSERT INTO AVALIACOES_FISICAS (ID_AVALIACAO, ID_ALUNO, DATA_AVALIACAO, AQUECIMENTO, PAUSA_SERIES, COND_TEMP_BIC, COND_VEL_BIC, COND_TEMP_EST, COND_VEL_EST, COND_TEMP_OUT, COND_VEL_OUT)
VALUES (123, 1, '01/06/2025', 'BICICLETA', '1 MINUTO', '20 MINUTOS', '15 km/h', 'NF', 'NF', 'NF', 'NF'),
       (213, 7, '07/06/2025', 'BICICLETA', '1 MINUTO', '20 MINUTOS', '15 km/h', 'NF', 'NF', 'NF', 'NF'),
       (321, 4, '04/06/2025', 'BICICLETA', '1 MINUTO', '20 MINUTOS', '15 km/h', 'NF', 'NF', 'NF', 'NF'),
       (456, 2, '02/06/2025', 'ESTEIRA', '1 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF'),
       (564, 8, '08/06/2025', 'ESTEIRA', '11 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF'),
       (591, 10, '10/06/2025', 'ESTEIRA', '1 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF'),
       (654, 5, '05/06/2025', 'BICICLETA', '1 MINUTO', '20 MINUTOS', '15 km/h', 'NF', 'NF', 'NF', 'NF'),
       (789, 3, '03/06/2025', 'ESTEIRA', '1 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF'),
       (978, 9, '09/06/2025', 'ESTEIRA', '1 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF'),
       (987, 6, '06/06/2025', 'ESTEIRA', '1 MINUTO', 'NF', 'NF', '20 MINUTOS', '6 km/h', 'NF', 'NF');

INSERT INTO FREQUENCIA (ID_FREQ, ID_ALUNO, CONTROLE_FREQ_DIAS)
VALUES (100, 1, '10/06/2025'),
       (101, 1, '15/06/2025'),
	   (102, 2, '20/06/2025'),
	   (103, 3, '12/06/2025'),
	   (104, 4, '16/06/2025'),
	   (105, 5, '19/06/2025'),
	   (106, 6, '22/06/2025'),
	   (107, 7, '22/06/2025'),
	   (108, 8, '11/06/2025'),
	   (109, 9, '19/06/2025'),
	   (110, 10, '25/06/2025');
	   
-- 7. Crie uma consulta para relacionar todos os dados disponíveis de todos os Alunos/Clientes da academia em ordem alfabética de nome.

SELECT * -- Seleciona todas as colunas da tabela.
FROM ALUNO -- os dados irão vir da tabela ALUNO.
ORDER BY NOME ASC; -- Ordena os resultados da coluna NOME e coloca em ordem crescente.

-- 8. Crie uma consulta para listar todos os registros de frequência de um aluno específico, ordenados por data. 

SELECT 
    A.NOME,                  -- Nome do aluno
    F.ID_FREQ,               -- ID do registro de frequência
    F.CONTROLE_FREQ_DIAS     -- Data da frequência
FROM FREQUENCIA AS F
JOIN ALUNO AS A ON F.ID_ALUNO = A.ID_ALUNO
WHERE A.ID_ALUNO = 4         -- Aqui definimos o aluno (ex: ID_ALUNO = 1)
ORDER BY F.CONTROLE_FREQ_DIAS ASC;

-- 9. Crie uma consulta para listar todas as avaliações físicas de alunos realizadas, ordenadas por data de avaliação. 

SELECT 
    A.NOME, -- Seleciona o nome do aluno da tabela "ALUNO"
    AV.ID_AVALIACAO, -- Seleciona todas as colunas da tabela "AVALIACOES_FISICAS"
    AV.DATA_AVALIACAO,
    AV.AQUECIMENTO,
    AV.PAUSA_SERIES,
    AV.COND_TEMP_BIC,
    AV.COND_VEL_BIC,
    AV.COND_TEMP_EST,
    AV.COND_VEL_EST,
    AV.COND_TEMP_OUT,
    AV.COND_VEL_OUT,
    AV.CONTROLE_FREQ_DIAS
FROM AVALIACOES_FISICAS AS AV -- A consulta está sendo feita na tabela AVALIACOES_FISICAS, a sigla AV (abreviação de AVALIACOES_FISICAS) serve para dizer que as colunos estão associadas a essa tabela.
JOIN ALUNO AS A ON AV.ID_ALUNO = A.ID_ALUNO -- Faz uma junção entre as tabelas AVALIACOES_FISICAS e ALUNO, com base na coluna ID_ALUNO, que existe nas duas tabelas.
ORDER BY AV.DATA_AVALIACAO ASC; -- Ordena os resultados pela data da avaliação física, da mais antiga para a mais recente.

-- 10. Crie uma consulta para listar todos os alunos cadastrados, juntamente com seus objetivos de treino, a quantidade total de exercícios realizados e o nome do personal responsável, 
-- ordenados alfabeticamente pelo nome do aluno. 

SELECT 
    A.NOME, -- Seleciona o nome do aluno da tabela "ALUNO"
    A.OBJETIVO, -- Seleciona o objetivo do aluno da tabela "ALUNO"
    ID_TREINO, 
    P.NOME -- Seleciona o nome do personal trainer associado ao aluno da tabela "PERSONAL".
FROM ALUNO AS A -- Define a tabela ALUNO como A
LEFT JOIN PERSONAL AS P ON A.ID_PERSONAL = P.ID_PERSONAL -- Para cada aluno, tenta encontrar o personal correspondente. Usamos a chave estrangeira "ID_PERSONAL" para fazer essa ligação.
LEFT JOIN TREINOS AS T ON A.ID_TREINO = T.ID_TREINO -- Junta a tabela de exercícios, pegando os exercícios relacionados ao grupo muscular do treino do aluno.
LEFT JOIN EXERCICIOS AS E ON T.ID_GRUPO_MUSC = E.ID_GRUPO_MUSC -- Conecta a tabela TREINOS com a tabela EXERCICIOS, usando como chave de ligação o campo ID_GRUPO_MUSC.
GROUP BY A.ID_ALUNO, A.NOME, A.OBJETIVO, P.NOME -- Agrupa os dados por aluno e personal para que o COUNT funcione corretamente (sem duplicar resultados).
ORDER BY A.NOME ASC; -- Ordena os resultados pelo nome do aluno em ordem alfabética.
