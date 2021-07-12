program TesteDevDelphi;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uModule in 'uModule.pas' {dtModule: TDataModule},
  uPedidoVenda in 'uPedidoVenda.pas' {frmPedidoVenda},
  uGlobal in 'uGlobal.pas',
  uCadCliente in 'uCadCliente.pas' {frmCadCliente},
  uConsCliente in 'uConsCliente.pas' {frmConsCliente},
  uConsPedidoVenda in 'uConsPedidoVenda.pas' {frmConsPedidoVenda},
  uConsProduto in 'uConsProduto.pas' {frmConsProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtModule, dtModule);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TfrmConsCliente, frmConsCliente);
  Application.CreateForm(TfrmConsPedidoVenda, frmConsPedidoVenda);
  Application.CreateForm(TfrmConsProduto, frmConsProduto);
  //  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.Run;
end.
