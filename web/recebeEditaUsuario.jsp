<%-- 
    Document   : recebeEditaUsuario
    Created on : 13 de jan. de 2021, 10:31:33
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
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
        <h1>Usuario Editado</h1>
        <hr />
        <%
          String id = request.getParameter("id");
          String nome = request.getParameter("nome");
          String cpf = request.getParameter("cpf");
          String datanasc = request.getParameter("datanasc");
          String fone = request.getParameter("fone");
          String cep = request.getParameter("cep");
          String endereco = request.getParameter("endereco");
          String bairro = request.getParameter("bairro");
          String cidade = request.getParameter("cidade");
          String uf = request.getParameter("uf");
          String email = request.getParameter("email");
          String senha = request.getParameter("senha");
          
          Usuario u = new Usuario();
          u.setId(Integer.parseInt(id));
          u.setNome(nome);
          u.setCpf(cpf);
          u.setDatanasc(Date.valueOf(datanasc));
          u.setFone(fone);
          u.setCep(cep);
          u.setEndereco(endereco);
          u.setBairro(bairro);
          u.setCidade(cidade);
          u.setUf(uf);
          u.setEmail(email);
          u.setSenha(senha);
          
          if(u.alterar()){
              out.write("Usuario alterado com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Usuario");
          }
          
        %>        
       <hr />
        <a href="consultaUsuario.jsp">Consulta Usuario</a>
    </body>
</html>
