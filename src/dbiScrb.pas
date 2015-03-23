unit dbiScrb;

interface uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TdbScrb = class(TDataModule)
    cnx: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryLastScribaOfBar: TFDQuery;
    qryInsertScriba: TFDQuery;
    qryUpdateScriba: TFDQuery;
    procedure cnxBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    function getLastScribaOfBar(pBarID: integer): boolean;
  end;

var
  dbScrb: TdbScrb;

implementation uses uEtcXE, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdbScrb.cnxBeforeConnect(Sender: TObject);
begin
  with Sender as TFDConnection do begin
    params.Values['Database'] := puntoIni.ReadString('database', 'scrb', ChangeFileExt(application.ExeName, '.gdb'));
    // lblRel.Caption := lblRel.Caption + ' | ' + params.Values['Database']
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

end.
