<%-- 
    Document   : editarReceita
    Created on : 12 de jan. de 2021, 10:18:49
    Author     : entra21
--%>

<%@page import="Modelos.Receita"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira </title>
    </head>
    <body>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Editar Receita</h1>
        <hr />
        <%
          int id = Integer.parseInt(request.getParameter("id"));
          Receita r = new Receita();
          if (id != 0){
              r = r.consultar(id);
          }    
        %>
        <form action="recebeEditaReceita.jsp" method="POST">
            <label> Id  </label>
            <input type="text" name="id" 
                   readonly="true"
                   value="<%out.write(""+r.getId());%>"/>
            <br />
            <label> Descrição </label>
            <input type="text" name="descricao" 
                   value="<%out.write(r.getDescricao());%>" />
            <br />
            <label> Data </label>
            <input type="text" name="data" 
                   value="<%out.write(""+r.getData());%>" />
            <br />
            <label> Valor </label>
            <input type="text" name="valor" 
                   value="<%out.write(""+r.getValor());%>" />
            
           
            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
