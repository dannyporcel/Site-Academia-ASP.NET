using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Inicial_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Modalidades modal = new Modalidades();
            DataSet dt = new DataSet();
            Conexao c = new Conexao();
            c.AbrirConexao();
            dt = modal.BuscarModalidades();

            dtlModalidades.DataSource = dt;
            dtlModalidades.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script> alert('É preciso se logar para entrar nesta página');window.location.href='../Autenticando/Login.aspx'</script>");
        }
                   
    }

    protected void singlebutton_enviar_Click(object sender, EventArgs e)
    {

    }
}