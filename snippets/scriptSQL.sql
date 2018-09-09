-- CRIANDO TABELAS
CREATE TABLE cursos(
  id SERIAL PRIMARY KEY,
  descricao VARCHAR(64)
);

CREATE TABLE estudantes(
  id    SERIAL PRIMARY KEY,
  nome  VARCHAR(64) NOT NULL,
  cpf		VARCHAR(12) UNIQUE,
  id_curso INT,
	endereco VARCHAR(128),

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

-- RELAÇÃO MUITOS PARA MUITOS
CREATE TABLE discplinas_estudantes(
  id SERIAL PRIMARY KEY,
  id_estudante INT,
  id_disciplina INT,

  FOREIGN KEY (id_estudante) REFERENCES estudantes(id),
  FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id)
);

INSERT INTO estudantes(nome, cpf, id_curso, endereco) VALUES
("Paulo Camargos Silva","12345678912", 1, "Av. Segismundo Pereira, 150"),
("João Souza","98765432198", 5, "Av. João Naves de Ávila, 1102");

INSERT INTO login(usuario, senha, id_estudante) VALUES
("paulo@ufu.br", "admin", 1),
("joao@ufu.br", "admin", 2);

INSERT INTO cursos(descricao) VALUES("Engenharia Biomédica"),
                                    ("Engenharia de Controle e Automação"),
                                    ("Engenharia de Computação"),
                                    ("Engenharia Elétrica"),
                                    ("Engenharia Eletrônica e de Telecomunicações ");

INSERT INTO disciplinas(descricao, sigla, ch, periodo, id_curso) VALUES
("Instrumentação Biomédica I", "IB1", 90, 8, 1),
("Telemedicina", "TELMED", 60, 7, 1),
("Sinais e Sistema I", "SSIS I", 30, 3, 2),
("Eletrônica Industrial e Acionamentos", "EIA", 60, 4, 2),
("Programação Orientada a Objeto", "POOB", 60, 5, 3),
("Computação Gráfica", "CG", 60, 6, 3),
("Eletrônica de Potência", "ELP", 60, 6, 4),
("Transformadores", "TRAFO", 90, 6, 4),
("Redes de Computadores", "RC", 60, 7, 5),
("Comunicação via Satélite", "CVS", 60, 8, 5);

INSERT INTO discplinas_estudantes(id_estudante, id_disciplina) VALUES(1,1), (1,2), (1,3);
