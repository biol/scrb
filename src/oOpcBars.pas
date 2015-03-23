unit oOpcBars; { rappresentazione delle barre su PLC main

}

interface uses dOPCDA;

type
  TOpcBar = class
    _Position
  , _Recipe
  , _BaDT
  , _Empty
  , _Available
  , _InTreatment
  , _RecipeSecs
  , _TankSecs: TdOPCItem;
    cachePosition
  , cacheRecipe
  , cacheRecipeSecs
  , cacheTankSecs: integer;
    cacheBaDT
  , cacheEmpty
  , cacheAvailable
  , cacheInTreatment: boolean;
    class function new(  pPosition
                       , pRecipe
                       , pBaDT
                       , pEmpty
                       , pAvailable
                       , pInTreatment
                       , pRecipeSecs
                       , pTankSecs: TdOPCItem
    ): TOpcBar;
    function position: integer;
    function isPositionChanged: boolean;
    function isFlagsChanged: boolean;
    procedure updateCache;
    function getFlags: integer;
    function getCacheFlags: integer;
  end;

implementation

{ TOpcBar }

function TOpcBar.getCacheFlags: integer;
var
  lBaDT
, lEmpty
, lAvailable
, lInTreatment: integer;
begin
  if cacheAvailable   then lAvailable   := 1 else lAvailable   := 0;
  if cacheEmpty       then lEmpty       := 1 else lEmpty       := 0;
  if cacheBaDT        then lBaDT        := 1 else lBaDT        := 0;
  if cacheInTreatment then lInTreatment := 1 else lInTreatment := 0;
  result := lAvailable OR (lEmpty shl 1) OR (lBaDT shl 2) OR (lInTreatment shl 3);
end;

function TOpcBar.getFlags: integer;
var
  lBaDT
, lEmpty
, lAvailable
, lInTreatment: integer;
begin
  if _Available  .value then lAvailable   := 1 else lAvailable   := 0;
  if _empty      .value then lEmpty       := 1 else lEmpty       := 0;
  if _BaDT       .value then lBaDT        := 1 else lBaDT        := 0;
  if _InTreatment.value then lInTreatment := 1 else lInTreatment := 0;
  result := lAvailable OR (lEmpty shl 1) OR (lBaDT shl 2) OR (lInTreatment shl 3);
end;

function TOpcBar.isFlagsChanged: boolean;
begin
  result := getCacheFlags <> getFlags;
end;

function TOpcBar.isPositionChanged: boolean;
begin
  result := cachePosition <> _Position.value;
end;

class function TOpcBar.new(pPosition, pRecipe, pBaDT, pEmpty, pAvailable, pInTreatment, pRecipeSecs, pTankSecs: TdOPCItem): TOpcBar;
begin
  result := TOpcBar.Create;
  result._Position    := pPosition   ;
  result._Recipe      := pRecipe     ;
  result._BaDT        := pBaDT       ;
  result._Empty       := pEmpty      ;
  result._Available   := pAvailable  ;
  result._InTreatment := pInTreatment;
  result._RecipeSecs  := pRecipeSecs ;
  result._TankSecs    := pTankSecs   ;
end;

function TOpcBar.position: integer;
begin
  result := _Position.value;
end;

procedure TOpcBar.updateCache;
begin
  cachePosition    := _Position   .value;
  cacheRecipe      := _Recipe     .value;
  cacheRecipeSecs  := _RecipeSecs .value;
  cacheTankSecs    := _TankSecs   .value;
  cacheBaDT        := _BaDT       .value;
  cacheEmpty       := _Empty      .value;
  cacheAvailable   := _Available  .value;
  cacheInTreatment := _InTreatment.value;
end;

end.

