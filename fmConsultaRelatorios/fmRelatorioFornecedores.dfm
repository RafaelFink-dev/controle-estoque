object formRelatorioFornecedores: TformRelatorioFornecedores
  Left = 0
  Top = 0
  ClientHeight = 601
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relatFornecedores: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Borders.Width = 3
    DataSource = formConsultaFornecedores.dsFornecedores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object bandaTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 71
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 3
      Borders.FixedBottom = True
      object lbTitle: TRLLabel
        Left = 1
        Top = 10
        Width = 715
        Height = 24
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE FORNECEDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object lbEmissao: TRLLabel
        Left = 0
        Top = 46
        Width = 142
        Height = 16
        Caption = 'Rel'#225'torio emitido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPage: TRLLabel
        Left = 662
        Top = 33
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 662
        Top = 49
        Width = 53
        Height = 16
        Alignment = taCenter
        Info = itPageNumber
        Text = ''
      end
    end
    object bandaDetalhes: TRLBand
      Left = 38
      Top = 109
      Width = 718
      Height = 112
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 3
      Borders.FixedBottom = True
      object RLDBText1: TRLDBText
        Left = 3
        Top = 40
        Width = 43
        Height = 16
        DataField = 'NOME'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
      end
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
      object RLDBText2: TRLDBText
        Left = 207
        Top = 40
        Width = 37
        Height = 16
        DataField = 'CNPJ'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
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
      object RLDBText3: TRLDBText
        Left = 351
        Top = 40
        Width = 65
        Height = 16
        DataField = 'CONTATO'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
      end
      object lbEndereco: TRLLabel
        Left = 351
        Top = 66
        Width = 68
        Height = 16
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 351
        Top = 83
        Width = 77
        Height = 16
        DataField = 'ENDERECO'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
      end
      object lbEmail: TRLLabel
        Left = 3
        Top = 66
        Width = 44
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 3
        Top = 88
        Width = 43
        Height = 16
        DataField = 'EMAIL'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
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
      object RLDBText6: TRLDBText
        Left = 463
        Top = 40
        Width = 52
        Height = 16
        DataField = 'CIDADE'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
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
      object RLDBText7: TRLDBText
        Left = 607
        Top = 40
        Width = 57
        Height = 16
        DataField = 'ESTADO'
        DataSource = formConsultaFornecedores.dsFornecedores
        Text = ''
      end
    end
  end
end
