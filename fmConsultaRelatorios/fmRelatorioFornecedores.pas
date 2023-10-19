unit fmRelatorioFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TformRelatorioFornecedores = class(TForm)
    relatFornecedores: TRLReport;
    bandaTitulo: TRLBand;
    lbTitle: TRLLabel;
    bandaDetalhes: TRLBand;
    RLDBText1: TRLDBText;
    lbNome: TRLLabel;
    lbCNPJ: TRLLabel;
    RLDBText2: TRLDBText;
    lbContato: TRLLabel;
    RLDBText3: TRLDBText;
    lbEndereco: TRLLabel;
    RLDBText4: TRLDBText;
    lbEmail: TRLLabel;
    RLDBText5: TRLDBText;
    lbCidade: TRLLabel;
    RLDBText6: TRLDBText;
    lbEstado: TRLLabel;
    RLDBText7: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    lbEmissao: TRLLabel;
    lbPage: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioFornecedores: TformRelatorioFornecedores;

implementation

{$R *.dfm}

uses
  fmConsultaFornecedores;

end.
