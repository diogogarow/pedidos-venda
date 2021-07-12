object frmConsPedidoVenda: TfrmConsPedidoVenda
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta Pedidos de Venda'
  ClientHeight = 443
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 96
    Hint = 'Consulta de clientes.'
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Texto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 66
      Height = 13
      Caption = 'Buscar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 110
      Top = 46
      Width = 87
      Height = 13
      Caption = 'Tipo de Busca:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTexto: TEdit
      Left = 8
      Top = 22
      Width = 620
      Height = 21
      Hint = '|Texto a ser pesquisado.'
      Color = 15658734
      MaxLength = 38
      TabOrder = 0
      OnClick = edtTextoClick
      OnKeyPress = edtTextoKeyPress
    end
    object cmbBusca: TComboBox
      Left = 8
      Top = 62
      Width = 89
      Height = 21
      Hint = 'Par'#226'metro da Busca.'
      Style = csDropDownList
      Color = 15658734
      TabOrder = 1
      Items.Strings = (
        'Descri'#231#227'o'
        'C'#243'digo')
    end
    object cmbTipo: TComboBox
      Left = 111
      Top = 62
      Width = 90
      Height = 21
      Hint = 'Selecione o tipo de busca.'
      Style = csDropDownList
      Color = 15658734
      TabOrder = 2
      Items.Strings = (
        'Direta'
        'Relativa')
    end
    object btnPesquisar: TBitBtn
      Left = 535
      Top = 63
      Width = 93
      Height = 27
      Hint = 'Efetua a pesquisa.'
      Caption = '&Pesquisar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        52020000424D5202000000000000520100002800000010000000100000000100
        08000000000000010000340B0000340B00004700000047000000405058009860
        580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
        7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
        8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
        8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
        9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
        AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
        CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
        E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
        F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
        4242424242422B39180B42424242424242424242424243443C180B4242424242
        42424242424242444438180B424242424242424242424242444339180A424242
        424242424242424242444335004201101A114242424242424242453D05072F34
        3434291942424242424242221A2D34343437403E0442424242424206231C3034
        37404146284242424242421B210F30373A414140310D42424242421F20032434
        373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
        2430333429424242424242421E463F0F0316252E08424242424242424227312D
        21252314424242424242424242420E141B1B42424242}
      ParentFont = False
      TabOrder = 3
      OnClick = btnPesquisarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 400
    Width = 636
    Height = 43
    Hint = 'Consulta de clientes.'
    Align = alBottom
    BevelOuter = bvNone
    Color = 12615680
    TabOrder = 1
    object btnCancelar: TSpeedButton
      Left = 330
      Top = 6
      Width = 93
      Height = 27
      Hint = '|Cancela a consulta.'
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 636
      Height = 5
      Align = alTop
      Shape = bsTopLine
      Style = bsRaised
      ExplicitWidth = 634
    end
    object btnOk: TBitBtn
      Left = 210
      Top = 6
      Width = 93
      Height = 27
      Hint = '|Confirma a consulta.'
      Caption = '&Ok'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 96
    Width = 636
    Height = 304
    Hint = 'Consulta de clientes.'
    Align = alClient
    BevelOuter = bvNone
    Color = 12615680
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 5
      Top = 6
      Width = 623
      Height = 291
      Hint = 'Lista dos clientes pesquisados.'
      Color = 15658734
      DataSource = dtModule.dtsBusca
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyUp = DBGrid1KeyUp
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'idpedido'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 395
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dataemissao'
          Title.Alignment = taCenter
          Title.Caption = 'Data Emiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end>
    end
  end
end
