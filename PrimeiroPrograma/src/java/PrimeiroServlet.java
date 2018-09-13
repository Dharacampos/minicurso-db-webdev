/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class PrimeiroServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int variavel_int = 20;
        
        String variavel_string = "Nome: Paulo Camargos";
        
        System.out.println(variavel_int);
        System.out.println(variavel_string);
        
        if(variavel_int == 10){
            System.out.println("É 10!");
        }else{
            System.out.println("Não é 10, é " + variavel_int);
        }
        
        switch(variavel_int){
            case 1:
                System.out.println("É 1");
                break;
            case 2:
                System.out.println("É 2");
                break;
            case 3:
                System.out.println("É 3");
                break;
            case 20: 
                System.out.println("É 20");
                break;
            default:
                System.out.println("Nãe é nenhum deles!");       
        }
        
        Map<String, String> primeiro_map = new HashMap<>();
        primeiro_map.put("1","Paulo");
        primeiro_map.put("2","Bianca");
        primeiro_map.put("3","Daniel");
        
        System.out.println(primeiro_map.get("1"));
        System.out.println(primeiro_map.get("2"));
        System.out.println(primeiro_map.get("3"));

    }
    
    
}
