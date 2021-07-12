object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pedidos de Venda'
  ClientHeight = 572
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 637
    Height = 437
    Align = alClient
    TabOrder = 1
    object btnConsClientes: TSpeedButton
      Tag = 1
      Left = 103
      Top = 15
      Width = 23
      Height = 21
      Caption = '>'
      Enabled = False
      OnClick = btnConsClientesClick
    end
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 42
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 66
      Width = 48
      Height = 13
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConsProdutos: TSpeedButton
      Tag = 1
      Left = 109
      Top = 63
      Width = 23
      Height = 21
      Caption = '>'
      Enabled = False
      OnClick = btnConsProdutosClick
    end
    object lblCliente: TLabel
      Tag = 1
      Left = 132
      Top = 18
      Width = 409
      Height = 13
      AutoSize = False
    end
    object lblProduto: TLabel
      Tag = 1
      Left = 139
      Top = 66
      Width = 409
      Height = 13
      AutoSize = False
    end
    object Label5: TLabel
      Left = 16
      Top = 99
      Width = 68
      Height = 13
      Caption = 'Quantidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 206
      Top = 99
      Width = 80
      Height = 13
      Caption = 'Valor Unit'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 410
      Top = 99
      Width = 64
      Height = 13
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 480
      Top = 99
      Width = 91
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 482
      Top = 415
      Width = 64
      Height = 13
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtValorTotal: TDBText
      Left = 552
      Top = 415
      Width = 65
      Height = 17
      Alignment = taRightJustify
      Color = clActiveCaption
      DataField = 'TotalPedido'
      DataSource = dtsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edtCliente: TEdit
      Tag = 1
      Left = 62
      Top = 15
      Width = 38
      Height = 21
      AutoSize = False
      Enabled = False
      MaxLength = 4
      TabOrder = 0
      OnExit = edtClienteExit
      OnKeyDown = edtClienteKeyDown
      OnKeyPress = edtClienteKeyPress
    end
    object edtProduto: TEdit
      Tag = 1
      Left = 69
      Top = 63
      Width = 38
      Height = 21
      AutoSize = False
      Enabled = False
      MaxLength = 4
      TabOrder = 1
      OnExit = edtProdutoExit
      OnKeyDown = edtProdutoKeyDown
      OnKeyPress = edtProdutoKeyPress
    end
    object DBGrid1: TDBGrid
      Tag = 1
      Left = 16
      Top = 160
      Width = 601
      Height = 249
      DataSource = dtsPedido
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'idProduto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorunitario'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valortotal'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 86
          Visible = True
        end>
    end
    object btnAdicionar: TBitBtn
      Tag = 1
      Left = 281
      Top = 129
      Width = 75
      Height = 25
      Caption = '&Adcionar'
      Enabled = False
      TabOrder = 4
      OnClick = btnAdicionarClick
    end
    object edtValorUnitario: TEdit
      Tag = 1
      Left = 292
      Top = 96
      Width = 77
      Height = 21
      Enabled = False
      TabOrder = 3
      OnExit = edtValorUnitarioExit
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object edtQuantidade: TEdit
      Tag = 1
      Left = 90
      Top = 96
      Width = 76
      Height = 21
      Enabled = False
      MaxLength = 5
      TabOrder = 2
      OnExit = edtQuantidadeExit
      OnKeyPress = edtQuantidadeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 509
    Width = 637
    Height = 63
    Align = alBottom
    TabOrder = 2
    object btnGravarPedido: TBitBtn
      Tag = 1
      Left = 132
      Top = 16
      Width = 105
      Height = 33
      Caption = '&Gravar Pedido'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarPedidoClick
    end
    object btnCancelar: TBitBtn
      Tag = 1
      Left = 410
      Top = 16
      Width = 105
      Height = 33
      Caption = '&Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 72
    Align = alTop
    TabOrder = 0
    object btnIncluir: TBitBtn
      Tag = 1
      Left = 51
      Top = 7
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
      Left = 207
      Top = 7
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
      Left = 363
      Top = 7
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
      Left = 520
      Top = 7
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
  object tbPedido: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'TotalPedido'
        Expression = 'sum(valortotal)'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'idProduto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'valorunitario'
        DataType = ftFloat
      end
      item
        Name = 'valortotal'
        DataType = ftFloat
      end
      item
        Name = 'idpedidos_produtos'
        DataType = ftInteger
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptUnknown
        Size = 45
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'vrUnitario'
        ParamType = ptUnknown
        Value = 0c
      end
      item
        DataType = ftCurrency
        Name = 'vrTotal'
        ParamType = ptUnknown
        Value = 0c
      end
      item
        DataType = ftInteger
        Name = 'idpedidos_produtos'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 16
    Top = 288
    object tbPedidoTotalPedido: TAggregateField
      FieldName = 'TotalPedido'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'Sum(valortotal)'
    end
  end
  object dtsPedido: TDataSource
    AutoEdit = False
    DataSet = tbPedido
    Left = 96
    Top = 288
  end
  object tbRemovido: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idpedidos_produtos'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idpedidos_produtos'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 16
    Top = 336
  end
  object dtsRemovido: TDataSource
    DataSet = tbRemovido
    Left = 96
    Top = 336
  end
end
