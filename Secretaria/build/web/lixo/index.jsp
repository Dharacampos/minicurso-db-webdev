<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="titulo" value="Entrar" />
<%@include file="inc/inc_logged_header.jsp"%>

<!--EXEMPLO DE JAVASCRIPT-->
<!--<script>
    link = document.createElement('link');
    link.href = 'css/signin.css';
    link.rel = 'stylesheet';
    document.getElementsByTagName('head')[0].appendChild(link);
</script>-->

<div class="container">
    <div class="row">
        <form class="form-signin" action="Entrar" method="post">
            <h2 class="form-signin-heading">Login</h2>
            <label for="Email" class="sr-only">Usuário</label>
            <input type="email" id="usuario" name="usuario" class="form-control" placeholder="Email" required autofocus>
            <label for="Password" class="sr-only">Senha</label>
            <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
            <div class="checkbox">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
        </form>
    </div>
</div> <!-- /container -->

<!--FIM EDICAO PAGINA-->
<%@include file="inc/inc_footer.jsp"%>