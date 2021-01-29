<%-- 
    Document   : consultaReceitaData
    Created on : 21/01/2021, 08:37:25
    Author     : entra21
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Receita"%>
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
        </style>
    </head>
    <body>

        <h1>Consulta Receita por Data</h1>
        <hr />
        <form action="consultaReceitaData.jsp" method="POST">

            <label>Digite a Data Inicial</label>
            <input type="text" name="dataInicial" />

            <hr/>

            <label>Digite a Data Final</label>
            <input type="text" name="dataFinal" />

            <hr/>       
            <input type="submit" value="Consultar" />
            <hr/>

            <%

                Receita receita = new Receita();
                List<Receita> receitas = new ArrayList<>();

                String inicio = request.getParameter("dataInicial");
                String fim = request.getParameter("dataFinal");

                if (inicio != null && fim != null) {
                    receitas = receita.consultarData(inicio, fim);
                }               
            %> 


            <%
            if (inicio == null && fim == null) {
                out.write("<table style='display:none'>");
           } else{
            if (inicio.isEmpty() && fim.isEmpty())
                out.write("<table style='display:none'>");
            else
                out.write("<table style='display:block'>");
           }                    

            
            %>
   
            <thead>
            <th>Id</th>
            <th>Descricao</th>
            <th>Valor</th>
            <th>Data</th>

            <th>Data Inicial</th>
            <th>Data Final</th>


        </thead> 


        <tbody>
            <% for (Receita r : receitas) {%>
            <tr>
                <td><% out.write("" + r.getId());%></td>
                <td><% out.write(r.getDescricao());%></td>
                <td><% out.write(String.valueOf(r.getValor()));%></td>
                <td><% out.write(String.valueOf(r.getData()));%></td>
                <td><% out.write(String.valueOf(r.getDataInicial()));%></td>
                <td><% out.write(String.valueOf(r.getDataFinal()));%></td>

            </tr>
            <%}%>
        </tbody>
    </table>
</form>
<footer>
    <script src="scripts/rodape.js"></script>
</footer>   
</body>
</html>
