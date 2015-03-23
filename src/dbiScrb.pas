unit dbiScrb;

interface uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TdbScrb = class(TDataModule)
    cnxScriba: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryLastScribaOfBar: TFDQuery;
    qryInsertScriba: TFDQuery;
    qryUpdateScriba: TFDQuery;
    qrySelectScribaByDropTime: TFDQuery;
    cnxLOG: TFDConnection;
    qryLastJobOfBar: TFDQuery;
    procedure cnxScribaBeforeConnect(Sender: TObject);
    procedure cnxLOGBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    function getLastJobOfBar(pBarID: integer): integer;
    function getLastScribaOfBar(pBarID: integer): boolean;
    procedure selectScribaByDropTime(pFrom, pTo: TDateTime);
  end;

var
  dbScrb: TdbScrb;

implementation uses uEtcXE, Vcl.Forms, oMyLog;

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdbScrb.cnxLOGBeforeConnect(Sender: TObject);
begin
  with Sender as TFDConnection do begin
    params.Values['Database'] := puntoIni.ReadString('database', 'LOG', ChangeFileExt(application.ExeName, '.gdb'));
    // lblRel.Caption := lblRel.Caption + ' | ' + params.Values['Database']
  end;
end;

procedure TdbScrb.cnxScribaBeforeConnect(Sender: TObject);
begin
  with Sender as TFDConnection do begin
    params.Values['Database'] := puntoIni.ReadString('database', 'scrb', ChangeFileExt(application.ExeName, '.gdb'));
    // lblRel.Caption := lblRel.Caption + ' | ' + params.Values['Database']
  end;
end;

function TdbScrb.getLastJobOfBar(pBarID: integer): integer;
begin
  with qryLastJobOfBar do begin
    close;
    params.ParamValues['BAR_ID'] := pBarID;
    open;
    if fieldByName('IDBARRA').AsInteger = pBarID then begin
      result := fieldByName('IDJOB').AsInteger;
    end else result := -1;
  end;
end;

function TdbScrb.getLastScribaOfBar(pBarID: integer): boolean;
begin
  with qryLastScribaOfBar do begin
    close;
    params.ParamValues['BAR_ID'] := pBarID;
    open;
    result := fieldByName('BAR_ID').AsInteger = pBarID
  end;
end;

procedure TdbScrb.selectScribaByDropTime(pFrom, pTo: TDateTime);
begin
  with qrySelectScribaByDropTime do begin
    close;
    params.ParamValues['FROM_DROP_TIME'] := pFrom;
    params.ParamValues['TO_DROP_TIME'  ] := pTo;
    open;
    myLog.add(Format('viewing logs "%s" ÷ "%s"', [
      FormatDateTime('dd/mm/yy hh:nn:ss', params.ParamValues['FROM_DROP_TIME'])
    , FormatDateTime('dd/mm/yy hh:nn:ss', params.ParamValues['TO_DROP_TIME'  ])
    ]))
  end;
end;

end.
