unit fmPesquisaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, dmConexao,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TformPesquisa = class(TForm)
    pnFundo: TPanel;
    DBGrid1: TDBGrid;
    pnRodape: TPanel;
    fbPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    btSelecionar: TButton;
    btCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPesquisa: TformPesquisa;

implementation

{$R *.dfm}

procedure TformPesquisa.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformPesquisa.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TformPesquisa.FormShow(Sender: TObject);
begin
  fbPesquisa.Connection := dtmConexao.Conexao;
  fbPesquisa.Open;
end;

procedure TformPesquisa.pnConfirmarClick(Sender: TObject);
begin
  Close;
end;

end.