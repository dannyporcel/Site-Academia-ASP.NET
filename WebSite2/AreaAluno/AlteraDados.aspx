<%@ Page Title="" Language="C#" MasterPageFile="~/ModeloAreaAluno.master" AutoEventWireup="true" CodeFile="AlteraDados.aspx.cs" Inherits="AreaAluno_AlteraDados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container col-3 form-group border" style="margin-bottom:100px">
            <h4>Dados pessoais</h4>
            <br />
            <asp:Label ID="lblNome" runat="server" Text="Nome:"></asp:Label>
            <asp:TextBox ID="txtNomeAtu" runat="server" Enabled="False" CssClass="form-control-file"></asp:TextBox>
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control-file"></asp:TextBox>
            <br />
            <asp:Label ID="lblCPF" runat="server" Text="CPF:"></asp:Label>
            <asp:TextBox ID="txtCPFAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtCPF" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Label ID="lblRG" runat="server" Text="RG:" CssClass="form-check-label" ></asp:Label>
            <asp:TextBox ID="txtRGAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtRG" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Label ID="lblDataNasc" runat="server" Text="Nascimento:"></asp:Label>
            <asp:TextBox ID="txtDataNascAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Label ID="lblGenero" runat="server" Text="Genero:"></asp:Label>
            <asp:TextBox ID="txtGeneroAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtGenero" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Button ID="btnAlteraDados" runat="server" Text="Alterar" OnClick="btnAlteraDados_Click" />
        </div>

        <div class="container col-3 form-group border" style="margin-bottom:100px">
            <h4>Endereço</h4>
            <br />
            <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro:"></asp:Label>
            <asp:TextBox ID="txtLogradouroAtu" runat="server" Enabled="False" CssClass="form-control-file"></asp:TextBox>
            <asp:TextBox ID="txtLogradouro" runat="server" CssClass="form-control-file"></asp:TextBox>
            <br />
            <asp:Label ID="lblNum" runat="server" Text="Numero:"></asp:Label>
            <asp:TextBox ID="txtNumAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtNum" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
            <asp:TextBox ID="txtBairroAtu" runat="server" Enabled="False" CssClass="form-control-file"></asp:TextBox>
            <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control-file"></asp:TextBox>
            <br />
            <asp:Label ID="lblCidade" runat="server" Text="Cidade:"></asp:Label>
            <asp:TextBox ID="txtCidadeAtu" runat="server" Enabled="False" CssClass="form-control-file"></asp:TextBox>
            <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control-file"></asp:TextBox>
            <br />
            <asp:Label ID="lblUf" runat="server" Text="UF:"></asp:Label>
            <asp:TextBox ID="txtUfAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtUf" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Label ID="lblCEP" runat="server" Text="CEP:"></asp:Label>
            <asp:TextBox ID="txtCEPAtu" runat="server" Enabled="False" CssClass="form-check"></asp:TextBox>
            <asp:TextBox ID="txtCEP" runat="server" CssClass="form-check"></asp:TextBox>
            <br />
            <asp:Button ID="btnAlterarEnd" runat="server" Text="Alterar endereço" OnClick="btnAlterarEnd_Click" />
        </div>
        <div class="col-2"></div>
    
</asp:Content>

