unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmCadCliente = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    edtCidade: TEdit;
    Panel2: TPanel;
    cmbUF: TComboBox;
    btnOk: TBitBtn;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    idCliente : integer;
    function validaCampos: boolean;

  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uGlobal, uModule;

function TfrmCadCliente.validaCampos: boolean;
begin
   result := false;

   if (Trim(edtNome.Text) = '') then
      begin
         Application.MessageBox('Informe o nome.', 'Atenção!' , MB_ICONINFORMATION);
         edtNome.SetFocus;
      end
   else if (Trim(edtcidade.Text) = '') then
      begin
         Application.MessageBox('Informe a cidade.', 'Atenção!' , MB_ICONINFORMATION);
         edtNome.SetFocus;
      end
   else if (cmbUF.ItemIndex = -1) then
      begin
         Application.MessageBox('Informe a Unidade Federativa.', 'Atenção!' , MB_ICONINFORMATION);
         cmbUF.SetFocus;
      end
   else
      result := true
end;

procedure TfrmCadCliente.btnOkClick(Sender: TObject);
var sucesso: boolean;
begin
   sucesso := true;

   if validacampos then
      begin
         try
            if (operacao = 'I') then
               begin
                  dtModule.qryBusca.close;
                  dtModule.qryBusca.SQL.Clear;
                  DtModule.QryBusca.SQL.Add(' Insert into clientes(  ');
                  DtModule.QryBusca.SQL.Add(' nome, cidade, uf)      ');
                  DtModule.QryBusca.SQL.Add(' Values (               ');
                  DtModule.QryBusca.SQL.Add(' :parNome,              ');
                  DtModule.QryBusca.SQL.Add(' :parCidade,            ');
                  DtModule.QryBusca.SQL.Add(' :parUF );              ');
                  DtModule.QryBusca.ParamByName('parNome').AsString     := edtnome.Text;
                  DtModule.QryBusca.ParamByName('parCidade').AsString   := edtcidade.Text;
                  DtModule.QryBusca.ParamByName('parUF').AsString       := cmbUF.Text;
                  DtModule.QryBusca.ExecSQL;
               end
            else if (operacao = 'A') then
               begin
                  dtModule.qryBusca.close;
                  dtModule.qryBusca.SQL.Clear;
                  DtModule.QryBusca.SQL.Add(' update clientes set             ');
                  DtModule.QryBusca.SQL.Add(' nome    = :parNome,             ');
                  DtModule.QryBusca.SQL.Add(' cidade  = :parCidade,           ');
                  DtModule.QryBusca.SQL.Add(' UF      = :parUF                ');
                  DtModule.QryBusca.SQL.Add(' Where idclientes = :paridcliente');
                  DtModule.QryBusca.ParamByName('paridcliente').AsInteger  := idCliente;
                  DtModule.QryBusca.ParamByName('parNome').AsString        := edtnome.Text;
                  DtModule.QryBusca.ParamByName('parCidade').AsString      := edtcidade.Text;
                  DtModule.QryBusca.ParamByName('parUF').AsString          := cmbUF.Text;
                  DtModule.QryBusca.ExecSQL;
               end
            else if (operacao = 'E') then
               begin
                  if (Application.MessageBox('Este registro será apagado.' + #13 + 'Confirmar operação?','Atenção!!!',292) = 6) then
                     begin

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
      end
   else
      sucesso := false;

   if sucesso then
      begin
         Application.MessageBox('Operação realizada com sucesso.','Atenção !!!', MB_ICONINFORMATION);
         btnCancelar.Click;
      end;

end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
   operacao := 'A';

end;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
   LimpaCampos(Self);
   RestauraBotao(Self);

   if (operacao = 'E') then
      RestExclusao(Self);
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
   operacao := 'E';
end;

procedure TfrmCadCliente.btnIncluirClick(Sender: TObject);
begin
   operacao := 'I';
   RestauraBotao(Self)
end;

procedure TfrmCadCliente.btnSairClick(Sender: TObject);
begin
   Close;
end;



end.
