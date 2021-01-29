<%-- 
    Document   : consultaCategoria
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="style/estilos.css">
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
        <h1>Consulta Categoria</h1>
         <hr />
        <%
           Categoria categoria = new Categoria();
           List<Categoria> categorias = categoria.consultar();
           
        %>
        <table>
        <thead>
        <th>Id</th>
        <th>Descricao</th>
        <th>Tipo</th>
        <th>Excluir</th>
        <th>Editar</th>
        
         </thead> 
         
             
        <tbody>
            <% for(Categoria c: categorias) {%>
            <tr>
                <td><% out.write(""+c.getId());%></td>
                <td><% out.write(c.getDescricao());%></td>
                <td><% out.write(c.getTipo());%></td> 
                 
            <td><%out.write("<a href=excluirCategoria.jsp?id="+c.getId()+">Excluir</a>");%></td>   
            <td><%out.write("<a href=editarCategoria.jsp?id="+c.getId()+">Editar</a>");%></td>   
            </tr>
            <%}%>
             
        </tbody>
            </table>
            <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
