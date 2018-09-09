<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="pagina_atual" value="cursos"></c:set>
<%@include file="inc/inc_logged_header.jsp"%>
<!--INICIO EDICAO PAGINA-->



<h2>Estudantes cadastrados</h2>

<br></br>
        <table class="table table-hover">
            <tr>
                <th>Id</th>
                <th>Nome</th> 
                <th>CPF</th>
                <th>Endereço</th>
                <th>Curso</th>
                <th>Ação</th>
            </tr>
            <c:forEach items="${ESTUDANTES}" var="estudante" >
                <tr>
                    <td>${estudante.id}</td>
                    <td>${estudante.nome}</td>
                    <td>${estudante.cpf}</td> 
                    <td>${estudante.endereco}</td>
                    <td>${estudante.curso}</td>
                    <th>
                        <div class="btn-group btn-group-xs" role="group">
                        <button type="button" class="btn btn-primary btn-sm">Editar</button>
                        <button type="button" class="btn btn-danger btn-sm">Deletar</button>
                        </div>
                    <th>
                        
                </tr>
            </c:forEach>
        </table>
    </div>
</div
</div>

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>