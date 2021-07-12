unit uConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmConsCliente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTexto: TEdit;
    cmbBusca: TComboBox;
    cmbTipo: TComboBox;
    btnPesquisar: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnCancelar: TSpeedButton;
    Bevel1: TBevel;
    btnOk: TBitBtn;
    procedure btnPesquisarClick(Sender: TObject);
    procedure cmbBuscaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTextoClick(Sender: TObject);
    procedure edtTextoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCliente: TfrmConsCliente;

implementation

{$R *.dfm}

uses uModule, uGlobal;

procedure TfrmConsCliente.btnCancelarClick(Sender: TObject);
begin
   cancelabusca := true;
   Close;
end;

procedure TfrmConsCliente.btnOkClick(Sender: TObject);
begin
   cancelabusca := False;
   Close;
end;

procedure TfrmConsCliente.btnPesquisarClick(Sender: TObject);
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
         DtModule.QryBusca.SQL.Add('Select idclientes       ');
         DtModule.QryBusca.SQL.Add('     , nome, cidade, UF ');
         DtModule.QryBusca.SQL.Add('  from clientes         ');
         DtModule.QryBusca.SQL.Add(' Where  1 = 1           ');
         if (not lBuscaTodos) then
            begin
               if (cmbBusca.ItemIndex = 0)  and (cmbTipo.ItemIndex = 0) then
                  DtModule.QryBusca.SQL.Add('and nome Like ' + QuotedStr(Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 0) and (cmbTipo.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and nome Like ' + QuotedStr('%' + Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and idclientes = ' + QuotedStr(Trim(edtTexto.Text)));
            end;

         if (cmbBusca.ItemIndex = 1) then
            DtModule.QryBusca.SQL.Add('Order By idclientes')
         else
            DtModule.QryBusca.SQL.Add('Order By nome');
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

procedure TfrmConsCliente.cmbBuscaChange(Sender: TObject);
begin
   edtTexto.Text := '';

   if (cmbBusca.ItemIndex = 0) then
      begin
         edtTexto.MaxLength := 60;
         cmbTipo.Enabled    := True;
      end
   else
      begin
         edtTexto.MaxLength := 8;
         cmbTipo.ItemIndex  := 0;
         cmbTipo.Enabled    := False;
      end;

   edtTexto.SetFocus;
end;

procedure TfrmConsCliente.DBGrid1DblClick(Sender: TObject);
begin
   if (not DtModule.QryBusca.IsEmpty) then
      begin
         cancelabusca := False;
         Close;
      end;
end;

procedure TfrmConsCliente.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = 27) then
      begin
         DtModule.QryBusca.Close;
         edtTexto.Text := '';
         edtTexto.SetFocus;
         btnPesquisar.Default := True;
         btnOk.Default := False;
         btnOk.Enabled := False;
      end;
end;

procedure TfrmConsCliente.edtTextoClick(Sender: TObject);
begin
   btnPesquisar.Default := True;
   btnOk.Default        := False;
end;

procedure TfrmConsCliente.edtTextoKeyPress(Sender: TObject; var Key: Char);
begin
   if (cmbBusca.ItemIndex <> 0) then
      if not (Key in['0'..'9', #8, #13]) then
         Key := #0;

   btnPesquisar.Default := True;
   btnOk.Default        := False;
end;

procedure TfrmConsCliente.FormShow(Sender: TObject);
begin
   cancelabusca := True;
   edtTexto.SetFocus;
end;

end.
