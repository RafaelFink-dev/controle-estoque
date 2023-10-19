unit fmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fmConfiguraServidor, Vcl.ExtCtrls,
  dmConexao,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  fmConsultarProdutos,
  fmConsultaGrupos, fmConsultaSubGrupos, fmConsultaCategorias,
  fmConsultaFornecedores, fmConsultaUnidadeMedida, IniFiles, uConexaoClasse;

type
  TformPrincipal = class(TForm)
    pnFundo: TPanel;
    pnTopo: TPanel;
    pnLine: TPanel;
    pnLatela: TPanel;
    imgTopo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnIconUm: TPanel;
    imIconUm: TImage;
    lbProdutos: TLabel;
    pnIconDois: TPanel;
    imIconDois: TImage;
    lbFornecedores: TLabel;
    pnIconTres: TPanel;
    imIconTres: TImage;
    lbGroups: TLabel;
    pnIconQuatro: TPanel;
    imIconQuatro: TImage;
    lbSubGrupos: TLabel;
    pnIconCinco: TPanel;
    imIconCinco: TImage;
    lbCategoria: TLabel;
    pnFormularios: TPanel;
    pnIconSeis: TPanel;
    imIconSeis: TImage;
    lbUnMedidas: TLabel;
    lbUnidade2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnIconUmMouseEnter(Sender: TObject);
    procedure s(Sender: TObject);
    procedure pnIconDoisMouseEnter(Sender: TObject);
    procedure pnIconDoisMouseLeave(Sender: TObject);
    procedure pnIconTresMouseEnter(Sender: TObject);
    procedure pnIconTresMouseLeave(Sender: TObject);
    procedure pnIconQuatroMoueEnter(Sender: TObject);
    procedure pnIconQuatroMouseLeave(Sender: TObject);
    procedure pnIconCincoMouseEnter(Sender: TObject);
    procedure pnIconCincoMouseLeave(Sender: TObject);
    procedure pnIconSeisMouseEnter(Sender: TObject);
    procedure pnIconSeisMouseLeave(Sender: TObject);
    procedure pnIconUmClick(Sender: TObject);
    procedure pnIconDoisClick(Sender: TObject);
    procedure pnIconTresClick(Sender: TObject);
    procedure pnIconQuatroClick(Sender: TObject);
    procedure pnIconCincoClick(Sender: TObject);
    procedure pnIconSeisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.FormCreate(Sender: TObject);
var
  telaConfigBD: TformConfiguraServidor;
  caminhoBanco, caminhoIni, caminhoPai: string;
  conexao: TConexao;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Config.ini') then
  begin
    MessageDlg('� necess�rio configurar a conex�o com o banco de dados!',
      mtInformation, [mbOK], 0);
    telaConfigBD := TformConfiguraServidor.Create(Self);
      try
        telaConfigBD.ShowModal;
        if telaConfigBD.Cancelado = True then
        begin
          Application.Terminate;
          Exit;
        end;
      finally
          FreeAndNil(telaConfigBD);
    end;
  end
  else
  begin
    conexao := TConexao.Create(ExtractFilePath(Application.ExeName) +
      'Config.ini');
    conexao.LeINI;
    caminhoBanco := conexao.Database;
    caminhoPai := ExtractFileDir(caminhoBanco);

    if not DirectoryExists(caminhoPai) then
    begin
      MessageDlg
        ('O caminho do banco de dados especificado no arquivo Config.ini ' +
        'n�o existe na m�quina atual. � necess�rio reconfigurar a conex�o com o banco de dados!',
        mtInformation, [mbOK], 0);

      // depois da mensagem chama a tela pra configurar novamente;
      telaConfigBD := TformConfiguraServidor.Create(Self);
      try
        telaConfigBD.ShowModal;
        if telaConfigBD.Cancelado = True then
        begin
          Application.Terminate;
          Exit;
        end;
      finally
          FreeAndNil(telaConfigBD);
      end;
    end
    else
    begin
      // faz nada s� abre;
    end;
  end;
end;

procedure TformPrincipal.pnIconSeisClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultaUMedida') then
  begin
    formConsultaUMedida := TformConsultaUMedida.Create(Self);
    formConsultaUMedida.Parent := pnFormularios;
    formConsultaUMedida.Align := alClient;
    formConsultaUMedida.BorderStyle := bsNone;
    formConsultaUMedida.Show;
  end
  else
  begin
    formConsultaUMedida.BringToFront;
    formConsultaUMedida.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconSeisMouseEnter(Sender: TObject);
begin
  pnIconSeis.Color := clSilver;
end;

procedure TformPrincipal.pnIconSeisMouseLeave(Sender: TObject);
begin
  pnIconSeis.Color := clMenuHighlight;
end;

procedure TformPrincipal.pnIconCincoClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultaCategorias') then
  begin
    formConsultaCategorias := TformConsultaCategorias.Create(Self);
    formConsultaCategorias.Parent := pnFormularios;
    formConsultaCategorias.Align := alClient;
    formConsultaCategorias.BorderStyle := bsNone;
    formConsultaCategorias.Show;
  end
  else
  begin
    formConsultaCategorias.BringToFront;
    formConsultaCategorias.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconCincoMouseEnter(Sender: TObject);
begin
  pnIconCinco.Color := clSilver;
end;

procedure TformPrincipal.pnIconCincoMouseLeave(Sender: TObject);
begin
  pnIconCinco.Color := clMenuHighlight;
end;

procedure TformPrincipal.pnIconDoisClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultaFornecedores') then
  begin
    formConsultaFornecedores := TformConsultaFornecedores.Create(Self);
    formConsultaFornecedores.Parent := pnFormularios;
    formConsultaFornecedores.Align := alClient;
    formConsultaFornecedores.BorderStyle := bsNone;
    formConsultaFornecedores.Show;
  end
  else
  begin
    formConsultaFornecedores.BringToFront;
    formConsultaFornecedores.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconDoisMouseEnter(Sender: TObject);
begin
  pnIconDois.Color := clSilver;
end;

procedure TformPrincipal.pnIconDoisMouseLeave(Sender: TObject);
begin
  pnIconDois.Color := clMenuHighlight;
end;

procedure TformPrincipal.pnIconQuatroClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultaSubGrupos') then
  begin
    formConsultaSubGrupos := TformConsultasUBGrupos.Create(Self);
    formConsultaSubGrupos.Parent := pnFormularios;
    formConsultaSubGrupos.Align := alClient;
    formConsultaSubGrupos.BorderStyle := bsNone;
    formConsultaSubGrupos.Show;
  end
  else
  begin
    formConsultaSubGrupos.BringToFront;
    formConsultaSubGrupos.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconQuatroMoueEnter(Sender: TObject);
begin
  pnIconQuatro.Color := clSilver;
end;

procedure TformPrincipal.pnIconQuatroMouseLeave(Sender: TObject);
begin
  pnIconQuatro.Color := clMenuHighlight;;
end;

procedure TformPrincipal.pnIconTresClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultaGrupos') then
  begin
    formConsultaGrupos := TformConsultaGrupos.Create(Self);
    formConsultaGrupos.Parent := pnFormularios;
    formConsultaGrupos.Align := alClient;
    formConsultaGrupos.BorderStyle := bsNone;
    formConsultaGrupos.Show;
  end
  else
  begin
    formConsultaGrupos.BringToFront;
    formConsultaGrupos.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconTresMouseEnter(Sender: TObject);
begin
  pnIconTres.Color := clSilver;
end;

procedure TformPrincipal.pnIconTresMouseLeave(Sender: TObject);
begin
  pnIconTres.Color := clMenuHighlight;
end;

procedure TformPrincipal.pnIconUmClick(Sender: TObject);
begin
  if dtmConexao.VerificaFormAberto('formConsultarProdutos') then
  begin
    formConsultarProdutos := TformConsultarProdutos.Create(Self);
    formConsultarProdutos.Parent := pnFormularios;
    formConsultarProdutos.Align := alClient;
    formConsultarProdutos.BorderStyle := bsNone;
    formConsultarProdutos.Show;
  end
  else
  begin
    formConsultarProdutos.BringToFront;
    formConsultarProdutos.WindowState := wsNormal;
  end;
end;

procedure TformPrincipal.pnIconUmMouseEnter(Sender: TObject);
begin
  pnIconUm.Color := clSilver;
end;

procedure TformPrincipal.s(Sender: TObject);
begin
  pnIconUm.Color := clMenuHighlight;
end;

end.
