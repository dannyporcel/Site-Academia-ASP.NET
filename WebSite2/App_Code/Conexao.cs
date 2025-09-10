using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Classe generica para conexão com o banco
/// </summary>
public class Conexao
{
    public SqlConnection conexao;
    public SqlCommand comando;
    string StringDeConexao = "Server=localhost;DataBase=BeMighty;user id=sa;password=etesp;";
    //string StringDeConexao = "Server=DESKTOP-UHRJTON\\SQLEXPRESS;DataBase=BeMighty;user id=sa;password=etesp";

    public Conexao()
    {
        // TODO: Add constructor logic here        
    }
    public void AbrirConexao()
    {
        conexao = new SqlConnection(StringDeConexao);
        conexao.Open();
        comando = new SqlCommand();
        comando.Connection = conexao;
    }

    public void FecharConexao()
    {
        conexao.Close();
        conexao = null;
        comando = null;
    }

    public void StringConsulta(string consulta)
    {
        comando.CommandText = consulta;
    }
}