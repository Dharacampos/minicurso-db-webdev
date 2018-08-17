/**
 * Author:  paulo
 * Created: 15/08/2018
 */

-- CRIANDO A TABELA 'users'
-- Campos obrigatorios: nome_completo, especialidade, crm
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(128) NOT NULL,
    idade INT NOT NULL,
    endereco VARCHAR(512),
    especialidade_id INT NOT NULL,
    crm INT UNIQUE NOT NULL,

    CHECK(idade>=18),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id)
    );
    
-- CRIANDO A TABELA 'especialidades'
CREATE TABLE especialidades (
	id SERIAL PRIMARY KEY,
    especialidade VARCHAR(64)
);
-- INSERINDO VALORES NA TABELA 'especialidades'
INSERT INTO especialidades (especialidade) VALUES ("Acupuntura"),
      ("Alergia e Imunologia"),
      ("Anestesiologia"),
      ("Angiologia"),
      ("Cancerologia"),
      ("Cardiologia"),
      ("Cirurgia Cardiovascular"),
      ("Cirurgia da Mão"),
      ("Cirurgia de Cabeça e Pescoço"),
      ("Cirurgia do Aparelho Digestivo"),
      ("Cirurgia Geral"),
      ("Cirurgia Pediátrica"),
      ("Cirurgia Plástica"),
      ("Cirurgia Torácica"),
      ("Cirurgia Vascular"),
      ("Clínica Médica"),
      ("Coloproctologia"),
      ("Dermatologia"),
      ("Endocrinologia e Metabologia"),
      ("Endoscopia"),
      ("Gastroenterologia"),
      ("Genética Médica"),
      ("Geral"),
      ("Geriatria"),
      ("Ginecologia e Obstetrícia"),
      ("Hematologia e Hemoterapia"),
      ("Homeopatia"),
      ("Infectologia"),
      ("Mastologia"),
      ("Medicina de Família e Comunidade"),
      ("Medicina do Trabalho"),
      ("Medicina de Tráfego"),
      ("Medicina Esportiva"),
      ("Medicina Física e Reabilitação"),
      ("Medicina Intensiva"),
      ("Medicina Legal e Perícia Médica"),
      ("Medicina Nuclear"),
      ("Medicina Preventiva e Social"),
      ("Nefrologia"),
      ("Neurocirurgia"),
      ("Neurologia"),
      ("Nutrologia"),
      ("Oftalmologia"),
      ("Ortopedia e Traumatologia"),
      ("Otorrinolaringologia"),
      ("Patologia"),
      ("Patologia Clínica/Medicina Laboratorial"),
      ("Pediatria"),
      ("Pneumologia"),
      ("Psiquiatria"),
      ("Radiologia e Diagnóstico por Imagem"),
      ("Radioterapia"),
      ("Reumatologia"),
      ("Urologia");

-- CRIANDO A TABELA login
CREATE TABLE login(
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    usuario VARCHAR(64) NOT NULL,
    senha VARCHAR(512) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    )

    