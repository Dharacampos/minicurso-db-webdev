<%-- 
    Document   : index
    Created on : 09/08/2018, 21:15:36
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--INSERINDO BIBLIOTECA TAGLIB-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--CRIANDO A VARIAVEL TITULO E ATRIBUINDO UM VALOR A ELA-->
<c:set var="titulo" value="ProEle UFU" />

<!--INCLUINDO O CODIGO DO ARQUIVO inc_header_inicio.jsp-->
<%@include file="inc/inc_header_inicio.jsp" %>

<!--------------- INICIO DO CONTEUDO DA PAGINA-->


<form action="Login" method="post"><!--INICIO DO FORMULARIO DE LOGIN--> 

    <!--CAMPO DO USUARIO-->
    <label for="nome">Entre com o seu usuário: </label>
    <input type="text" name="usuario" id="usuario" placeholder="joao@ufu.br">

    <!--CAMPO DA SENHA-->
    <label for="senha">Entre com a senha: </label>
    <input type="password" name="senha" id="senha">

    <!--BOTAO DE ENVIAR-->
    <input type="submit" name="entrar" id="entrar" value="Entrar"> 

</form><!--FIM DO FORMULARIO DE LOGIN--> 

<!--------------- FIM DO CONTEUDO DA PAGINA-->

<!--INCLUINDO O CODIGO DO ARQUIVO inc_footer_inicio.jsp-->
<%@include file="inc/inc_footer_inicio.jsp" %>
                          <!--Estruturação do site-->
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        
    </head>
    <body>
        <div>
            
        </div>
    </body>
</html>