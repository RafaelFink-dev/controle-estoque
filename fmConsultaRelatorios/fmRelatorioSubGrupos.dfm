object formRelatorioSubGrupos: TformRelatorioSubGrupos
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relatSubGrupos: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = formConsultaSubGrupos.dsSubGrupos
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
        Left = 207
        Top = 16
        Width = 302
        Height = 24
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE SUBGRUPOS'
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
      object RLSystemInfo2: TRLSystemInfo
        Left = 662
        Top = 49
        Width = 53
        Height = 16
        Alignment = taCenter
        Info = itPageNumber
        Text = ''
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
    end
    object bandaDetalhes: TRLBand
      Left = 38
      Top = 109
      Width = 718
      Height = 68
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 3
      Borders.FixedBottom = True
      object lbNome: TRLLabel
        Left = 3
        Top = 18
        Width = 133
        Height = 16
        Caption = 'Nome do SubGrupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDescricao: TRLLabel
        Left = 335
        Top = 18
        Width = 70
        Height = 16
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 335
        Top = 40
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = formConsultaSubGrupos.dsSubGrupos
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 40
        Width = 43
        Height = 16
        DataField = 'NOME'
        DataSource = formConsultaSubGrupos.dsSubGrupos
        Text = ''
      end
    end
  end
end
