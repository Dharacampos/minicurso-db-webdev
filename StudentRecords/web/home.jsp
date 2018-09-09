<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="inc/inc_header.jsp"%>
<!--INICIO EDICAO PAGINA-->

<h1>Estudantes cadastrados</h1>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <table class="table table-hover">
                <tr>
                    <th>Id</th>
                    <th>Nome</th> 
                    <th>CPF</th>
                    <th>Endereço</th>
                    <th>Curso</th>
                </tr>
                <c:forEach items="${sessionScope.ESTUDANTES}" var="estudante" >
                    <tr>
                        <td>${estudante.id}</td>
                        <td>${estudante.nome}</td>
                        <td>${estudante.cpf}</td> 
                        <td>${estudante.endereco}</td>
                        <td>${estudante.curso}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <col-md-4>
            <button class="btn btn-primary">Atualizar</button>
        </col-md-4>
    </div>    
</div>


<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>