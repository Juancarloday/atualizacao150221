<%-- 
    Document   : editarCategoria
    Created on : 13 de jan. de 2021, 08:28:40
    Author     : entra21
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <hr />
        <%
          int id = Integer.parseInt(request.getParameter("id"));
          Categoria c = new Categoria();
          if (id != 0){
              c = c.consultar(id);
          }    
        %>
        <form action="recebeEditaCategoria.jsp" method="POST">
            <label> Id  </label>
            <input type="text" name="id" 
                   readonly="true"
                   value="<%out.write(""+c.getId());%>"/>
            <br />
            <label> Descrição </label>
            <input type="text" name="descricao" 
                   value="<%out.write(c.getDescricao());%>" />
            <br />
            <label> Tipo </label>
            <input type="text" name="tipo" 
                   value="<%out.write(""+c.getTipo());%>" />

            
           
            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
