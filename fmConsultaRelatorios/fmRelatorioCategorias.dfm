object formRelatorioCategorias: TformRelatorioCategorias
  Left = 0
  Top = 0
  ClientHeight = 608
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relatCategorias: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object bandaTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btTitle
      object lbTitle: TRLLabel
        Left = 204
        Top = 16
        Width = 308
        Height = 24
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE CATEGORIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEmissao: TRLLabel
        Left = 0
        Top = 46
        Width = 137
        Height = 16
        Caption = 'Rel'#225'toio emitido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 143
        Top = 46
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
    end
    object bandaDetalhes: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 80
      object lbNome: TRLLabel
        Left = 3
        Top = 18
        Width = 138
        Height = 16
        Caption = 'Nome do fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCNPJ: TRLLabel
        Left = 207
        Top = 18
        Width = 42
        Height = 16
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbContato: TRLLabel
        Left = 351
        Top = 18
        Width = 57
        Height = 16
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCidade: TRLLabel
        Left = 463
        Top = 18
        Width = 53
        Height = 16
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEstado: TRLLabel
        Left = 607
        Top = 18
        Width = 50
        Height = 16
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 96
        Top = 48
        Width = 70
        Height = 16
        Text = ''
      end
    end
  end
end
