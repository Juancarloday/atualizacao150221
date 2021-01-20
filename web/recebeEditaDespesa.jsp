<%-- 
    Document   : recebeEditaDespesa
    Created on : 12 de jan. de 2021, 11:28:52
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
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
        <h1>Despesa Editada</h1>
        <hr />
        <%
          String id = request.getParameter("id");
          String descricao = request.getParameter("descricao");
          String valor = request.getParameter("valor");
          String data = request.getParameter("data");
          
          Despesa d = new Despesa();
          d.setId(Integer.parseInt(id));
          d.setDescricao(descricao);
          d.setValor(Float.parseFloat(valor));
          d.setData(Date.valueOf(data));
          
          
          if(d.alterar()){
              out.write("Despesa alterado com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar despesa");
          }
          
        %>        
       <hr />
        <a href="consultaDespesa.jsp">Consulta Despesa</a>
        
    </body>
</html>
