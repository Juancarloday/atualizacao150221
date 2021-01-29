<%-- 
    Document   : recebeEditaReceita
    Created on : 12 de jan. de 2021, 11:06:21
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Receita Editada</h1>
        <hr />
        <%
          String id = request.getParameter("id");
          String descricao = request.getParameter("descricao");
          String valor = request.getParameter("valor");
          String data = request.getParameter("data");
          
          Receita r = new Receita();
          r.setId(Integer.parseInt(id));
          r.setDescricao(descricao);
          r.setValor(Float.parseFloat(valor));
          r.setData(Date.valueOf(data));
          
          
          if(r.alterar()){
              out.write("Despesa alterado com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Receita");
          }
          
        %>        
       <hr />
        <a href="consultaReceita.jsp">Consulta Receita</a>
        
    </body>
</html>
