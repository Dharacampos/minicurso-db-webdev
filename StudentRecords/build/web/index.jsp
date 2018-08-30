
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="inc/inc_header.jsp"%>
<!--INICIO EDICAO PAGINA-->

<h1>Estudates no PET</h1>

<ol>
<c:forEach items="${ESTUDANTES}" var="estudante" >
    <li>${estudante}</li>
</c:forEach>
</ol>

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>