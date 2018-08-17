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

<div class="container">
    <form class="form-signin" action="Login" method="post">
        <h2 class="form-signin-heading">Login</h2>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" id="usuario" name="usuario" class="form-control" placeholder="Usuário" required autofocus>
        <label for="password" class="sr-only">Senha</label>
        <input type="password" name="senha" id="senha" class="form-control" placeholder="Senha" required>
        <div class="checkbox">
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="entrar" id="entrar">Sign in</button>
    </form>
</div> <!-- /container -->

<!--------------- FIM DO CONTEUDO DA PAGINA-->

<!--INCLUINDO O CODIGO DO ARQUIVO inc_footer_inicio.jsp-->
<%@include file="inc/inc_footer_inicio.jsp" %>
