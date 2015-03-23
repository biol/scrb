program Scrb;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  guiScrb in 'guiScrb.pas' {FormScrb},
  uOPCMain in '..\..\..\commonXE\dOPC\uOPCMain.pas' {MainOPCdlg},
  oMyLog in '..\..\..\commonXE\oMyLog.pas',
  uEtcXE in '..\..\..\commonXE\uEtcXE.pas',
  OPCGroupDlg in '..\..\..\commonXE\dOPC\OPCGroupDlg.pas' {EditGroupDlg},
  uExplorer in '..\..\..\commonXE\dOPC\uExplorer.pas' {ExplorerDlg},
  uInspector in '..\..\..\commonXE\dOPC\uInspector.pas' {InspecDlg},
  uSelGroupDlg in '..\..\..\commonXE\dOPC\uSelGroupDlg.pas' {SelGroupDlg},
  dbiScrb in 'dbiScrb.pas' {dbScrb: TDataModule},
  oScrbBars in 'oScrbBars.pas',
  oOpcBars in 'oOpcBars.pas',
  oCtrlBars in 'oCtrlBars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormScrb, FormScrb);
  Application.CreateForm(TMainOPCdlg, MainOPCdlg);
  Application.CreateForm(TExplorerDlg, ExplorerDlg);
  Application.CreateForm(TInspecDlg, InspecDlg);
  Application.CreateForm(TdbScrb, dbScrb);
  Application.Run;
end.
