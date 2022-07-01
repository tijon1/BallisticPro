class A49WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // RECOIL
    //=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=0.100000,OutVal=0.010000),(InVal=0.150000,OutVal=0.100000),(InVal=0.250000,OutVal=0.200000),(InVal=0.600000,OutVal=-0.200000),(InVal=0.700000,OutVal=-0.250000),(InVal=1.000000,OutVal=0.100000)))
		YCurve=(Points=(,(InVal=0.100000,OutVal=0.090000),(InVal=0.150000,OutVal=0.150000),(InVal=0.250000,OutVal=0.120000),(InVal=0.600000,OutVal=-0.150000),(InVal=0.700000,OutVal=0.050000),(InVal=500000.000000,OutVal=0.500000)))
		PitchFactor=0.800000
		YawFactor=0.800000
		XRandFactor=0.300000
		YRandFactor=0.300000
		MaxRecoil=1024.000000
		DeclineTime=1.500000
		ViewBindFactor=0.450000
		HipMultiplier=1.000000
		CrouchMultiplier=0.600000
		bViewDecline=True
	End Object

	//=================================================================
    // AIM
    //=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=16,Max=2048)
		CrouchMultiplier=0.600000
		ADSMultiplier=0.700000
		ViewBindFactor=0.350000
		SprintChaos=0.400000
		AimDamageThreshold=75.000000
		ChaosDeclineTime=2.000000
		ChaosSpeedThreshold=600.000000
	End Object

    //=================================================================
    // PRIMARY FIRE
    //=================================================================

	Begin Object Class=ProjectileEffectParams Name=ClassicPrimaryEffectParams
		ProjectileClass=Class'BWBP_SKC_Pro.A49Projectile'
		SpawnOffset=(X=10.000000,Y=10.000000,Z=-9.000000)
		Speed=40.000000
		MaxSpeed=8000.000000
		AccelSpeed=60000.000000
		Damage=15
		DamageRadius=48.000000
		MomentumTransfer=100.000000
		HeadMult=2.0
		LimbMult=0.5
		MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
		FlashScaleFactor=0.600000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-Fire',Pitch=1.200000,Volume=0.700000)
		Recoil=24.000000
		Chaos=-1.0
		Inaccuracy=(X=8,Y=4)
		WarnTargetPct=0.300000	
	End Object

	Begin Object Class=FireParams Name=ClassicPrimaryFireParams
		FireInterval=0.100000
		BurstFireRateFactor=1.00
		FireEndAnim=	
	FireEffectParams(0)=ProjectileEffectParams'ClassicPrimaryEffectParams'
	End Object

    //=================================================================
    // SECONDARY FIRE
    //=================================================================
	
	Begin Object Class=FireEffectParams Name=ArenaAltEffectParams
		MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
		FlashScaleFactor=1.200000
     	Recoil=2048.000000
     	Chaos=0.500000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-ShockWave',Volume=2.000000)
     	WarnTargetPct=0.100000
		PushbackForce=2000.000000
	End Object
	
	Begin Object Class=FireParams Name=ArenaAltFireParams
		FireAnim="AltFire"
		FireInterval=1.7
     	AmmoPerFire=8
		FireEffectParams(0)=FireEffectParams'ArenaAltEffectParams'
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		SightOffset=(X=-12.000000,Z=35.000000)
		SightPivot=(Pitch=768)
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
        AltFireParams(0)=FireParams'ArenaAltFireParams'
		//AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	
    Layouts(0)=WeaponParams'ClassicParams'
}