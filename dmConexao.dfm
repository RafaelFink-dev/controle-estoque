object dtmConexao: TdtmConexao
  Height = 168
  Width = 217
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=D:\Pessoal\Dev\Programa'#231#227'o\ProjetoVagaDevSky\Dados\LOJA' +
        '.FDB'
      'DriverID=FB')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 120
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 24
    Top = 88
  end
  object fbAux: TFDQuery
    Connection = Conexao
    Left = 136
    Top = 88
  end
end
