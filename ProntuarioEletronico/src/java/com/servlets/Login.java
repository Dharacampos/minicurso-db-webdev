/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        RECUPERANDO A SESSAO 
        HttpSession session = request.getSession(false);
        
//        COLHENDO VALORES DO FORMULARIO
        String usuario = request.getParameter("usuario"); //USUARIO
        String senha = request.getParameter("senha");//SENHA
        
//        VERIFICANDO SE O VALOR DE USUARIO NAO ESTA VAZIO
        if(!usuario.equals("")){ // SE TEM UM VALOR VALIDO
//            ATRIBUINDO A VARIAVEL 'usuario' A SESSAO
            session.setAttribute("usuario", usuario);
//            REDIRECIONANDO PARA A PAGINA home.jsp
            response.sendRedirect("home.jsp");
        }else{
//            REDIRECIONANDO PARA A PAGINA erro.jsp
            response.sendRedirect("erro.jsp");
        }
    }
}
