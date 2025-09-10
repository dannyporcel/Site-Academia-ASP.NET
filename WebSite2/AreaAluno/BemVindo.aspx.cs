using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AreaAluno_BemVindo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Aluno aluno = new Aluno();
        int idAluno = Convert.ToInt32(Session["idAluno"]);
        aluno.AcessarAluno(idAluno);
        
        lblNomeAluno.Text   = aluno.NomeAluno;
        lblCPF.Text         = aluno.CPF;
        lblRG.Text          = aluno.RG;
        lblIdade.Text       = aluno.CalculaIdade(aluno.DataNascimento).ToString();
        lblTel.Text         = aluno.Tel1;
        lblEmail.Text       = aluno.Email;


        Plano plano = new Plano();
        plano.AcessoPlanoAtual(idAluno);

        lblNomePlano.Text = plano.NomePlano;
        lblObservacao.Text = plano.Observacao;
        lblSituacao.Text = plano.Situacao;
        lblValorPlano.Text = plano.Valor.ToString();
        lblInicio.Text = plano.Inicio.ToShortDateString();
    }   
    
}