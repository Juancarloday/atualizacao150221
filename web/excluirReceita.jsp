<%-- 
    Document   : excluirReceita
    Created on : 12 de jan. de 2021, 09:50:14
    Author     : entra21
--%>

<%@page import="Modelos.Receita"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
          <h1>Excluir receita</h1>
         <hr/>
         <%
             int id = Integer.parseInt(request.getParameter("id"));
             Receita r = new Receita();
             if (id != 0) {
                 r = r.consultar(id);
                 if(r.excluir()) {
                     out.write("Receita excluída com sucesso");
                 } else {
                     out.write("Erro ao excluir receita");
                 }
             }
         %>
        <hr />
        <a href="consultaReceita.jsp">Consulta Receita</a>
             
    </body>
</html>
