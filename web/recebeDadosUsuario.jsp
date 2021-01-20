<%-- 
    Document   : recebeDadosUsuario
    Created on : 18/12/2020, 08:17:57
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Finanaceira</title>
    </head>
    <body>
     <%
        Usuario user = new Usuario();
        if(user.userExiste(request.getParameter("nome"))){
            String msg = "Usuario ja existe!";
            response.sendRedirect("erro.jsp?msg="+ msg);
            session.setAttribute("user", request.getParameter("usuario"));
       }
    else{
       user.setCpf(request.getParameter("cpf"));
       user.setNome(request.getParameter("nome"));
       user.setEmail(request.getParameter("email"));
       user.setFone(request.getParameter("fone"));
       user.setDatanasc(Date.valueOf(request.getParameter("datanasc")));
       user.setCep(request.getParameter("cep"));
       user.setEndereco(request.getParameter("endereco"));
       user.setBairro(request.getParameter("bairro"));
       user.setCidade(request.getParameter("cidade"));
       user.setUf(request.getParameter("uf"));
       user.setSenha(request.getParameter("senha"));
        if (user.salvar()){
            //direciona para a página de informações
            response.sendRedirect("informacao.jsp?msg=Cliente salvo com sucesso");
         }
        else{
            response.sendRedirect("erro.jsp?msg=Problemas ao salvar cliente");
        }
    }
        %>
    </body>     
</html>
