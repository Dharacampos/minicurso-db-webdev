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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo
 */
public class Atualizar extends HttpServlet {

    private Connection conexao;
    private PreparedStatement st;

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
        
        // Recuperar os valores do formulario
        int estudante_id = Integer.parseInt(request.getParameter("id"));
        String endereco = request.getParameter("endereco");
        
        //Recuperando disciplinas marcadas no formulario
        String[] disciplinas_matriculadas = request.getParameterValues("disciplinas_mat");
        Map<Integer, String> disciplinas_mat = new HashMap<>();
        if (disciplinas_matriculadas != null) {
            for (String e : disciplinas_matriculadas) {
                Integer disciplina_id = Integer.parseInt(e);
                String disciplina_descricao = ((Map<Integer, String>) session.getAttribute("CATALOGO_DISCIPLINAS")).get(disciplina_id);
                disciplinas_mat.put(disciplina_id, disciplina_descricao);
            }
        }
        try {
            // Criar conexao como BD
            conexao = ConexaoDatabase.getConnection();

            //Criar a query para atualizar o estudante
            String query = "UPDATE estudantes SET endereco=? WHERE id=?";

            // Criar o st
            st = conexao.prepareStatement(query);
            st.setString(1, endereco);
            st.setInt(2, estudante_id);

            // Executar o st
            st.execute();

            // Atualizar disciplinas na tabela disciplinas_estudantes
            atualizarDisciplinas(session, estudante_id, disciplinas_mat);

            // Recuperar o estudante e a lista de cursos da session
            List<Estudante> estudantes = (List<Estudante>) session.getAttribute("ESTUDANTES");
            Map<Integer, String> cursos = (Map<Integer, String>) session.getAttribute("CATALOGO_CURSOS");
            Estudante e_atual = null;
            
            // Atualizar a session
            for (Estudante e : estudantes) {
                if (e.getId() == estudante_id) {
                    e_atual = e;
                    break;
                }
            }
            e_atual.setDisciplinas_mat(disciplinas_mat);
            e_atual.setEndereco(endereco);

            // Redirecionar a pagina
            response.sendRedirect("home.jsp?update=true");
        } catch (SQLException ex) {
            Logger.getLogger(Atualizar.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConexaoDatabase.destroy();
        }
    }

    private void atualizarDisciplinas(HttpSession session, int estudante_id, Map<Integer, String> disciplinas_mat) throws SQLException {
        // Criar conexao
        conexao = ConexaoDatabase.getConnection();

        // Criar query para deletar todas disciplinas
        String query = "DELETE FROM disciplinas_estudantes WHERE id_estudante=?";

        // Criar statement
        st = conexao.prepareStatement(query);
        st.setInt(1, estudante_id);

        // Executar statement
        st.execute();

        if (!disciplinas_mat.isEmpty()) {
            // Loop sobre todas as disciplinas selecionadas no form
            for (Map.Entry<Integer, String> entry : disciplinas_mat.entrySet()) {
                // Criar query para inserir as novas disciplinas
                query = "INSERT INTO disciplinas_estudantes(id_disciplina, id_estudante)"
                        + "VALUES(?,?)";

                // Criar statemet
                st = conexao.prepareStatement(query);
                st.setInt(1, entry.getKey());
                st.setInt(2, estudante_id);
                // Executar statement

                st.execute();
            }
        }
    }
}
