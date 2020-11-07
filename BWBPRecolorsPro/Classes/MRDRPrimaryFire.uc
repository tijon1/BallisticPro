//=============================================================================
// MRDRPrimaryFire.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class MRDRPrimaryFire extends BallisticRangeAttenFire;

//Do the spread on the client side
function PlayFiring()
{
	if (BW.MagAmmo - ConsumedLoad < 2)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		FireAnim = 'OpenFire';
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		FireAnim = 'Fire';
	}
	super.PlayFiring();
}

defaultproperties
{
     CutOffDistance=1536.000000
     CutOffStartRange=768.000000
     WallPenetrationForce=8.000000
     
     Damage=20.000000
     
     
     RangeAtten=0.200000
     WaterRangeAtten=0.200000
     DamageType=Class'BWBPRecolorsPro.DT_MRDR88Body'
     DamageTypeHead=Class'BWBPRecolorsPro.DT_MRDR88Head'
     DamageTypeArm=Class'BWBPRecolorsPro.DT_MRDR88Body'
     KickForce=1250
     PenetrateForce=0
     bPenetrate=False
     ClipFinishSound=(Sound=Sound'BallisticSounds3.Misc.ClipEnd-2',Volume=0.800000,Radius=48.000000,bAtten=True)
     DryFireSound=(Sound=Sound'BallisticSounds3.Misc.DryPistol',Volume=0.700000)
     MuzzleFlashClass=Class'BWBPRecolorsPro.MRDRFlashEmitter'
     FlashScaleFactor=0.600000
     BrassClass=Class'BallisticProV55.Brass_Pistol'
     BrassOffset=(X=-25.000000,Z=-5.000000)
     FireRecoil=64.000000
     FireChaos=0.100000
     XInaccuracy=48.000000
     YInaccuracy=48.000000
     BallisticFireSound=(Sound=Sound'PackageSounds4Pro.MRDR.MRDR-Fire')
     bPawnRapidFireAnim=True
     FireRate=0.120000
     AmmoClass=Class'BallisticProV55.Ammo_9mm'
     ShakeRotMag=(X=64.000000,Y=32.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-3.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.500000
}
