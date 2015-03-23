unit oScrbBars; { serializzazione dei movimenti su database

}

interface

type
  TScrbBar = class
  // CRUD ~ SCRIBA, senza delete
    _ID,
    _BAR_ID,
    _JOB_ID,
    _RECIPE_ID,
    _POSITION_ID,
    _RECIPE_SECS,
    _TANK_SECS,
    _FLAGS: integer;
    _DROP_TIME,
    _PICKUP_TIME: TDateTime;
    class function new(pBarID: integer): TScrbBar;
    procedure clearAlmostAll;
    procedure insert;
    procedure selectMostRecent;
    procedure update;
    function getJobIDByLegacyLOG: integer;
  end;

implementation uses dbiScrb, FireDAC.Comp.Client, System.SysUtils;

{ TScrbBar }

procedure setupParams(pScrbBar: TScrbBar; pFDQuery: TFDQuery; includePickupTime: boolean);
begin
  with pFDQuery do begin
    close;
    params.ParamValues['ID'         ] := pScrbBar._ID         ;
    params.ParamValues['BAR_ID'     ] := pScrbBar._BAR_ID     ;
    params.ParamValues['JOB_ID'     ] := pScrbBar._JOB_ID     ;
    params.ParamValues['RECIPE_ID'  ] := pScrbBar._RECIPE_ID  ;
    params.ParamValues['POSITION_ID'] := pScrbBar._POSITION_ID;
    params.ParamValues['RECIPE_SECS'] := pScrbBar._RECIPE_SECS;
    params.ParamValues['TANK_SECS'  ] := pScrbBar._TANK_SECS  ;
    params.ParamValues['FLAGS'      ] := pScrbBar._FLAGS      ;
    params.ParamValues['DROP_TIME'  ] := pScrbBar._DROP_TIME  ;
    if includePickupTime then params.ParamValues['PICKUP_TIME'] := pScrbBar._PICKUP_TIME;
  end;
end;

procedure TScrbBar.selectMostRecent;
begin
  if dbScrb.getLastScribaOfBar(_BAR_ID) then with dbScrb.qryLastScribaOfBar do begin
    _ID          := fieldByName('ID'         ).asInteger;
    _JOB_ID      := fieldByName('JOB_ID'     ).asInteger;
    _RECIPE_ID   := fieldByName('RECIPE_ID'  ).asInteger;
    _POSITION_ID := fieldByName('POSITION_ID').asInteger;
    _RECIPE_SECS := fieldByName('RECIPE_SECS').asInteger;
    _TANK_SECS   := fieldByName('TANK_SECS'  ).asInteger;
    _FLAGS       := fieldByName('FLAGS'      ).asInteger;
    _DROP_TIME   := fieldByName('DROP_TIME'  ).asDateTime;
    _PICKUP_TIME := fieldByName('PICKUP_TIME').asDateTime;
  end else _ID := 0;   // valore sentinella ...
end;

procedure TScrbBar.clearAlmostAll;
begin // tutto tranne id e poi metto now() nel Drop
  _ID          := 0;
  _JOB_ID      := 0;
  _RECIPE_ID   := 0;
  _POSITION_ID := 0;
  _RECIPE_SECS := 0;
  _TANK_SECS   := 0;
  _FLAGS       := 0;
  _DROP_TIME   := now();
  _PICKUP_TIME := 0;
end;

function TScrbBar.getJobIDByLegacyLOG: integer;
begin
  result := dbScrb.getLastJobOfBar(_BAR_ID)
end;

procedure TScrbBar.insert;
begin
  setupParams(self, dbScrb.qryInsertScriba, false);
  dbScrb.qryInsertScriba.ExecSQL;
end;

procedure TScrbBar.update;
begin
  setupParams(self, dbScrb.qryUpdateScriba, true);
  dbScrb.qryUpdateScriba.ExecSQL;
end;

class function TScrbBar.new(pBarID: integer): TScrbBar;
begin
  result := TScrbBar.Create;
  result._BAR_ID := pBarID;
end;

end.
