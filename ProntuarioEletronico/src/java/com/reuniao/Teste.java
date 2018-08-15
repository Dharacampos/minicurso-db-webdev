/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.reuniao;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo
 */
@WebServlet(name = "Login")
public class Teste extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
   
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session  = request.getSession(false);
        String nome = request.getParameter("nome");
        
        System.out.println("Seja muito bem-vindo, " + nome ) ;
        session.setAttribute("nome", nome);
        response.sendRedirect("funcionou.jsp");    
    }
}
