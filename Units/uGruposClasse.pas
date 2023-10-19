unit uGruposClasse;

interface

uses
  sysUtils, dmConexao, Classes, DB, Vcl.Dialogs;

type

  TGrupos = class

  private
    FidGrupo: Integer;
    FNome: String;
    FDescricao: String;
    FAtivo: String;
    procedure setDescricao(const Value: String);
    procedure setIDGrupo(const Value: Integer);
    procedure setNome(const Value: String);
    procedure setAtivo(const Value: String);

  public
    constructor create;
    procedure Salvar;
    procedure Excluir;

  published
    Property IDGrupo: Integer read FidGrupo write setIDGrupo;
    Property Nome: String read FNome write setNome;
    Property Descricao: String read FDescricao write setDescricao;
    Property Ativo: String read FAtivo write setAtivo;

  end;

implementation

{ TGrupos }

procedure TGrupos.Excluir;
begin
 if FidGrupo > -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add
      ('SELECT COUNT(*) FROM PRODUTOS WHERE IDGRUPO = :ID');
    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidGrupo;
    dtmConexao.fbAux.Open;

    if dtmConexao.fbAux.Fields[0].AsInteger > 0 then
    begin
      ShowMessage
        ('N�o � poss�vel excluir o grupo. coloque-o como inativo ou exclua os produtos vinculados ao mesmo.');
    end
    else
    begin
      dtmConexao.fbAux.Close;
      dtmConexao.fbAux.SQL.Clear;
      dtmConexao.fbAux.SQL.Add('DELETE FROM GRUPOS   ');
      dtmConexao.fbAux.SQL.Add(' WHERE IDGRUPO = :ID ');
      dtmConexao.fbAux.ParamByName('ID').AsInteger := FidGrupo;
      dtmConexao.fbAux.ExecSQL;

      ShowMessage('Grupo exclu�do com sucesso.')
    end;
  end;
end;

procedure TGrupos.Salvar;
begin
  if FidGrupo = -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('INSERT INTO GRUPOS (NOME, DESCRICAO, ATIVO) VALUES (:NOME, :DESCRICAO, :ATIVO)');

    dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;
    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Grupo adicionado com sucesso!');
  end
  else
  begin
    // Caso contr�rio faz um update
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add(' UPDATE GRUPOS SET NOME = :NOME, DESCRICAO = :DESCRICAO, ATIVO = :ATIVO');
    dtmConexao.fbAux.SQL.Add(' WHERE IDGRUPO = :ID');

    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidGrupo;
    dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;

    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Grupo alterado com sucesso!');
  end;
end;


constructor TGrupos.create;
begin
  FidGrupo := -1;
end;

procedure TGrupos.setAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TGrupos.setDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TGrupos.setIDGrupo(const Value: Integer);
begin
  FidGrupo := Value;
end;

procedure TGrupos.setNome(const Value: String);
begin
  FNome := Value;
end;

end.

