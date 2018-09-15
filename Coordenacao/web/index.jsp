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
    Connection conexao = ConexaoDatabase.getConnection();
    
    // Criar query sql SELECT para cursos
    String sql_cursos = "SELECT * FROM cursos;";    
    
    // Criar query sql SELECT para disciplinas
    String sql_disciplinas = "SELECT * FROM disciplinas;";
    
    // Criar STATEMENT para cursos
    PreparedStatement stmt_cursos = conexao.prepareStatement(sql_cursos);
    
    // Criar STATEMENT para discipilinas
    PreparedStatement stmt_disciplinas = conexao.prepareStatement(sql_disciplinas);
    
    // Ordenar execucao do SQL e receber o conjunto de resultados para CURSOS
    ResultSet rs_cursos = stmt_cursos.executeQuery();

    // Ordenar execucao do SQL e receber o conjunto de resultados para DISCIPLINAS
    ResultSet rs_disciplinas = stmt_disciplinas.executeQuery();
    
    // Salvando os resultados de rs_cursos (CURSOS) em uma variavel
    Map<String, String> cursos = new HashMap<>(); // criando a variavel 'cursos'
    while(rs_cursos.next()){ // iterando sobre a lista de resultados de rs_cursos
        String id_curso = rs_cursos.getString("id"); // Salvando o id do curso
        String descricao_curso = rs_cursos.getString("descricao"); // Salvando a descricao
        cursos.put(id_curso, descricao_curso); // adicionado o id e a descr. do curso a variavel
    }
    
    // Salvando os resultados de rs_disciplinas (DISCIPLINAS) em uma variavel
    Map<String, String> disciplinas = new HashMap<>(); // criando a variavel 'disciplinas'
    while(rs_disciplinas.next()){ // iterando sobre a lista de resultados de rs_disciplinas
        String id_disciplinas = rs_disciplinas.getString("id"); // Salvando o id da disciplina
        String descricao_disciplinas = rs_disciplinas.getString("descricao");// Salvando a descricao
        disciplinas.put(id_disciplinas, descricao_disciplinas);  // adicionado o id e a descr. da disciplina a variavel
    }  
    
    // Colocando as variaveis no escopo da pagina
    pageContext.setAttribute("cursos", cursos);
    pageContext.setAttribute("disciplinas", disciplinas);
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