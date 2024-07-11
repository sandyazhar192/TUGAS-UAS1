unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    edt7: TEdit;
    dbgrd1: TDBGrid;
    cbb1: TComboBox;
    lbl9: TLabel;
    btn6: TButton;
    lbl10: TLabel;
    procedure posisiawal;
    procedure FormCreate(Sender: TObject);
    procedure bersih;
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt7Change(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation

uses
  Unit2, Unit4;

{$R *.dfm}

procedure TForm1.posisiawal;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
btn1.Enabled:= True;
btn2.Enabled:= false;
btn3.Enabled:= false;
btn4.Enabled:= false;
btn5.Enabled:= false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
btn1.Enabled:= True;
btn2.Enabled:= false;
btn3.Enabled:= false;
btn4.Enabled:= false;
btn5.Enabled:= false;
btn6.Enabled:= True;
cbb1.Enabled:= False;
end;

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt7.Clear;

end;

procedure TForm1.btn1Click(Sender: TObject);
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
btn1.Enabled:= False;
btn2.Enabled:= True;
btn3.Enabled:= false;
btn4.Enabled:= false;
btn5.Enabled:= True;
cbb1.Enabled:= True;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text:= DataModule2.ZMember.Fields[1].AsString;
edt2.Text:= DataModule2.ZMember.Fields[2].AsString;
edt3.Text:= DataModule2.ZMember.Fields[3].AsString;
edt4.Text:= DataModule2.ZMember.Fields[4].AsString;
edt5.Text:= DataModule2.ZMember.Fields[5].AsString;
a:= DataModule2.ZMember.Fields[0].AsString;

edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
btn1.Enabled:= False;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
btn6.Enabled:= True;
cbb1.Enabled:= True;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
DataModule2.ZMember.SQL.Clear;
DataModule2.ZMember.SQL.Add('insert into kustomer values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+cbb1.Text+'")');
DataModule2.ZMember.ExecSQL ;

DataModule2.ZMember.SQL.Clear;
DataModule2.ZMember.SQL.Add('select * from kustomer');
DataModule2.ZMember.Open;
ShowMessage('Data Berhasil DiSimpan!');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
begin
  if edt1.Text = '' then
  begin
    ShowMessage('Nama Satuan Tidak Boleh Kosong!');
  end
  else if edt2.Text = '' then
  begin
    ShowMessage('Deskripsi Tidak Boleh Kosong!');
  end
  else if (edt1.Text = DataModule2.ZMember.FieldByName('nik').AsString) and
          (edt2.Text = DataModule2.ZMember.FieldByName('nama').AsString) and
          (edt3.Text = DataModule2.ZMember.FieldByName('telp').AsString) and
          (edt4.Text = DataModule2.ZMember.FieldByName('email').AsString) and
          (edt5.Text = DataModule2.ZMember.FieldByName('alamat').AsString) then

  begin
    ShowMessage('Data Kustomer ' + edt1.Text + ' Tidak Ada Perubahan');
    ShowMessage('Data Kustomer ' + edt2.Text + ' Tidak Ada Perubahan');
    ShowMessage('Data Kustomer ' + edt3.Text + ' Tidak Ada Perubahan');
    ShowMessage('Data Kustomer ' + edt4.Text + ' Tidak Ada Perubahan');
    ShowMessage('Data Kustomer ' + edt5.Text + ' Tidak Ada Perubahan');
  end
  else
  begin
    // Update operation
    with DataModule2.ZMember do
    begin
      SQL.Clear;
      SQL.Add('update kustomer set nik = "' + edt1.Text + '", nama = "' + edt2.Text + '", telp = "' + edt3.Text + '",email = "' + edt4.Text + '",alamat = "' + edt5.Text + '" where id = "' + a + '"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from kustomer');
      Open;
    end;
    ShowMessage('Data Berhasil DiEdit!');
  end;
end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
begin
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule2.ZMember do
begin
SQL.Clear;
SQL.Add('delete from kustomer where id= "'+a+'"');
ExecSQL ;

SQL.Clear;
SQL.Add('select * from kustomer');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin

ShowMessage('Data Batal Dihapus!');

end;
end;
end;

procedure TForm1.edt7Change(Sender: TObject);
begin
with DataModule2.ZMember do
begin
SQL.Clear;
SQL.Add('select * from kustomer where nama like "%'+edt7.Text+'%"');
Open;
end;
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
if cbb1.Text = 'YES' then
  begin
    lbl10.Caption := '10%';
  end
  else if cbb1.Text = 'NO' then
  begin
    lbl10.Caption := '5%';
  end
  else
  begin
    lbl10.Caption := '';
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
DataModule2.preview;
end;

end.
