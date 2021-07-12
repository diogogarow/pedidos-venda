unit uModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.Win.ADODB, Data.DBXMySQL, Data.SqlExpr,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdtModule = class(TDataModule)
    FDMySQLDriver: TFDPhysMySQLDriverLink;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    qryBusca: TFDQuery;
    FDQuery2: TFDQuery;
    dtsBusca: TDataSource;
    FDStoredProc1: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtModule: TdtModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
