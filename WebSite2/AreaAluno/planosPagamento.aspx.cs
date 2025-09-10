using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AreaAluno_planosPagamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        Plano p = new Plano();
        Conexao c = new Conexao();
        DataSet dt1,dt2,dt3;
        int idPlano = Convert.ToInt32(Request.QueryString["Plano"]);
        int idAluno = (int)Session["idAluno"];
        c.AbrirConexao();

        //preenchendo gvPlanos
        dt1 = p.TodosPlanos(idAluno);
        gvPlanos.DataSource = dt1;
        gvPlanos.DataBind();

        
        //preenchendo gvModalidade
        dt2 = p.Modalidades(idPlano);
        gvModalidade.DataSource = dt2;
        gvModalidade.DataBind();
        gvModalidade.Visible = true;

        //preenchendo gvHistPagamento
        dt3 = p.HistPagamento(idPlano);
        gvHistPagamento.DataSource = dt3;
        gvHistPagamento.DataBind();
        gvHistPagamento.Visible = true;

        c.FecharConexao();       
    }
           
}