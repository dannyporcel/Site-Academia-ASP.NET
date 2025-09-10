using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Autenticando_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAcessar_Click(object sender, EventArgs e)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        string cpf, senha;
        cpf = txtCPF.Text;
        senha = txtSenha.Text;

        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "SELECT * FROM tbl_Aluno WHERE CPF = @cpf AND Senha = @senha";
        c.comando.Parameters.Add("@cpf", SqlDbType.VarChar).Value = cpf;
        c.comando.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha;

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);

        if (dt.Tables[0].DefaultView.Count == 1)
        {
            Session["logado"] = "1";
            Session["idAluno"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["ID_Aluno"].ToString());
            Response.Redirect("../AreaAluno/BemVindo.aspx");
            c.FecharConexao();
        }
        else
        {
            Response.Write("CPF ou senha incorretos");
            c.FecharConexao();
        }
    }
}