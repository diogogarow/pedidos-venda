unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    btnAbrePedidoVenda: TButton;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAbrePedidoVendaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function haConexao: boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uModule, uPedidoVenda, uCadCliente;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
   Try
      Application.CreateForm(TFrmCadCliente, frmCadCliente);
      frmCadCliente.ShowModal;
   Finally
      frmCadCliente.free;
   End;
end;

procedure TfrmPrincipal.btnAbrePedidoVendaClick(Sender: TObject);
begin
   Try
      Application.CreateForm(TFrmPedidoVenda, frmPedidoVenda);
      frmPedidoVenda.ShowModal;
   Finally
      frmPedidoVenda.free;
   End;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   if haconexao then
      begin
         //ll
      end;
end;

function TfrmPrincipal.haConexao: boolean;
begin
   result := false;

   if not dtModule.FDConnection.Connected then
      try
         dtModule.FDConnection.connected := true;
      except
         Application.MessageBox('Um erro ocorreu com a conexão.', 'Atenção!!!', MB_ICONERROR);
         Application.Terminate;
      end;

   if dtModule.FDConnection.Connected then
      result := true;
end;

{$R *.dfm}

end.
