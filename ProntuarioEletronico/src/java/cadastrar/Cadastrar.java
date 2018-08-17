/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastrar;

import com.database.ConexaoDatabase;
import com.seguranca.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
        Connection conexao = ConexaoDatabase.getConnection();
        Statement st;
        ResultSet rs;
        String query_usuarios, query_login, nome_completo, endereco, usuario,
                senha, senha_encriptada = null;
        int idade, especialidade, crm;

        System.out.println("INICIANDO SERVLET");
            
//        RECOLHENDO VALORES DO FORMULARIO | VERIFICANDO SE nome e crm NÃO SÃO VAZIOS
        if (!request.getParameter("nome").isEmpty() 
                && !request.getParameter("crm").isEmpty() 
                && !request.getParameter("idade").isEmpty()) {
            idade = Integer.parseInt(request.getParameter("idade"));
            // CHECANDO SE A IDADE NÃO E VAZIA E MAIOR QUE 18
            if (idade > 18) {
                nome_completo = request.getParameter("nome");//NOME   
                endereco = request.getParameter("endereco");
                usuario = request.getParameter("usuario");
                especialidade = Integer.parseInt(request.getParameter("especialidade"));
                crm = Integer.parseInt(request.getParameter("crm"));
                senha = request.getParameter("senha");
                senha_encriptada = encriptar_senha(senha);

                //Inserindo usuario na tabela usuarios
                query_usuarios = "INSERT INTO usuarios (nome_completo, idade, endereco, especialidade_id, crm) VALUES ("
                        + "'" + nome_completo + "',"
                        + idade + ","
                        + "'" + endereco + "',"
                        + "'" + especialidade + "',"
                        + "" + crm + ")";

                //Buscando o usuario na tabela usuarios
                query_login = "SELECT id FROM usuarios WHERE crm =" + crm;

                //Inserindousuario no 
                try {
                    st = conexao.createStatement();
                    st.executeUpdate(query_usuarios);
                    rs = st.executeQuery(query_login);
                    rs.next();
                    query_login = "INSERT INTO login (usuario_id, usuario, senha) VALUES ("
                            + "'" + rs.getString("id") + "'," 
                            + "'" + usuario + "',"
                            + "'" + senha_encriptada + "');";
                    st.executeUpdate(query_login);
                    System.out.println("[OK] USUÁRIO INSERIDO COM SUCESSO");
                } catch (SQLException ex) {
                    Logger.getLogger(Cadastrar.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                // TODO: RETORNAR ERRO IDADE
            }
        }

//
//        String senha_banco = "1234";
//        senha_encriptada = BCrypt.hashpw(senha, BCrypt.gensalt());
//        
//        if(BCrypt.checkpw(senha_banco, senha_encriptada)){
//            System.out.println("BATE");
//        }else{
//            System.out.println("NÃO NÃO");
//        }
    }

    private String encriptar_senha(String senha) {
        String senha_encriptada = BCrypt.hashpw(senha, BCrypt.gensalt());
        return senha_encriptada;
    }
}
