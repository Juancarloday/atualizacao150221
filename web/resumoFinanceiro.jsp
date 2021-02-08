<%-- 
    Document   : resumoFinanceiro
    Created on : 05/02/2021, 11:01:42
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%
            int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>   

        
        <h1>Consulta Balancete</h1>
        <hr />



        <form action="consultaReceitaDetalhada.jsp" method="POST">
            <div class="container">
                
                
                
                
                <label>Digite a Data Inicial</label>
                <input type="date" name="dataInicio" />


                <label>Digite a Data Final</label>
                <input type="date" name="dataFim" />


                <label>Agrupar?</label>
                <input type="checkbox" name="agrupar" checked="true" />
    </body>
</html>
