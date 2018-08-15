<%-- 
    Document   : funcionou
    Created on : 09/08/2018, 21:03:13
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estamos ainda testando</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>Seja muito bem-vindo, <% out.print(session.getAttribute("nome")); %></p>
    </body>
</html>
