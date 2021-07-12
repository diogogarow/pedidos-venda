unit uPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPedidoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConsClientes: TSpeedButton;
    DBGrid1: TDBGrid;
    tbPedido: TClientDataSet;
    dtsPedido: TDataSource;
    Label1: TLabel;
    edtCliente: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    edtProduto: TEdit;
    btnConsProdutos: TSpeedButton;
    lblCliente: TLabel;
    lblProduto: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    lblValorTotal: TLabel;
    Label4: TLabel;
    btnGravarPedido: TBitBtn;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    dbtValorTotal: TDBText;
    btnAdicionar: TBitBtn;
    tbPedidoTotalPedido: TAggregateField;
    edtValorUnitario: TEdit;
    tbRemovido: TClientDataSet;
    dtsRemovido: TDataSource;
    edtQuantidade: TEdit;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnConsClientesClick(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsProdutosClick(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    idpedido, idpedidos_produtos : Integer;
    adicionaGrid : Boolean;
    function validaCampos: boolean;
    function ultimoIdPedidoCadastrado: integer;
    procedure incluiPedidosProdutos(id_Pedido, id_produto :integer; quantidade, valor, total: Currency );
    procedure deletaPedidosProdutos(idpedidoproduto: integer);
    procedure abreConsCliente;
    procedure abreConsProdutos;
    procedure abreConsPedidoVenda;
    procedure preencheCampos;
    procedure alteraGrid;


  public
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

uses uModule, uGlobal, uConsCliente, uConsPedidoVenda, uConsProduto;

function TfrmPedidoVenda.validaCampos: boolean;
begin
   result := false;
   if (Trim(edtCliente.Text) = '') then
      begin
         Application.MessageBox('Informe o código do cliente.', 'Atenção!' , MB_ICONINFORMATION);
         edtCliente.SetFocus;
      end
   else if (Trim(edtProduto.Text) = '') then
      begin
         Application.MessageBox('Informe o código do produto.', 'Atenção!' , MB_ICONINFORMATION);
         edtProduto.SetFocus;
      end
   else if (Trim(edtQuantidade.Text) = ',') then
      begin
         Application.MessageBox('Informe a quantidade do produto.', 'Atenção!' , MB_ICONINFORMATION);
         edtQuantidade.SetFocus;
      end
   else
      result := true;

end;

procedure TfrmPedidoVenda.abreConsCliente;
begin
   try
      Application.CreateForm(TfrmConsCliente, frmconscliente);
      frmconscliente.ShowModal;
   finally
      frmconscliente.free;
      if not cancelabusca then
         begin
            edtCliente.Text    := dtmodule.qryBusca.FieldByName('idclientes').AsString;
            lblCliente.Caption := dtmodule.qryBusca.FieldByName('nome').AsString;
            edtProduto.SetFocus;
         end;
      dtmodule.qryBusca.close;
   end;
end;

procedure TfrmPedidoVenda.abreConsPedidoVenda;
begin
   try
      Application.CreateForm(TfrmConsPedidoVenda, frmConsPedidoVenda);
      frmConsPedidoVenda.ShowModal;
   finally
      frmConsPedidoVenda.free;

      if (not cancelabusca) then
         begin
            Screen.Cursor := crHourGlass;

            RestauraBotao(Self);
            preencheCampos;

            if (operacao = 'E') then
               begin
                  RestExclusao(Self);
                  btnAdicionar.Enabled    := False;
                  btnGravarPedido.Enabled := true;
                  btnCancelar.Enabled     := true;
                  btnGravarPedido.SetFocus;
               end
            else
               edtCliente.SetFocus;

            Screen.Cursor := crDefault;
         end;
   end;
end;

procedure TfrmPedidoVenda.abreConsProdutos;
begin
   try
      Application.CreateForm(TfrmConsProduto, frmConsProduto);
      frmConsProduto.ShowModal;
   finally
      frmConsProduto.free;
      if not cancelabusca then
         begin
            edtProduto.Text         := dtmodule.qryBusca.FieldByName('idprodutos').AsString;
            lblProduto.Caption      := dtmodule.qryBusca.FieldByName('descricao').AsString;
            edtValorUnitario.Text   := dtmodule.qryBusca.FieldByName('precovenda').AsString;
            edtQuantidade.SetFocus;
         end;
      dtmodule.qryBusca.close;
   end;
end;

procedure TfrmPedidoVenda.alteraGrid;
begin
   if not tbPedido.IsEmpty then
      begin
         edtProduto.text         := tbPedido.FieldByName('idproduto').AsString;
         lblProduto.Caption      := tbPedido.FieldByName('descricao').AsString;
         edtQuantidade.Text      := tbPedido.FieldByName('quantidade').AsString;
         edtValorUnitario.Text   := tbPedido.FieldByName('valorunitario').AsString;
         lblValorTotal.Caption   := tbPedido.FieldByName('valortotal').AsString;

         edtCliente.Enabled      := false;
         edtProduto.Enabled      := false;
         btnConsClientes.Enabled := false;
         btnConsProdutos.Enabled := false;
         adicionaGrid            := false;
         DBGrid1.Enabled         := false;
         btnAdicionar.Caption    := '&Alterar';

         edtQuantidade.SetFocus;
         tbPedido.DisableControls;
      end;
end;

procedure TfrmPedidoVenda.btnAdicionarClick(Sender: TObject);
begin
   if validaCampos then
      begin
         if adicionaGrid then
            begin
               tbPedido.Append;
               tbPedido.FieldByName('idpedidos_produtos').Value := null;
            end
         else
            begin
               tbPedido.Edit;
               tbPedido.FieldByName('idpedidos_produtos').Value := idpedidos_produtos;
            end;

         tbPedido.FieldByName('idproduto').Value            := Trim(edtProduto.Text);
         tbPedido.FieldByName('descricao').Value            := lblProduto.Caption;
         tbPedido.FieldByName('quantidade').Value           := edtQuantidade.Text;
         tbPedido.FieldByName('valorunitario').Value        := edtValorUnitario.text;
         tbPedido.FieldByName('valortotal').Value           := StrToFloat(lblValorTotal.Caption);
         tbPedido.Post;


         edtCliente.Enabled      := true;
         edtProduto.Enabled      := true;
         btnConsClientes.Enabled := true;
         btnConsProdutos.Enabled := true;
         adicionaGrid            := true;
         DBGrid1.Enabled         := true;
         btnAdicionar.Caption    := '&Adicionar';

         edtProduto.Clear;
         edtQuantidade.Clear;
         edtValorUnitario.Clear;
         lblproduto.Caption      := '';
         lblValorTotal.Caption   := '0,00';

         tbPedido.EnableControls;
         edtProduto.SetFocus;
      end;
end;

procedure TfrmPedidoVenda.btnAlterarClick(Sender: TObject);
begin
   operacao := 'A';
   abreConsPedidoVenda;
end;

procedure TfrmPedidoVenda.btnExcluirClick(Sender: TObject);
begin
   operacao := 'E';
   abreConsPedidoVenda;
end;

procedure TfrmPedidoVenda.btnGravarPedidoClick(Sender: TObject);
var sucesso: boolean;
begin
   sucesso := false;

   if (Trim(edtCliente.Text) = '') then
      begin
         Application.MessageBox('Informe o código do cliente.', 'Atenção!' , MB_ICONINFORMATION);
         edtCliente.SetFocus;
      end
   else if tbPedido.IsEmpty then
      begin
         Application.MessageBox('Informe o(s) produto(s) do pedido.', 'Atenção!' , MB_ICONINFORMATION);
         edtProduto.SetFocus;
      end
   else
      begin
         try
            sucesso := true;
            if (operacao = 'I') then
               begin

               dtModule.qryBusca.close;
               dtModule.qryBusca.SQL.Clear;
               DtModule.QryBusca.SQL.Add(' Insert into pedidos(   ');
               DtModule.QryBusca.SQL.Add('        idcliente       ');
               DtModule.QryBusca.SQL.Add('      , dataemissao     ');
               DtModule.QryBusca.SQL.Add('      , valortotal      ');
               DtModule.QryBusca.SQL.Add(' ) Values (             ');
               DtModule.QryBusca.SQL.Add(' :paridcliente,         ');
               DtModule.QryBusca.SQL.Add(' :pardataemissao,       ');
               DtModule.QryBusca.SQL.Add(' :parvalortotal );      ');
               DtModule.QryBusca.ParamByName('paridcliente').AsInteger     := StrToInt(edtCliente.Text);
               DtModule.QryBusca.ParamByName('pardataemissao').AsDateTime  := date +time;
               DtModule.QryBusca.ParamByName('parvalortotal').AsFloat      := tbPedidoTotalPedido.Value;
               DtModule.QryBusca.ExecSQL;

               idpedido := ultimoIdPedidoCadastrado;

               tbpedido.DisableControls;
               tbPedido.First;

               while not tbPedido.Eof do
                  begin
                     incluiPedidosProdutos(idpedido
                        , tbPedido.FieldByName('idproduto').AsInteger
                        , tbPedido.FieldByName('quantidade').AsFloat
                        , tbPedido.FieldByName('valorunitario').AsFloat
                        , tbPedido.FieldByName('valortotal').AsFloat);

                     tbPedido.Next;
                  end;

               tbPedido.EnableControls;
               end
            else if (operacao = 'A') then
               begin
                  dtModule.qryBusca.close;
                  dtModule.qryBusca.SQL.Clear;
                  DtModule.QryBusca.SQL.Add(' update pedidos set              ');
                  DtModule.QryBusca.SQL.Add(' valortotal = :parvalortotal     ');
                  DtModule.QryBusca.SQL.Add(' where idpedido = :paridpedido   ');
                  DtModule.QryBusca.ParamByName('paridpedido').AsInteger   := idpedido;
                  DtModule.QryBusca.ParamByName('parvalortotal').AsFloat   := tbPedidoTotalPedido.Value;
                  DtModule.QryBusca.ExecSQL;

                  if not tbRemovido.IsEmpty then
                     begin
                        tbRemovido.DisableControls;
                        tbRemovido.First;

                        while not tbRemovido.Eof do
                           begin
                              deletaPedidosProdutos(tbRemovido.FieldByName('idpedidos_produtos').AsInteger);

                              tbRemovido.Next;
                           end;

                        tbRemovido.EnableControls;
                     end;

                  if not tbPedido.IsEmpty then
                     begin
                        tbPedido.DisableControls;
                        tbPedido.First;

                        while not tbPedido.Eof do
                           begin
                              if tbPedido.FieldByName('idpedidos_produtos').IsNull then
                                 begin
                                    incluiPedidosProdutos(idpedido
                                       , tbPedido.FieldByName('idproduto').AsInteger
                                       , tbPedido.FieldByName('quantidade').AsFloat
                                       , tbPedido.FieldByName('valorunitario').AsFloat
                                       , tbPedido.FieldByName('valortotal').AsFloat);
                                 end
                              else
                                 begin
                                    dtModule.qryBusca.close;
                                    dtModule.qryBusca.SQL.Clear;
                                    DtModule.QryBusca.SQL.Add(' update pedidos_produtos set        ');
                                    DtModule.QryBusca.SQL.Add(' quantidade = :parquantidade,       ');
                                    DtModule.QryBusca.SQL.Add(' valor      = :parvalor,            ');
                                    DtModule.QryBusca.SQL.Add(' valortotal = :parvalortotal        ');
                                    DtModule.QryBusca.SQL.Add(' where idpedidos_produtos = :parid  ');
                                    DtModule.QryBusca.ParamByName('parid').AsInteger         := tbPedido.FieldByName('idpedidos_produtos').AsInteger;
                                    DtModule.QryBusca.ParamByName('parquantidade').AsFloat   := tbPedido.FieldByName('quantidade').AsFloat;
                                    DtModule.QryBusca.ParamByName('parvalor').AsFloat        := tbPedido.FieldByName('valorunitario').AsFloat;
                                    DtModule.QryBusca.ParamByName('parvalortotal').AsFloat   := tbPedido.FieldByName('valortotal').AsFloat;
                                    DtModule.QryBusca.ExecSQL;
                                 end;

                              tbPedido.Next;
                           end;

                     end;

               end
            else if (operacao = 'E') then
               begin
                  if (Application.MessageBox('Este registro será apagado.' + #13 + 'Confirmar operação?','Atenção!!!',292) = 6) then
                     begin
                        dtModule.qryBusca.close;
                        dtModule.qryBusca.SQL.Clear;
                        DtModule.QryBusca.SQL.Add(' Delete from pedidos_produtos    ');
                        DtModule.QryBusca.SQL.Add('  where idpedido = :paridpedido  ');
                        DtModule.QryBusca.ParamByName('paridpedido').AsInteger   := idpedido;
                        DtModule.QryBusca.ExecSQL;

                        dtModule.qryBusca.close;
                        dtModule.qryBusca.SQL.Clear;
                        DtModule.QryBusca.SQL.Add(' Delete from pedidos             ');
                        DtModule.QryBusca.SQL.Add('  where idpedido = :paridpedido  ');
                        DtModule.QryBusca.ParamByName('paridpedido').AsInteger   := idpedido;
                        DtModule.QryBusca.ExecSQL;
                     end
                  else
                     sucesso := false;
               end;
            dtmodule.FDConnection.Commit;
         except
            if dtmodule.FDConnection.InTransaction then
               dtmodule.FDConnection.Rollback;

            Application.HandleException(Self);
            sucesso := False;

         end;

      end;

   if sucesso then
      begin
         Application.MessageBox('Operação realizada com sucesso.','Atenção !!!', MB_ICONINFORMATION);
         btnCancelar.Click;
      end;
end;

procedure TfrmPedidoVenda.btnIncluirClick(Sender: TObject);
begin
   operacao := 'I';
   RestauraBotao(Self);
   edtCliente.SetFocus;
end;

procedure TfrmPedidoVenda.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPedidoVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = []) and (Key = 46) then
      begin
         Key := 0;
         if not tbPedido.IsEmpty then
            begin
               if not tbPedido.FieldByName('idpedidos_produtos').IsNull then
                  begin
                     tbremovido.Append;
                     tbRemovido.FieldByName('idpedidos_produtos').Value := tbPedido.FieldByName('idpedidos_produtos').Value;
                     tbRemovido.Post;
                     tbPedido.Delete;
                  end
               else
                  tbPedido.Delete;
            end;
      end
   else  if (Shift = []) and (Key = 13) then
      begin
         Key := 0;
         alteraGrid;
      end;


end;

procedure TfrmPedidoVenda.deletaPedidosProdutos(idpedidoproduto: integer);
begin
   DtModule.QryBusca.Close;
   DtModule.QryBusca.SQL.Clear;
   DtModule.QryBusca.SQL.Add(' Delete from pedidos_produtos          ');
   DtModule.QryBusca.SQL.Add('  where idpedidos_produtos = :parid    ');
   DtModule.QryBusca.ParamByName('parid').value := idpedidoproduto;
   DtModule.qryBusca.ExecSQL;
end;

procedure TfrmPedidoVenda.edtClienteExit(Sender: TObject);
begin
   if (Trim(edtCliente.Text) <> '') then
      begin
         DtModule.QryBusca.Close;
         DtModule.QryBusca.SQL.Clear;
         DtModule.QryBusca.SQL.Add('Select nome from clientes        ');
         DtModule.QryBusca.SQL.Add('Where idclientes = :paridcliente ');
         DtModule.QryBusca.ParamByName('paridcliente').value := edtCliente.Text;
         DtModule.qryBusca.Open;

         if not (dtModule.qryBusca.IsEmpty) then
            lblCliente.caption := dtModule.qryBusca.FieldByName('nome').AsString
         else
            begin
               Application.MessageBox( 'Código do cliente não encontrado.', 'Atenção !!!', MB_ICONINFORMATION );
               edtCliente.SetFocus;
            end;

      end;
end;

procedure TfrmPedidoVenda.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = []) and (Key = VK_F3) then
      begin
         Key := 0;
         abreConsCliente;
      end;
end;

procedure TfrmPedidoVenda.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key := #0;
end;

procedure TfrmPedidoVenda.edtProdutoExit(Sender: TObject);
begin
   if (Trim(edtProduto.Text) <> '') then
      begin
         DtModule.QryBusca.Close;
         DtModule.QryBusca.SQL.Clear;
         DtModule.QryBusca.SQL.Add('Select descricao, precovenda  ');
         DtModule.QryBusca.SQL.Add('  from produtos               ');
         DtModule.QryBusca.SQL.Add('Where idprodutos = :paridprodutos ');
         DtModule.QryBusca.ParamByName('paridprodutos').value := edtProduto.Text;
         DtModule.qryBusca.Open;

         if not (dtModule.qryBusca.IsEmpty) then
            begin
               lblProduto.caption      := dtModule.qryBusca.FieldByName('descricao').AsString;
               edtValorUnitario.Text   := FormatFloat('###.00', dtModule.qryBusca.FieldByName('precovenda').value);

            end
         else
            begin
               Application.MessageBox( 'Código do produto não encontrado.', 'Atenção !!!', MB_ICONINFORMATION );
               edtproduto.SetFocus;
            end;

      end;
end;

procedure TfrmPedidoVenda.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = []) and (Key = VK_F3) then
      begin
         Key := 0;
         abreConsProdutos;
      end;
end;

procedure TfrmPedidoVenda.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key := #0;
end;

procedure TfrmPedidoVenda.edtQuantidadeExit(Sender: TObject);
begin
   if not (Trim(edtQuantidade.Text) = '') and not (Trim(edtValorUnitario.Text) = '') then
      begin
         lblValorTotal.Caption := Formatfloat('###.00', (StrTofloat(edtQuantidade.Text) * StrToFloat(edtValorUnitario.Text)));
      end;
end;

procedure TfrmPedidoVenda.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13,',']) then
      Key := #0;
end;

procedure TfrmPedidoVenda.edtValorUnitarioExit(Sender: TObject);
begin
   if not (Trim(edtQuantidade.Text) = '') and not (Trim(edtValorUnitario.Text) = '') then
      begin
         lblValorTotal.Caption := Formatfloat('###.00', (StrToFloat(edtQuantidade.Text) * StrToFloat(edtValorUnitario.Text)));
      end;
end;

procedure TfrmPedidoVenda.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13,',']) then
      Key := #0;
end;

procedure TfrmPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tbPedido.close;
   tbPedido.Destroy;

   dtModule.qryBusca.close;

end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin

   tbPedido.CreateDataSet;
   tbPedido.Open;

   tbRemovido.CreateDataSet;
   tbRemovido.Open;

   adicionaGrid := true;
end;

procedure TfrmPedidoVenda.FormShow(Sender: TObject);
begin
   //
end;

procedure TfrmPedidoVenda.incluiPedidosProdutos(id_Pedido, id_produto :integer;
  quantidade, valor, total: Currency );
begin
   dtModule.qryBusca.close;
   dtModule.qryBusca.SQL.Clear;
   DtModule.QryBusca.SQL.Add(' Insert into pedidos_produtos (  ');
   DtModule.QryBusca.SQL.Add('        idpedido,                ');
   DtModule.QryBusca.SQL.Add('        idproduto,               ');
   DtModule.QryBusca.SQL.Add('        quantidade,              ');
   DtModule.QryBusca.SQL.Add('        valor,                   ');
   DtModule.QryBusca.SQL.Add('        valortotal               ');
   DtModule.QryBusca.SQL.Add('      ) Values (                 ');
   DtModule.QryBusca.SQL.Add('   :paridpedido,                 ');
   DtModule.QryBusca.SQL.Add('   :paridproduto,                ');
   DtModule.QryBusca.SQL.Add('   :parquantidade,               ');
   DtModule.QryBusca.SQL.Add('   :parvalor,                    ');
   DtModule.QryBusca.SQL.Add('   :parvalortotal)               ');
   DtModule.QryBusca.ParamByName('paridpedido').AsInteger   := id_pedido;
   DtModule.QryBusca.ParamByName('paridproduto').AsInteger  := id_produto;
   DtModule.QryBusca.ParamByName('parquantidade').AsFloat   := tbPedido.FieldByName('quantidade').AsFloat;
   DtModule.QryBusca.ParamByName('parvalor').AsFloat        := tbPedido.FieldByName('valorunitario').AsFloat;
   DtModule.QryBusca.ParamByName('parvalortotal').AsFloat   := tbPedido.FieldByName('valortotal').AsFloat;
   DtModule.QryBusca.ExecSQL;
end;

procedure TfrmPedidoVenda.preencheCampos;
begin
   idpedido := DtModule.QryBusca.FieldByName('idpedido').Value;

   DtModule.QryBusca.Close;
   DtModule.QryBusca.SQL.Clear;
   DtModule.QryBusca.SQL.Add('Select ped.idpedido, ped.dataemissao      ');
   DtModule.QryBusca.SQL.Add('     , ped.valortotal, cli.nome           ');
   DtModule.QryBusca.SQL.Add('     , cli.idclientes                     ');
   DtModule.QryBusca.SQL.Add('  from pedidos ped                        ');
   DtModule.QryBusca.SQL.Add(' inner join clientes cli                  ');
   DtModule.QryBusca.SQL.Add('    on (ped.idcliente = cli.idclientes)   ');
   DtModule.QryBusca.SQL.Add('Where ped.idpedido = :paridpedido         ');
   DtModule.QryBusca.ParamByName('paridpedido').value := idpedido;
   DtModule.QryBusca.Open;

   if not dtModule.qryBusca.IsEmpty then
      begin
         edtCliente.Text      := DtModule.QryBusca.FieldByName('idclientes').AsString;
         lblCliente.Caption   := DtModule.QryBusca.FieldByName('nome').AsString;

         DtModule.QryBusca.Close;
         DtModule.QryBusca.SQL.Clear;
         DtModule.QryBusca.SQL.Add('Select pedpro.idpedidos_produtos          ');
         DtModule.QryBusca.SQL.Add('     , pedpro.quantidade                  ');
         DtModule.QryBusca.SQL.Add('     , pro.idprodutos, pro.descricao      ');
         DtModule.QryBusca.SQL.Add('     , pedpro.valor, pedpro.valortotal    ');
         DtModule.QryBusca.SQL.Add('  from pedidos ped                        ');
         DtModule.QryBusca.SQL.Add(' inner join pedidos_produtos pedpro       ');
         DtModule.QryBusca.SQL.Add('    on (ped.idpedido = pedpro.idpedido)   ');
         DtModule.QryBusca.SQL.Add(' inner join produtos pro                  ');
         DtModule.QryBusca.SQL.Add('    on (pedpro.idproduto = pro.idprodutos)');
         DtModule.QryBusca.SQL.Add('Where ped.idpedido = :paridpedido         ');
         DtModule.QryBusca.ParamByName('paridpedido').value := idpedido;
         DtModule.QryBusca.Open;

         if not dtModule.qryBusca.IsEmpty then
            begin
               while not dtmodule.qrybusca.Eof do
                  begin
                     tbPedido.Append;
                     tbPedido.FieldByName('idproduto').AsInteger           := DtModule.QryBusca.FieldByName('idprodutos').AsInteger;
                     tbPedido.FieldByName('descricao').AsString            := DtModule.QryBusca.FieldByName('descricao').AsString;
                     tbPedido.FieldByName('quantidade').AsFloat            := DtModule.QryBusca.FieldByName('quantidade').AsFloat;
                     tbPedido.FieldByName('valorunitario').AsFloat         := DtModule.QryBusca.FieldByName('valor').AsFloat;
                     tbPedido.FieldByName('valortotal').AsFloat            := DtModule.QryBusca.FieldByName('valortotal').AsFloat;
                     tbPedido.FieldByName('idpedidos_produtos').AsInteger  := DtModule.QryBusca.FieldByName('idpedidos_produtos').AsInteger;
                     tbPedido.Post;

                     dtModule.qryBusca.Next;
                  end;

            end;

      end;


end;

procedure TfrmPedidoVenda.btnCancelarClick(Sender: TObject);
begin
   LimpaCampos(Self);
   RestauraBotao(Self);

   if (operacao = 'E') then
      RestExclusao(Self);

   adicionaGrid   := true;

   tbPedido.EmptyDataSet;
   tbRemovido.EmptyDataSet;
   DBGrid1.Refresh;
   btnGravarPedido.Enabled := false;
   btnCancelar.Enabled     := false;
end;

procedure TfrmPedidoVenda.btnConsClientesClick(Sender: TObject);
begin
   abreConsCliente;
end;

procedure TfrmPedidoVenda.btnConsProdutosClick(Sender: TObject);
begin
   abreConsProdutos;
end;

function TfrmPedidoVenda.ultimoIdPedidoCadastrado: integer;
begin
   result := 0;

   DtModule.QryBusca.Close;
   DtModule.QryBusca.SQL.Clear;
   DtModule.QryBusca.SQL.Add('select max(idpedido) ');
   DtModule.QryBusca.SQL.Add('    as maxID         ');
   DtModule.QryBusca.SQL.Add('  from pedidos       ');
   DtModule.QryBusca.Open;

   if not dtModule.qryBusca.IsEmpty then
      result := DtModule.QryBusca.FieldByName('maxID').AsInteger;

end;

end.
