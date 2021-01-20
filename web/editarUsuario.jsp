<%-- 
    Document   : editarUsuario
    Created on : 13 de jan. de 2021, 09:44:37
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Editar Usuario</h1>
        <hr />
        <%
          int id = Integer.parseInt(request.getParameter("id"));
          Usuario u = new Usuario();
          if (id != 0){
              u = u.consultar(id);
          }    
        %>
        <form action="recebeEditaUsuario.jsp" method="POST">
            <label> Id  </label>
            <input type="text" name="id" 
                   readonly="true"
                   value="<%out.write(""+u.getId());%>"/>
            <br />
            <label> Nome </label>
            <input type="text" name="nome" 
                   value="<%out.write(u.getNome());%>" />
            <br />
            <label> CPF </label>
            <input type="text" name="cpf" 
                   value="<%out.write(u.getCpf());%>" />
            <br />
            <label> Data Nascimento </label>
            <input type="text" name="datanasc" 
                   value="<%out.write(""+u.getDatanasc());%>" />
            <br />
            <label> Fone </label>
            <input type="text" name="fone" 
                   value="<%out.write(u.getFone());%>" />
            <br />
            <label> CEP </label>
            <input type="text" name="cep" 
                   value="<%out.write(u.getCep());%>" />
            <br />
            <label> Endereco </label>
            <input type="text" name="endereco" 
                   value="<%out.write(u.getEndereco());%>" />
            <br />
            <label> Bairro </label>
            <input type="text" name="bairro" 
                   value="<%out.write(u.getBairro());%>" />
            <br />
            <label> Cidade </label>
            <input type="text" name="cidade" 
                   value="<%out.write(u.getCidade());%>" />
            <br />
            <label> UF </label>
            <input type="text" name="uf" 
                   value="<%out.write(u.getUf());%>" />            
            <br />
            <label> e-mail </label>
            <input type="text" name="email" 
                   value="<%out.write(u.getEmail());%>" />
            <br />            
            <label> Senha </label>
            <input type="text" name="senha" 
                   value="<%out.write(u.getSenha());%>" />
            <br />
           
            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
