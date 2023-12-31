unit fmCadastrarSubGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSubGruposClasse;

type
  TformCadastrarSubGrupos = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnCancelar: TPanel;
    imFechar: TImage;
    pnConfirmar: TPanel;
    Image1: TImage;
    edCodigo: TMaskEdit;
    edNome: TMaskEdit;
    edDescricao: TMaskEdit;
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbDescricao: TLabel;
    cbAtivo: TCheckBox;
    procedure pnCancelarMouseEnter(Sender: TObject);
    procedure pnCancelarMouseLeave(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure pnCancelarClick(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastrarSubGrupos: TformCadastrarSubGrupos;

implementation

{$R *.dfm}

procedure TformCadastrarSubGrupos.FormCreate(Sender: TObject);
begin
  cbAtivo.Checked := True;
end;

procedure TformCadastrarSubGrupos.pnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastrarSubGrupos.pnCancelarMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformCadastrarSubGrupos.pnCancelarMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := clMenuHighlight;
end;

procedure TformCadastrarSubGrupos.pnConfirmarClick(Sender: TObject);
var
  SubgruposClasse : TSubGrupos;
begin
  if edNome.Text <> '' then
  begin
    try
      SubgruposClasse := TSubGrupos.create;
      SubgruposClasse.IDSubGrupo := StrToIntDef(edCodigo.Text, -1);
      SubgruposClasse.Nome := edNome.Text;
      SubgruposClasse.Descricao := edDescricao.Text;

      if cbAtivo.Checked then
      begin
        SubgruposClasse.Ativo := 'T';
      end
      else
      begin
        SubgruposClasse.Ativo := 'F';
      end;

      SubgruposClasse.Salvar;
    finally
      FreeAndNil(SubgruposClasse);
      Close;
    end;
  end
  else
    ShowMessage('Necessário preencher o nome!');
end;

procedure TformCadastrarSubGrupos.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCadastrarSubGrupos.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

end.
