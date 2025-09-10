<%@ Page Title="" Language="C#" MasterPageFile="~/ModeloAreaAluno.master" AutoEventWireup="true" CodeFile="BemVindo.aspx.cs" Inherits="AreaAluno_BemVindo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
   
        
        <div class="container col-3 border"style="padding-top:30px;padding-left:50px; margin-left:50px">
            <h5>Nome</h5>
            <asp:Label ID="lblNomeAluno" runat="server">Nome:</asp:Label><br /><br />            
            <h5>CPF</h5>
            <asp:Label ID="lblCPF" runat="server">CPF:</asp:Label><br /><br />             
            <h5>RG</h5>
            <asp:Label ID="lblRG" runat="server">RG:</asp:Label><br /><br />             
            <h5>Idade</h5>
            <asp:Label ID="lblIdade" runat="server">Idade:</asp:Label><br /><br />
            <h5>Telefone</h5>
            <asp:Label ID="lblTel" runat="server">Telefone:</asp:Label><br /><br />
            <h5>E-mail:</h5>
            <asp:Label ID="lblEmail" runat="server">Email:</asp:Label><br /><br />
        </div>
        <div class="container col-3 border" style="padding-top:30px; padding-left:50px; margin-right:50px">
            <h5>Plano</h5>
            <asp:Label ID="lblNomePlano" runat="server" >Plano:</asp:Label><br /><br />
            <h5>Observação</h5>
            <asp:Label ID="lblObservacao" runat="server" /><br /><br />
            <h5>Situação</h5>
            <asp:Label ID="lblSituacao" runat="server" /><br /><br />           
            <h5>Mensalidade</h5>
            <asp:Label ID="lblValorPlano" runat="server" >Mensalidade:</asp:Label><br /><br />
            <h5>Inicio</h5>
            <asp:Label ID="lblInicio" runat="server" >Inicio:</asp:Label>            
        </div>

        <div class="col-2"></div>        
    
    
    
</asp:Content>

