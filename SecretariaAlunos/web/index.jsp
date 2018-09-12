<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.ConexaoDatabase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Cadastrar"></c:set>
<%@include file="inc/inc_logged_header.jsp"%>

<!--CODIGO PARA LISTAR CURSOS E DISCIPLINAS NA BASE DE DADOS-->
<% 
    // Criar conexão com o banco de dados
    
    // Criar query sql SELECT para cursos
    
    // Criar STATEMENT para cursos
    
    // Ordenar execucao do SQL e receber o conjunto de resultados para CURSOS
    
    // Salvando os resultados de rs_cursos (CURSOS) em uma lista variavel

    
    // ---------- REPETINDO O MESMO PROCESSO PARA DISCIPLINAS --------------
    
    
    // Criar query sql SELECT para disciplinas
    
    // Criar STATEMENT para discipilinas

    // Ordenar execucao do SQL e receber o conjunto de resultados para DISCIPLINAS
    
    // Salvando os resultados de rs_disciplinas (DISCIPLINAS) em uma variavel

    
    // Colocando as list no escopo da pagina (pageContext)

%>

<!--INICIO EDICAO PAGINA-->


<h2>Cadastrar estudante</h2>
<hr><br><br>

<!--MENSAGEM DE SUCESSO APÓS CADASTRO BEM-SUCEDIDO-->
<c:if test="${param.sucesso=='true'}" >
    <div class="alert alert-success text-center" role="alert">Cadastro realizado com sucesso!</div>
</c:if>


<!-- FORMULÁRIO DE CADASTRO DO ESTUDANTE -->
<form action="Myservlet" method="post" class="form-group" id="dados_estudantes">
    
    <div class="row">
       
        <div class="col-md-6 form-group">
            <label for="nome">Nome</label>
            <input class="form-control" id="nome" name="nome">
        </div> 
       
        <div class="col-md-6 form-group">
            <label for="curso">Curso</label>
            <select class="form-control" name="curso" id="curso">
                <c:forEach items="${cursos}" var="curso">
                    <option value="${curso.key}">${curso.value}</option>
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
                <c:forEach items="${disciplinas}" var="disc">
                    <label>
                        <input type="checkbox" name="disciplinas" id="disciplinas" value="${disc.key}" > ${disc.value}
                    </label>
                    <br>
                </c:forEach>
            </div>
        </div>
    </div>
    <br>
    <button type="submit" class="btn btn-success btn-block" value="Cadastrar" id="botao_submit" name="botao_submit">Cadastrar</button>
</form>

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>