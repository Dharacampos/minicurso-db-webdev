<%-- 
    Document   : inc_logged_header
    Created on : 09/09/2018, 11:50:44
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="Cadastre e tenha controle dos seus estudantes com este aplicativo web">
        <meta name="author" content="Universidade Federal de Uberlândia">

        <title>${titulo}</title>


        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet">

        <link href="css/main.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.jsp">Student Manager</a>
                </div>

                <%--<c:if test="${sessionScope.ESTUDANTES != null}">--%>
<!--                     Collect the nav links, forms, and other content for toggling 
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="${titulo=="Home" ? "active" : ""}"><a href="home.jsp">Listar</a></li>
                            <li class="${titulo=="Cadastro" ? "active" : ""}"><a href="cadastro.jsp">Cadastrar</a></li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Sair">Sair</a></li>
                        </ul>
                    </div> /.navbar-collapse -->
                <%--</c:if>--%>
            </div><!-- /.container-fluid -->
        </nav>

        <div class="container">
