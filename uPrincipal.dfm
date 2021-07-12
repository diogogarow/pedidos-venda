object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Teste de Conhecimento'
  ClientHeight = 209
  ClientWidth = 238
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
  object btnAbrePedidoVenda: TButton
    Left = 32
    Top = 72
    Width = 161
    Height = 65
    Caption = 'Pedidos De Venda'
    TabOrder = 0
    OnClick = btnAbrePedidoVendaClick
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 143
    Width = 75
    Height = 25
    Caption = 'cidades'
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
end
