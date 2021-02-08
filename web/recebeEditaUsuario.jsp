

<%-- 
    Document   : recebeDadosUsuario
    Created on : 18/12/2020, 08:17:57
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
        //verifica sessão
        String usuario = (String) session.getAttribute("usuario");
        int idUser = (int) session.getAttribute("idUser");
        if (usuario == null) {
            response.sendRedirect("login.jsp");
        }
        Usuario user = new Usuario();
        if (user.userExiste(request.getParameter("usuario"))) {
            user.setIdUser(idUser);
            user.setNome(request.getParameter("nome"));
            user.setCpf(request.getParameter("cpf"));
            user.setDataNasc(Date.valueOf(request.getParameter("dataNascimento")));
            user.setFone(request.getParameter("fone"));
            user.setCep(request.getParameter("cep"));
            user.setEndereco(request.getParameter("endereco"));
            user.setBairro(request.getParameter("bairro"));
            user.setCidade(request.getParameter("cidade"));
            user.setUf(request.getParameter("uf"));
            user.setEmail(request.getParameter("usuario"));
            user.setSenha(request.getParameter("senha"));
            if (user.alterar(idUser)) {
                String msg = "Usuario alterado";
                response.sendRedirect("informacao.jsp?msg=" + msg);
            }
        } else {
            String msg = "Usuario não encontrato para alterar!";
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
%>







<%-- 
    Document   : recebeEditaUsuario
    Created on : 13 de jan. de 2021, 10:31:33
    Author     : entra21


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
--%>