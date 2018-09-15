package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Singleton de conexões com o banco de dados.
 *
 * Retorna uma conexão com o banco de dados.
 *
 * @author paulo
 */
public class ConexaoDatabase {

    // VARIAVEL STATIC PARA RETORNAR A CONEXAO
    private static Connection connection;

    /**
     * Retorna uma conexão com o banco de dados
     * @return Connection
     */
    public static Connection getConnection() {        
        //VARIAVEIS PARA CONN COM O DB
        String driverDB = "com.mysql.jdbc.Driver"; // driver que estamos usando
        String url = "jdbc:mysql://localhost:3306/minicursobd"; // endereco do banco de dados
        String username = "root"; // Usuário configurado no banco de dados
        String password = "";       // Senha configurada no banco de dados
        // Obs.: O usuario e senha configurados acima sao aquelas padroes 
        // da instalacao. Se voce configurou outra senha/usuario, altere o valor
        // das variaveis acima para corresponder.

        //SE A CONEXAO NAO EXISTE, CRIA E RETORNA. SE EXISTE RETORNA AQUELA EXISTENTE.
        if (connection == null) {
            try {
                Class.forName(driverDB);
                connection = DriverManager.getConnection(url, username, password);
                System.out.println("[OK] Conexão com DB criada com sucesso");
            } catch (SQLException ex) {
                System.out.println("[ERRO] Erro ao conectar com o banco de dados");
                System.out.println(ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConexaoDatabase.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return connection;
    }

    /**
     * Finaliza uma conexão existente
     */
    public static void destroy() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
                System.out.println("[OK] Conexão destruída");
            } catch (SQLException ex) {
                System.out.println("[ERRO] Erro na destruição da conexão");
                System.out.println(ex);
            }
        }
    }
}
