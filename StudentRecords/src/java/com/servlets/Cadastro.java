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
import java.util.ArrayList;
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
        String curso_nome = ((Map<Integer, String>) session.getAttribute("CATALOGO_CURSOS")).get(curso_id);
        String endereco = request.getParameter("endereco");
        System.out.println(endereco);
        String[] disciplinas_matriculadas =  request.getParameterValues("disciplinas_mat");
        List<String> disciplinas_mat = new ArrayList<>();
        for(String e : disciplinas_matriculadas){
            System.out.println(e);
            disciplinas_mat.add(e);
        }
        
        // Instanciar objeto Estudante
        Estudante e = new Estudante(nome, cpf, endereco, curso_nome, disciplinas_mat);
        
        // Acicionar objeto a lista de estudante
        List<Estudante> ESTUDANTES = (List<Estudante>) session.getAttribute("ESTUDANTES");
        ESTUDANTES.add(e);
        
        // Criar conexao com o BD
        Connection conexao = ConexaoDatabase.getConnection();
        
        // Criar a query
        String query = "INSERT INTO estudantes(nome, cpf, endereco, id_curso) "
                + "VALUES(?,?,?,?)";
        
        try {
            // Criar o statement
            PreparedStatement st = conexao.prepareStatement(query);
            st.setString(1, nome);
            st.setString(2, cpf);
            st.setString(3, endereco);
            st.setInt(4, curso_id);
            
            st.execute();
            // Executar o statement
            // Redirecionar para a pagina de cadastro com msg de sucesso
        } catch (SQLException ex) {
            Logger.getLogger(Cadastro.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
