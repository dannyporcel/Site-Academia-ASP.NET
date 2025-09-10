<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Autenticando_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.css" rel="stylesheet" /> 
</head>
<body>
    <header class="container-fluid bg-danger">
        <nav class="navbar container-fluid" style="padding-bottom:15px; margin-bottom:15px">
        <a href ="/Inicial/index.aspx" class="navbar-brand">
        <img src="../imagens/logo3.png" />
        </a>         
        </nav>
    </header>
    <form id="form1" runat="server">
        <div class ="container col-3 border" style="padding-top:20px; padding-bottom:35px; margin-top:150px; background-color:crimson">
            <asp:Label ID="lblUsuario" runat="server" AssociatedControlID="txtCPF" Text="Seu CPF:" style ="color:white"></asp:Label>
            <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control-file" TabIndex="1"></asp:TextBox>
            <br />
            <asp:Label ID="lblSenha" runat="server" AssociatedControlID="txtSenha" Text="Senha:" style ="color:white"></asp:Label>
            <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control-file" TabIndex="2" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnAcessar" runat="server" TabIndex="3" Text="Acessar" OnClick="btnAcessar_Click" CssClass="form-control-file" />
        </div>
        <footer class="page-footer font-small blue fixed-bottom bg-danger">
        <!-- Copyright -->
        <div class="footer-copyright text-center py-3 " style ="color:white">© 2018 Copyright: Be Mighty
                       
        </div>
        <!-- Copyright -->
    </footer>
    </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery-3.3.1.slim.min.js"></script>


    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/esm/popper.min.js"></script>
    <script src="../Scripts/popper-utils.min.js"></script>
    <script src="../Scripts/esm/popper-utils.min.js"></script>

    <script src="../Scripts/bootstrap.min.js"></script>     
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
