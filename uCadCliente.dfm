object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 249
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 72
    Align = alTop
    TabOrder = 0
    object btnIncluir: TBitBtn
      Tag = 1
      Left = 13
      Top = 12
      Width = 75
      Height = 50
      Caption = '&Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TBitBtn
      Tag = 1
      Left = 167
      Top = 12
      Width = 75
      Height = 50
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Tag = 1
      Left = 321
      Top = 12
      Width = 75
      Height = 50
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSair: TBitBtn
      Tag = 1
      Left = 475
      Top = 12
      Width = 75
      Height = 50
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 565
    Height = 114
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 18
      Width = 35
      Height = 13
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Cidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 37
      Top = 83
      Width = 17
      Height = 13
      Caption = 'UF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Tag = 1
      Left = 60
      Top = 15
      Width = 490
      Height = 21
      AutoSize = False
      Enabled = False
      MaxLength = 45
      TabOrder = 0
    end
    object edtCidade: TEdit
      Tag = 1
      Left = 60
      Top = 47
      Width = 490
      Height = 21
      AutoSize = False
      Enabled = False
      MaxLength = 45
      TabOrder = 1
    end
    object cmbUF: TComboBox
      Tag = 1
      Left = 60
      Top = 80
      Width = 40
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Enabled = False
      ItemIndex = 0
      TabOrder = 2
      Text = 'AC'
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 186
    Width = 565
    Height = 63
    Align = alBottom
    TabOrder = 2
    object btnOk: TBitBtn
      Tag = 1
      Left = 167
      Top = 22
      Width = 75
      Height = 25
      Caption = '&Ok'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TBitBtn
      Tag = 1
      Left = 321
      Top = 22
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
