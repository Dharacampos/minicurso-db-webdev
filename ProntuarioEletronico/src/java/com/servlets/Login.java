/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.database.ConexaoDatabase;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet responsavel por verificar se o usuário e senha inseridos no
 * formulário correspondem com aqueles cadastrados no banco de dados
 *
 * @author paulo
 */
public class Login extends HttpServlet {

    /**
     * Metodo responsavel por receber os request advindos do cliente na forma de
     * POST
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        DECLARANDO VARIAVEIS
        Connection conexao;
        HttpSession session;
        String usuario_form;
        String senha_form;
        String query;
        Statement st;
        ResultSet rs = null;

//        VARIAVEL CONTENDO A CONEXAO COM O BD
        conexao = ConexaoDatabase.getConnection();

//        RECUPERANDO A SESSAO 
        session = request.getSession(false);

//        COLHENDO VALORES DO FORMULARIO
        usuario_form = request.getParameter("usuario"); //USUARIO
        senha_form = request.getParameter("senha");

//        QUERY QUE SERA EXECUTADA NO BANCO DE DADOS
        query = "SELECT usuario, senha FROM users WHERE usuario='"
                + usuario_form + "'";

//        CONSULTANDO O BANCO DE DADOS
        try {
//        CRIANDO UM STATEMENT (st) E UMA CONJUNTO DE RESULTADOS 
//          (rs) PARA A CONEXAO
            if(conexao.isClosed()) System.out.println("FECHADA ------------------WA");
            else System.out.println("ABERTA ------------------------");
            st = conexao.createStatement();
            rs = st.executeQuery(query);

//            PERCORRENDO O rs
            while (rs.next()) { //        VERIFICANDO SE O VALOR DE USUARIO NAO ESTA VAZIO
                //SENHA E USUARIO CADASTRADO NO BANCO
                String senha_banco = rs.getString("senha");
                String usuario_banco = rs.getString("usuario");
                
                if (usuario_banco != null // CHECANDO SE OS VALORES BATEM COM DB
                        && usuario_banco.equals(usuario_form)
                        && senha_banco.equals(senha_form)) {
//            ATRIBUINDO A VARIAVEL 'usuario' A SESSAO
                    session.setAttribute("usuario", usuario_form);
//            REDIRECIONANDO PARA A PAGINA home.jsp
                    response.sendRedirect("home.jsp");
                } else {
//            REDIRECIONANDO PARA A PAGINA erro.jsp
                    response.sendRedirect("erro.jsp");
                }
            }
        } catch (SQLException ex) {
            System.out.println("[ERRO] Erro ao criar Statement ou ResultSet");
            System.out.println(ex);
        }

    }
}
