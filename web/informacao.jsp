<%-- 
    Document   : informacao
    Created on : 13 de jan. de 2021, 11:13:15
    Author     : entra21
--%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        div{
            display: block;
            width: 300px;
            margin:auto;
            margin-top: 100px;
        }
        p{
            color: blue;
            font-size: 30px;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
    <div>
        <a href="index.html"><img src="imagens/home.png" width="100px" height="100px"/></a> 
        
        <p>
            <%
                out.write(request.getParameter("msg"));
            %>
        </p> 
    </div>  
    </body>
</html>
