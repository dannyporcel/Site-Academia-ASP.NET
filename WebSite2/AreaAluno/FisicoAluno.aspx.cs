using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AreaAluno_FisicoAluno : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet dt = new DataSet();
        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "select * from Fisico_Aluno where ID_Aluno=@idAluno";
        c.comando.Parameters.Add("@idAluno", SqlDbType.Int).Value = (int)Session["idAluno"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);

        gvFisico.DataSource = dt;
        gvFisico.DataBind();
    }
}