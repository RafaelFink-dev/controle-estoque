unit fmCadastrarFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask, uFornecedoresClasse, fmPesquisaCep, MaskUtils;

type
  TformCadastrarFornecedores = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnCancelar: TPanel;
    imFechar: TImage;
    pnConfirmar: TPanel;
    Image1: TImage;
    edCodigo: TMaskEdit;
    edNome: TMaskEdit;
    edEmail: TMaskEdit;
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbCNPJ: TLabel;
    lbContato: TLabel;
    lbEmail: TLabel;
    lnEndereco: TLabel;
    edEndereco: TEdit;
    edCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lbCEP: TLabel;
    edEstado: TEdit;
    pnIncluirEndereco: TPanel;
    lbEditarEndereco: TLabel;
    cbAtivo: TCheckBox;
    edTelefone: TMaskEdit;
    edCnpj: TMaskEdit;
    edCep: TMaskEdit;
    procedure pnCancelarMouseEnter(Sender: TObject);
    procedure pnCancelarMouseLeave(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure pnCancelarClick(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure pnIncluirEnderecoClick(Sender: TObject);
    procedure pnIncluirEnderecoMouseEnter(Sender: TObject);
    procedure pnIncluirEnderecoMouseLeave(Sender: TObject);
    procedure lbEditarEnderecoClick(Sender: TObject);
    procedure lbEditarEnderecoMouseEnter(Sender: TObject);
    procedure lbEditarEnderecoMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function RemovePontuacao(const str: string): string;

  public
    { Public declarations }
  end;

var
  formCadastrarFornecedores: TformCadastrarFornecedores;

implementation

{$R *.dfm}

function TformCadastrarFornecedores.RemovePontuacao(const str: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    if not(str[i] in ['.', '/', ',', '(', ')', '-']) then
      Result := Result + str[i];
  end;
end;

procedure TformCadastrarFornecedores.FormCreate(Sender: TObject);
begin
  cbAtivo.Checked := True;
end;

procedure TformCadastrarFornecedores.lbEditarEnderecoClick(Sender: TObject);
begin
  edEndereco.Enabled := True;
  edCep.Enabled := True;
  edCidade.Enabled := True;
  edEstado.Enabled := True;

end;

procedure TformCadastrarFornecedores.lbEditarEnderecoMouseEnter
  (Sender: TObject);
begin
  lbEditarEndereco.Font.Style := lbEditarEndereco.Font.Style + [fsBold];
  lbEditarEndereco.Cursor := crHandPoint;
end;

procedure TformCadastrarFornecedores.lbEditarEnderecoMouseLeave
  (Sender: TObject);
begin
  lbEditarEndereco.Font.Style := lbEditarEndereco.Font.Style - [fsBold];
  lbEditarEndereco.Cursor := crDefault;
end;

procedure TformCadastrarFornecedores.pnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastrarFornecedores.pnCancelarMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformCadastrarFornecedores.pnCancelarMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := clMenuHighlight;
end;

procedure TformCadastrarFornecedores.pnConfirmarClick(Sender: TObject);
var
  Fornecedores: TFornecedores;
  nroFornecedor: String;
begin
  if (edNome.Text <> '') and (edCnpj.Text <> '') then
  begin
    try
      Fornecedores := TFornecedores.create;
      Fornecedores.IDFornecedor := StrToIntDef(edCodigo.Text, -1);
      Fornecedores.Nome := edNome.Text;
      Fornecedores.Endereco := edEndereco.Text;
      Fornecedores.Cidade := edCidade.Text;
      Fornecedores.Estado := edEstado.Text;
      Fornecedores.Contato := RemovePontuacao(edTelefone.Text);
      Fornecedores.Email := edEmail.Text;
      Fornecedores.Cep := RemovePontuacao(edCep.Text);
      nroFornecedor := RemovePontuacao(edCnpj.Text);

      if cbAtivo.Checked = True then
      begin
        Fornecedores.Ativo := 'T';
      end
      else
      begin
        Fornecedores.Ativo := 'F';
      end;

      if Length(nroFornecedor) <> 14 then
      begin
        ShowMessage('N�mero de fornecedor inv�lido!');
      end
      else
      begin
        Fornecedores.cnpj := RemovePontuacao(edCnpj.Text);
        Fornecedores.Salvar;
      end;

    finally
      FreeAndNil(Fornecedores);
      Close;
    end;
  end
  else
    ShowMessage('Necess�rio preenche o NOME e CNPJ!');
end;

procedure TformCadastrarFornecedores.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCadastrarFornecedores.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

procedure TformCadastrarFornecedores.pnIncluirEnderecoClick(Sender: TObject);
var
  telaCep: TFormCep;
begin
  try
    telaCep := TFormCep.create(Self);
    telaCep.ShowModal
  finally
    edEndereco.Text := telaCep.logradouro;
    edCidade.Text := telaCep.localidade;
    edEstado.Text := telaCep.uf;
    edCep.Text := telaCep.Cep;
    FreeAndNil(telaCep);
  end;
end;

procedure TformCadastrarFornecedores.pnIncluirEnderecoMouseEnter
  (Sender: TObject);
begin
  pnIncluirEndereco.Color := clSilver;
end;

procedure TformCadastrarFornecedores.pnIncluirEnderecoMouseLeave
  (Sender: TObject);
begin
  pnIncluirEndereco.Color := clMenuHighlight;
end;

end.
