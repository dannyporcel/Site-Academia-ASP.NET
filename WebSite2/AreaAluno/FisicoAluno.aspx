<%@ Page Title="" Language="C#" MasterPageFile="~/ModeloAreaAluno.master" AutoEventWireup="true" CodeFile="FisicoAluno.aspx.cs" Inherits="AreaAluno_FisicoAluno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvFisico" runat="server" AutoGenerateColumns="False" CellPadding="7" CellSpacing="5"  HeaderStyle-BackColor="#ff5050"
            HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" CssClass="container offset-6" style="margin-top:100px;">
        <Columns>
            <asp:BoundField DataField="Data_Med" HeaderText="Medido em:" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Altura" HeaderText="Altura:" />
            <asp:BoundField DataField="Peso" HeaderText="Peso:" />
            <asp:BoundField DataField="Bracos" HeaderText="Braços:" />
            <asp:BoundField DataField="Abdomen" HeaderText="Abdomem:" />
            <asp:BoundField DataField="Pernas" HeaderText="Pernas:" />
        </Columns>

<HeaderStyle HorizontalAlign="Center" BackColor="#FF5050" ForeColor="White"></HeaderStyle>

<RowStyle HorizontalAlign="Center"></RowStyle>
    </asp:GridView>
</asp:Content>

