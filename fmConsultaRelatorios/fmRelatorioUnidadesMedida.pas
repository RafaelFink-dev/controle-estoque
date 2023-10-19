unit fmRelatorioUnidadesMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TformRelatorioUnidades = class(TForm)
    relatUnidades: TRLReport;
    bandaTitulo: TRLBand;
    lbTitle: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    lbEmissao: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    lbPage: TRLLabel;
    bandaDetalhes: TRLBand;
    RLDBText1: TRLDBText;
    lbNome: TRLLabel;
    lbAbreviacao: TRLLabel;
    RLDBText3: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioUnidades: TformRelatorioUnidades;

implementation

{$R *.dfm}

uses
  fmConsultaUnidadeMedida;

end.
