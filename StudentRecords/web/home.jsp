<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="pagina_atual" value="estudantes"></c:set>
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
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_editar${estudante.id}">Editar</button>
                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal_deletar${estudante.id}">Deletar</button>
                </div>
            <th>

        </tr>
    </c:forEach>
</table>
</div>
</div
</div>

<c:forEach items="${ESTUDANTES}" var="estudante" >
    <!-- Modal EDITAR -->
    <div class="modal fade bs-example-modal-lg" id="modal_editar${estudante.id}" tabindex="-1" role="dialog" aria-labelledby="modal_editarLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="modal_editarLabel">Editar estudante</h4>
                </div>
                <div class="modal-body">
                    <!--CAMPOS DE EDICAO DO ESTUDANTE-->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Salvar alterações</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal DELETAR -->
    <div class="modal fade" id="modal_deletar${estudante.id}" tabindex="-1" role="dialog" aria-labelledby="modal_deletarLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="modal_deletarLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>


<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>