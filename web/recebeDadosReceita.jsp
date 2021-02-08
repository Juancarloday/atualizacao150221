
<%-- 
    Document   : recebeDadosReceita
    Created on : 16/12/2020, 08:05:39
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //verifica sessão
    String usuario = (String) session.getAttribute("usuario");
    int idUser = (int) session.getAttribute("idUser");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
    //instancia e recebe os valores da tela HTML
    Receita receita = new Receita();
    receita.setIdUsuario(idUser);
    receita.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
    receita.setDescricao(request.getParameter("descricao"));
    receita.setValor(Float.parseFloat(request.getParameter("valor")));
    receita.setData(Date.valueOf(request.getParameter("data")));
    String msg = "";
    if (receita.salvar()) {
        msg = "Receita salva com sucesso!";
    } else {
        msg = "Problemas ao salvar Receita!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>





<%-- 
    Document   : recebeDadosReceita
    Created on : 16/12/2020, 08:05:39
    Author     : entra21


<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Dados Receita</h1>
        <%
          //recebe os valores da tela HTML  
          String descricao = request.getParameter("descricao");
          String valor = request.getParameter("valor");
          String data = request.getParameter("data");
          String dataInicial = request.getParameter("dataInicial");
          String dataFinal = request.getParameter("dataFinal");
          
          //instancia o cliente
          Receita receita = new Receita();
          receita.setDescricao(descricao);
          receita.setValor(Float.parseFloat(valor));
          receita.setData(Date.valueOf(data));
          receita.setDataInicial(Date.valueOf(dataInicial));
          receita.setDataFinal(Date.valueOf(dataFinal));
          
          if(receita.salvar()){
              out.write("Receita salva com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar receita");
          }
          
        %>
        <hr />
    </body>
</html>
--%>