/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.database.ConexaoDatabase;
import com.models.Estudante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
 * Servlet para cadastro de estudante no banco de dados
 *
 * @author paulo
 */
public class Cadastro extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Recuperando a session
        HttpSession session = request.getSession();

        // Recuperar valores do formulario
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        int curso_id = Integer.parseInt(request.getParameter("curso"));
        String curso_descricao = ((Map<Integer, String>) session.getAttribute("CATALOGO_CURSOS")).get(curso_id);
        String endereco = request.getParameter("endereco");
        System.out.println(endereco);
        String[] disciplinas_matriculadas = request.getParameterValues("disciplinas_mat");
        Map<Integer, String> disciplinas_mat = new HashMap<>();
        for (String e : disciplinas_matriculadas) {
            Integer disciplina_id = Integer.parseInt(e);
            String disciplina_descricao = ((Map<Integer, String>) session.getAttribute("CATALOGO_DISCIPLINAS")).get(disciplina_id);
            disciplinas_mat.put(disciplina_id, disciplina_descricao);
        }

        // Instanciar objeto Estudante
        Estudante e = new Estudante(nome, cpf, endereco, curso_descricao, disciplinas_mat);

        // Acicionar objeto a lista de estudante
        List<Estudante> ESTUDANTES = (List<Estudante>) session.getAttribute("ESTUDANTES");
        ESTUDANTES.add(e);

        // Criar conexao com o BD
        Connection conexao = ConexaoDatabase.getConnection();

        // Criar a query para inserção estudante no BD
        String query = "INSERT INTO estudantes(nome, cpf, endereco, id_curso) "
                + "VALUES(?,?,?,?)";
        try {
            // Criar o statement
            PreparedStatement st = conexao.prepareStatement(query);
            st.setString(1, nome);
            st.setString(2, cpf);
            st.setString(3, endereco);
            st.setInt(4, curso_id);
            // Executar o statement
            st.execute();
            
            // Buscando o Id do estudante no banco de dados
            String query_id_estudante = "SELECT id FROM estudantes WHERE cpf=?";
            st = conexao.prepareStatement(query_id_estudante);
            st.setString(1, e.getCpf());
            ResultSet rs = st.executeQuery();
            int id_estudante;
            while (rs.next()) {
                id_estudante = rs.getInt("id");
                e.setId(id_estudante);
            }
            
            // Inserindo a relacao estudante x disciplina na tabela estudantes x disciplinas
            inserirDisciplinasEstudante(e, disciplinas_mat, session);
            
            // Redirecionar para a pagina de cadastro com msg de sucesso
            response.sendRedirect("cadastro.jsp?success=true");
        } catch (SQLException ex) {
            Logger.getLogger(Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConexaoDatabase.destroy();
        }  
    }

    private void inserirDisciplinasEstudante(Estudante e, Map<Integer, String> disciplinas_mat, HttpSession session) throws SQLException {
        // Criar conexao
        Connection conexao = ConexaoDatabase.getConnection();
        PreparedStatement st;
        ResultSet rs;

        //Inserir relacao disciplina X estudante no BD
        for (Map.Entry<Integer, String> entry : disciplinas_mat.entrySet()) {
            Integer id_disciplina = entry.getKey();
            
            String query_disciplinas = "INSERT INTO disciplinas_estudantes(id_estudante, id_disciplina) VALUES(?,?)";
            st = conexao.prepareStatement(query_disciplinas);
            st.setInt(1, e.getId());
            st.setInt(2, id_disciplina);
            st.execute();
        }
    }
}

