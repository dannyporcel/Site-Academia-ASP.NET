<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Inicial_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.css" rel="stylesheet" />   

    <link href="css/estilo.css" rel="stylesheet" />
</head>
<body style="background-color:lightgray">
    <header class="container-fluid bg-light">  
        <nav class="navbar navbar-expand-lg navbar-light  container col-10 offset-1" " style="padding-bottom:15px">

                <a href ="index.aspx" class="navbar-brand">
                <img src="../imagens/logo3.png" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                            <a class="nav-link" href="index.aspx"><h3><small class="text-danger" >Inicío</small></h3></a>
                            </li>                           

                            <li class="nav-item">
                            <a class="nav-link" href="#Modalidade"><h3><small class="text-danger" >Modalidades</small></h3></a>
                            </li>
                    </ul>

                    <form class="form-inline my-2 my-lg-0">                     
                            <a class="btn btn-outline-danger my-2 my-sm-0" href="../Autenticando/Login.aspx" role="button" >ENTRAR</a> 
                              
                    </form>
                </div>
     </nav>        
    </header>
    <!-- SEÇÃO COM FOTO PRINCIPAL //////////////////////////////////////////////////////////////// -->
    <section class="container col-10" style="padding-top:18px; margin-bottom:50px" >
        <img src="../imagens/Principal1.png" class="container-fluid" />
    </section>
    <!-- FIM SEÇÃO COM FOTO PRINCIPAL //////////////////////////////////////////////////////////// -->

    <form id="form1" runat="server">

    <div id="central" class="container" style="padding-bottom:60px;  padding-top: 15px">
        <h4 class="alert alert-danger" role="alert" style="text-align:center; margin-bottom:50px"> Bem vindo(a)</h4> <br />
            <div class="row">
                <section class="container col-8">
                        <p> Na "ACADEMIA", você encontra atividades que foram desenvolvidas pensando em você e nas suas necessidades.
                            Flexibilidade de horários, profissionais atenciosos e ambientes agradáveis completam nosso quadro de vantagens.
                            O que você pretende para o seu físico, sua saúde e seu estilo de vida estão aqui!
                        </p>
                        <p>
                            Emagrecimento, hipertrofia, treino funcional, seja qual for seu objetivo teremos prazer em te atender.
                            Venha conhecer nosso ambiente.
                        </p>
                        <figure class="figure">
                          <img src="../imagens/foto_principal3.jpg" class="figure-img img-fluid rounded" alt="Imagem academia."/>
                          <figcaption class="figure-caption">Ambiente da academia.</figcaption>
                        </figure>
                </section>
             
                <section class ="container col-3" style="margin-left:90px">
                    <div class="card" style="width:auto">
                         <img class="card-img-top" src="../imagens/ambiente_1.jpg" alt="Imagem de capa do card"/>
                          <div class="card-body">
                            <h5 class="card-title"style="text-align:start">Conheça nossas modalidades</h5>
                                <p class="card-text">Verifique as modalidades disponíves e quais são as que mais se encaixam
                                     no seu objetivo final, acesse o link.</p>                                
                          </div>
                        <div class="card-body">                           
                            <a href="#Modalidade" class="card-link">Modalidades</a>
                        </div>
                   </div>
                </section>
         </div>        
  </div>
        <div id="Modalidade">
            <asp:DataList ID="dtlModalidades" runat="server" Width="70px" RepeatDirection="Horizontal" CssClass="container" RepeatLayout="Table" RepeatColumns="4">            
           
                    <HeaderTemplate>
                        <h4 class="text-danger"><asp:Label ID="lblModalidades" runat="server" Text="Modalidades"></asp:Label></h4>
                    </HeaderTemplate>
           
                    <ItemTemplate>
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                               <h4><asp:Label ID="lblNomeModal" runat="server" Text='<%# Bind("nomeModal") %>' cssClass="card-title"></asp:Label></h4> 
                                <br />
                                <asp:Label ID="lblDescricaoModal" runat="server" Text='<%# Bind("descricaoModal") %>'></asp:Label>
                                <br />                                
                            </div>
                        </div>
                    </ItemTemplate>
            
            </asp:DataList>
        </div>       
   
    </form>   

    <footer class="page-footer font-small blue bg-danger">
        <!-- Copyright -->
        <div class="footer-copyright text-center py-3 " style ="color:white">© 2018 Copyright: Be Mighty
                       
        </div>
        <!-- Copyright -->
    </footer>
    <script src="JScript.js"></script>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery-3.3.1.slim.min.js"></script>


    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/esm/popper.min.js"></script>
    <script src="../Scripts/popper-utils.min.js"></script>
    <script src="../Scripts/esm/popper-utils.min.js"></script>

    <script src="../Scripts/bootstrap.min.js"></script>     
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
