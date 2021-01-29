<%-- 
    Document   : consultaDespesaData
    Created on : 22/01/2021, 08:09:39
    Author     : entra21
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Despesa"%>


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

        <h1>Consulta Despesa por Data</h1>
         <hr />
        <form action="consultaDespesaData.jsp" method="POST">
           
            <label>Digite a Data Inicial</label>
            <input type="text" name="dataInicial" />
            
            <hr/>

            <label>Digite a Data Final  </label>
            <input type="text" name="dataFinal" />
            
            <hr/>       
            <input type="submit" value="Consultar" />
            
            <hr/>
             
            
            
            
        <%
           Despesa despesa = new Despesa();
           List<Despesa> despesas = new ArrayList<>();
          
           String inicio = request.getParameter("dataInicial");
           String fim = request.getParameter("dataFinal");
           
           if (inicio != null && fim != null){
               despesas = despesa.consultarData(inicio, fim);
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

         </thead> 
         
             
        <tbody>
            <% for(Despesa d: despesas) {%>
            <tr>
                <td><% out.write(""+d.getId());%></td>
                <td><% out.write(d.getDescricao());%></td>
                <td><% out.write(String.valueOf(d.getValor()));%></td>
                <td><% out.write(String.valueOf(d.getData()));%></td>
                <td><% out.write(String.valueOf(d.getDataInicial()));%></td>
                <td><% out.write(String.valueOf(d.getDataFinal()));%></td>
                
            </tr>
            <%}%>
             
        </tbody>
            </table>
        </form>
            <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
    </head>
</html>
