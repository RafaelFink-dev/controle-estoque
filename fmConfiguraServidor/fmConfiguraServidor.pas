unit fmConfiguraServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask, uConexaoClasse;

type
  TformConfiguraServidor = class(TForm)
    pnFundo: TPanel;
    pnTopo: TPanel;
    pnConfiguracao: TPanel;
    igIconConfig: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnConfirmar: TPanel;
    pnCancelar: TPanel;
    OpenDialog: TOpenDialog;
    Label3: TLabel;
    pnLinha: TPanel;
    Label4: TLabel;
    edCaminhoServidor: TMaskEdit;
    pnSelecionarCaminhoBanco: TPanel;
    Label5: TLabel;
    edUsuarioBD: TMaskEdit;
    Label6: TLabel;
    edSenhaBD: TMaskEdit;
    pnVerSenha: TPanel;
    procedure pnCancelarClick(Sender: TObject);
    procedure pnCancelarMouseLeave(Sender: TObject);
    procedure pnCancelarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure pnSelecionarCaminhoBancoMouseEnter(Sender: TObject);
    procedure pnSelecionarCaminhoBancoMouseLeave(Sender: TObject);
    procedure pnSelecionarCaminhoBancoClick(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure pnVerSenhaMouseEnter(Sender: TObject);
    procedure pnVerSenhaMouseLeave(Sender: TObject);
    procedure pnVerSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancelado : Boolean;
  end;

var
  formConfiguraServidor: TformConfiguraServidor;


implementation

{$R *.dfm}

procedure TformConfiguraServidor.FormCreate(Sender: TObject);
begin
  Cancelado := False;
end;

procedure TformConfiguraServidor.pnCancelarClick(Sender: TObject);
begin
  Cancelado := True;
  Close;
end;

procedure TformConfiguraServidor.pnCancelarMouseEnter(Sender: TObject);
begin
  pnCancelar.Color := clSilver;
end;

procedure TformConfiguraServidor.pnCancelarMouseLeave(Sender: TObject);
begin
  pnCancelar.Color := $00F2F2F2;
end;

procedure TformConfiguraServidor.pnConfirmarClick(Sender: TObject);
var
  Conexao: TConexao;
begin
  if (edCaminhoServidor.Text = '') or (edUsuarioBD.Text = '') or
    (edSenhaBD.Text = '') then
  begin
    MessageDlg('Todos campos devem ser preenchidos!', mtInformation, [mbOK], 0);
  end
  else
  begin
    if (edUsuarioBD.Text = 'SYSDBA') and (edSenhaBD.Text = 'masterkey') then
    begin
      Conexao := TConexao.Create(ExtractFilePath(Application.ExeName) +
        'Config.ini');
      try
        Conexao.GravaINI(edUsuarioBD.Text, edSenhaBD.Text, '',
          edCaminhoServidor.Text);
      finally
        FreeAndNil(Conexao);
      end;
      Close;
    end
    else
      MessageDlg('Usu�rio ou senha incorretos!', mtInformation, [mbOK], 0);
  end;
end;

procedure TformConfiguraServidor.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformConfiguraServidor.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

procedure TformConfiguraServidor.pnSelecionarCaminhoBancoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edCaminhoServidor.Text := OpenDialog.FileName;
  end;
end;

procedure TformConfiguraServidor.pnSelecionarCaminhoBancoMouseEnter
  (Sender: TObject);
begin
  pnSelecionarCaminhoBanco.Color := clSilver;
end;

procedure TformConfiguraServidor.pnSelecionarCaminhoBancoMouseLeave
  (Sender: TObject);
begin
  pnSelecionarCaminhoBanco.Color := clMenuHighlight;
end;

procedure TformConfiguraServidor.pnVerSenhaClick(Sender: TObject);
begin
  if pnVerSenha.Caption = 'EXIBIR' then
  begin
    pnVerSenha.Caption := 'OCULTAR';
    edSenhaBD.PasswordChar := #0;
  end
  else
  begin
    pnVerSenha.Caption := 'EXIBIR';
    edSenhaBD.PasswordChar := '*';
  end;
end;

procedure TformConfiguraServidor.pnVerSenhaMouseEnter(Sender: TObject);
begin
  pnVerSenha.Color := clSilver;
end;

procedure TformConfiguraServidor.pnVerSenhaMouseLeave(Sender: TObject);
begin
  pnVerSenha.Color := clMenuHighlight;
end;

end.