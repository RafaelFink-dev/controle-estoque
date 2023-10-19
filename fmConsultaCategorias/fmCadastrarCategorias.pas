unit fmCadastrarCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uCategoriasClasse;

type
  TformCadastrarCategorias = class(TForm)
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
    procedure imFecharMouseEnter(Sender: TObject);
    procedure imFecharMouseLeave(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure pnCancelarClick(Sender: TObject);
    procedure imFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastrarCategorias: TformCadastrarCategorias;

implementation

{$R *.dfm}

procedure TformCadastrarCategorias.FormCreate(Sender: TObject);
begin
  cbAtivo.Checked := True;
end;

procedure TformCadastrarCategorias.Image1Click(Sender: TObject);
var
  categoriasClasse : TCategorias;
begin
  if edNome.Text <> '' then
  begin
    try
    categoriasClasse := TCategorias.create;
    categoriasClasse.IDCategoria := StrToIntDef(edCodigo.Text, -1);
    categoriasClasse.Nome := edNome.Text;
    categoriasClasse.Descricao := edDescricao.Text;

    categoriasClasse.Salvar;
    finally
    FreeAndNil(categoriasClasse);
    Close;
    end;
  end
  else
    ShowMessage('Necessário preencher o nome!');
end;

procedure TformCadastrarCategorias.Image1MouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCadastrarCategorias.Image1MouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

procedure TformCadastrarCategorias.imFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastrarCategorias.imFecharMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformCadastrarCategorias.imFecharMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := clMenuHighlight;
end;

procedure TformCadastrarCategorias.pnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastrarCategorias.pnCancelarMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformCadastrarCategorias.pnCancelarMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := clMenuHighlight;
end;

procedure TformCadastrarCategorias.pnConfirmarClick(Sender: TObject);
var
  categoriasClasse : TCategorias;
begin
  if edNome.Text <> '' then
  begin
    try
      categoriasClasse := TCategorias.create;
      categoriasClasse.IDCategoria := StrToIntDef(edCodigo.Text, -1);
      categoriasClasse.Nome := edNome.Text;
      categoriasClasse.Descricao := edDescricao.Text;

      if cbAtivo.Checked then
      begin
        categoriasClasse.Ativo := 'T';
      end
      else
      begin
        categoriasClasse.Ativo := 'F';
      end;

      categoriasClasse.Salvar;
    finally
      FreeAndNil(categoriasClasse);
      Close;
    end;
  end
  else
    ShowMessage('Necessário preencher o nome!');
end;

procedure TformCadastrarCategorias.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCadastrarCategorias.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

end.
