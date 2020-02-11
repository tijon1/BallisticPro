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

// Server Variables -----------------------------------------------------------
// Weapon
var() config float		AccuracyScale;		// Used for scaling general weapon accuracy.
var() config float		RecoilScale;		// Used for scaling general weapon recoil.
var() config bool		bNoJumpOffset;		// Prevents weapons shifting and being offset when jumping or sprinting
var() config bool		bNoLongGun;			// Disable 'long gun' features
var() config bool		bNoReloading;		// Disables reloading and weapons use boring old style ammo handling...
var() config bool		bSightFireOnly;		//Prevents hipfire entirely.
var() config bool		bRelaxedHipfire;		//Reduces HipRecoilFactor and BallisticProShotgunFire's HipSpreadFactor by a fixed amount
// ----------------------------------------------------------------------------
var struct RepInfo_BCore
{
	var float		AccuracyScale;
	var float		RecoilScale;
	var bool		bNoJumpOffset;
	var bool		bNoLongGun;
	var bool		bNoReloading;
	var bool		bSightFireOnly;
	var bool		bRelaxedHipfire;
}BCoreRep;

replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		BCoreRep;
}

// Set all defaults to match server vars here
simulated function InitClientVars()
{
	AccuracyScale	= BCoreRep.AccuracyScale;
	RecoilScale		= BCoreRep.RecoilScale;
	bNoJumpOffset	= BCoreRep.bNoJumpOffset;
	bNoLongGun		= BCoreRep.bNoLongGun;
	bNoReloading	= BCoreRep.bNoReloading;
	bSightFireOnly = BCoreRep.bSightFireOnly;
	bRelaxedHipfire = BCoreRep.bRelaxedHipfire;

	class.default.AccuracyScale	= AccuracyScale;
	class.default.RecoilScale	= RecoilScale;
	class.default.bNoJumpOffset	= bNoJumpOffset;
	class.default.bNoLongGun	= bNoLongGun;
	class.default.bNoReloading	= bNoReloading;
	class.default.bSightFireOnly = bSightFireOnly;
	class.default.bRelaxedHipfire = bRelaxedHipfire;

	Log("InitClientVars: "$ModString);

	Log("AccuracyScale: "$AccuracyScale);
	Log("RecoilScale: "$RecoilScale);
	Log("bNoJumpOffset: "$bNoJumpOffset);
	Log("bNoLongGun: "$bNoLongGun);
	Log("bNoReloading: "$bNoReloading);
}

function ServerInitialize()
{
	BCoreRep.AccuracyScale	= AccuracyScale;
	BCoreRep.RecoilScale	= RecoilScale;
	BCoreRep.bNoJumpOffset	= bNoJumpOffset;
	BCoreRep.bNoLongGun		= bNoLongGun;
	BCoreRep.bNoReloading	= bNoReloading;
	BCoreRep.bSightFireOnly = bSightFireOnly;
	BCoreRep.bRelaxedHipfire = bRelaxedHipfire;

	Log("ServerInitialize: "$ModString);
}

simulated event PostNetBeginPlay()
{
	if (Role < ROLE_Authority)
		InitClientVars();
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
     bOnlyDirtyReplication=False
}
