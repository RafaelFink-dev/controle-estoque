unit fmConsultaCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, fmCadastrarCategorias,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmConexao, uCategoriasClasse,
  Vcl.Mask, fmRelatorioCategoria;

type
  TformConsultaCategorias = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnRodape2: TPanel;
    pnIncluir: TPanel;
    imIncluir: TImage;
    pnEditar: TPanel;
    imSalvar: TImage;
    pnExcluir: TPanel;
    imExcluir: TImage;
    pnFechar: TPanel;
    imFechar: TImage;
    gridCategorias: TDBGrid;
    pnTopo: TPanel;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    pnPesquisar: TPanel;
    imPesquisar: TImage;
    lbCategorias: TLabel;
    dsCategorias: TDataSource;
    fbCategorias: TFDQuery;
    lbPesquisa: TLabel;
    pnLimparFiltros: TPanel;
    Image1: TImage;
    pnRelatorio: TPanel;
    imRelatorio: TImage;
    edPesquisa: TEdit;
    fbCategoriasIDCATEGORIA: TIntegerField;
    fbCategoriasNOME: TStringField;
    fbCategoriasDESCRICAO: TStringField;
    fbCategoriasATIVO: TStringField;
    fbCategoriasSITUACAO: TStringField;
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
    procedure pnPesquisarClick(Sender: TObject);
    procedure pnLimparFiltrosClick(Sender: TObject);
    procedure pnLimparFiltrosMouseEnter(Sender: TObject);
    procedure pnLimparFiltrosMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnRelatorioMouseEnter(Sender: TObject);
    procedure pnRelatorioMouseLeave(Sender: TObject);
    procedure pnRelatorioClick(Sender: TObject);
    procedure cbFiltrosExit(Sender: TObject);
    procedure fbCategoriasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaCategorias: TformConsultaCategorias;

implementation

{$R *.dfm}

procedure TformConsultaCategorias.cbFiltrosExit(Sender: TObject);
begin
  if cbFiltros.ItemIndex = 0 then
  begin
    edPesquisa.NumbersOnly := True;
    edPesquisa.Clear;
  end
  else
    edPesquisa.Clear;
    edPesquisa.NumbersOnly := False;
end;

procedure TformConsultaCategorias.fbCategoriasCalcFields(DataSet: TDataSet);
begin
 if fbCategorias.FieldByName('ATIVO').AsString = 'T' then
   fbCategoriasSITUACAO.AsString := 'Ativo'
 else
    fbCategoriasSITUACAO.AsString := 'Inativo';
end;

procedure TformConsultaCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(formConsultaCategorias);
end;

procedure TformConsultaCategorias.FormShow(Sender: TObject);
begin
  fbCategorias.Connection := dtmConexao.Conexao;
  fbCategorias.Open;
end;

procedure TformConsultaCategorias.pnEditarClick(Sender: TObject);
var
  telaCategorias: TformCadastrarCategorias;
begin
  if not fbCategorias.IsEmpty then
  begin
    try
      telaCategorias := TformCadastrarCategorias.Create(Self);
      telaCategorias.Caption := 'ALTERA��O DE CATEGORIAS';
      telaCategorias.edCodigo.Text := fbCategorias.FieldByName('IDCATEGORIA').AsString;
      telaCategorias.edNome.Text := fbCategorias.FieldByName('NOME').AsString;
      telaCategorias.edDescricao.Text := fbCategorias.FieldByName('DESCRICAO').AsString;

      if fbCategorias.FieldByName('ATIVO').AsString = 'T' then
      begin
        telaCategorias.cbAtivo.Checked := True;
      end
      else
      begin
        telaCategorias.cbAtivo.Checked := False;
      end;

      telaCategorias.ShowModal;
    finally
      FreeAndNil(telaCategorias);
      fbCategorias.Refresh;
    end;
  end
  else
  begin
    ShowMessage('Nenhuma categoria para editar!');
  end;
end;
procedure TformConsultaCategorias.pnEditarMouseEnter(Sender: TObject);
begin
  pnEditar.Color := clSilver;
end;

procedure TformConsultaCategorias.pnEditarMouseLeave(Sender: TObject);
begin
  pnEditar.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnExcluirClick(Sender: TObject);
var
  categoriasClasse : TCategorias;
begin
  try
    if MessageDlg('Deseja excluir permanentemente essa categoria?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      categoriasClasse := TCategorias.Create;
      categoriasClasse.IDCategoria := gridCategorias.Fields[0].Value;
      categoriasClasse.Excluir;

      FreeAndNil(categoriasClasse);
    end;
  finally
    fbCategorias.Refresh;
  end;
end;

procedure TformConsultaCategorias.pnExcluirMouseEnter(Sender: TObject);
begin
  pnExcluir.Color := clSilver;
end;

procedure TformConsultaCategorias.pnExcluirMouseLeave(Sender: TObject);
begin
  pnExcluir.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformConsultaCategorias.pnFecharMouseEnter(Sender: TObject);
begin
  pnFechar.Color := clSilver;
end;

procedure TformConsultaCategorias.pnFecharMouseLeave(Sender: TObject);
begin
  pnFechar.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnIncluirClick(Sender: TObject);
var
  telaCadastroCategorias : TFormCadastrarCategorias;
begin
  try
    telaCadastroCategorias := TformCadastrarCategorias.Create(Self);
    telaCadastroCategorias.ShowModal;
  finally
    FreeAndNil(telaCadastroCategorias);
    fbCategorias.Refresh;
  end;
end;

procedure TformConsultaCategorias.pnIncluirMouseEnter(Sender: TObject);
begin
  pnIncluir.Color := clSilver;
end;

procedure TformConsultaCategorias.pnIncluirMouseLeave(Sender: TObject);
begin
  pnIncluir.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnLimparFiltrosClick(Sender: TObject);
begin
  cbFiltros.ItemIndex := -1;
  edPesquisa.Clear;
  fbCategorias.Filtered := False;
end;
procedure TformConsultaCategorias.pnLimparFiltrosMouseEnter(Sender: TObject);
begin
  pnLimparFiltros.Color := clSilver;
end;

procedure TformConsultaCategorias.pnLimparFiltrosMouseLeave(Sender: TObject);
begin
  pnLimparFiltros.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnPesquisarClick(Sender: TObject);
begin
  if (cbFiltros.ItemIndex <> -1) and (edPesquisa.Text <> '') then
  begin
    if cbFiltros.ItemIndex = 0 then
    begin
      fbCategorias.Filtered := False;
      fbCategorias.Filter := 'IDCATEGORIA = ' + QuotedStr(edPesquisa.Text);
      fbCategorias.Filtered := True;
    end
    else if cbFiltros.ItemIndex = 1 then
    begin
      fbCategorias.Filtered := False;
      fbCategorias.Filter := 'NOME LIKE ' + QuotedStr('%' + edPesquisa.Text + '%');
      fbCategorias.Filtered := True;
    end;
  end
  else
    ShowMessage('Necess�rio selecionar algum filtro e preencher uma descri��o!');
end;

procedure TformConsultaCategorias.pnPesquisarMouseEnter(Sender: TObject);
begin
  pnPesquisar.Color := clSilver;
end;

procedure TformConsultaCategorias.pnPesquisarMouseLeave(Sender: TObject);
begin
  pnPesquisar.Color := clMenuHighlight;
end;

procedure TformConsultaCategorias.pnRelatorioClick(Sender: TObject);
begin
  try
    formRelatorioCategoria := TformRelatorioCategoria.Create(Self);
    formRelatorioCategoria.relatCategoria.Preview();
  finally
    FreeAndNil(formRelatorioCategoria);
  end;

end;

procedure TformConsultaCategorias.pnRelatorioMouseEnter(Sender: TObject);
begin
  pnRelatorio.Color := clSilver;
end;

procedure TformConsultaCategorias.pnRelatorioMouseLeave(Sender: TObject);
begin
  pnRelatorio.Color := clMenuHighlight;
end;

end.
