unit fmPesquisaCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  dmConexao,
  Vcl.StdCtrls, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.Mask;

type
  TformCep = class(TForm)
    pnFundo: TPanel;
    lbCEP: TLabel;
    pnRodape: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    pnConfirmar: TPanel;
    pnFechar: TPanel;
    edCep: TMaskEdit;
    procedure imFecharClick(Sender: TObject);
    procedure pnFecharClick(Sender: TObject);
    procedure pnConfirmarClick(Sender: TObject);
    procedure pnConfirmarMouseEnter(Sender: TObject);
    procedure pnConfirmarMouseLeave(Sender: TObject);
    procedure pnFecharMouseEnter(Sender: TObject);
    procedure pnFecharMouseLeave(Sender: TObject);
    procedure edCepKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function RemovePontuacao(const str: string): string;
  public
    { Public declarations }
  var
    cep, logradouro, localidade, uf: String;
  end;

var
  formCep: TformCep;

implementation

{$R *.dfm}

function TformCep.RemovePontuacao(const str: string): string;
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

procedure TformCep.edCepKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> #8) and (Length(TEdit(Sender).Text) >= 8) then
  begin
    Key := #0;
  end;
end;

procedure TformCep.imFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformCep.pnConfirmarClick(Sender: TObject);
begin

  if Length(edCep.Text) = 8 then
  begin
    edCep.Text := RemovePontuacao(edCep.Text);

    RESTRequest1.Resource := edCep.Text + '/json';
    RESTRequest1.Execute;

    if RESTRequest1.Response.StatusCode = 200 then
    begin
      if RESTRequest1.Response.Content.IndexOf('erro') > 0 then
      begin
        ShowMessage('CEP N�O ENCONTRADO!');
      end
      else
      begin
        cep := FDMemTable1.FieldByName('cep').AsString;
        logradouro := FDMemTable1.FieldByName('logradouro').AsString;
        localidade := FDMemTable1.FieldByName('localidade').AsString;
        uf := FDMemTable1.FieldByName('uf').AsString;
        Close;
      end;
    end;
  end
  else
  begin
    ShowMessage('CEP INV�LIDO!');
  end;
end;

procedure TformCep.pnConfirmarMouseEnter(Sender: TObject);
begin
  pnConfirmar.Color := clSilver;
end;

procedure TformCep.pnConfirmarMouseLeave(Sender: TObject);
begin
  pnConfirmar.Color := clMenuHighlight;
end;

procedure TformCep.pnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformCep.pnFecharMouseEnter(Sender: TObject);
begin
  pnFechar.Color := clSilver;
end;

procedure TformCep.pnFecharMouseLeave(Sender: TObject);
begin
  pnFechar.Color := clRed;
end;

end.
