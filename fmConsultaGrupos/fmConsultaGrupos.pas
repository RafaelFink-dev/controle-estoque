unit fmConsultaGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.StdCtrls, fmCadastrarGrupos,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmConexao, uGruposClasse,
  Vcl.Mask, fmRelatorioGrupos;

type
  TformConsultaGrupos = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnRodape2: TPanel;
    pnTopo: TPanel;
    gridGrupos: TDBGrid;
    pnIncluir: TPanel;
    imIncluir: TImage;
    pnEditar: TPanel;
    imSalvar: TImage;
    pnExcluir: TPanel;
    imExcluir: TImage;
    pnFechar: TPanel;
    imFechar: TImage;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    pnPesquisar: TPanel;
    imPesquisar: TImage;
    lbGrupos: TLabel;
    dsGrupos: TDataSource;
    fbGrupos: TFDQuery;
    lbPesquisa: TLabel;
    pnLimparFiltros: TPanel;
    Image1: TImage;
    edPesquisa: TEdit;
    pnRelatorio: TPanel;
    imRelatorio: TImage;
    fbGruposIDGRUPO: TIntegerField;
    fbGruposNOME: TStringField;
    fbGruposDESCRICAO: TStringField;
    fbGruposATIVO: TStringField;
    fbGruposSITUACAO: TStringField;
    procedure pnIncluirMouseEnter(Sender: TObject);
    procedure pnIncluirMouseLeave(Sender: TObject);
    procedure pnEditarMouseEnter(Sender: TObject);
    procedure pnEditarMouseLeave(Sender: TObject);
    procedure pnExcluirMouseEnter(Sender: TObject);
    procedure pnExcluirMouseLeave(Sender: TObject);
    procedure pnFecharClick(Sender: TObject);
    procedure pnFecharMouseEnter(Sender: TObject);
    procedure pnFecharMouseLeave(Sender: TObject);
    procedure pnPesquisarMouseEnter(Sender: TObject);
    procedure pnPesquisarMouseLeave(Sender: TObject);
    procedure pnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnEditarClick(Sender: TObject);
    procedure pnExcluirClick(Sender: TObject);
    procedure pnLimparFiltrosMouseEnter(Sender: TObject);
    procedure pnLimparFiltrosMouseLeave(Sender: TObject);
    procedure pnPesquisarClick(Sender: TObject);
    procedure pnLimparFiltrosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnRelatorioMouseEnter(Sender: TObject);
    procedure pnRelatorioMouseLeave(Sender: TObject);
    procedure pnRelatorioClick(Sender: TObject);
    procedure cbFiltrosExit(Sender: TObject);
    procedure fbGruposCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaGrupos: TformConsultaGrupos;

implementation

{$R *.dfm}

procedure TformConsultaGrupos.cbFiltrosExit(Sender: TObject);
begin
  if cbFiltros.ItemIndex = 0 then
  begin
    edPesquisa.Clear;
    edPesquisa.NumbersOnly := True;
  end
  else
    edPesquisa.Clear;
    edPesquisa.NumbersOnly := False;
end;

procedure TformConsultaGrupos.fbGruposCalcFields(DataSet: TDataSet);
begin
 if fbGrupos.FieldByName('ATIVO').AsString = 'T' then
   fbGruposSITUACAO.AsString := 'Ativo'
 else
    fbGruposSITUACAO.AsString := 'Inativo';
end;

procedure TformConsultaGrupos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(formConsultaGrupos);
end;

procedure TformConsultaGrupos.FormShow(Sender: TObject);
begin
  fbGrupos.Connection := dtmConexao.Conexao;
  fbGrupos.Open;
end;

procedure TformConsultaGrupos.pnEditarClick(Sender: TObject);
var
  telaGrupos: TformCadastrarGrupos;
begin
  if not fbGrupos.IsEmpty then
  begin
    try
      telaGrupos := TformCadastrarGrupos.Create(Self);
      telaGrupos.Caption := 'ALTERA��O DE GRUPOS';
      telaGrupos.edCodigo.Text := fbGrupos.FieldByName('IDGRUPO').AsString;
      telaGrupos.edNome.Text := fbGrupos.FieldByName('NOME').AsString;
      telaGrupos.edDescricao.Text := fbGrupos.FieldByName('DESCRICAO').AsString;

      if fbGrupos.FieldByName('ATIVO').AsString = 'T' then
      begin
        telaGrupos.cbAtivo.Checked := True;
      end
      else
      begin
        telaGrupos.cbAtivo.Checked := False;
      end;

      telaGrupos.ShowModal;
    finally
      FreeAndNil(telaGrupos);
      fbGrupos.Refresh;
    end;
  end
  else
  begin
    ShowMessage('Nenhum grupo para alterar!');
  end;
end;
procedure TformConsultaGrupos.pnEditarMouseEnter(Sender: TObject);
begin
  pnEditar.Color := clSilver;
end;

procedure TformConsultaGrupos.pnEditarMouseLeave(Sender: TObject);
begin
  pnEditar.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnExcluirClick(Sender: TObject);
var
  gruposClasse : TGrupos;
begin
  try
    if MessageDlg('Deseja excluir permanentemente esse grupo?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      gruposClasse := TGrupos.Create;
      gruposClasse.IDGrupo := fbGrupos.FieldByName('IDGRUPO').AsInteger;
      gruposClasse.Excluir;

      FreeAndNil(gruposClasse);
    end;
  finally
    fbGrupos.Refresh;
  end;
end;

procedure TformConsultaGrupos.pnExcluirMouseEnter(Sender: TObject);
begin
  pnExcluir.Color := clSilver;
end;

procedure TformConsultaGrupos.pnExcluirMouseLeave(Sender: TObject);
begin
  pnExcluir.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformConsultaGrupos.pnFecharMouseEnter(Sender: TObject);
begin
  pnFechar.Color := clSilver;
end;

procedure TformConsultaGrupos.pnFecharMouseLeave(Sender: TObject);
begin
  pnFechar.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnIncluirClick(Sender: TObject);
var
  telaCadastrarGrupos : TformCadastrarGrupos;
begin
  try
    telaCadastrarGrupos := TformCadastrarGrupos.Create(Self);
    telaCadastrarGrupos.ShowModal;
  finally
    FreeAndNil(telaCadastrarGrupos);
    fbGrupos.Refresh;
  end;
end;

procedure TformConsultaGrupos.pnIncluirMouseEnter(Sender: TObject);
begin
  pnIncluir.Color := clSilver;
end;

procedure TformConsultaGrupos.pnIncluirMouseLeave(Sender: TObject);
begin
  pnIncluir.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnLimparFiltrosClick(Sender: TObject);
begin
  cbFiltros.ItemIndex := -1;
  edPesquisa.Clear;
  fbGrupos.Filtered := False;
end;

procedure TformConsultaGrupos.pnLimparFiltrosMouseEnter(Sender: TObject);
begin
  pnLimparFiltros.Color := clSilver;
end;

procedure TformConsultaGrupos.pnLimparFiltrosMouseLeave(Sender: TObject);
begin
  pnLimparFiltros.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnPesquisarClick(Sender: TObject);
begin

  if (cbFiltros.ItemIndex <> -1) and (edPesquisa.Text <> '') then
  begin
    if cbFiltros.ItemIndex = 0 then
    begin
      fbGrupos.Filtered := False;
      fbGrupos.Filter := 'IDGRUPO = ' + QuotedStr(edPesquisa.Text);
      fbGrupos.Filtered := True;
    end
    else if cbFiltros.ItemIndex = 1 then
    begin
      fbGrupos.Filtered := False;
      fbGrupos.Filter := 'NOME LIKE ' + QuotedStr('%' + edPesquisa.Text + '%');
      fbGrupos.Filtered := True;
    end;
  end
  else
    ShowMessage('Necess�rio selecionar algum filtro e preencher uma descri��o!');
end;

procedure TformConsultaGrupos.pnPesquisarMouseEnter(Sender: TObject);
begin
  pnPesquisar.Color := clSilver;
end;

procedure TformConsultaGrupos.pnPesquisarMouseLeave(Sender: TObject);
begin
  pnPesquisar.Color := clMenuHighlight;
end;

procedure TformConsultaGrupos.pnRelatorioClick(Sender: TObject);
begin
  formRelatorioGrupos := TformRelatorioGrupos.Create(Self);
  formRelatorioGrupos.relatGrupos.Preview();
end;

procedure TformConsultaGrupos.pnRelatorioMouseEnter(Sender: TObject);
begin
  pnRelatorio.Color := clSilver;
end;

procedure TformConsultaGrupos.pnRelatorioMouseLeave(Sender: TObject);
begin
  pnRelatorio.Color := clMenuHighlight;
end;

end.
