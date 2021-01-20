<%-- 
    Document   : consultaUsuario
    Created on : 18/12/2020, 08:32:04
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Usuario"%>
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
        <h1>Consulta Usuario</h1>
         <hr />
        <%
           Usuario usuario = new Usuario();
           List<Usuario> usuarios = usuario.consultar();
           
        %>
        <table>
        <thead>
            <tr>
                <th>Cpf</th>
                <th>Nome</th>
                <th>Data de Nascimento</th>
                <th>E-mail</th>
                <th>Telefone</th>
                <th>CEP</th>
                <th>Endereço</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>Senha</th>
                <th>Excluir</th>
                <th>Editar</th>
            </tr>
         </thead>         
        <tbody>
            <% for(Usuario u: usuarios) {%>
               <tr>
                <td><% out.write(u.getCpf());%></td>
                <td><% out.write(u.getNome());%></td>
                <td><% out.write(String.valueOf(u.getDatanasc()));%></td>
                <td><% out.write(u.getEmail());%></td>
                <td><% out.write(u.getFone());%></td>
                <td><% out.write(u.getCep());%></td>
                <td><% out.write(u.getEndereco());%></td>
                <td><% out.write(u.getBairro());%></td>
                <td><% out.write(u.getCidade());%></td>
                <td><% out.write(u.getUf());%></td>
                <td><% out.write(u.getSenha());%></td> 
                 
                <td><%out.write("<a href=excluirUsuario.jsp?id="+u.getId()+">Excluir</a>");%></td>   
                <td><%out.write("<a href=editarUsuario.jsp?id="+u.getId()+">Editar</a>");%></td>   
               </tr>
            <%}%>
             
        </tbody>
            </table>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
