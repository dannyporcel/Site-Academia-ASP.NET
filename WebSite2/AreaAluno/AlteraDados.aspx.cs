using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AreaAluno_AlteraDados : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Aluno aluno = new Aluno();
        int idAluno = Convert.ToInt32(Session["idAluno"]);
        aluno.AcessarAluno(idAluno);

        txtNomeAtu.Text         = aluno.NomeAluno;
        txtCPFAtu.Text          = aluno.CPF;
        txtRGAtu.Text           = aluno.RG;
        txtGeneroAtu.Text       = aluno.Genero;
        txtDataNascAtu.Text     = aluno.DataNascimento.ToShortDateString();
        txtLogradouroAtu.Text   = aluno.Logradouro;
        txtNumAtu.Text          = aluno.NumeroResidencial;
        txtBairroAtu.Text       = aluno.Bairro;
        txtCidadeAtu.Text       = aluno.Cidade;
        txtUfAtu.Text           = aluno.UF;
        txtCEPAtu.Text          = aluno.CEP;
    }

    
    protected void btnAlteraDados_Click(object sender, EventArgs e)
    {        
        Aluno aluno = new Aluno();
        int idAluno = Convert.ToInt32(Session["idAluno"]);
        string nome, cpf, rg, genero;
        DateTime nascimento;

        if (txtNome.Text.Equals(""))
        {
             nome = txtNomeAtu.Text;
        }
        else
        {
            nome = txtNome.Text;
        }

        if (txtCPF.Text.Equals(""))
        {
            cpf = txtCPFAtu.Text;
        }
        else
        {
            cpf = txtCPF.Text;
        }

        if (txtRG.Text.Equals(""))
        {            
            rg = txtRGAtu.Text;
        }
        else
        {
            rg = txtRG.Text;
        }

        if (txtGenero.Text.Equals(""))
        {
            genero = txtGeneroAtu.Text;
        }
        else
        {
            genero = txtGenero.Text;            
        }

        if (txtDataNasc.Text.Equals(""))
        {
            nascimento = Convert.ToDateTime(txtDataNascAtu.Text);
        }
        else
        {
            nascimento = Convert.ToDateTime(txtDataNasc.Text);            
        }

        aluno.AtualizaAluno(idAluno,nome,cpf,rg,nascimento,genero);
        Response.Redirect("AlteraDados.aspx");
    }


    protected void btnAlterarEnd_Click(object sender, EventArgs e)
    {
        Aluno aluno = new Aluno();
        int idAluno = (int) Session["idAluno"];

        string end, num, bairro, cidade, UF, CEP; 

        if (txtLogradouro.Text.Equals(""))
        {
            end = txtLogradouroAtu.Text;
        }
        else
        {
            end = txtLogradouro.Text;
        }

        if (txtNum.Text.Equals(""))
        {
            num = txtNumAtu.Text;
        }
        else
        {
           num = txtNum.Text;
        }

        if (txtBairro.Text.Equals(""))
        {
            bairro = txtBairroAtu.Text;
        }
        else
        {
            bairro = txtBairro.Text;
        }

        if (txtCidade.Text.Equals(""))
        {
            cidade = txtCidadeAtu.Text;
        }
        else
        {
            cidade = txtCidade.Text;
        }

        if (txtUf.Text.Equals(""))
        {
            UF = txtUfAtu.Text;
        }
        else
        {
            UF = txtUf.Text;
        }

        if (txtCEP.Text.Equals(""))
        {
            CEP = txtCEPAtu.Text;
        }
        else
        {
            CEP = txtCEP.Text;
        }
         

        aluno.AtualizaEndAluno(idAluno, end, num, bairro, cidade, UF, CEP);
        Response.Redirect("AlteraDados.aspx");
    }
    
}