<%-- 
    Document   : index
    Created on : 09/08/2018, 21:15:36
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--INSERINDO BIBLIOTECA TAGLIB-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--CRIANDO A VARIAVEL TITULO E ATRIBUINDO UM VALOR A ELA-->
<c:set var="titulo" value="Erro | ProEle UFU" />

<!--INCLUINDO O CODIGO DO ARQUIVO inc_header_inicio.jsp-->
<%@include file="inc/inc_header_inicio.jsp" %>

<!--------------- INICIO DO CONTEUDO DA PAGINA-->

<h1>ERRO! </h1>

<h1>USUÁRIO E/OU SENHA INCORRETOS. TENTE NOVAMENTE!</h1>

<!--------------- FIM DO CONTEUDO DA PAGINA-->

<!--INCLUINDO O CODIGO DO ARQUIVO inc_footer_inicio.jsp-->
<%@include file="inc/inc_footer_inicio.jsp" %>