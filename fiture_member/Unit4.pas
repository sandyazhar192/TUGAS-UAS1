unit Unit4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQuickReport4 = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrbndColumnHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrshp1: TQRShape;
    qrshp2: TQRShape;
    qrshp3: TQRShape;
    qrshp4: TQRShape;
    qrshp5: TQRShape;
    qrshp6: TQRShape;
    qrshp7: TQRShape;
    qrdbtxtid: TQRDBText;
    qrdbtxtnik1: TQRDBText;
    qrdbtxtnama: TQRDBText;
    qrdbtxtemail1: TQRDBText;
    qrdbtxtemail2: TQRDBText;
    qrdbtxttelp1: TQRDBText;
    qrdbtxtmember2: TQRDBText;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
  private

  public

  end;

var
  QuickReport4: TQuickReport4;

implementation

uses
  Unit1, Unit2;

{$R *.DFM}

end.
