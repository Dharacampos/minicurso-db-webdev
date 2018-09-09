/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.database.ConexaoDatabase;
import com.models.Estudante;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo
 */
public class Entrar extends HttpServlet {

    //        DECLARANDO VARIAVEIS
    private Connection conexao;
    private String usuario_form;
    private String senha_form;
    private String query;
    private PreparedStatement st = null;
    private ResultSet rs = null;
    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("entrar.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(false);

//        VARIAVEL CONTENDO A CONEXAO COM O BD
        conexao = ConexaoDatabase.getConnection();

//        COLHENDO VALORES DO FORMULARIO
        usuario_form = request.getParameter("usuario"); //USUARIO
        senha_form = request.getParameter("senha"); //SENHA

//        QUERY QUE SERA EXECUTADA NO BANCO DE DADOS
        query = "SELECT id, senha FROM login WHERE usuario=?";

//        CONSULTANDO O BANCO DE DADOS
        try {
//        PREPARANDO O STATEMENT
            st = conexao.prepareStatement(query);
            st.setString(1, usuario_form);

            // EXECUTANDO A QUERY 
            rs = st.executeQuery();

//            PERCORRENDO O result set
            if (rs.next()) { //        VERIFICANDO SE O VALOR DE USUARIO NAO ESTA VAZIO
                //SENHA E USUARIO CADASTRADO NO BANCO
                String senha_banco = rs.getString("senha");
//                String usuario_banco = rs.getString("usuario");

                if (senha_banco.equals(senha_form)) {
                    carregarEstudantes(session);
                    carregarCatalogoDisciplinas(session);
//                    rd.forward(request, response);
                    ConexaoDatabase.destroy();
                    response.sendRedirect("home.jsp");

                } else {
//            REDIRECIONANDO PARA A PAGINA erro.jsp
                    response.sendRedirect("erro.jsp=0");
                }
            } else {
                response.sendRedirect("erro.jsp?status=-1");
            }
        } catch (SQLException ex) {
            System.out.println("[ERRO] Erro ao criar Statement ou ResultSet");
            System.out.println(ex);
        } finally {
            ConexaoDatabase.destroy();
        }// FIM finally
    }//FIM doPost

    private void carregarEstudantes(HttpSession session) throws SQLException {
        // CRIANDO LISTA DE ESTUDANTES 
        List<Estudante> estudantes = new ArrayList<>();
        // Criar conexao

        conexao = ConexaoDatabase.getConnection();
//        Statement stmt = conexao.createStatement();

        // Criar query
        query = "SELECT * FROM estudantes";
        //Criar statement
        st = conexao.prepareStatement(query);
        // Executar query
        System.out.println(query);
//        ResultSet res = stmt.executeQuery(query);
        ResultSet rs = st.executeQuery();
        // Atribuir o retorno ao request
//        rs.last();
//        System.out.println(rs.getRow());
//        rs.first();

        while (rs.next()) {
//            RECOLHENDO INORMACOES DO resultset
            int id = Integer.parseInt(rs.getString("id"));
            String nome = rs.getString("nome");
            String cpf = rs.getString("cpf");
            String endereco = rs.getString("endereco");
            int id_curso = Integer.parseInt(rs.getString("id_curso"));
            System.out.println(nome);

            //Buscando o nome do curso do estudante
            String nome_curso = buscarNomeCurso(id_curso);
            // Buscando as disciplinas que o estudantes esta matriculado
            List<String> disciplinas_mat = buscarDisciplinasMatriculadas(id);

//            INSTANCIANDO O ESTUDANTE 
            Estudante e = new Estudante(id, nome, cpf, endereco, nome_curso, disciplinas_mat);
//
////            ADICIONANDO O ESTUDANTE A LISTA
            estudantes.add(e);
        }
//        ADICIONADO A LISTA A session
        session.setAttribute("ESTUDANTES", estudantes);

    }//FIM buscarEstudantes

    private String buscarNomeCurso(int id_curso) throws SQLException {
        String nome_curso = "";

        // Criar conexao
        conexao = ConexaoDatabase.getConnection();

        // Criar query
        query = "SELECT descricao FROM cursos WHERE id=?";

        //Criar statement
        st = conexao.prepareStatement(query);
        st.setInt(1, id_curso);

// Executar query
        ResultSet rs = st.executeQuery();

        // Atribuir o retorno ao request
        while (rs.next()) {
            nome_curso = rs.getString("descricao");
        }

        //Retornar o resultado
        return nome_curso;
    }

    private List<String> buscarDisciplinasMatriculadas(int id) throws SQLException {
        //Criar conexao
        conexao = ConexaoDatabase.getConnection();

        //Criar query
        query = "SELECT d.descricao FROM disciplinas_estudantes de "
                + "INNER JOIN estudantes e ON e.id = de.id_estudante "
                + "INNER JOIN disciplinas d ON d.id = de.id_disciplina "
                + "WHERE e.id = ?;";

        //Criar o statement
        st = conexao.prepareStatement(query);
        st.setInt(1, id);

        //Executar o statement
        ResultSet rs = st.executeQuery();
        List<String> disciplinas = new ArrayList<>();

        //Recuperar os resultados
        while (rs.next()) {
            disciplinas.add(rs.getString("descricao"));
            System.out.println(rs.getString("descricao"));
        }

        //retornar os resultados 
        return disciplinas;
    }

    private void carregarCatalogoDisciplinas(HttpSession session) throws SQLException {
        //Criar conexao
        conexao = ConexaoDatabase.getConnection();

        //Criar query
        query = "SELECT descricao FROM disciplinas";

        //Criar o statement        List<String> disciplinas = new ArrayList<>();
        st = conexao.prepareStatement(query);

        //Executar o statement
        ResultSet rs = st.executeQuery();

        //Recuperar os resultados
        List<String> catalogo_disciplinas = new ArrayList<>();

        while (rs.next()) {
            catalogo_disciplinas.add(rs.getString("descricao"));
            System.out.println(rs.getString("descricao"));
        }
        
        // Adicionar a session
        session.setAttribute("CATALOGO_DISCIPLINAS", catalogo_disciplinas);
    }

}
