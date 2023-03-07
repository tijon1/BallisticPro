//=============================================================================
// BCReplicationInfo.
//
// Special global replication actor for transmitting server-side globals to all
// clients.
// This is spawned at the beginning of the match by mutator, then it is
// replicated to all clients. Client then copies the values of all the varibles
// to its defaults. After that, all actors client side can see what the server
// has set by reading the defaults of this class.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class BCReplicationInfo extends LinkedReplicationInfo config(BallisticProV55);

var() string		ModString;

enum EGameStyle
{
	Arena,		// BallisticPro
	Legacy,		// BallisticV25
	Realism,	// Kab
	Tactical	// PvE
};

//=============================================================================
// CONFIG VARIABLES
//=============================================================================
var() globalconfig EGameStyle	GameStyle;				
var() globalconfig float		AccuracyScale;			// Used for scaling general weapon accuracy.
var() globalconfig float		RecoilScale;			// Used for scaling general weapon recoil.
var() globalconfig bool		    bNoJumpOffset;			// Prevents weapons shifting and being offset when jumping or sprinting
var() globalconfig bool		    bNoLongGun;				// Disable 'long gun' features
var() globalconfig bool		    bNoReloading;			// Disables reloading and weapons use boring old style ammo handling...
var() globalconfig float      	ReloadSpeedScale;   	// Buff reload speeds
var() globalconfig bool         bAlternativePickups;	// Press Use to Pickup Weapon
var() globalconfig float		PlayerADSMoveSpeedFactor;
var() globalconfig float		PlayerCrouchSpeedFactor;
// LDG TEST ONLY
var() globalconfig bool         bUseFixedModifiers;                      // Testing - use fixed modifiers for various aspects - Arena only!
var() globalconfig float        SightingTimeScale;
var() globalconfig int          ChaosSpeedThresholdOverride;

// NOT REPLICATED

var() globalconfig float		DamageScale, DamageModHead, DamageModLimb; 	// Configurable damage modifiers

// ----------------------------------------------------------------------------
var struct RepInfo_BCore
{
	var EGameStyle 	GameStyle;
	var float		AccuracyScale;
	var float		RecoilScale;
	var float       ReloadSpeedScale;
	var bool		bNoJumpOffset;
	var bool		bNoLongGun;
	var bool		bNoReloading;
    var float		PlayerADSMoveSpeedFactor;
    var float		PlayerCrouchSpeedFactor;
	var bool        bAlternativePickups;
    var bool        bUseFixedModifiers;
    var float       SightingTimeScale;
    var float       ChaosSpeedThresholdOverride;
} BCoreRep;

replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		BCoreRep;
}

// Set all defaults to match server vars here
simulated function InitClientVars()
{
	GameStyle 			= BCoreRep.GameStyle;
	AccuracyScale		= BCoreRep.AccuracyScale;
	RecoilScale			= BCoreRep.RecoilScale;
	ReloadSpeedScale 	= BCoreRep.ReloadSpeedScale;
	bNoJumpOffset		= BCoreRep.bNoJumpOffset;
	bNoLongGun			= BCoreRep.bNoLongGun;
	bNoReloading		= BCoreRep.bNoReloading;
    PlayerADSMoveSpeedFactor = BCoreRep.PlayerADSMoveSpeedFactor;
	PlayerCrouchSpeedFactor = BCoreRep.PlayerCrouchSpeedFactor;
	bAlternativePickups = BCoreRep.bAlternativePickups;
    bUseFixedModifiers  = BCoreRep.bUseFixedModifiers;
    SightingTimeScale   = BCoreRep.SightingTimeScale;
    ChaosSpeedThresholdOverride = BCoreRep.ChaosSpeedThresholdOverride;

	class.default.GameStyle 			= GameStyle;
	class.default.AccuracyScale			= AccuracyScale;
	class.default.RecoilScale			= RecoilScale;
	class.default.ReloadSpeedScale 		= ReloadSpeedScale;
	class.default.bNoJumpOffset			= bNoJumpOffset;
	class.default.bNoLongGun			= bNoLongGun;
	class.default.bNoReloading			= bNoReloading;
    class.default.PlayerADSMoveSpeedFactor = PlayerADSMoveSpeedFactor;
	class.default.PlayerCrouchSpeedFactor = PlayerCrouchSpeedFactor;
	class.default.bAlternativePickups 	= bAlternativePickups;
    class.default.SightingTimeScale     = SightingTimeScale;
    class.default.ChaosSpeedThresholdOverride = ChaosSpeedThresholdOverride;

	Log("InitClientVars: "$ModString);

	Log("AccuracyScale: "$AccuracyScale);
	Log("RecoilScale: "$RecoilScale);
	Log("bNoJumpOffset: "$bNoJumpOffset);
	Log("bNoLongGun: "$bNoLongGun);
	Log("bNoReloading: "$bNoReloading);
}

function ServerInitialize()
{
	BCoreRep.GameStyle				= GameStyle;
	BCoreRep.AccuracyScale			= AccuracyScale;
	BCoreRep.RecoilScale			= RecoilScale;
	BCoreRep.ReloadSpeedScale 		= ReloadSpeedScale;
	BCoreRep.bNoJumpOffset			= bNoJumpOffset;
	BCoreRep.bNoLongGun				= bNoLongGun;
	BCoreRep.bNoReloading			= bNoReloading;
    BCoreRep.PlayerADSMoveSpeedFactor = PlayerADSMoveSpeedFactor;
	BCoreRep.PlayerCrouchSpeedFactor = PlayerCrouchSpeedFactor;
	BCoreRep.bAlternativePickups 	= bAlternativePickups;
    BCoreRep.bUseFixedModifiers     = bUseFixedModifiers;
    BCoreRep.SightingTimeScale      = SightingTimeScale;
    BCoreRep.ChaosSpeedThresholdOverride = ChaosSpeedThresholdOverride;

	Log("ServerInitialize: "$ModString);
}

simulated event PostNetBeginPlay()
{
	if (Role < ROLE_Authority)
		InitClientVars();
}

static final function bool IsArena()
{
    return default.GameStyle == EGameStyle.Arena;
}

static final function bool IsClassic()
{
    return default.GameStyle == EGameStyle.Legacy;
}

static final function bool IsRealism()
{
    return default.GameStyle == EGameStyle.Realism;
}

static final function bool IsTactical()
{
    return default.GameStyle == EGameStyle.Tactical;
}

static final function bool IsClassicOrRealism()
{
    return IsClassic() || IsRealism();
}

static final function bool IsArenaOrTactical()
{
    return IsArena() || IsTactical();
}

static final function bool UseFixedModifiers()
{
    return default.GameStyle == EGameStyle.Arena && default.bUseFixedModifiers;
}

static function BCReplicationInfo HitMe(actor A)
{
	local BCReplicationInfo BRI;

	BRI = GetBRep(A);

	if (BRI == None)
	{
		BRI = A.Spawn(default.class);
		BRI.ServerInitialize();
	}
	return BRI;
}

static function BCReplicationInfo GetBRep(actor A)
{
	local BCReplicationInfo BRI;

	foreach A.DynamicActors(class'BCReplicationInfo', BRI)
	{
		if (A != None)
			return BRI;
	}
	return None;
}

defaultproperties
{
     ModString="Ballistic Pro Core"
     AccuracyScale=1.000000
     RecoilScale=1.000000
	 ReloadSpeedScale=1.000000
	 bAlternativePickups=False
     bOnlyDirtyReplication=False
     bUseFixedModifiers=False
     DamageScale=1.0f
     DamageModHead=1.5f
     DamageModLimb=0.7f
     SightingTimeScale=1.0f
     PlayerADSMoveSpeedFactor=1
     PlayerCrouchSpeedFactor=0.5
}
