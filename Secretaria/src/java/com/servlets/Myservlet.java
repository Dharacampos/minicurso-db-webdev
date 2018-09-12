/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.database.ConexaoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class Myservlet extends HttpServlet {

    // Variaveis globais da classe Myservlet
    Connection conexao;
    PreparedStatement stmt;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8"); // Configurando o codigo de caracteres

        // Iniciando uma conexão com o banco de dados
        conexao = ConexaoDatabase.getConnection();

        // Pegando o valor do botao pressionado [Cadastrar ou Atualizar ou Deletar]
        String botao_submit = request.getParameter("botao_submit");

        // Switch para verficar qual botao foi pressionado
        try {
            switch (botao_submit) {
                case "Cadastrar":
                    System.out.println("Cadastrar");
                    cadastrar_estudante(request, response);
                    response.sendRedirect("index.jsp?sucesso=true");
                    return;
                case "Atualizar":
                    System.out.println("Atualizar");
                    atualizar_estudante(request, response);
                    response.sendRedirect("editar.jsp?atualizado=true");
                    return;
                case "Deletar":
                    System.out.println("Deletar");
                    deletar_estudante(request, response);
                    response.sendRedirect("editar.jsp?deletado=true");
                    return;
                default:
                    System.out.println("Inválido");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Myservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void cadastrar_estudante(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        // Receber os dados dos estudantes preenchido no formulario
        String nome = request.getParameter("nome"); // input text nome
        String id_curso = request.getParameter("curso"); // input text curso convertida para Integer
        String cpf = request.getParameter("cpf"); // input text cpf
        String endereco = request.getParameter("endereco"); // input text endereco
        String[] disciplinas = request.getParameterValues("disciplinas"); // input checkbox disciplinas

        // Criar uma query para inserir valor no banco de dados
        String query_sql = "INSERT INTO estudantes(nome, cpf, endereco, id_curso) "
                + "VALUES(?,?,?,?)";

        // Criar um PreparedStatement
        stmt = conexao.prepareStatement(query_sql);

        // Configurar os valores de ? na query_sql
        stmt.setString(1, nome);
        stmt.setString(2, cpf);
        stmt.setString(3, endereco);
        stmt.setString(4, id_curso);

        // Executar o codigo sql no BD
        stmt.execute();

        // Funcao/metodo para cadastrar as disciplinas que o estudante marcou na lista
        cadastarDisciplinasEstudante(request, response, cpf, disciplinas);

    }

    private void atualizar_estudante(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        // Receber valores do formulario
        int id_estudante = Integer.parseInt(request.getParameter("id"));
        String cpf = request.getParameter("cpf");
        String endereco = request.getParameter("endereco");
        String[] disciplinas = request.getParameterValues("disciplinas");
        System.out.println(disciplinas);
        // Criando uma query para atualizar o endereco do estudante
        String query_sql = "UPDATE estudantes SET endereco=? WHERE id=?";
        
        // Criando um statement
        stmt = conexao.prepareStatement(query_sql);
        
        // Substituindo os ? valores
        stmt.setString(1, endereco);
        stmt.setInt(2, id_estudante);
        
        // Executando o statement
        stmt.execute();
        
        // Removendo todas disciplinas cadastradas
        
        // Criando a query_sql
        query_sql = "DELETE FROM disciplinas_estudantes WHERE id_estudante=?";
        
        // Criando statement 
        stmt = conexao.prepareStatement(query_sql);
        
        // Substituindo ? na query_sql
        stmt.setInt(1, id_estudante);

        // Executando a query
        stmt.execute();  
        
        // ADICIONADO AS NOVAS DISCIPLINAS se existir alguma marcada
        if(disciplinas != null)
            cadastarDisciplinasEstudante(request, response, cpf, disciplinas);
        
    }

    private void deletar_estudante(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        // Receber o Id do estudante a ser removido no BD
        int id_estudante = Integer.parseInt(request.getParameter("id_estudante"));
        
        
        // VAMOS AGORA DELETAR O ESTUDANTE DA TABELA "estudantes"
        // Criar sql para remover o estudante do BD
        String query_sql = "DELETE FROM estudantes WHERE id=?";
        
        // Criando um PreparedStatement
        stmt = conexao.prepareStatement(query_sql);
        
        // Substituindo ? na query_sql
        stmt.setInt(1, id_estudante);
        
        //Executando a query
        stmt.execute();

        // VAMOS AGORA DELETAR O REGISTRO DO ESTUDANTE NA TABELA "disciplinas_estudantes"
        
        // Criando a query_sql
        query_sql = "DELETE FROM disciplinas_estudantes WHERE id_estudante=?";
        
        // Criando statement 
        stmt = conexao.prepareStatement(query_sql);
        
        // Substituindo ? na query_sql
        stmt.setInt(1, id_estudante);

        // Executando a query
        stmt.execute();        
    }

    private void cadastarDisciplinasEstudante(HttpServletRequest request, HttpServletResponse response, String cpf, String[] disciplinas) throws SQLException {
        // QUAL O id no BD do Estudante que acabamos de cadadastrar? Não sabemos. Precisamos consulta:

        // Query sql para buscar o id do estudante
        String query_id = "SELECT id FROM estudantes WHERE cpf=?";

        // Criando PreparedStatement
        stmt = conexao.prepareStatement(query_id);

        // Colocando valores no ? da query
        stmt.setString(1, cpf);

        // Executando o stmt e recebendo o resultado
        rs = stmt.executeQuery();

        int id_estudante = 0; // variavel que ira conter o id do estudante
        while (rs.next()) {
            id_estudante = rs.getInt("id"); // retornando a coluna 'id' do resultado da query
        }

        // UFFAAA, ate que enfim conseguimos o id do estudante.
        // Agora podemos inserir o registo do estudante e suas disciplinas na tabela
        // disciplinas estudantes.
        // Observacao: Para cada disciplina que o estudante marcou, executaremos a query
        // Interando sobre a lista de disciplinas matriculadas 
        for (String d : disciplinas) {
            // Criar a query para inserir na tabela disciplinas_estudantes
            String query_sql = "INSERT INTO disciplinas_estudantes(id_estudante, id_disciplina) "
                    + "VALUES(?,?)";

            // Criando o stmt para a query_sql
            stmt = conexao.prepareStatement(query_sql);

            // Iserindo os valores no lugar de ? em query_sql
            stmt.setInt(1, id_estudante);
            stmt.setInt(2, Integer.parseInt(d));

            // Executando a query
            stmt.execute();
        }
    }
}
