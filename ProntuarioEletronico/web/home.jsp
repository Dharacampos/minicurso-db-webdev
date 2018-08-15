<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Home | ProEle UFU" />
<%@include file="inc/inc_header_logged.jsp" %>
<!--INICIO DO CONTEUDO DA PAGINA-->

<h1>Seja muito bem-vindo <c:out value="${sessionScope.usuario}" /></h1>

<!--FIM DO CONTEUDO DA PAGINA-->
<%@include file="inc/inc_footer_logged.jsp" %>


