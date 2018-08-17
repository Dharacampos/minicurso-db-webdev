/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastrar;

import com.seguranca.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class Cadastrar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
//        DECLARANDO VARIAVEIS
        String nome_completo, endereco, usuario, senha, senha_encriptada = null;
        int idade;
         MessageDigest md;

//        RECOLHENDO VALORES DO FORMULARIO
        nome_completo = request.getParameter("nome");
        if(!request.getParameter("idade").equals(""))
            idade = Integer.parseInt(request.getParameter("idade"));
        endereco = request.getParameter("endereco");
        usuario = request.getParameter("usuario");
        senha = request.getParameter("senha");

        String senha_banco = "1234";
        senha_encriptada = BCrypt.hashpw(senha, BCrypt.gensalt());
        
        if(BCrypt.checkpw(senha_banco, senha_encriptada)){
            System.out.println("BATE");
        }else{
            System.out.println("NÃO NÃO");
        }
        

    }
}
