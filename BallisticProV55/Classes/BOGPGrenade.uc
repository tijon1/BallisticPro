//=============================================================================
// BOGPGrenade.
//
// Grenade fired by the BGOP Grenade Pistol.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class BOGPGrenade extends BallisticGrenade;

defaultproperties
{
	WeaponClass=Class'BallisticProV55.BOGPPistol'

    ArmingDelay=0.3
	UnarmedDetonateOn=DT_ImpactTimed
    UnarmedPlayerImpactType=PIT_Bounce
    ArmedDetonateOn=DT_Impact
    ArmedPlayerImpactType=PIT_Detonate

	bNoInitialSpin=True
	bAlignToVelocity=True
	DetonateDelay=1.000000
	ImpactDamage=25
	ImpactDamageType=Class'BallisticProV55.DTBOGPGrenade'
	ImpactManager=Class'BallisticProV55.IM_M50Grenade'
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-4.000000)
	MyRadiusDamageType=Class'BallisticProV55.DTBOGPGrenadeRadius'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ShakeRadius=256.000000
	MotionBlurRadius=384.000000
	MotionBlurFactor=3.000000
	MotionBlurTime=4.000000
	WallPenetrationForce=64
	MyDamageType=Class'BallisticProV55.DTBOGPGrenadeRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_Grenade'
	DrawScale=0.300000
	bIgnoreTerminalVelocity=True
}
