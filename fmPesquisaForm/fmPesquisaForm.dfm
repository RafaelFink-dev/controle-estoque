object formPesquisa: TformPesquisa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'PESQUISAS'
  ClientHeight = 300
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object pnRodape: TPanel
      Left = 0
      Top = 240
      Width = 427
      Height = 60
      Align = alBottom
      BevelOuter = bvNone
      Color = clInactiveCaption
      ParentBackground = False
      TabOrder = 1
      object btSelecionar: TButton
        Left = 224
        Top = 12
        Width = 108
        Height = 33
        Caption = 'SELECIONAR'
        ModalResult = 1
        TabOrder = 0
      end
      object btCancelar: TButton
        Left = 88
        Top = 12
        Width = 108
        Height = 33
        Caption = 'CANCELAR'
        TabOrder = 1
        OnClick = btCancelarClick
      end
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 421
      Height = 234
      Align = alClient
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object fbPesquisa: TFDQuery
    Connection = dtmConexao.Conexao
    SQL.Strings = (
      'SELECT * FROM GRUPOS')
    Left = 128
    Top = 120
  end
  object dsPesquisa: TDataSource
    DataSet = fbPesquisa
    Left = 200
    Top = 112
  end
end
