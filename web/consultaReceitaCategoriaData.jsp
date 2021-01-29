<%-- 
    Document   : consultaReceitaCategoriaData.jsp
    Created on : 25/01/2021, 10:20:35
    Author     : entra21
--%>

<%@page import="Modelos.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <h1>Consulta Receita por Categoria e Data</h1>
        <hr />
        <form action="consultaReceitaCategoriaData.jsp" method="POST">

            <label>Digite a Data Inicial</label>
            <input type="text" name="dataInicial" />

            <hr/>

            <label>Digite a Data Final</label>
            <input type="text" name="dataFinal" />

            <hr/>
            
            <label>Digite a Categoria</label>
            <input type="text" name="categoria"/>

 
            </select>
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
            <%

                Categoria categoria = new Categoria();
                List<Categoria> categorias = categoria.consultar();
           
            %> 
         <tbody>
            <% for (Categoria c : categorias) {%>
            <tr>
                <td><% out.write("" + c.getId());%></td>
                <td><% out.write(c.getDescricao());%></td>
                <td><% out.write(c.getTipo());%></td>
 


            </tr>
            <%}%>
        </tbody>  
            
        <thead>
            <th>Id</th>
            <th>Descricao</th>
            <th>Valor</th>
            <th>Data</th>



        </thead> 
            <input type="button" value="Salvar" onclick="enviaForm()" />
    </table>
            <script>
            function enviaForm(){
                var categoria = document.getElementsByName("categoria");
                if(categoria[0].value === "categoria"){
                   categoria[0].focus();
                   exit();
            }

            
            document.forms[0].submit();
        }
        </script>
</form>
<footer>
    <script src="scripts/rodape.js"></script>
</footer>
    </body>
</html>
