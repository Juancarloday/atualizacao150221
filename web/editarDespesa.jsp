<%-- 
    Document   : editarDespesa
    Created on : 12 de jan. de 2021, 11:25:55
    Author     : entra21
--%>

<%@page import="Modelos.Despesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Editar Cliente</h1>
        <hr />
        <%
          int id = Integer.parseInt(request.getParameter("id"));
          Despesa d = new Despesa();
          if (id != 0){
              d = d.consultar(id);
          }    
        %>
        <form action="recebeEditaDespesa.jsp" method="POST">
            <label> Id  </label>
            <input type="text" name="id" 
                   readonly="true"
                   value="<%out.write(""+d.getId());%>"/>
            <br />
            <label> Descrição </label>
            <input type="text" name="descricao" 
                   value="<%out.write(d.getDescricao());%>" />
            <br />
            <label> Data </label>
            <input type="text" name="data" 
                   value="<%out.write(""+d.getData());%>" />
            <br />
            <label> Valor </label>
            <input type="text" name="valor" 
                   value="<%out.write(""+d.getValor());%>" />
            
           
            <hr />
            <input type="submit" value="Alterar" />
        </form>

    </body>
</html>
