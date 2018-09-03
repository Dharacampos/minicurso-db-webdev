<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="inc/inc_header.jsp"%>
<!--INICIO EDICAO PAGINA-->

<h1>Estudantes no PET</h1>

<ol>
    <!--laço subst i++, ja entende o tamanho da lista-->
    <c:forEach items="${ESTUDANTES}" var="estudante" >
        <li>${estudante}</li>
        </c:forEach>

</ol>
<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>