using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AreaAluno_alteraSenha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        string CPF,senhaAtual, novaSenha, novaSenhaRep;
        Aluno aluno = new Aluno();
        int idAluno = (int)Session["idAluno"];
        if (txtCPF.Text !="" && txtNovaSenha.Text != "" && txtNovaSenhaRep.Text != "" && txtSenhaAtual.Text != "")
        {
            CPF = txtCPF.Text;
            senhaAtual = txtSenhaAtual.Text;
            novaSenha = txtNovaSenha.Text;
            novaSenhaRep = txtNovaSenhaRep.Text;

            AtualizaSenha(CPF, senhaAtual, novaSenha, novaSenhaRep);
        }
        else
        {
            Response.Write("Preencha todos os campos");
        }

    }

    public void AtualizaSenha(string CPF, string senhaAtual, string novaSenha, string repNovaSenha)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        string senha;
        Conexao c = new Conexao();

        try
        {           
            c.AbrirConexao();
            c.comando.CommandText = "SELECT Senha FROM tbl_Aluno WHERE CPF = @CPF ";
            c.comando.Parameters.Add("@CPF", SqlDbType.VarChar).Value = CPF;
            dAdapter.SelectCommand = c.comando;
            dAdapter.Fill(dt);

            senha = dt.Tables[0].DefaultView[0].Row["Senha"].ToString();

            if (senha != "")
            {
                if (!senha.Equals(novaSenha) && novaSenha.Equals(repNovaSenha) && senha.Equals(senhaAtual))
                {
                    String str1 = "Update tbl_Aluno set Senha = " + novaSenha + " where CPF like " + CPF;
                    c.comando.CommandText = str1;
                    c.comando.ExecuteNonQuery();
                    c.conexao.Close();
                    Response.Write("Sucesso");
                }
                else
                {
                    Response.Write("Verifique se os dados estão corretos e tente novamente.");
                }
            }

        }
        catch (Exception)
        {
            Response.Write("Não foi possível encontrar o CPF descrito!");
        }

       

        
           
        

        c.FecharConexao();
    }
}