<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:rgba(0, 0, 242, 0.1)">
    <head>
        <title>Minha Agenda Financeira</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="style/estilos.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>

        <div class="login">
            <img src="imagens/avatar.jpg" style="width:76px">
            <h3> Olá,
                <%
                    String nomeUser = (String) session.getAttribute("nome");
                    out.write(nomeUser);
                %> !!
                <h3>
                    <div class="topnav a">
                        <a href="#"><i class="fa fa-envelope"></i> </a>
                        <a href="#"><i class="fa fa-user"></i></a>
                        <a href="#"><i class="fa fa-cog"></i></a>
                    </div>
                    </div>

                    <div class="painel"> Painel de Controle </div><br>

                    <div class="menu"
                         <div class="clearfix">
                        <div class="column">
                            <ul>
                                <li><a href="menu.jsp" ><i class="fa fa-users fa-fw"></i>  MENU </a></li>
                                <li><a href="cadastroDespesa.jsp"><i class="fas fa-comments-dollar"></i>  Seu novo Gasto</a> </li>
                                <li><a href="cadastroReceita.jsp"><i class="fas fa-donate"></i>  Sua nova Renda</a></li>
                                <li><a href="cadastroCategoria.jsp"><i class="fas fa-clipboard"></i>  Crie nova Categoria</a></li>
                                <li><a href="consultaBalancete.jsp"><i class="fas fa-balance-scale"></i>  Resumo Financeiro</a></li>
                                <li><a href="#"><i class="fa fa-bell fa-fw"></i>  Meus Dados</a></li>
                                <li><a href="#"><i class="fa fa-cog fa-fw"></i>  Configurações</a></li>
                            </ul>
                        </div>
                    </div>

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

                        <div class="container1"><h1>Cadastro de Usuarios</h1>
                            <div class="row">
                                <div class="col-25">
                                    <form action="recebeDadosUsuario.jsp" method="POST">
                                        <div class="row">
                                            <div class="col-25">            
                                                <label>Nome</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" name="nome" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Cpf</label>
                                            </div> 
                                            <div class="col-75">    
                                                <input type="text" name="cpf" onkeydown="javascript: fMasc(this, mCPF);" 
                                                       maxlength="14">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Data Nascimento</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="date" name="dataNascimento" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Fone</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="fone" onkeydown="javascript: fMasc(this, mTel);" 
                                                       maxlength="15">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Cep</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="cep" id="cep"  
                                                       maxlength="9" onblur="pesquisacep(this.value);">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Endereço</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="endereco" id="rua" maxlength="60"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Bairro</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="bairro" id="bairro" maxlength="30"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Cidade</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="cidade" id="cidade" maxlength="30"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Estado</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="text" name="uf" id="uf" maxlength="2"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>e-Mail/Usuario</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="email" name="usuario" required />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-25">
                                                <label>Senha</label>
                                            </div> 
                                            <div class="col-75">
                                                <input type="password" name="senha" required />
                                            </div>
                                        </div>          
                                        <div class="row">
                                            <input class="salvar" type="button" value="Enviar" onclick="enviarDados()" />
                                            <input class="cancelar" type="reset" value="Cancelar" />
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
                                </div>
                            </div>
                        </div>

                        <footer>
                            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
                        </footer>
                    </body>
                    </html>