unit Unit2;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, frxClass, frxDBSet;

type
  TDataModule2 = class(TDataModule)
    Zconnection: TZConnection;
    ZMember: TZQuery;
    dsmember: TDataSource;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    procedure preview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}


procedure TDataModule2.preview;
begin
frxdbdtst1.DataSet :=  DataModule2.ZMember;
frxrprt1.ShowReport;
end;

end.
