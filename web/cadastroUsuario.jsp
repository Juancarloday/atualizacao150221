<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="style/estilos.css">
        <style>
            input[type=checkbox]{
                display: block;
                position: relative;
                margin-left: 230px;                
            }
            input[type=button],[type=reset]{
                display: block;
                width: 90px;
                margin-left: auto;
                margin-right: auto; 
                margin-top: 10px;
            }
            input[type=text]:focus{
                background-color: white;                                              
            }
            input[type=text],[type=date],[type=email],[type=password]{
                position: initial;
                background-color: lightskyblue;
                border-bottom-color: white;
                margin-left: 230px; 
                width: 280px;                                
            }
            label{
                display: block;
                position: absolute;
                margin-left: 10px;                 
            }
            div{
                display: block;
                background-color: lightblue;
                margin-left: auto;
                margin-right: auto;
                width: 530px;
                border: fuchsia;
                margin-bottom: 10px;
                padding: 20px;
            }
        </style>
        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }
            function mTel(fone) {
                fone = fone.replace(/\D/g, "")
                fone = fone.replace(/^(\d)/, "($1")
                fone = fone.replace(/(.{3})(\d)/, "$1)$2")
                if (fone.length == 9) {
                    fone = fone.replace(/(.{1})$/, "-$1")
                } else if (fone.length == 10) {
                    fone = fone.replace(/(.{2})$/, "-$1")
                } else if (fone.length == 11) {
                    fone = fone.replace(/(.{3})$/, "-$1")
                } else if (fone.length == 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                } else if (fone.length > 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                }
                return fone;
            }
            function mCNPJ(cnpj) {
                cnpj = cnpj.replace(/\D/g, "")
                cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2")
                cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
                cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2")
                cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2")
                return cnpj
            }
            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }
            function mCEP(cep) {
                cep = cep.replace(/\D/g, "")
                cep = cep.replace(/^(\d{2})(\d)/, "$1.$2")
                cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2")
                return cep
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
            
            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
                //document.getElementById('ibge').value = ("");
            }
            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('cep').value = (conteudo.cep);
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                   // document.getElementById('ibge').value = (conteudo.ibge);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }
            function pesquisacep(valor) {
                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');
                //Verifica se campo cep possui valor informado.
                if (cep != "") {
                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;
                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {
                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";
                        //document.getElementById('ibge').value = "...";
                        //Cria um elemento javascript.
                        var script = document.createElement('script');
                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
        </script>
    </head>
    <body>
        <!--<header>
            <script src="scripts/cabecalho.js"></script>
        </header>-->
        <section>
            <!--<nav>
                <script src="scripts/menu.js"></script>
            </nav>-->
            <article>
                <h1>Cadastro de Usuarios</h1>

                <form action="recebeDadosUsuario.jsp" method="POST">
                    <div>
                        <label>Nome</label>
                        <input type="text" name="nome" /> <br /> <br />

                        <label>Cpf</label>
                        <input type="text" name="cpf" onkeydown="javascript: fMasc(this, mCPF);" 
                               maxlength="14"><br /> <br />

                        <label>Data Nascimento</label>
                        <input type="date" name="dataNascimento" /> <br /> <br />

                        <label>Fone</label>
                        <input type="text" name="fone" onkeydown="javascript: fMasc(this, mTel);" 
                               maxlength="15"><br /> <br />

                        <label>Cep</label>
                        <input type="text" name="cep" id="cep"  
                               maxlength="9" onblur="pesquisacep(this.value);"><br /> <br />

                        <label>Endereço</label>
                        <input type="text" name="endereco" id="rua" maxlength="60"/> <br /> <br />

                        <label>Bairro</label>
                        <input type="text" name="bairro" id="bairro" maxlength="30"/> <br /> <br />

                        <label>Cidade</label>
                        <input type="text" name="cidade" id="cidade" maxlength="30"/> <br /> <br />

                        <label>Estado</label>
                        <input type="text" name="uf" id="uf" maxlength="2"/> <br /> <br />

                        <label>e-Mail/Usuario</label>
                        <input type="email" name="usuario" required /> <br /> <br />

                        <label>Senha</label>
                        <input type="password" name="senha" required /> <br /> <br />

                        <input type="button" value="Enviar" onclick="enviarDados()" />
                    </div>
                </form>

                <script>
                    function enviarDados() {
                        var nome = document.getElementsByName("nome");
                        if (nome[0].value === "") {
                            nome[0].focus();
                            alert("informe o Nome");
                            exit();
                        }
                        var cpf = document.getElementsByName("cpf");
                        var numsStr = cpf[0].value.replace(/[^0-9]/g, '');
                        if (!testaCpf(numsStr)) {
                            cpf[0].focus();
                            alert("Cpf inválido!");
                            exit();
                        }
                        var dataNascimento = document.getElementsByName("dataNascimento");
                        if (dataNascimento[0].value === "") {
                            dataNascimento[0].focus();
                            alert("informe a Data de Nascimento");
                            exit();
                        }
                        var cep = document.getElementsByName("cep");
                        if (cep[0].value === "") {
                            cep[0].focus();
                            alert("informe o Cep");
                            exit();
                        }
                        document.forms[0].submit();
                    }
                    function testaCpf(strCPF) {
                        var Soma;
                        var Resto;
                        Soma = 0;
                        if (strCPF == "00000000000")
                            return false;
                        for (i = 1; i <= 9; i++)
                            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
                        Resto = (Soma * 10) % 11;
                        if ((Resto == 10) || (Resto == 11))
                            Resto = 0;
                        if (Resto != parseInt(strCPF.substring(9, 10)))
                            return false;
                        Soma = 0;
                        for (i = 1; i <= 10; i++)
                            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
                        Resto = (Soma * 10) % 11;
                        if ((Resto == 10) || (Resto == 11))
                            Resto = 0;
                        if (Resto != parseInt(strCPF.substring(10, 11)))
                            return false;
                        return true;
                    }
                </script>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>






<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User


<%@page import="java.util.List"%>
<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
            <link rel="stylesheet" href="styles/estilos.css">
            <style>
               input[type=checkbox]{
                display: block;
                position: relative;
                margin-left: 230px;                
            }
            
            input[type=button],[type=reset]{
                display: block;
                width: 90px;
                margin-left: auto;
                margin-right: auto; 
                margin-top: 10px;
            }
            
            
            input[type=text]:focus{
                background-color: white;                                              
            }
            
            input[type=text],[type=date],[type=password]{
                position: initial;
                background-color: lightskyblue;
                border-bottom-color: white;
                margin-left: 230px; 
                width: 280px;                                
            }
            label{
                display: block;
                position: absolute;
                margin-left: 10px;                 
            }
            
            div{
                display: block;
                background-color: lightblue;
                margin-left: auto;
                margin-right: auto;
                width: 530px;
                border: fuchsia;
                margin-bottom: 10px;
                padding: 20px;
            }
        </style>
    </head>
    <body>
              
                  
        <h1 class="h">"Cadastro Usuario"</h1>
        <hr />

        
        <form action="recebeDadosUsuario.jsp" method ="POST">

        <div>
            <label>INFORME O CPF</label>
            <input type="text" name="cpf" /> <br />
            <label id="erroCPF" class="error"></label>            
            <br />

            <label>INFORME O NOME</label>
            <input type="text" name="nome" /> <br />

            <br />
            <label>INFORME DATA NASCIMENTO</label>
            <input type="date" name="datanasc" /> <br />

            <br />
            <label>INFORME O FONE</label>
            <input type="text" name="fone" /> <br />

            <br />
            <label>INFORME O CEP</label>
            <input type="text" name="cep" /> <br />
            
            <br />
            <label>INFORME O ENDEREÇO</label>
            <input type="text" name="endereco" /> <br />
            
            <br />
            <label>INFORME O BAIRRO</label>
            <input type="text" name="bairro" /> <br />
            
            <br />
            <label>INFORME A CIDADE</label>
            <input type="text" name="cidade" /> <br />           
            
            <br />
            <label>INFORME A UF</label>
            <input type="text" name="uf" /> <br />   
            
            <br />
            <label>INFORME O e-mail</label>
            <input type="text" name="email" /> <br />

            <br />                      
            <label>INFORME SENHA</label><br />
            <input type="password" name="senha" /> <br />

            <hr />
            <input type="button" value="Salvar" onclick="enviaDados()"/> <br />
            <input type="reset" value="Cancelar" />
        </div
               </form>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
       
             <script>
                function enviaDados(){
                    var semErros = true;
                    var erros = document.getElementById("erros");
                    var cpf = document.getElementsByName("cpf");
                    if(cpf[0].value === ""){
                        erros.innerHTML = "informe o CPF";
                        document.getElementById("erroCPF").innerHTML="informe o CPF"
                        cpf[0].focus();
                        semErros = false;
                    }
                    
                    var nome = document.getElementsByName("nome");
                    if(nome[0].value === ""){
                        erros.innerHTML += "<br>Informe nome";
                        nome[0].style="border: red solid 5px";
                        alert("informe o Nome");
                        semErros = false;
                    }
                                
                    var datanasc = document.getElementsByName("datanasc");
                    if(datanasc[0].value === ""){
                        erros.innerHTML += "<br>Informe data de nascimento";
                        datanasc[0].style="border: red solid 5px";
                        alert("informe a Data de Nascimento");
                        semErros = false;
                    }
                    
                    var fone = document.getElementsByName("fone");
                    if(fone[0].value === ""){
                        erros.innerHTML += "<br>Informe fone";
                        fone[0].style="border: red solid 5px";
                        alert("informe o Fone");
                        semErros = false;
                    }
                    
                    var cep = document.getElementsByName("cep");
                    if(cep[0].value === ""){
                        erros.innerHTML += "<br>Informe cep";
                        cep[0].style="border: red solid 5px";
                        alert("informe o cep");
                        semErros = false;
                    }
                    
                    var endereco = document.getElementsByName("endereco");
                    if(endereco[0].value === ""){
                        erros.innerHTML += "<br>Informe endereco";
                        endereco[0].style="border: red solid 5px";
                        alert("informe o endereco");
                        semErros = false;
                    }
                            
                    var bairro = document.getElementsByName("bairro");
                    if(bairro[0].value === ""){
                        erros.innerHTML += "<br>Informe bairro";
                        bairro[0].style="border: red solid 5px";
                        alert("informe o bairro");
                        semErros = false;
                    }
                            
                    var cidade = document.getElementsByName("cidade");
                    if(cidade[0].value === ""){
                        erros.innerHTML += "<br>Informe cidade";
                        cidade[0].style="border: red solid 5px";
                        alert("informe a cidade");
                        semErros = false;
                    }
                            
                    var uf = document.getElementsByName("uf");
                    if(uf[0].value === ""){
                        erros.innerHTML += "<br>Informe uf";
                        uf[0].style="border: red solid 5px";
                        alert("informe a uf");
                        semErros = false;
                    }
                                                                  
                    var email = document.getElementsByName("email");
                    if(email[0].value === ""){
                        erros.innerHTML += "<br>Informe email";
                        email[0].style="border: red solid 5px";
                        alert("informe o e-mail");
                        semErros = false;
                    }                    
                                       
                    var senha = document.getElementsByName("senha");
                    if(senha[0].value === ""){
                        erros.innerHTML += "<br>Informe senha";
                        senha[0].style="border: red solid 5px";
                        alert("informe a Senha");
                        semErros = false;
                    }
                    if(semErros)
                      document.forms[0].submit();
                }
             </script>
      </body>
</html>
--%>
