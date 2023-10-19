unit fmRelatorioCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TformRelatorioCategoria = class(TForm)
    relatCategoria: TRLReport;
    bandaTitulo: TRLBand;
    lbTitle: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    lbEmissao: TRLLabel;
    bandaDetalhes: TRLBand;
    RLDBText1: TRLDBText;
    lbNome: TRLLabel;
    lbDescricao: TRLLabel;
    RLDBText2: TRLDBText;
    RLSystemInfo2: TRLSystemInfo;
    lbPage: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioCategoria: TformRelatorioCategoria;

implementation

{$R *.dfm}

uses
  fmConsultaCategorias;

end.
