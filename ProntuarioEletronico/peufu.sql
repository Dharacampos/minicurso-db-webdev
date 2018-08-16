/**
 * Author:  paulo
 * Created: 15/08/2018
 */

-- CRIANDO A TABELA 'users'
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    usuario VARCHAR(32),
    senha VARCHAR(16)
    );

-- INSERINDO VALORES NA TABELA 'users'
INSERT INTO users (usuario, senha) 
VALUES ('paulo@ufu.br', '1234');