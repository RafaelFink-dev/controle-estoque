unit fmCadastarUnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uUnidadesMedidaClasse;

type
  TformCadastroUnidade = class(TForm)
    pnFundo: TPanel;
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbDescricao: TLabel;
    pnRodape: TPanel;
    pnCancelar: TPanel;
    imFechar: TImage;
    pnConfirmar: TPanel;
    Image1: TImage;
    edCodigo: TMaskEdit;
    edAbreviacao: TMaskEdit;
    edDescricao: TMaskEdit;
    cbAtivo: TCheckBox;
    procedure pnConfirmarClick(Sender: TObject);
    procedure pnCancelarClick(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure pnCancelarMouseEnter(Sender: TObject);
    procedure pnCancelarMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edAbreviacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastroUnidade: TformCadastroUnidade;

implementation

{$R *.dfm}

procedure TformCadastroUnidade.edAbreviacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Verifica se a tecla pressionada não é o Backspace (#8) ou outras teclas de edição
  if (Key <> #8) and (Length(TEdit(Sender).Text) >= 10) then
  begin
    // Impede a entrada de mais caracteres definindo a tecla como #0
    Key := #0;
  end;
end;

procedure TformCadastroUnidade.FormCreate(Sender: TObject);
begin
  cbAtivo.Checked := True;
end;

procedure TformCadastroUnidade.pnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastroUnidade.pnCancelarMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformCadastroUnidade.pnCancelarMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := clMenuHighlight;
end;

procedure TformCadastroUnidade.pnConfirmarClick(Sender: TObject);
var
  UnidadeClasse : TUnidade;
begin
  if (edDescricao.Text <> '') or (edAbreviacao.Text <> '') then
  begin
    try
      UnidadeClasse := TUnidade.create;
      UnidadeClasse.IDUnidade := StrToIntDef(edCodigo.Text, -1);
      UnidadeClasse.Descricao := edDescricao.Text;
      UnidadeClasse.Abreviacao := edAbreviacao.Text;

      if cbAtivo.Checked then
      begin
        UnidadeClasse.Ativo := 'T';
      end
      else
      begin
        UnidadeClasse.Ativo := 'F';
      end;

      UnidadeClasse.Salvar;
    finally
      FreeAndNil(UnidadeClasse);
      Close;
    end;
  end
  else
    ShowMessage('Necessário preencher a descrição e abreviação!');
end;

procedure TformCadastroUnidade.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCadastroUnidade.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

end.
