-- CRIAR A DATABASE
-- CREATE DATABASE minicursobd;

-- CRIANDO TABELAS
CREATE TABLE cursos(
  id SERIAL PRIMARY KEY,
  descricao VARCHAR(64)
)  ENGINE=MyISAM DEFAULT CHARSET=utf8  COLLATE=utf8_general_ci;

CREATE TABLE estudantes(
  id    SERIAL PRIMARY KEY,
  nome  VARCHAR(64) NOT NULL,
  cpf		VARCHAR(12) UNIQUE,
	endereco VARCHAR(128),
  id_curso INT,

  FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

CREATE TABLE login(
  id SERIAL PRIMARY KEY,
  usuario VARCHAR(32),
  senha VARCHAR(512),
  ativo  TINYINT DEFAULT 1,
  id_estudante INT,

  FOREIGN KEY (id_estudante) REFERENCES estudantes(id)
);

CREATE TABLE disciplinas(
  id SERIAL PRIMARY KEY,
  descricao VARCHAR(64),
  sigla VARCHAR(6),
  -- Carga horaria
  ch INT,
  periodo INT,
  id_curso INT,

  FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- RELA��O MUITOS PARA MUITOS
CREATE TABLE disciplinas_estudantes(
  id SERIAL PRIMARY KEY,
  id_estudante INT,
  id_disciplina INT,

  FOREIGN KEY (id_estudante) REFERENCES estudantes(id),
  FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id)
);

INSERT INTO estudantes(nome, cpf, id_curso, endereco) VALUES
("Paulo Camargos Silva","12345678912", 1, "Av. Segismundo Pereira, 150"),
("Dhara Campos", "23456789123", 1, "Av. Afonso Pena, 250")
("Jo�o Souza","98765432198", 5, "Av. Jo�o Naves de �vila, 1102");

INSERT INTO login(usuario, senha, id_estudante) VALUES
("paulo@ufu.br", "admin", 1),
("joao@ufu.br", "admin", 2);

INSERT INTO cursos(descricao) VALUES("Engenharia Biom�dica"),
                                    ("Engenharia de Controle e Automa��o"),
                                    ("Engenharia de Computa��o"),
                                    ("Engenharia El�trica"),
                                    ("Engenharia Eletr�nica e de Telecomunica��es ");

INSERT INTO disciplinas(descricao, sigla, ch, periodo, id_curso) VALUES
("Instrumenta��o Biom�dica I", "IB1", 90, 8, 1),
("Telemedicina", "TELMED", 60, 7, 1),
("Sinais e Sistema I", "SSIS I", 30, 3, 2),
("Eletr�nica Industrial e Acionamentos", "EIA", 60, 4, 2),
("Programa��o Orientada a Objeto", "POOB", 60, 5, 3),
("Computa��o Gr�fica", "CG", 60, 6, 3),
("Eletr�nica de Pot�ncia", "ELP", 60, 6, 4),
("Transformadores", "TRAFO", 90, 6, 4),
("Redes de Computadores", "RC", 60, 7, 5),
("Comunica��o via Sat�lite", "CVS", 60, 8, 5);

INSERT INTO disciplinas_estudantes(id_estudante, id_disciplina) VALUES(1,1), (1,2), (1,3), (2, 9), (2, 7);
