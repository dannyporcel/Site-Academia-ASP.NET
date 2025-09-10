using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Aluno
/// </summary>
public class Aluno:Conexao
{   
       
    public Aluno()
    {
        //
        // TODO: Add constructor logic here
        //
    }   
    
    //PROPRIEDADES    

    private string _nomeAluno;
    public string NomeAluno
    {
        get { return _nomeAluno; }
        set { _nomeAluno = value; }
    }

    private string _CPF;
    public string CPF
    {
        get { return _CPF; }
        set { _CPF = value; }
    }

    private string _RG;
    public string RG
    {
        get { return _RG; }
        set { _RG = value; }
    }

    private DateTime _dataNascimento;
    public DateTime DataNascimento
    {
        get { return _dataNascimento; }
        set { _dataNascimento = value; }
    }
    
    private string _logradouro;
    public string Logradouro
    {
        get { return _logradouro; }
        set { _logradouro = value; }
    }

    private string _numeroResidencial;
    public string NumeroResidencial
    {
        get { return _numeroResidencial; }
        set { _numeroResidencial = value; }
    }

    private string _bairro;
    public string Bairro
    {
        get { return _bairro; }
        set { _bairro = value; }
    }

    private string _cidade;
    public string Cidade
    {
        get { return _cidade; }
        set { _cidade = value; }
    }

    private string _UF;
    public string UF
    {
        get { return _UF; }
        set { _UF = value; }
    }

    private string _CEP;
    public string CEP
    {
        get { return _CEP; }
        set { _CEP = value; }
    }

    private string _tel1;
    public string Tel1
    {
        get { return _tel1; }
        set { _tel1 = value; }
    }

    private string _tel2;
    public string Tel2
    {
        get { return _tel2; }
        set { _tel2 = value; }
    }

    private string _DDD1;
    public string DDD1
    {
        get { return _DDD1; }
        set { _DDD1 = value; }
    }

    private string _DDD2;
    public string DDD2
    {
        get { return _DDD2; }
        set { _DDD2 = value; }
    }

    private string _email;
    public string Email
    {
        get { return _email; }
        set { _email = value; }
    }

    private string _genero;
    public string Genero
    {
        get { return _genero; }
        set { _genero = value; }
    }

    private string _senha;
    public string Senha
    {
        get { return _senha; }
        set { _senha = value; }
    }

    private string _foto;
    public string Foto
    {
        get { return _genero; }
        set { _genero = value; }
    }
    //METODO QUE PREENCHE AS PROPRIEDADES DO ALUNO PELO VALOR ENCONTRADO NA TABELA.
    //Este método acessa o banco e preenche os atributos da classe aluno com os dados do banco
    public void AcessarAluno(int idAluno)
    {
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "SELECT * FROM tbl_Aluno WHERE ID_Aluno = @idAluno ";
        c.comando.Parameters.Add("@idAluno", SqlDbType.Int).Value = idAluno;

        dAdapter.SelectCommand = c.comando;
        dAdapter.Fill(dt);

        if (dt.Tables[0].DefaultView.Count == 1)
        {
            _nomeAluno      = dt.Tables[0].DefaultView[0].Row["nomeAluno"].ToString();
            _CPF            = dt.Tables[0].DefaultView[0].Row["CPF"].ToString();
            _RG             = dt.Tables[0].DefaultView[0].Row["RG"].ToString();
            _dataNascimento = Convert.ToDateTime(dt.Tables[0].DefaultView[0].Row["dataNasc"]);
            _logradouro     = dt.Tables[0].DefaultView[0].Row["Logradouro"].ToString();
            _numeroResidencial = dt.Tables[0].DefaultView[0].Row["numEndereco"].ToString();
            _bairro         = dt.Tables[0].DefaultView[0].Row["Bairro"].ToString();
            _cidade         = dt.Tables[0].DefaultView[0].Row["Cidade"].ToString();
            _UF             = dt.Tables[0].DefaultView[0].Row["UF"].ToString();
            _CEP            = dt.Tables[0].DefaultView[0].Row["CEP"].ToString();
            _tel1           = dt.Tables[0].DefaultView[0].Row["telefone"].ToString();
            _tel2           = dt.Tables[0].DefaultView[0].Row["telefone_2"].ToString();
            _DDD1           = dt.Tables[0].DefaultView[0].Row["DDD1"].ToString();
            _DDD2           = dt.Tables[0].DefaultView[0].Row["DDD2"].ToString();
            _email          = dt.Tables[0].DefaultView[0].Row["Email"].ToString();
            _genero         = dt.Tables[0].DefaultView[0].Row["Genero"].ToString();
            _foto           = "";

        }
        c.FecharConexao();
    }

    //Este método abre uma coneção com o banco e atualiza os dados pessoais do Aluno
    public void AtualizaAluno(int idAluno, string nome, string cpf, string rg, DateTime nascimento, string genero )
    {        
        Conexao c = new Conexao();
        c.AbrirConexao();
        
        c.comando.CommandText = "UPDATE tbl_Aluno set nomeAluno = @nome, CPF = @CPF, RG = @RG, dataNasc = @nascimento, Genero = @genero WHERE ID_Aluno = @idAluno";
        c.comando.Parameters.Add("@idAluno", SqlDbType.Int).Value = idAluno;
        c.comando.Parameters.Add("@nome", SqlDbType.VarChar).Value = nome;
        c.comando.Parameters.Add("@CPF", SqlDbType.VarChar).Value = cpf;
        c.comando.Parameters.Add("@RG", SqlDbType.VarChar).Value = rg;
        c.comando.Parameters.Add("@nascimento", SqlDbType.Date).Value = nascimento;
        c.comando.Parameters.Add("@genero", SqlDbType.VarChar).Value = genero;
        c.comando.ExecuteNonQuery();
        c.FecharConexao();
    }

    //Este método acessa o banco de dados e atualiza os dados do endereço do Aluno
    public void AtualizaEndAluno(int idAluno, string End, string num, string bairro, string cidade, string uf, string CEP)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        c.comando.CommandText = "UPDATE tbl_Aluno set Logradouro = @logradouro, numEndereco = @num, Bairro = @bairro, Cidade = @cidade," +
            " UF = @uf, CEP = @cep WHERE ID_Aluno = @idAluno";
        c.comando.Parameters.Add("@idAluno", SqlDbType.Int).Value = idAluno;
        c.comando.Parameters.Add("@logradouro", SqlDbType.VarChar).Value = End;
        c.comando.Parameters.Add("@num", SqlDbType.VarChar).Value = num;
        c.comando.Parameters.Add("@bairro", SqlDbType.VarChar).Value = bairro;
        c.comando.Parameters.Add("@cidade",SqlDbType.VarChar).Value = cidade;
        c.comando.Parameters.Add("@uf",SqlDbType.Char).Value = uf;
        c.comando.Parameters.Add("cep",SqlDbType.VarChar).Value = CEP;
        c.comando.ExecuteNonQuery();
        c.FecharConexao();
    }

    //Este método calcula a idade com base numa data de nascimento.
    public int CalculaIdade(DateTime dtNascimento)
    {
        int idade = DateTime.Now.Year - dtNascimento.Year;
        if (DateTime.Now.Month < dtNascimento.Month || (DateTime.Now.Month == dtNascimento.Month && DateTime.Now.Day < dtNascimento.Day))
            idade--;

        return idade;
    }     
}