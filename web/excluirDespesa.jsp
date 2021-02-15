<%-- 
    Document   : excluirDespesa
    Created on : 12 de jan. de 2021, 09:29:41
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Excluir Despesa</h1>
        <hr />
        <%
            int id = Integer.parseInt(request.getParameter("id"));
    int idUser = Integer.parseInt(request.getParameter("idUser"));
    if (id != 0 && idUser != 0) {
        Despesa despesa = new Despesa();
        despesa = despesa.consultar(id, idUser);
        if (despesa != null) {
            String msg = "";
            if (despesa.excluir()) {
                msg = "Despesa excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Despesa!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
    }
%>    
        <hr />
        <a href="consultaDespesa.jsp">Consulta Despesa</a>

    </body>
</html>
