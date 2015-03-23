unit oCtrlBars; { controllo: acquisizione e serializzazione

}

interface uses oOpcBars, oScrbBars, dOPCDA;

type
  TCtrolBar = class
    _ScrbBar: TScrbBar;
    _OpcBar: TOpcBar;
    procedure boot;
    procedure step;
  end;

  TCtrolBars = class
    aCtrolBars: array of TCtrolBar;
    procedure boot(
      dPosition
    , dRecipe
    , dBaDT
    , dEmpty
    , dAvailable
    , dInTreatment
    , dRecipeSecs
    , dTankSecs: TdOpcGroup);
    procedure step;
  end;

implementation uses System.SysUtils;

const
  K_Crane_bias = 2000;


{ TCtrolBar }

procedure TCtrolBar.boot;
begin { se la barra è in volo aspettiamo che atterri: NON deve scattare la isPositionChanged nel prossimo step
  ELSE: l'ultimo record ... se la posizione non combacia inserire ASAP, facendo scattare la isPositionChanged
}
  if _OpcBar.position > K_Crane_bias then begin   // barra in volo
    _OpcBar.cachePosition := _OpcBar.position // NON deve scattare la isPositionChanged
  end else { barra in vasca } if (_ScrbBar._ID <= 0) or (_OpcBar.position <> _ScrbBar._POSITION_ID) then begin
    // record assente in Scriba oppure posizione NON coincidente: va creato il NUOVO record ASAP
    _OpcBar.cachePosition := -1   // far scattare la positionChanged
  end;
end;

procedure TCtrolBar.step;
begin
  if _OpcBar.isPositionChanged then begin
    if _OpcBar.Position > K_Crane_bias then begin
      // barra in volo: chiudere il record su scriba con il tempo di prelievo e i dati in cache
      _ScrbBar.selectMostRecent;
      _ScrbBar._JOB_ID      := _ScrbBar.getJobIDByLegacyLOG; // andare a recuperarlo solo ADESSO (è in un altro database!)
      _ScrbBar._RECIPE_ID   := _OpcBar.cacheRecipe;
      _ScrbBar._RECIPE_SECS := _OpcBar.cacheRecipeSecs;  // toDo: recuperare il dato dalle recipes? No! E se è stato alterato a mano?
      _ScrbBar._TANK_SECS   := _OpcBar.cacheTankSecs;
      _ScrbBar._FLAGS       := _OpcBar.getCacheFlags;
      _ScrbBar._PICKUP_TIME := now();
      _ScrbBar.update;
    end else begin
      // barra atterrata: creare nuovo record ignorando TUTTI gli altri dati: solo posizione e tempo di deposito
      _ScrbBar.clearAlmostAll;
      _ScrbBar._POSITION_ID := _OpcBar.Position;
      _ScrbBar.insert;
    end;
  end;
  _OpcBar.updateCache;   // in ogni caso alla fine metto da parte i dati più recenti dell'OPC
end;

{ TCtrolBars }

procedure TCtrolBars.boot(dPosition, dRecipe, dBaDT, dEmpty, dAvailable, dInTreatment, dRecipeSecs, dTankSecs: TdOpcGroup);
var i: integer;
  function blip(d: TdOpcGroup; i: integer): TdOpcItem; begin result := d.OPCItems[i] end;
begin
  setLength(aCtrolBars, dPosition.OPCItems.Count);
  for i := 0 to high(aCtrolBars) do begin
    aCtrolBars[i] := TCtrolBar.Create;
    aCtrolBars[i]._ScrbBar := TScrbBar.new(i + 1);
    aCtrolBars[i]._OpcBar  := TOpcBar.new(
      blip(dPosition, i)
    , blip(dRecipe, i)
    , blip(dBaDT, i)
    , blip(dEmpty, i)
    , blip(dAvailable, i)
    , blip(dInTreatment, i)
    , blip(dRecipeSecs, i)
    , blip(dTankSecs, i)
    );
    aCtrolBars[i].boot;
  end;
end;

procedure TCtrolBars.step;
var my: TCtrolBar;
begin
  for my in aCtrolBars do my.step;
end;

end.


