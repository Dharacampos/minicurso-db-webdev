<%-- 
    Document   : home
    Created on : 03/09/2018, 09:42:24
    Author     : Dhara Campos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Cadastro"></c:set>
<%@include file="inc/inc_logged_header.jsp"%>
<!--INICIO EDICAO PAGINA-->

<h2>Cadastrar estudante</h2>

<c:if test="${param.success=='true'}" >
    <div class="alert alert-success text-center" role="alert">Cadastro realizado com sucesso!</div>
</c:if>
   

<form action="Cadastro" method="post" class="form-group" id="dados_estudantes">
    <!--CAMPOS DE EDICAO DO ESTUDANTE-->
    <div class="row">
        <div class="col-md-6 form-group">
            <label for="nome">Nome</label>
            <input class="form-control" id="nome" name="nome">
        </div>
        <div class="col-md-6 form-group">
            <label for="curso">Curso</label>
<!--            <input class="form-control" type="text" id="curso" nome="curso" >-->
<select class="form-control" name="curso" id="curso">
            <c:forEach items="${CATALOGO_CURSOS}" var="curso">
                <option value="${curso.key}">${curso.value} </option>
            </c:forEach>
</select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 form-group">
            <label for="cpf">CPF</label>
                        <input class="form-control" type="text" id="cpf" name="cpf">
        </div>
        
        <div class="col-md-9 form-group">
            <label for="endereco">Endereço</label>
            <input class="form-control" type="text" id="endereco" name="endereco">
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label for="disciplinas">Disciplinas</label>
            <div class="checkbox" >
                <c:forEach items="${CATALOGO_DISCIPLINAS}" var="disc">
                    <label>
                        <input type="checkbox" name="disciplinas_mat" id="disciplinas_mat" value="${disc.key}" > ${disc.value}
                    </label>
                    <br>
                </c:forEach>
            </div>
        </div>
    </div>
        <br>
        <button type="submit" class="btn btn-success btn-block">Cadastrar</button>
</form>

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>