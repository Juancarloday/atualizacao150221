<%-- 
    Document   : excluirUsuario
    Created on : 13 de jan. de 2021, 10:24:55
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
        <h1>Excluir Usuario</h1>
        <hr/>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario u = new Usuario();
            if (id != 0) {
                u = u.consultar(id);
                if (u.excluir()) {
                    out.write("Usuario excluído com sucesso");
                } else {
                    out.write("Erro ao excluir Usuario");
                }
            }
        %>
        <hr />
        <a href="consultaUsuario.jsp">Consulta usuario</a>
    </body>
</html>
