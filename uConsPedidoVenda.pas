unit uConsPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsPedidoVenda = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTexto: TEdit;
    cmbBusca: TComboBox;
    cmbTipo: TComboBox;
    btnPesquisar: TBitBtn;
    Panel3: TPanel;
    btnCancelar: TSpeedButton;
    Bevel1: TBevel;
    btnOk: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTextoClick(Sender: TObject);
    procedure edtTextoKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPedidoVenda: TfrmConsPedidoVenda;

implementation

{$R *.dfm}

uses uGlobal, uModule;

procedure TfrmConsPedidoVenda.btnCancelarClick(Sender: TObject);
begin
   cancelabusca := true;
   Close;
end;

procedure TfrmConsPedidoVenda.btnOkClick(Sender: TObject);
begin
   cancelabusca := False;
   Close;
end;

procedure TfrmConsPedidoVenda.btnPesquisarClick(Sender: TObject);
var lBuscaTodos :boolean;
begin
   lBuscaTodos := False;

   if (Trim(edtTexto.Text) = '') then
      begin
        lBuscaTodos := True;
        edtTexto.SetFocus;
        DtModule.QryBusca.Close;
        btnPesquisar.Default := True;
        btnOk.Enabled := False;
      end;

   if (lBuscaTodos) or (Trim(edtTexto.Text) <> '') then
      try
         Screen.Cursor := crHourGlass;

         DtModule.QryBusca.Close;
         DtModule.QryBusca.SQL.Clear;
         DtModule.QryBusca.SQL.Add('Select ped.idpedido, ped.dataemissao      ');
         DtModule.QryBusca.SQL.Add('     , ped.valortotal, cli.nome           ');
         DtModule.QryBusca.SQL.Add('  from pedidos ped                        ');
         DtModule.QryBusca.SQL.Add(' inner join clientes cli                  ');
         DtModule.QryBusca.SQL.Add('    on (ped.idcliente = cli.idclientes)   ');
         DtModule.QryBusca.SQL.Add(' Where 1 = 1                              ');
         if (not lBuscaTodos) then
            begin
               if (cmbBusca.ItemIndex = 0)  and (cmbTipo.ItemIndex = 0) then
                  DtModule.QryBusca.SQL.Add('and cli.nome Like ' + QuotedStr(Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 0) and (cmbTipo.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and cli.nome Like ' + QuotedStr('%' + Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and ped.idpedido = ' + QuotedStr(Trim(edtTexto.Text)));
            end;

         if (cmbBusca.ItemIndex = 1) then
            DtModule.QryBusca.SQL.Add('Order By ped.idpedido')
         else
            DtModule.QryBusca.SQL.Add('Order By cli.nome');
         DtModule.QryBusca.Open;

         if (DtModule.QryBusca.IsEmpty) then
            begin
               if (lBuscaTodos) then
                  Application.MessageBox('Nenhum registro foi cadastrado até o momento.', 'Atenção !!!', MB_ICONSTOP)
               else
                  Application.MessageBox('Não foram encontrados registros com o texto digitado.', 'Atenção !!!', MB_ICONSTOP);

               DtModule.QryBusca.Close;
               btnOk.Enabled := False;
               edtTexto.SetFocus;
               edtTexto.SelectAll;
               btnPesquisar.Default := True;
            end
         else
            begin
               btnOk.Enabled := True;
               btnOk.Default := True;
               btnPesquisar.Default := False;
               DBGrid1.SetFocus;
            end;
      finally
         Screen.Cursor := crDefault;
      end;
end;

procedure TfrmConsPedidoVenda.DBGrid1DblClick(Sender: TObject);
begin
   if (not DtModule.QryBusca.IsEmpty) then
      begin
         cancelabusca := False;
         Close;
      end;
end;

procedure TfrmConsPedidoVenda.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{   if (Key = 27) then
      begin
         DtModule.QryBusca.Close;
         edtTexto.Text := '';
         edtTexto.SetFocus;
         btnPesquisar.Default := True;
         btnOk.Default := False;
         btnOk.Enabled := False;
      end;   //}
end;

procedure TfrmConsPedidoVenda.edtTextoClick(Sender: TObject);
begin
   btnPesquisar.Default := True;
   btnOk.Default        := False;
end;

procedure TfrmConsPedidoVenda.edtTextoKeyPress(Sender: TObject; var Key: Char);
begin
   if (cmbBusca.ItemIndex <> 0) then
      if not (Key in['0'..'9', #8, #13]) then
         Key := #0;

   btnPesquisar.Default := True;
   btnOk.Default        := False;
end;

procedure TfrmConsPedidoVenda.FormShow(Sender: TObject);
begin
   cancelabusca := True;
   edtTexto.SetFocus;
end;

end.
