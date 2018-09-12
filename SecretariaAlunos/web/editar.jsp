<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.ConexaoDatabase"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Editar"></c:set>
<%@include file="inc/inc_logged_header.jsp"%>

<!--CODIGO PARA LISTAS CURSOS E DISCIPLINAS NA BASE DE DADOS-->
<%
    // Criar conexão com o banco de dados

    // Criar query sql SELECT para cursos

    // Criar STATEMENT para cursos

    // Ordenar execucao do SQL e receber o conjunto de resultados para CURSOS

    // Salvando os resultados de rs_cursos (CURSOS) em uma variavel

    
    // --------- REPETIR O MESMO PROCESSO PARA DISCIPLINAS ---------------
    
    
    // Criar query sql SELECT para disciplinas

    // Criar STATEMENT para discipilinas

    // Ordenar execucao do SQL e receber o conjunto de resultados para DISCIPLINAS


    // Salvando os resultados de rs_disciplinas (DISCIPLINAS) em uma variavel

    
    // ---------- BUSCANDO ESTUDANTES NO BANCO DE DADOS -----------------
    // Criar query sql SELECT para estudantes

    // Criar STATEMENT para estudantes

    // Ordenar execucao do SQL e receber o conjunto de resultados para ESTUDANTES

    // Colocando as variaveis no escopo da pagina

%>

<!--INICIO EDICAO PAGINA-->


<h2>Estudantes cadastrados</h2>
<hr><br><br>

<c:if test="${param.deletado=='true'}" >
    <div class="alert alert-success text-center" role="alert">Remoção realizada com sucesso!</div>
</c:if>
<br>
<c:if test="${param.atualizado=='true'}" >
    <div class="alert alert-success text-center" role="alert">Atualização realizada com sucesso!</div>
</c:if>

<table class="table table-hover">
    <tr>
        <th>Id</th>
        <th>Nome</th> 
        <th>CPF</th>
        <th>Endereço</th>
        <th>Curso</th>
        <th>Ação</th>
    </tr>
    <% while (rs_estudantes.next()) {%>

    <tr>
        <td><%= rs_estudantes.getString("id")%></td>
        <td><%= rs_estudantes.getString("nome")%></td>
        <td><%= rs_estudantes.getString("cpf")%></td>
        <td><%= rs_estudantes.getString("endereco")%></td>
        <td><%= rs_estudantes.getString("id_curso")%></td>
        <th>
            <div class="btn-group btn-group-xs" role="group">
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_editar<%= rs_estudantes.getString("id")%>">Editar</button>
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal_deletar<%= rs_estudantes.getString("id")%>">Deletar</button>
            </div>
        <th>
    </tr>
    <% } // FIM DO WHILE
        rs_estudantes.beforeFirst();
    %>
</table>
</div>

<% while (rs_estudantes.next()) {%>
<!-- Modal EDITAR -->
<div class="modal fade bs-example-modal-lg" id="modal_editar<%= rs_estudantes.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="modal_editarLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal_editarLabel">Editar estudante</h4>
            </div>
            <div class="modal-body">
                <form action="Myservlet" method="post" class="form-group" id="dados_estudantes<%= rs_estudantes.getString("id")%>">
                    <!--CAMPOS DE EDICAO DO ESTUDANTE-->
                    <div class="row">
                        <div class="col-md-1 form-group">
                            <label for="id">Id</label>
                            <input class="form-control" type="text" id="id" name="id" value="<%= rs_estudantes.getString("id")%>" readonly="">
                        </div>
                        <div class="col-md-5 form-group">
                            <label for="nome">Nome</label>
                            <input class="form-control" type="text" id="nome" name="nome" value="<%= rs_estudantes.getString("nome")%>" readonly="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="curso">Curso</label>
                            <% // Codigo para encontrar a descricao do curso  do estudante 
                                // baseado no Id do curso

                                // Sql para buscar o estudante
                                String sql_curso_estudante = "SELECT descricao FROM cursos WHERE id=?";

                                // Preparando o statement
                                PreparedStatement stmt_curso_estudante = conexao.prepareStatement(sql_curso_estudante);
                                stmt_curso_estudante.setInt(1, Integer.parseInt(rs_estudantes.getString("id_curso")));

                                // Recebendo o result_set
                                ResultSet rs_curso_estudante = stmt_curso_estudante.executeQuery();

                                // Salvando a descricao do curso em uma variavel 
                                String descricao_curso = "";
                                while (rs_curso_estudante.next()) {
                                    descricao_curso = rs_curso_estudante.getString("descricao");
                                }
                            %>
                            <input class="form-control" type="text" id="curso" nome="curso" value="<%=descricao_curso%>" readonly="">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 form-group">
                            <label for="cpf">CPF</label>
                            <input class="form-control" type="text" id="cpf" name="cpf" value="<%= rs_estudantes.getString("cpf")%>" readonly="">
                        </div>
                        <div class="col-md-9 form-group">
                            <label for="endereco">Endereço</label>
                            <input class="form-control" type="text" id="endereco" name="endereco" value="<%= rs_estudantes.getString("endereco")%>">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label for="disciplinas">Disciplinas</label>
                            <div class="checkbox">
                                <% // Codigo para encontrar as disciplinas que o estudante curso
                                    // baseado no Id do curso

                                    // Sql para buscar o estudante
                                    String sql_disc_estudante = "SELECT d.id, d.descricao FROM disciplinas_estudantes de "
                                            + "INNER JOIN estudantes e ON e.id = de.id_estudante "
                                            + "INNER JOIN disciplinas d ON d.id = de.id_disciplina "
                                            + "WHERE e.id = ?;";

                                    // Preparando o statement
                                    PreparedStatement stmt_disc_estudante = conexao.prepareStatement(sql_disc_estudante);
                                    stmt_disc_estudante.setInt(1, Integer.parseInt(rs_estudantes.getString("id")));

                                    // Recebendo o result_set
                                    ResultSet rs_disc_estudante = stmt_disc_estudante.executeQuery();

                                    // Salvando a descricao do curso em uma variavel 
                                    Map<String, String> disciplinas_matriculadas = new HashMap<>();
                                    while (rs_disc_estudante.next()) {
                                        disciplinas_matriculadas.put(rs_disc_estudante.getString("id"), rs_disc_estudante.getString("descricao"));
                                    }
                                    System.out.println(disciplinas_matriculadas);
                                    // Configurando as disciplinas como pageContext
                                    pageContext.setAttribute("disciplinas_mat", disciplinas_matriculadas);
                                %>

                                <c:forEach items="${disciplinas}" var="disciplina">
                                    <label>
                                        <input type="checkbox" name="disciplinas" id="disciplinas" value="${disciplina.key}"
                                               <c:forEach items="${disciplinas_mat}" var="disc_matriculada">
                                                   ${disciplina.key==disc_matriculada.key ? "checked" : ""}
                                               </c:forEach>>
                                        ${disciplina.value}
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
                <button type="submit" form="dados_estudantes<%= rs_estudantes.getString("id")%>" class="btn btn-primary" id="botao_submit" name="botao_submit" value="Atualizar">Atualizar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal DELETAR -->
<div class="modal fade" id="modal_deletar<%= rs_estudantes.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="modal_deletarLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal_deletarLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                Apagar os dados de <strong><%= rs_estudantes.getString("nome")%></strong> permanentemente?
                <form action="Myservlet" method="post" id="form_remover<%= rs_estudantes.getString("id")%>" name="form_remover" >
                    <input type="text"  hidden="" id="id_estudante" name="id_estudante" value="<%= rs_estudantes.getString("id")%>">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                <button type="submit" class="btn btn-primary" form="form_remover<%= rs_estudantes.getString("id")%>" id="botao_submit" name="botao_submit" value="Deletar">Deletar</button>
            </div>
        </div>
    </div>
</div>
<% }%>

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>