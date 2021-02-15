


<%-- 
    Document   : recebeDadosReceita
    Created on : 16/12/2020, 08:05:39
    Author     : entra21
--%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.sql.Date"%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<html style="background-color:rgba(0, 0, 242, 0.1)">
    <head>
        <title>Minha Agenda Financeira</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="style/estilos.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <%
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
            Despesa despesa = new Despesa();
            despesa.setIdUsuario(idUser);
            despesa.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            despesa.setDescricao(request.getParameter("descricao"));

            String valor = request.getParameter("valor"); //12.356,44
            valor = valor.replace(".", ""); //12356,44
            valor = valor.replace(',', '.');//12356.44
            despesa.setValor(Float.parseFloat(valor));
            despesa.setData(Date.valueOf(request.getParameter("data")));

            String msg = "";
            if (despesa.salvar()) {
                msg = "O seu novo Gasto foi salvo com sucesso!";
            } else {
                msg = "Problemas ao salvar o seu Novo Despesa!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        %>
        <hr />
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer> 
    </body>
</html>
