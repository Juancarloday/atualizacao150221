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
                //verifica sessão
    String usuario = (String) session.getAttribute("usuario");
    int idUser = (int) session.getAttribute("idUser");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
        Receita receita = new Receita();
    receita.setId(Integer.parseInt(request.getParameter("id")));
    receita.setIdUsuario(idUser);
    receita.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
    receita.setDescricao(request.getParameter("descricao"));
    receita.setValor(Float.parseFloat(request.getParameter("valor")));
    receita.setData(Date.valueOf(request.getParameter("data")));
    String msg = "";
    if (receita.alterar()) {
        msg = "Receita alterada com sucesso!";
    } else {
        msg = "Problemas ao alterar Receita!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>        
    
        <hr />
        <a href="consultaReceita.jsp">Consulta Receita</a>

    </body>
</html>
