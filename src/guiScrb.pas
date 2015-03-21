unit guiScrb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormScrb = class(TForm)
    pnlHead: TPanel;
    lblRel: TLabel;
    lblStep: TLabel;
    tmrStep: TTimer;
    cbStep: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure pnlHeadDblClick(Sender: TObject);
    procedure tmrStepTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScrb: TFormScrb;

implementation

{$R *.dfm}

uses uOPCMain, oMyLog, uEtcXE;

var
  _booting: boolean = True;
  _OPCcountDown: integer = 3;


procedure TFormScrb.FormActivate(Sender: TObject);
begin if not _booting then exit;
  _booting := False;
  lblRel.Caption := 'Rel. ' + sGetBuildInfo;
  MainOPCdlg.show;
end;

procedure TFormScrb.pnlHeadDblClick(Sender: TObject);
begin
  MainOPCdlg.show;
end;

procedure TFormScrb.tmrStepTimer(Sender: TObject);
begin
  tmrStep.Enabled := False;
  try
    if not cbStep.Checked then exit;
    if _OPCcountDown > 0 then begin
      dec( _OPCcountDown );
    end else if (not MainOPCdlg.connected) then begin
      MainOPCdlg.loadFromXML(puntoIni.ReadString('OPC', 'xml', ChangeFileExt(Application.ExeName, '.xml')));
      Application.ProcessMessages;
      MainOPCdlg.close;
    end else begin
      // step;
    end;
    if lblStep.Caption = 'O°' then lblStep.Caption := '°O' else lblStep.Caption := 'O°';
  finally
    tmrStep.Enabled := true;   // continua il conto alla rovescia
  end;
end;

end.
