unit fmConsultaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmConexao, fmCadastrarFornecedores, uFornecedoresClasse, fmRelatorioFornecedores,
  Vcl.Mask;

type
  TformConsultaFornecedores = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnRodape2: TPanel;
    gridFornecedores: TDBGrid;
    lbFornecedores: TLabel;
    pnTopo: TPanel;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    pnFechar: TPanel;
    imFechar: TImage;
    pnExcluir: TPanel;
    imExcluir: TImage;
    pnEditar: TPanel;
    imSalvar: TImage;
    pnIncluir: TPanel;
    imIncluir: TImage;
    pnPesquisar: TPanel;
    imPesquisar: TImage;
    dsFornecedores: TDataSource;
    fbFornecedores: TFDQuery;
    lbPesquisa: TLabel;
    pnLimparFiltros: TPanel;
    Image1: TImage;
    pnRelatorio: TPanel;
    imRelatorio: TImage;
    edPesquisa: TEdit;
    fbFornecedoresIDFORNECEDOR: TIntegerField;
    fbFornecedoresNOME: TStringField;
    fbFornecedoresCNPJ: TStringField;
    fbFornecedoresENDERECO: TStringField;
    fbFornecedoresCONTATO: TStringField;
    fbFornecedoresEMAIL: TStringField;
    fbFornecedoresCIDADE: TStringField;
    fbFornecedoresESTADO: TStringField;
    fbFornecedoresCEP: TStringField;
    fbFornecedoresATIVO: TStringField;
    fbFornecedoresSITUACAO: TStringField;
    procedure pnFecharClick(Sender: TObject);
    procedure pnIncluirClick(Sender: TObject);
    procedure pnIncluirMouseEnter(Sender: TObject);
    procedure pnIncluirMouseLeave(Sender: TObject);
    procedure pnEditarMouseEnter(Sender: TObject);
    procedure pnEditarMouseLeave(Sender: TObject);
    procedure pnExcluirMouseEnter(Sender: TObject);
    procedure pnExcluirMouseLeave(Sender: TObject);
    procedure pnFecharMouseEnter(Sender: TObject);
    procedure pnFecharMouseLeave(Sender: TObject);
    procedure pnPesquisarMouseLeave(Sender: TObject);
    procedure pnPesquisarMouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnEditarClick(Sender: TObject);
    procedure pnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnPesquisarClick(Sender: TObject);
    procedure pnLimparFiltrosClick(Sender: TObject);
    procedure pnLimparFiltrosMouseEnter(Sender: TObject);
    procedure pnLimparFiltrosMouseLeave(Sender: TObject);
    procedure pnRelatorioMouseEnter(Sender: TObject);
    procedure pnRelatorioMouseLeave(Sender: TObject);
    procedure pnRelatorioClick(Sender: TObject);
    procedure cbFiltrosExit(Sender: TObject);
    procedure fbFornecedoresCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaFornecedores: TformConsultaFornecedores;

implementation

{$R *.dfm}

procedure TformConsultaFornecedores.cbFiltrosExit(Sender: TObject);
begin
  if cbFiltros.ItemIndex = 0 then
  begin
    edPesquisa.NumbersOnly := True;
    edPesquisa.Clear;
  end
  else
    edPesquisa.NumbersOnly := False;
end;

procedure TformConsultaFornecedores.fbFornecedoresCalcFields(DataSet: TDataSet);
begin
 if fbFornecedores.FieldByName('ATIVO').AsString = 'T' then
   fbFornecedoresSITUACAO.AsString := 'Ativo'
 else
    fbFornecedoresSITUACAO.AsString := 'Inativo';
end;

procedure TformConsultaFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(formConsultaFornecedores);
end;

procedure TformConsultaFornecedores.FormShow(Sender: TObject);
begin
  fbFornecedores.Connection := dtmConexao.Conexao;
  fbFornecedores.Open;
end;

procedure TformConsultaFornecedores.pnEditarClick(Sender: TObject);
var
  telaFornecedores: TformCadastrarFornecedores;
begin
  if not fbFornecedores.IsEmpty then
  begin
    try
      telaFornecedores := TformCadastrarFornecedores.Create(Self);
      telaFornecedores.Caption := 'ALTERA��O DE FORNECEDORES';
      telaFornecedores.edCodigo.Text := fbFornecedores.FieldByName('IDFORNECEDOR').AsString;
      telaFornecedores.edNome.Text := fbFornecedores.FieldByName('NOME').AsString;
      telaFornecedores.edCnpj.Text := fbFornecedores.FieldByName('CNPJ').AsString;
      telaFornecedores.edTelefone.Text := fbFornecedores.FieldByName('CONTATO').AsString;
      telaFornecedores.edEndereco.Text := fbFornecedores.FieldByName('ENDERECO').AsString;
      telaFornecedores.edEmail.Text := fbFornecedores.FieldByName('EMAIL').AsString;
      telaFornecedores.edEstado.Text := fbFornecedores.FieldByName('ESTADO').AsString;
      telaFornecedores.edCidade.Text := fbFornecedores.FieldByName('CIDADE').AsString;
      telaFornecedores.edCep.Text := fbFornecedores.FieldByName('CEP').AsString;
      if fbFornecedores.FieldByName('ATIVO').AsString = 'T' then
      begin
        telaFornecedores.cbAtivo.Checked := True;
      end
      else
      begin
        telaFornecedores.cbAtivo.Checked := False;
      end;

      telaFornecedores.ShowModal;
    finally
      FreeAndNil(telaFornecedores);
      fbFornecedores.Refresh;
    end;
  end
  else
  begin
    ShowMessage('Nenhum fornecedor para alterar!');
  end;
end;

procedure TformConsultaFornecedores.pnEditarMouseEnter(Sender: TObject);
begin
  pnEditar.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnEditarMouseLeave(Sender: TObject);
begin
  pnEditar.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnExcluirClick(Sender: TObject);
var
  fornecedoresClasse : TFornecedores;
begin
  try
    if MessageDlg('Deseja excluir permanentemente esse fornecedor?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      fornecedoresClasse := TFornecedores.Create;
      fornecedoresClasse.IDFornecedor := gridFornecedores.Fields[0].Value;
      fornecedoresClasse.Excluir;

      FreeAndNil(fornecedoresClasse);
    end;
  finally
    fbFornecedores.Refresh;
  end;
end;

procedure TformConsultaFornecedores.pnExcluirMouseEnter(Sender: TObject);
begin
  pnExcluir.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnExcluirMouseLeave(Sender: TObject);
begin
  pnExcluir.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformConsultaFornecedores.pnFecharMouseEnter(Sender: TObject);
begin
  pnFechar.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnFecharMouseLeave(Sender: TObject);
begin
  pnFechar.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnIncluirClick(Sender: TObject);
var
  telaFornecedores : TformCadastrarFornecedores;
begin
  try
    telaFornecedores := TformCadastrarFornecedores.Create(Self);
    telaFornecedores.ShowModal;
  finally
    FreeAndNil(telaFornecedores);
    fbFornecedores.Refresh;
  end;
end;

procedure TformConsultaFornecedores.pnIncluirMouseEnter(Sender: TObject);
begin
  pnIncluir.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnIncluirMouseLeave(Sender: TObject);
begin
  pnIncluir.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnLimparFiltrosClick(Sender: TObject);
begin
  cbFiltros.ItemIndex := -1;
  edPesquisa.Clear;
  fbFornecedores.Filtered := False;
end;

procedure TformConsultaFornecedores.pnLimparFiltrosMouseEnter(Sender: TObject);
begin
  pnLimparFiltros.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnLimparFiltrosMouseLeave(Sender: TObject);
begin
  pnLimparFiltros.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnPesquisarClick(Sender: TObject);
begin

  if (cbFiltros.ItemIndex <> -1) and (edPesquisa.Text <> '') then
  begin
    if cbFiltros.ItemIndex = 0 then
    begin
      fbFornecedores.Filtered := False;
      fbFornecedores.Filter := 'IDFORNECEDOR = ' + QuotedStr(edPesquisa.Text);
      fbFornecedores.Filtered := True;
    end
    else if cbFiltros.ItemIndex = 1 then
    begin
      fbFornecedores.Filtered := False;
      fbFornecedores.Filter := 'NOME LIKE ' + QuotedStr('%' + edPesquisa.Text + '%');
      fbFornecedores.Filtered := True;
    end;
  end
  else
    ShowMessage('Necess�rio selecionar algum filtro e preencher uma descri��o!');
end;

procedure TformConsultaFornecedores.pnPesquisarMouseEnter(Sender: TObject);
begin
  pnPesquisar.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnPesquisarMouseLeave(Sender: TObject);
begin
  pnPesquisar.Color := clMenuHighlight;
end;

procedure TformConsultaFornecedores.pnRelatorioClick(Sender: TObject);
begin
  try
    formRelatorioFornecedores := TformRelatorioFornecedores.Create(Self);
    formRelatorioFornecedores.relatFornecedores.Preview();
  finally
    FreeAndNil(formRelatorioFornecedores);
  end;
end;

procedure TformConsultaFornecedores.pnRelatorioMouseEnter(Sender: TObject);
begin
  pnRelatorio.Color := clSilver;
end;

procedure TformConsultaFornecedores.pnRelatorioMouseLeave(Sender: TObject);
begin
  pnRelatorio.Color := clMenuHighlight;
end;

end.
