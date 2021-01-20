<%-- 
    Document   : excluirCategoria
    Created on : 12 de jan. de 2021, 09:34:17
    Author     : entra21
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
                 <h1>Excluir Categoria</h1>
         <hr/>
         <%
             int id = Integer.parseInt(request.getParameter("id"));
             Categoria c = new Categoria();
             if (id != 0) {
                 c = c.consultar(id);
                 if(c.excluir()) {
                     out.write("Categoria excluída com sucesso");
                 } else {
                     out.write("Erro ao excluir categoria");
                 }
             }
         %>
        <hr />
        <a href="consultaCategoria.jsp">Consulta Categoria</a>
      
    </body>
</html>
