
<%-- 
    Document   : recebeEditaDespesa
    Created on : 16/12/2020, 08:05:39
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Despesa"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String usuario = (String) session.getAttribute("usuario");
    int idUser = (int) session.getAttribute("idUser");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
    Despesa despesa = new Despesa();
    despesa.setId(Integer.parseInt(request.getParameter("id")));
    despesa.setIdUsuario(idUser);
    despesa.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
    despesa.setDescricao(request.getParameter("descricao"));
    despesa.setValor(Float.parseFloat(request.getParameter("valor")));
    despesa.setData(Date.valueOf(request.getParameter("data")));
    String msg = "";
    if (despesa.alterar()) {
        msg = "Despesa alterada com sucesso!";
    } else {
        msg = "Problemas ao alterar Despesa!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>
