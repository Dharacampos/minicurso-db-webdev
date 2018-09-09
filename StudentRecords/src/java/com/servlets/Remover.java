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
import java.sql.SQLException;
import java.util.List;
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
public class Remover extends HttpServlet {

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
        // Recuperar id do estudante a ser removido
        int id_estudante = Integer.parseInt(request.getParameter("id_estudante"));

        try {
            // Criar conexao com DB
            Connection conexao = ConexaoDatabase.getConnection();

            // Criar query remocao estudante da tabela disciplinas_estudantes
            String query_disciplinas = "DELETE FROM disciplinas_estudantes WHERE id_estudante=?";

            // Criar statement
            PreparedStatement st = conexao.prepareStatement(query_disciplinas);
            st.setInt(1, id_estudante);
            
            // Executar query
            st.execute();
            
            // Criar query remocao estudante da tabela estudantes
            String query_estudante = "DELETE FROM estudantes WHERE id=?";

            // Criar statement
            st = conexao.prepareStatement(query_estudante);
            st.setInt(1, id_estudante);
            
            // Executar query
            st.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Remover.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConexaoDatabase.destroy();
        }

        //Remover estudante da session
        HttpSession session = request.getSession();
        List<Estudante> estudantes = (List<Estudante>) session.getAttribute("ESTUDANTES");
        int estudante_index = 0;
        for(Estudante e : estudantes){
            if(e.getId() == id_estudante){
                estudante_index = estudantes.indexOf(e);
                break;
            }
        }
        estudantes.remove(estudante_index);
        
        response.sendRedirect("home.jsp?success=true");
    }

}
