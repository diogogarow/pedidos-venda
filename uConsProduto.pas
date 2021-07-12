unit uConsProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmConsProduto = class(TForm)
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
    procedure edtTextoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbBuscaChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsProduto: TfrmConsProduto;

implementation

{$R *.dfm}

uses uGlobal, uModule;

procedure TfrmConsProduto.btnCancelarClick(Sender: TObject);
begin
   cancelabusca := true;
   Close;
end;

procedure TfrmConsProduto.btnOkClick(Sender: TObject);
begin
   cancelabusca := False;
   Close;
end;

procedure TfrmConsProduto.btnPesquisarClick(Sender: TObject);
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
         DtModule.QryBusca.SQL.Add('Select idprodutos       ');
         DtModule.QryBusca.SQL.Add('     , descricao        ');
         DtModule.QryBusca.SQL.Add('     , precovenda       ');
         DtModule.QryBusca.SQL.Add('  from produtos         ');
         DtModule.QryBusca.SQL.Add(' Where  1 = 1           ');
         if (not lBuscaTodos) then
            begin
               if (cmbBusca.ItemIndex = 0)  and (cmbTipo.ItemIndex = 0) then
                  DtModule.QryBusca.SQL.Add('and descricao Like ' + QuotedStr(Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 0) and (cmbTipo.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and descricao Like ' + QuotedStr('%' + Trim(edtTexto.Text) + '%'))
               else if (cmbBusca.ItemIndex = 1) then
                  DtModule.QryBusca.SQL.Add('and idprodutos = ' + QuotedStr(Trim(edtTexto.Text)));
            end;

         if (cmbBusca.ItemIndex = 1) then
            DtModule.QryBusca.SQL.Add('Order By idprodutos')
         else
            DtModule.QryBusca.SQL.Add('Order By descricao');
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

procedure TfrmConsProduto.cmbBuscaChange(Sender: TObject);
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

procedure TfrmConsProduto.DBGrid1DblClick(Sender: TObject);
begin
   if (not DtModule.QryBusca.IsEmpty) then
      begin
         cancelabusca := False;
         Close;
      end;
end;

procedure TfrmConsProduto.DBGrid1KeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmConsProduto.edtTextoKeyPress(Sender: TObject; var Key: Char);
begin
   if (cmbBusca.ItemIndex <> 0) then
      if not (Key in['0'..'9', #8, #13]) then
         Key := #0;

   btnPesquisar.Default := True;
   btnOk.Default        := False;
end;

end.
