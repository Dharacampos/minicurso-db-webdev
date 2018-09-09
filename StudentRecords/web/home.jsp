<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Home"></c:set>
<%@include file="inc/inc_logged_header.jsp"%>
<!--INICIO EDICAO PAGINA-->

<h2>Estudantes cadastrados</h2>

<br><br>
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
                    <form action="Atualizar" method="post" class="form-group" id="dados_estudantes">
                        <!--CAMPOS DE EDICAO DO ESTUDANTE-->
                        <div class="row">
                            <div class="col-md-1 form-group">
                                <label for="id">Id</label>
                                <p id="id" name="id">${estudante.id}</p>

                            </div>
                            <div class="col-md-5 form-group">
                                <label for="nome">Nome</label>
                                <p id="nome" name="nome">${estudante.nome}</p>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="curso">Curso</label>
                                <input class="form-control" type="text" id="curso" nome="curso" value="${estudante.curso}">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 form-group">
                                <label for="cpf">CPF</label>
                                <p id="cpf" name="cpf">${estudante.cpf}</p>
                            </div>
                            <div class="col-md-9 form-group">
                                <label for="endereco">Endereço</label>
                                <input class="form-control" type="text" id="endereco" nome="endereco" value="${estudante.endereco}">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label for="disciplinas">Disciplinas</label>
                                <div class="checkbox">
                                    <c:forEach items="${CATALOGO_DISCIPLINAS}" var="disc">
                                        <label>
                                            <input type="checkbox" value="${disc.key}"
                                                   <c:forEach items="${estudante.disciplinas_mat}" var="disc_matriculada">
                                                       ${disc.value==disc_matriculada.value ? "checked" : ""}
                                                   </c:forEach>>
                                            ${disc.value}
                                        </label>
                                        <br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" form="dados_estudantes" class="btn btn-primary">Salvar alterações</button>
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
                    Apagar os dados de <strong>${estudante.nome}</strong> permanentemente?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                    <button type="button" class="btn btn-primary">Sim, deletar</button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>


<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>