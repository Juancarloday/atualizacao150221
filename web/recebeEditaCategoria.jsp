<%-- 
    Document   : recebeEditaCategoria
    Created on : 8 de nov de 2020, 21:51:26
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Categoria categoria = new Categoria();
    categoria.setId(Integer.parseInt(request.getParameter("id")));
    categoria.setIdUsuario(Integer.parseInt(request.getParameter("idUser")));
    categoria.setDescricao(request.getParameter("descricao"));
    categoria.setTipo(request.getParameter("tipo"));
    String msg = "";
    if (categoria.alterar()) {
        //direciona para a página de informações
        msg = "Categoria alterada com Sucesso!";
    } else {
        msg = "Problemas ao alterar Categoria!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>













<%-- 
    Document   : recebeEditaCategoria
    Created on : 13 de jan. de 2021, 08:15:13
    Author     : entra21


<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Categoria Editada</h1>
        <hr />
        <%
          String id = request.getParameter("id");
          String descricao = request.getParameter("descricao");
          String tipo = request.getParameter("tipo");
          
          Categoria c = new Categoria();
          c.setId(Integer.parseInt(id));
          c.setDescricao(descricao);
          c.setTipo(tipo);
          
          
          if(c.alterar()){
              out.write("Categoria alterada com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Categoria");
          }
          
        %>        
       <hr />
        <a href="consultaCategoria.jsp">Consulta Categoria</a>
    </body>
</html>
--%>