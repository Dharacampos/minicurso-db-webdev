<%-- 
    Document   : index
    Created on : 09/08/2018, 21:15:36
    Author     : paulo
--%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.ConexaoDatabase"%>


<% //CODIGO JAVA
    //RECOLHENDO DADOS DAS ESPECIALIDADES DO DB
    Connection conexao = ConexaoDatabase.getConnection();
    Statement st = conexao.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM especialidades");
    
    //CRIANDO DICIONARIO PARA ARMAZENAR O ID+ESPECIALIDADE
    Map<Integer, String> especialidades = new LinkedHashMap<Integer,String>();
    
    while(rs.next()){
        especialidades.put(Integer.parseInt(rs.getString("id")), rs.getString("especialidade"));
    }
    //ADICIONANDO AS ESPECIALIDADES À SESSION
    session.setAttribute("especialidades", especialidades);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--INSERINDO BIBLIOTECA TAGLIB-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--CRIANDO A VARIAVEL TITULO E ATRIBUINDO UM VALOR A ELA-->
<c:set var="titulo" value="ProEle UFU | Cadastrar" />

<!--INCLUINDO O CODIGO DO ARQUIVO inc_header_inicio.jsp-->
<%@include file="inc/inc_header_inicio.jsp" %>

<!--------------- INICIO DO CONTEUDO DA PAGINA-->
<p><span class="text-danger">(*) Campo obrigatorio</span></p>
<form action="Cadastrar" method="post"><!--INICIO DO FORMULARIO DE CADASTRO--> 

    <!--CAMPO NOME COMPLETO-->
    <label for="nome">Nome completo<span class="text-danger">*</span></label>
    <input type="text" name="nome" id="nome" placeholder="Ex.: João da Silva">
    <br><br>
    <!--CAMPO IDADE-->
    <label for="idade">Idade<span class="text-danger">*</span></label>
    <input type="number" name="idade" id="idade">
    <br><br>
    <!--CAMPO CRM-->
    <label for="crm">CRM<span class="text-danger">*</span></label>
    <input type="number" name="crm" id="crm">
    <br><br>
    <!--CAMPO CRM-->
    <label for="especialidade">Especialidades</label>
    <select name="especialidade" id="especialidade">
        <c:forEach items="${sessionScope.especialidades}" var="esp">
            <option value="${esp.getKey()}">${esp.getValue()}</option>
        </c:forEach>
    </select>
    <br><br>
    <!--CAMPO ENDERECO-->
    <label for="endereco">Endereço</label>
    <input type="text" name="endereco" id="endereco" placeholder="Av. João Naves de Ávila, 1228, Sta. Mônica - Uberlândia">
    <br><br>
    <!--CAMPO DO USUARIO-->
    <label for="nome">Entre com o seu usuário: <span class="text-danger">*</span></label>
    <input type="text" name="usuario" id="usuario" placeholder="exemplo@ufu.br">
    <br><br>
    <!--CAMPO DA SENHA-->
    <label for="senha">Entre com a senha: <span class="text-danger">*</span></label>
    <input type="password" name="senha" id="senha">
    <br><br>
    <!--BOTAO DE ENVIAR-->
    <input type="submit" name="entrar" id="entrar" value="Entrar"> 

</form><!--FIM DO FORMULARIO DE LOGIN--> 

<!--------------- FIM DO CONTEUDO DA PAGINA-->

<!--INCLUINDO O CODIGO DO ARQUIVO inc_footer_inicio.jsp-->
<%@include file="inc/inc_footer_inicio.jsp" %>