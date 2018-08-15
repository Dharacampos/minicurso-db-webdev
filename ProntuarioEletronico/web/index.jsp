<%-- 
    Document   : index
    Created on : 09/08/2018, 21:15:36
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <form action="Teste" method="post">
            <div>
                <div>
                    <div>
                        <label for="nome">Entre com o seu nome: </label>
                        <input class="form-control" type="text" name="nome">
                    </div>
                </div>
            </div>

            <input class="btn btn-primary " type="submit" value="Enviar">  
        </form>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
