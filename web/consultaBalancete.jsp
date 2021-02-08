<%-- 
    Document   : consultalocacao
    Created on : 13 de nov de 2020, 08:17:15
    Author     : entra21
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.Despesa"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 70%;
            }
            td, th {
                border: 1px solid #B0E0E6;
                text-align: center;
                padding: 7px;
            }
            tr:nth-child(even) {
                background-color: #B0E0E6;
            }

            .container-item{
                width: 50%;
                border: red solid 1px;
                margin-left: auto;
                margin-right: auto;
                padding-left: 15px;
            }

            .container-item label{
                font-size: 18px;
                display: block
            }

            span{
                font-weight: bold;
                color: red;
            }
        </style>
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

        <form action="consultaBalancete.jsp" method="POST">
            <div class="container">
                <label>Digite a Data Inicial</label>
                <input type="date" name="dataInicio" />


                <label>Digite a Data Final</label>
                <input type="date" name="dataFim" />

                <input type="button" value="Consultar" onclick="enviaForm()" />
                <hr/>
                <div class="container-item">
                    <%
                        String inicio = request.getParameter("dataInicio");
                        String fim = request.getParameter("dataFim");
                        float valorReceita = 0;
                        float valorDespesa = 0;

                        if (inicio != null & fim != null) {
                            Date dataInicio = Date.valueOf(inicio);
                            Date dataFim = Date.valueOf(fim);
                           

                            Receita receita = new Receita();
                            valorReceita = receita.getTotalReceita(idUser, dataInicio, dataFim);

                            Despesa despesa = new Despesa();
                            valorDespesa = despesa.getTotalDespesa(idUser, dataInicio, dataFim);
                        }

                    %>
                    <p>Total receitas: <span> <%out.write(ConversorData.formataMoeda(valorReceita));%> </span></p>
                    <p>Total desepesas: <%out.write(ConversorData.formataMoeda(valorDespesa));%> </p>
                    <p> Saldo: <%out.write(ConversorData.formataMoeda(valorReceita - valorDespesa));%></p>                
                </div>    

            </div>

        </form>      

        <script>

            function enviaForm() {
                var inicio = document.getElementsByName("dataInicio")[0].value;
                var fim = document.getElementsByName("dataFim")[0].value;
                if (inicio === "" || fim === "") {
                    alert("è preciso informar datas");
                } else
                    document.forms[0].submit();
            }
        </script>
    </body>
</html>
