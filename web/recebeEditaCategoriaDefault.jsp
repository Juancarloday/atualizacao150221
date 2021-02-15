<%-- 
    Document   : recebeEditaCategoriaDefault
    Created on : 15/02/2021, 10:37:10
    Author     : entra21
--%>
<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Editar Categoria Default</h1>

        <%
            CategoriaDefault categoriaDefault = new CategoriaDefault();
            categoriaDefault.setId(Integer.parseInt(request.getParameter("id")));
            categoriaDefault.setDescricao(request.getParameter("descricao"));
            categoriaDefault.setTipo(request.getParameter("tipo"));
            String msg = "";
            if (categoriaDefault.alterar()) {
                //direciona para a página de informações
                msg = "Categoria Default alterada com Sucesso!";
            } else {
                msg = "Problemas ao alterar Categoria Default!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        %>     


    </body>
</html>
