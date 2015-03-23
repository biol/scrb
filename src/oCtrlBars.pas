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

implementation



{ TCtrolBar }

procedure TCtrolBar.boot;
begin { l'ultimo record ... la posizione è la stessa? allora ripartiamo da lì, altrimenti:
  se adesso è sul carro ... niente, aspettiamo che atterri, altrimenti nuovo record
}

end;

procedure TCtrolBar.step;
const
  K_Crane_bias = 2000;
begin
  if _OpcBar.isPositionChanged then begin
    if _OpcBar.Position > K_Crane_bias then begin
      // barra in volo: chiudere il record su scriba con il tempo di prelievo
    end else begin
      // barra atterrata: creare nuovo record
    end;
  end;
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


