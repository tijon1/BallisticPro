class E23WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
		
	//Series
	Begin Object Class=ProjectileEffectParams Name=ClassicSeriesEffectParams
        ProjectileClass=Class'BallisticProV55.E23Projectile_Std'
        SpawnOffset=(X=20.000000,Y=9.000000,Z=-9.000000)
        MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
        Speed=5500.000000
        MaxSpeed=14000.000000
        AccelSpeed=100000.000000
        Damage=35.000000
        DamageRadius=16.000000
        MaxDamageGainFactor=0.6
        DamageGainStartTime=0.05
        DamageGainEndTime=0.25
        FlashScaleFactor=0.750000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
        Chaos=0.06
        Recoil=96
        WarnTargetPct=0.1
    End Object

    Begin Object Class=FireParams Name=ClassicSeriesFireParams
        AmmoPerFire=1
        FireAnim="Fire"
        FireEndAnim=
        FireInterval=0.150000
        FireEffectParams(0)=ProjectileEffectParams'ClassicSeriesEffectParams'
    End Object

	//Shotgun
    Begin Object Class=ProjectileEffectParams Name=ClassicMultiEffectParams
        ProjectileClass=Class'BallisticProV55.E23Projectile_SG'
        SpawnOffset=(X=20.000000,Y=9.000000,Z=-9.000000)
        MuzzleFlashClass=Class'BallisticProV55.E23SGFlashEmitter'
        Speed=50.000000
        MaxSpeed=6000.000000
        AccelSpeed=60000.000000
        Damage=8.000000
        DamageRadius=64.000000
        MaxDamageGainFactor=0.00
        DamageGainEndTime=0.0
        FlashScaleFactor=1.000000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SGFire',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
        Chaos=0.1
        Recoil=256
        WarnTargetPct=0.2
    End Object

    Begin Object Class=FireParams Name=ClassicMultiFireParams
        AmmoPerFire=1
        TargetState="Shotgun"
        FireAnim="Fire2"
        FireEndAnim=
        FireInterval=0.50000
        FireEffectParams(0)=ProjectileEffectParams'ClassicMultiEffectParams'
    End Object

	//Sniper
    Begin Object Class=ProjectileEffectParams Name=ClassicSniperEffectParams
        ProjectileClass=Class'BallisticProV55.E23Projectile_Snpr'
        SpawnOffset=(X=20.000000,Y=9.000000,Z=-9.000000)
        MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
        Speed=5500.000000
        MaxSpeed=50000.000000
        AccelSpeed=100000.000000
        Damage=35.000000
        DamageRadius=64.000000
        FlashScaleFactor=0.750000
        Chaos=0.350000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
        Recoil=768.000000
        WarnTargetPct=0.1
    End Object

    Begin Object Class=FireParams Name=ClassicSniperFireParams
        AmmoPerFire=20
        FireAnim="Fire"
        FireEndAnim=
        FireInterval=0.650000
        FireEffectParams(0)=ProjectileEffectParams'ClassicSniperEffectParams'
    End Object

	//Laser
    Begin Object Class=InstantEffectParams Name=ClassicLaserEffectParams
        TraceRange=(Min=10000.000000,Max=10000.000000)
        WaterTraceRange=5000
        Damage=11.000000
        HeadMult=1.5f
        LimbMult=0.5f
        DamageType=Class'BallisticProV55.DTVPRLaser'
        DamageTypeHead=Class'BallisticProV55.DTVPRLaserHead'
        DamageTypeArm=Class'BallisticProV55.DTVPRLaser'
        PenetrateForce=200
        bPenetrate=True
        MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
        FlashScaleFactor=0.750000
        Chaos=0.000000
	    Recoil=0
        FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
        WarnTargetPct=0.2
    End Object

    Begin Object Class=FireParams Name=ClassicLaserFireParams
        FireAnim=
        FireLoopAnim="'"
        FireEndAnim=
        FireInterval=0.085000
        FireEffectParams(0)=InstantEffectParams'ClassicLaserEffectParams'
    End Object
		
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=0.100000,OutVal=0.010000),(InVal=0.200000,OutVal=-0.150000),(InVal=0.350000,OutVal=0.200000),(InVal=0.600000,OutVal=-0.300000),(InVal=0.800000,OutVal=0.350000),(InVal=1.000000,OutVal=-0.400000)))
		YCurve=(Points=(,(InVal=0.100000,OutVal=0.080000),(InVal=0.200000,OutVal=0.200000),(InVal=0.300000,OutVal=0.400000),(InVal=0.600000,OutVal=0.750000),(InVal=0.700000,OutVal=0.800000),(InVal=1.000000,OutVal=1.000000)))
		PitchFactor=0.800000
		YawFactor=0.800000
		XRandFactor=0.200000
		YRandFactor=0.200000
		MaxRecoil=1024.000000
		DeclineTime=1.500000
		ViewBindFactor=0.250000
		ADSViewBindFactor=0.250000
		HipMultiplier=1.000000
		CrouchMultiplier=0.500000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=16,Max=2048)
		CrouchMultiplier=0.500000
		ADSMultiplier=0.700000
		ViewBindFactor=0.150000
		SprintChaos=0.400000
		AimDamageThreshold=75.000000
		ChaosDeclineTime=2.000000
		ChaosSpeedThreshold=650.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		MagAmmo=45
		SightOffset=(X=-8.000000,Z=9.300000)
		SightPivot=(Pitch=256)
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
        FireParams(0)=FireParams'ClassicSeriesFireParams'
        FireParams(1)=FireParams'ClassicMultiFireParams'
        FireParams(2)=FireParams'ClassicSniperFireParams'
		AltFireParams(0)=FireParams'ClassicLaserFireParams'
	End Object
	Layouts(0)=WeaponParams'ClassicParams'


}