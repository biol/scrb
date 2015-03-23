unit guiScrb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

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

uses uOPCMain, oMyLog, uEtcXE, oCtrlBars;

var
  _booting: boolean = True;
  _OPCcountDown: integer = 3;
  myCtrlBars: TCtrolBars;

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
      myCtrlBars.boot(
        MainOPCdlg.getOpcGroupByName('B.Position')
      , MainOPCdlg.getOpcGroupByName('B.Recipe')
      , MainOPCdlg.getOpcGroupByName('B.BaDT')
      , MainOPCdlg.getOpcGroupByName('B.empty')
      , MainOPCdlg.getOpcGroupByName('B.Available')
      , MainOPCdlg.getOpcGroupByName('B.InTreatment')
      , MainOPCdlg.getOpcGroupByName('B.RecipeSecs')
      , MainOPCdlg.getOpcGroupByName('B.TankSecs')
      );
    end else begin
      myCtrlBars.step;
    end;
    if lblStep.Caption = 'O°' then lblStep.Caption := '°O' else lblStep.Caption := 'O°';
  finally
    tmrStep.Enabled := true;   // continua il conto alla rovescia
  end;
end;

initialization
  myCtrlBars := TCtrolBars.Create;

finalization
  myCtrlBars.Free;

end.

