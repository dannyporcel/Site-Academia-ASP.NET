using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Modalidades
/// </summary>
public class Modalidades
{
    public Modalidades()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataSet BuscarModalidades()
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "SELECT nomeModal, descricaoModal  FROM tbl_Modalidade";       

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);
        c.FecharConexao();

        return dt;
    }
}