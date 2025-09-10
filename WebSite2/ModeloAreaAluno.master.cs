using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModeloAreaAluno : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((string)Session["logado"]!= "1")
        {            
            Response.Redirect("../Autenticando/Login.aspx");
        }
        else
        {

        }
        if (Session["idAluno"]!= null)
        {
            int idAluno = (int)Session["idAluno"];
            Aluno aluno = new Aluno();
            aluno.AcessarAluno(idAluno);
            fotoAluno.ImageUrl = "imagens/pessoa.jpg";
            lblBemVindo.Text = "Usuário: "+aluno.NomeAluno;
            lblBemVindo.ForeColor = System.Drawing.Color.White;
        }       
    }

    protected void trocarFoto_Click(object sender, EventArgs e)
    {

    }

    protected void fisicoAluno_Click(object sender, EventArgs e)
    {
        Response.Redirect("FisicoAluno.aspx");
    }

    protected void alteraSenha_Click(object sender, EventArgs e)
    {
        Response.Redirect("alteraSenha.aspx");
    }    

    protected void btnEditarDados_Click1(object sender, EventArgs e)
    {
        Response.Redirect("AlteraDados.aspx");
    }

    protected void btnPlanos_Click1(object sender, EventArgs e)
    {
        Response.Redirect("planosPagamento.aspx");
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../AreaAluno/BemVindo.aspx");
    }

    protected void btnSair_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Autenticando/Encerrar.aspx");
    }
}
