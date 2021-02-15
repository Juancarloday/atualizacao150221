<%-- 
    Document   : excluirReceita
    Created on : 12 de jan. de 2021, 09:50:14
    Author     : entra21
--%>
<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
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
    int idUser = Integer.parseInt(request.getParameter("idUser"));
    if (id != 0 && idUser != 0) {
        Receita receita = new Receita();
        receita = receita.consultar(id, idUser);
        if (receita != null) {
            String msg = "";
            if (receita.excluir()) {
                msg = "Receita excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Receita!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
    }
%>           

        <hr />
        <a href="consultaReceita.jsp">Consulta Receita</a>

    </body>
</html>
