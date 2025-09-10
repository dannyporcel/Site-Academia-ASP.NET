<%@ Page Title="" Language="C#" MasterPageFile="~/ModeloAreaAluno.master" AutoEventWireup="true" CodeFile="planosPagamento.aspx.cs" Inherits="AreaAluno_planosPagamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        
            <asp:GridView ID="gvPlanos" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="5"  HeaderStyle-BackColor="#ff5050"
            HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:BoundField DataField="nomePlano" HeaderText="Plano:" />
                    <asp:BoundField DataField="Observacao" HeaderText="Observação:"/>
                    <asp:BoundField DataField="plSituacao" HeaderText="Situação:" />
                    <asp:BoundField DataField="dataCadastro" HeaderText="Início:" />
                    <asp:BoundField DataField="PlanoValor" HeaderText="Valor:" />
                    <asp:BoundField DataField="ID_Plano" HeaderText="" Visible="false" /> 
                    <asp:HyperLinkField DataNavigateUrlFields="ID_Plano" DataNavigateUrlFormatString="planosPagamento.aspx?Plano={0}" NavigateUrl="Selecionar" Text="Selecionar" />
                </Columns>        
            </asp:GridView>
   
       
            <asp:GridView ID="gvModalidade" runat="server" AutoGenerateColumns="False" Visible="False" CellPadding="5" CellSpacing="5" 
                HeaderStyle-BackColor="#ff5050" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:BoundField DataField="nomeModal" HeaderText="Modalidade:" />
                    <asp:BoundField DataField="descricaoModal" HeaderText="Descrição:" />
                </Columns>
            </asp:GridView>
       
      
            <asp:GridView ID="gvHistPagamento" runat="server" AutoGenerateColumns="False" Visible="False" CellPadding="5" CellSpacing="5" 
                    HeaderStyle-BackColor="#ff5050" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:BoundField DataField="DataPagamento" HeaderText="Data do Pagamento" />
                    <asp:BoundField DataField="DataVencimento" HeaderText="Data do vencimento" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor Pago" />
                </Columns>
            </asp:GridView>
        
    
</asp:Content>

