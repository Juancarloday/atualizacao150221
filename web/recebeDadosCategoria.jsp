<%-- 
    Document   : recebeDadosCategoria
    Created on : 16/12/2020, 09:36:25
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
        <h1>Dados da Categoria</h1>
        <%
          //recebe os valores da tela HTML
          //String id = request.getParameter("id");
          String descricao = request.getParameter("descricao");
          String tipo = request.getParameter("tipo");
         
          //instancia o 
          Categoria categoria = new Categoria();
          //categoria.setId(Integer.parseInt(id));
          categoria.setDescricao(descricao);
          //categoria.setTipo(Boolean.getBoolean(tipo));
          categoria.setTipo(tipo);
         
          if(categoria.salvar()){
              out.write("Categoria salva com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar categoria");
          }
          
        %>
        <hr />
    </body>
</html>
