unit uUnidadesMedidaClasse;

interface

uses
  sysUtils, dmConexao, Classes, DB, Vcl.Dialogs;

type

  TUnidade = class

  private
    FidUnidade: Integer;
    FDescricao: String;
    FAbreviacao: String;
    FAtivo: String;
    procedure setAbreviacao(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setIDUnidade(const Value: Integer);
    procedure setAtivo(const Value: String);


  public
    constructor create;
    procedure Salvar;
    procedure Excluir;

  published
    Property IDUnidade: Integer read FIDUnidade write setIDUnidade;
    Property Descricao: String read FDescricao write setDescricao;
    Property Abreviacao: String read FAbreviacao write setAbreviacao;
    Property Ativo: String read FAtivo write setAtivo;

  end;

implementation

{ TGrupos }

constructor TUnidade.create;
begin
  IDUnidade := -1;
end;

procedure TUnidade.Excluir;
begin
 if IDUnidade > -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add
      ('SELECT COUNT(*) FROM PRODUTOS WHERE IDUNIDADEMEDIDA = :ID');
    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidUnidade;
    dtmConexao.fbAux.Open;

    if dtmConexao.fbAux.Fields[0].AsInteger > 0 then
    begin
      ShowMessage
        ('N�o � poss�vel excluir a unidade. coloque-a como inativo ou exclua os produtos vinculados a mesma.');
    end
    else
    begin

    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('DELETE FROM UNIDADESMEDIDA   ');
    dtmConexao.fbAux.SQL.Add(' WHERE IDUNIDADE = :ID ');
    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidUnidade;
    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Unidade exclu�da com sucesso.')
    end;
  end;
end;

procedure TUnidade.Salvar;
begin
  if IDUnidade = -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('INSERT INTO UNIDADESMEDIDA (DESCRICAO, ABREVIACAO, ATIVO) VALUES (:DESCRICAO, :ABREVIACAO, :ATIVO)');

    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ABREVIACAO').AsString := FAbreviacao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;
    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Unidade adicionada com sucesso!');
  end
  else
  begin
    // Caso contr�rio faz um update
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add(' UPDATE UNIDADESMEDIDA SET DESCRICAO = :DESCRICAO, ABREVIACAO = :ABREVIACAO, ATIVO = :ATIVO');
    dtmConexao.fbAux.SQL.Add(' WHERE IDUNIDADE = :ID');

    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidUnidade;
    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ABREVIACAO').AsString := FAbreviacao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;

    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Unidade alterada com sucesso!');
  end;
end;

procedure TUnidade.setAbreviacao(const Value: String);
begin
  FAbreviacao := Value;
end;

procedure TUnidade.setAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TUnidade.setDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TUnidade.setIDUnidade(const Value: Integer);
begin
  FIDUnidade := Value;
end;

end.

