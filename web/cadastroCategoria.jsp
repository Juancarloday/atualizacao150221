<%-- 
    Document   : cadastroCategoria
    Created on : 29 de out de 2020, 10:44:15
    Author     : entra21
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="styles/estilos.css"/>
        <title>cadastroCategoria</title>
        <style>
            /*input[type=checkbox]{
                display: block;
                position: absolute;
                margin-left: 130px;                
            }*/
            
           /*input[type=text]:focus{
                background-color: white;                                              
            }
            
            input[type=number]:focus{
                background-color: white;                                              
            }*/
            
            input[type=text], [type=number]{
                display: block;
                /*position: relative;*/
                background-color: #3CBC8D;
                margin-left: 130px; 
                /*width: 250px;*/
            }
                        
            input[type=button],[type=reset]{
                display: block;
                width: 70px;
                margin-left: 350px;
                /*margin-left: auto;
                margin-right: auto; */
                margin-top: 10px;
            }
            
            label{
                display: block;
                position: absolute;
                margin-top: 20px;
                margin-left: 20px;                 
            }
            
            /*div{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 600px;
                border: blue solid 2px;
                margin-bottom: 10px;
                padding: 20px;
            }*/
        </style>
    </head>
    <body>
        <header>
            <!--<script src="scripts/cabecalho.js"></script>-->
        </header>
        <section>
            <nav>
                <!--<script src="scripts/menu.js"></script>-->
            </nav>
            <article>
                <div style="margin-left: 20px;">
                <h1>Cadastro de Categorias</h1>
                
                <form action="recebeDadosCategoria.jsp" method="POST">
                    <label>Descrição</label>
                    <input style="width: 35%" type="text" name="descricao" /> <br /> 
                    
                    <select name="tipo" style="margin-left: 130px;">
                        <option value="D">DESPESA</option>
                        <option value="R">RECEITA</option>
                    </select>
                        
                    <input type="button" value="Enviar" onclick="enviaForm()" />
                    <input type="reset" value="Limpar" />
                </form>
                </div>

                <p class="error" id="erros" style= "margin-left: 70px; margin-bottom: 50px;
                                            color: red; font-size: 14px;"></p>

                <script>
                    function enviaForm(){
                        var descricao = document.getElementsByName("descricao");
                        if(descricao[0].value === ""){
                            descricao[0].focus();
                            erros.innerHTML = "Informe a Categoria";
                            exit();
                        }
                        
                        document.forms[0].submit();
                    }
                </script>
            </article>
        </section>
        <footer>
            <!--<script src="scripts/rodape.js"></script>-->
        </footer>
    </body>
</html>








<%-- 
    Document   : cadastroCategoria
    Created on : 16/12/2020, 08:44:41
    Author     : entra21


<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Despesa"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <%
         int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");           
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } 
            else{
               idUser = (int) session.getAttribute("idUser");
            }
        %>
        <h1>Cadastro Categoria</h1>
        <hr />
         <div>
            <form action="recebeDadosCategoria.jsp" method="POST">
            
            <label>Informe a descrição</label>
            <input type="text" name="descricao" /> 
            
            <br />
            <label>Informe o tipo</label> <br />
           <!-- 
            <input type="radio" id="despesa" name="tipo" value="despesa" />
            <label for="despesa">Despesa</label><br>
            <input type="radio" id ="receita" name="tipo" value="receita" />
            <label for="receita">Receita</label><br>             
            -->
            <select name="tipo">
                <option value="R">Receita</option>
                <option value="D">Despesa</option>
            </select>
           
            
            <hr />
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" onclick="enviaForm()" />
           
            <hr />
            </div>
        </form>
        <script>
            function enviaForm(){
                var descricao = document.getElementsByName("descricao");
                if(descricao[0].value === ""){
                   descricao[0].focus();
                   alert("informe a descricao");
                   exit();
            }
                var valor = document.getElementsByName("tipo");
                if(valor[0].value === ""){
                   valor[0].focus();
                   alert("informe o tipo");
                   exit();
            }
            
            document.forms[0].submit();
        }
        </script>
    </body>
</html>
--%>