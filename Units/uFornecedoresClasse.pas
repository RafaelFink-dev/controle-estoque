unit uFornecedoresClasse;

interface

uses
  sysUtils, dmConexao, Classes, DB, Vcl.Dialogs;

type

  TFornecedores = class
  private
    FidFornecedor: Integer;
    FNome: String;
    FCnpj: String;
    FEndereco: String;
    FContato: String;
    FEmail: String;
    FCidade: String;
    FEstado: String;
    FCep: String;
    FAtivo: String;

    procedure setCidade(const Value: String);
    procedure setCnpj(const Value: String);
    procedure setContato(const Value: String);
    procedure setEmail(const Value: String);
    procedure setEndereco(const Value: String);
    procedure setEstado(const Value: String);
    procedure setIDFornecedor(const Value: Integer);
    procedure setNome(const Value: String);
    procedure setAtivo(const Value: String);
    procedure setCep(const Value: String);


  public
    constructor create;
    Procedure Salvar;
    Procedure Excluir;

  published
    Property IDFornecedor: Integer read FidFornecedor write setIDFornecedor;
    Property Nome: String read FNome write setNome;
    Property Cnpj: String read FCnpj write setCnpj;
    Property Endereco: String read FEndereco write setEndereco;
    Property Contato: String read FContato write setContato;
    Property Email: String read FEmail write setEmail;
    Property Cidade: String read FCidade write setCidade;
    Property Estado: String read FEstado write setEstado;
    Property Cep: String read FCep write setCep;
    Property Ativo: String read FAtivo write setAtivo;

  end;

implementation

{ TFornecedores }

procedure TFornecedores.Excluir;
begin
  if FidFornecedor > -1 then
  begin
    // Verificar se existem produtos vinculados a este fornecedor
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add
      ('SELECT COUNT(*) FROM produtos_e_fornecedores WHERE IDFORNECEDOR = :ID');
    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidFornecedor;
    dtmConexao.fbAux.Open;

    if dtmConexao.fbAux.Fields[0].AsInteger > 0 then
    begin
      // Existem produtos vinculados ao fornecedor, exibir mensagem de aviso
      ShowMessage
        ('N�o � poss�vel excluir o fornecedor. coloque-o como inativo ou exclua os produtos vinculados ao mesmo.');
    end
    else
    begin
      // N�o existem produtos vinculados, pode excluir o fornecedor
      dtmConexao.fbAux.Close;
      dtmConexao.fbAux.SQL.Clear;
      dtmConexao.fbAux.SQL.Add
        ('DELETE FROM FORNECEDORES WHERE IDFORNECEDOR = :ID');
      dtmConexao.fbAux.ParamByName('ID').AsInteger := FidFornecedor;
      dtmConexao.fbAux.ExecSQL;

      ShowMessage('Fornecedor exclu�do com sucesso.');
    end;
  end;
end;

procedure TFornecedores.Salvar;
begin
  if FidFornecedor = -1 then
  begin
    // Verificar se existe algum cnpj igual ja cadastrado
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('SELECT * FROM FORNECEDORES WHERE CNPJ = :CNPJ');
    dtmConexao.fbAux.ParamByName('CNPJ').AsString := FCnpj;
    dtmConexao.fbAux.Open;

    if dtmConexao.fbAux.Fields[0].AsInteger > 0 then
    begin
      // Existem produtos vinculados ao fornecedor, exibir mensagem de aviso
      ShowMessage
        ('N�o � poss�vel incluir o fornecedor. J� existe este CNPJ cadastrado.');
    end
    else
    begin
      dtmConexao.fbAux.Close;
      dtmConexao.fbAux.SQL.Clear;
      dtmConexao.fbAux.SQL.Add
        (' INSERT INTO FORNECEDORES ( NOME, CNPJ, ENDERECO, CONTATO, EMAIL, CIDADE,');
      dtmConexao.fbAux.SQL.Add(' ESTADO, CEP, ATIVO) VALUES ( ');
      dtmConexao.fbAux.SQL.Add
        (' :NOME, :CNPJ, :ENDERECO, :CONTATO, :EMAIL, :CIDADE, :ESTADO, :CEP, :ATIVO)');

      dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
      dtmConexao.fbAux.ParamByName('CNPJ').AsString := FCnpj;
      dtmConexao.fbAux.ParamByName('ENDERECO').AsString := FEndereco;
      dtmConexao.fbAux.ParamByName('CONTATO').AsString := FContato;
      dtmConexao.fbAux.ParamByName('EMAIL').AsString := FEmail;
      dtmConexao.fbAux.ParamByName('CIDADE').AsString := FCidade;
      dtmConexao.fbAux.ParamByName('ESTADO').AsString := FEstado;
      dtmConexao.fbAux.ParamByName('CEP').AsString := FCep;
      dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;

      dtmConexao.fbAux.ExecSQL;

      ShowMessage('Fornecedor adicionado com sucesso!');
    end;
  end
  else
  begin
    // Verificar se existe algum cnpj igual ja cadastrado
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('SELECT * FROM FORNECEDORES WHERE CNPJ = :CNPJ');
    dtmConexao.fbAux.SQL.Add('AND IDFORNECEDOR <> :IDFORNECEDOR');
    dtmConexao.fbAux.ParamByName('CNPJ').AsString := FCnpj;
    dtmConexao.fbAux.ParamByName('IDFORNECEDOR').AsInteger := IDFornecedor;
    dtmConexao.fbAux.Open;

    if dtmConexao.fbAux.Fields[0].AsInteger > 0 then
    begin
      ShowMessage('N�o � poss�vel alterar o CNPJ do fornecedor. J� existe este CNPJ cadastrado.');
    end
    else
    begin
      // Caso contr�rio faz um update
      dtmConexao.fbAux.Close;
      dtmConexao.fbAux.SQL.Clear;
      dtmConexao.fbAux.SQL.Add
        (' UPDATE FORNECEDORES SET NOME = :NOME, CNPJ = :CNPJ, ENDERECO = :ENDERECO, CONTATO = :CONTATO, EMAIL = :EMAIL, CIDADE = :CIDADE,');
      dtmConexao.fbAux.SQL.Add(' ESTADO = :ESTADO, CEP = :CEP, ATIVO = :ATIVO');
      dtmConexao.fbAux.SQL.Add(' WHERE IDFORNECEDOR = :ID');

      dtmConexao.fbAux.ParamByName('ID').AsInteger := FidFornecedor;
      dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
      dtmConexao.fbAux.ParamByName('CNPJ').AsString := FCnpj;
      dtmConexao.fbAux.ParamByName('ENDERECO').AsString := FEndereco;
      dtmConexao.fbAux.ParamByName('CONTATO').AsString := FContato;
      dtmConexao.fbAux.ParamByName('EMAIL').AsString := FEmail;
      dtmConexao.fbAux.ParamByName('CIDADE').AsString := FCidade;
      dtmConexao.fbAux.ParamByName('ESTADO').AsString := FEstado;
      dtmConexao.fbAux.ParamByName('CEP').AsString := FCep;
      dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;

      dtmConexao.fbAux.ExecSQL;

      ShowMessage('Fornecedor alterado com sucesso!');
    end;
  end;
end;

constructor TFornecedores.create;
begin
  FidFornecedor := -1;
end;

procedure TFornecedores.setAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TFornecedores.setCep(const Value: String);
begin
  FCep := Value;
end;

procedure TFornecedores.setCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TFornecedores.setCnpj(const Value: String);
begin
  FCnpj := Value;
end;

procedure TFornecedores.setContato(const Value: String);
begin
  FContato := Value;
end;

procedure TFornecedores.setEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TFornecedores.setEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TFornecedores.setEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TFornecedores.setIDFornecedor(const Value: Integer);
begin
  FidFornecedor := Value;
end;

procedure TFornecedores.setNome(const Value: String);
begin
  FNome := Value;
end;

end.
