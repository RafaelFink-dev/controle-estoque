unit uCategoriasClasse;

interface

uses
  sysUtils, dmConexao, Classes, DB, Vcl.Dialogs;

type
  TCategorias = class

  private
    FidCategoria: Integer;
    FNome: String;
    FDescricao: String;
    FAtivo: String;

    procedure setIDCategoria(const Value: Integer);
    procedure setNome(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setAtivo(const Value: String);

  public
    constructor create;
    procedure Salvar;
    procedure Excluir;

  published
    Property IDCategoria: Integer read FidCategoria write setIDCategoria;
    Property Nome: String read FNome write setNome;
    Property Descricao: String read FDescricao write setDescricao;
    Property Ativo: String read FAtivo write setAtivo;

  end;

implementation

{ TGrupos }

procedure TCategorias.Excluir;
begin
 if FidCategoria > -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('DELETE FROM CATEGORIAS   ');
    dtmConexao.fbAux.SQL.Add(' WHERE IDCATEGORIA = :ID ');
    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidCategoria;
    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Categoria excluída com sucesso.')
  end;

end;

procedure TCategorias.Salvar;
begin
  if FidCategoria = -1 then
  begin
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add('INSERT INTO CATEGORIAS (NOME, DESCRICAO, ATIVO) VALUES (:NOME, :DESCRICAO, :ATIVO)');

    dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;
    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Categoria adicionada com sucesso!');
  end
  else
  begin
    // Caso contrário faz um update
    dtmConexao.fbAux.Close;
    dtmConexao.fbAux.SQL.Clear;
    dtmConexao.fbAux.SQL.Add(' UPDATE CATEGORIAS SET NOME = :NOME, DESCRICAO = :DESCRICAO, ATIVO = :ATIVO');
    dtmConexao.fbAux.SQL.Add(' WHERE IDCATEGORIA = :ID');

    dtmConexao.fbAux.ParamByName('ID').AsInteger := FidCategoria;
    dtmConexao.fbAux.ParamByName('NOME').AsString := FNome;
    dtmConexao.fbAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dtmConexao.fbAux.ParamByName('ATIVO').AsString := FAtivo;

    dtmConexao.fbAux.ExecSQL;

    ShowMessage('Categoria alterada com sucesso!');
  end;
end;


constructor TCategorias.create;
begin
  FidCategoria := -1;
end;

procedure TCategorias.setAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TCategorias.setDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCategorias.setIDCategoria(const Value: Integer);
begin
  FidCategoria := Value;
end;

procedure TCategorias.setNome(const Value: String);
begin
  FNome := Value;
end;


end.

