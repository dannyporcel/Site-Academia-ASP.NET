using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Plano
/// </summary>
public class Plano
{
    public Plano()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //PROPRIEDADES
    private string _nomePlano;
    public string NomePlano
    {
        get { return _nomePlano; }
        set { _nomePlano = value; }
    }

    private string _observacao;
    public string Observacao
    {
        get { return _observacao; }
        set { _observacao = value; }
    }

    private string _situacao;
    public string Situacao
    {
        get { return _situacao; }
        set { _situacao = value; }
    }

    private DateTime _inicio;
    public DateTime Inicio
    {
        get { return _inicio; }
        set { _inicio = value; }
    }

    private decimal _valor;
    public decimal Valor
    {
        get { return _valor; }
        set { _valor = value; }
    }

    //Preenchendo os atributos da classe com os dados do ultimo plano do aluno.
    public void AcessoPlanoAtual(int idAluno)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        Conexao c = new Conexao();
        c.AbrirConexao();

        //c.comando.CommandText = "SELECT * FROM tbl_PlanoAluno WHERE ID_Plano = @idPlano";
        c.comando.CommandText = "SELECT TOP 1 * FROM tbl_PlanoAluno WHERE ID_Aluno = @idAluno ORDER BY ID_Plano DESC";
        c.comando.Parameters.Add("idAluno", SqlDbType.Int).Value = idAluno;

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);

        if (dt.Tables[0].DefaultView.Count != 0)
        {
            _nomePlano = dt.Tables[0].DefaultView[0].Row["nomePlano"].ToString();
            _observacao = dt.Tables[0].DefaultView[0].Row["Observacao"].ToString();
            _situacao = dt.Tables[0].DefaultView[0].Row["plSituacao"].ToString();
            _inicio = Convert.ToDateTime(dt.Tables[0].DefaultView[0].Row["dataCadastro"]);
            _valor = Convert.ToDecimal(dt.Tables[0].DefaultView[0].Row["PlanoValor"]);
        }
    }//FIM AcessoPlanoAtual

    //Retornando todos os planos do aluno corrente
    public DataSet TodosPlanos (int idAluno)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        Conexao c = new Conexao();
        c.AbrirConexao();
        
        c.comando.CommandText = "SELECT ID_Plano, nomePlano, Observacao, plSituacao, convert(varchar(10), dataCadastro, 103) as dataCadastro, PlanoValor FROM tbl_PlanoAluno WHERE ID_Aluno = @idAluno";
        c.comando.Parameters.Add("idAluno", SqlDbType.Int).Value = idAluno;

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);

        return dt;
    }

    //Retornando Modalidades
    public DataSet Modalidades (int idPlano)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "SELECT nomeModal, descricaoModal FROM tbl_Modalidade WHERE  ID_Modalidade in (select ID_Modalidade from tbl_PlanoModal where ID_Plano = @idPlano)";
        c.comando.Parameters.Add("idPlano", SqlDbType.Int).Value = idPlano;

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);
        c.FecharConexao();

        return dt;
    }

    //Retornando Histórico de pagamento.
    public DataSet HistPagamento(int idPlano)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        Conexao c = new Conexao();
        c.AbrirConexao();
        c.comando.CommandText = "select convert(varchar(10), DataPagamento, 103) as DataPagamento, convert(varchar(10), DataVencimento, 103) as DataVencimento, Valor from tbl_PagamentoPlano where ID_PlanoAluno = @idPlano";
        c.comando.Parameters.Add("idPlano", SqlDbType.Int).Value = idPlano;

        dataAdapter.SelectCommand = c.comando;
        dataAdapter.Fill(dt);
        c.FecharConexao();

        return dt;
    }
}