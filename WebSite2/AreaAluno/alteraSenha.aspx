<%@ Page Title="" Language="C#" MasterPageFile="~/ModeloAreaAluno.master" AutoEventWireup="true" CodeFile="alteraSenha.aspx.cs" Inherits="AreaAluno_alteraSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container col-5 border" style="padding-top:20px; padding-bottom:35px; margin-top:150px">

        <asp:Label ID="lblCPF" runat="server" Text="Seu CPF" AssociatedControlID="txtCPF"></asp:Label>
        <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control-file"></asp:TextBox>
        <br />
        <asp:Label ID="lblSenhaAtual" runat="server" Text="Senha atual" AssociatedControlID="txtSenhaAtual"></asp:Label>
        <asp:TextBox ID="txtSenhaAtual" runat="server" CssClass="form-control-file" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblNovaSenha" runat="server" Text="Nova senha" AssociatedControlID="txtNovaSenha"></asp:Label>
        <asp:TextBox ID="txtNovaSenha" runat="server" CssClass="form-control-file" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblNovaSenhaRep" runat="server" Text="Repita nova senha" AssociatedControlID="txtNovaSenhaRep"></asp:Label>
        <asp:TextBox ID="txtNovaSenhaRep" runat="server" CssClass="form-control-file" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="btnConfirmar" runat="server" Text="Atualizar Senha" OnClick="btnConfirmar_Click"  CssClass="form-control-file btn-danger"/>

    </div>
</asp:Content>

