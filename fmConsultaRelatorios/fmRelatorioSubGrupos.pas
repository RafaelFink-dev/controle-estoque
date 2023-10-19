unit fmRelatorioSubGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TformRelatorioSubGrupos = class(TForm)
    relatSubGrupos: TRLReport;
    bandaTitulo: TRLBand;
    lbTitle: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    lbEmissao: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    lbPage: TRLLabel;
    bandaDetalhes: TRLBand;
    lbNome: TRLLabel;
    lbDescricao: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioSubGrupos: TformRelatorioSubGrupos;

implementation

{$R *.dfm}

uses
  fmConsultaSubGrupos;

end.
