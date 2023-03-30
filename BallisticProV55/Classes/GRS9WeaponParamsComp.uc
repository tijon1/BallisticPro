class GRS9WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
    Begin Object Class=InstantEffectParams Name=ArenaPrimaryEffectParams
        TraceRange=(Min=4000.000000,Max=4000.000000)
        DecayRange=(Min=525,Max=1225)
		PenetrationEnergy=16
        RangeAtten=0.5
        Damage=15
        HeadMult=2.25f
        LimbMult=0.75f
        DamageType=Class'BallisticProV55.DTGRS9Pistol'
        DamageTypeHead=Class'BallisticProV55.DTGRS9PistolHead'
        DamageTypeArm=Class'BallisticProV55.DTGRS9Pistol'
        PenetrateForce=100
        bPenetrate=True
        MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
        FlashScaleFactor=2.500000
        Recoil=180.000000
        Chaos=0.120000
        BotRefireRate=0.99
        WarnTargetPct=0.2
        FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.200000)
    End Object

    Begin Object Class=FireParams Name=ArenaPrimaryFireParams
        FireInterval=0.055
        FireEndAnim=
        AimedFireAnim='SightFire'
        FireAnimRate=1.700000	
        FireEffectParams(0)=InstantEffectParams'ArenaPrimaryEffectParams'
    End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
    Begin Object Class=InstantEffectParams Name=ArenaSecondaryEffectParams
        RangeAtten=0.5
        Damage=14
        DamageType=Class'BallisticProV55.DTGRS9Laser'
        DamageTypeHead=Class'BallisticProV55.DTGRS9LaserHead'
        DamageTypeArm=Class'BallisticProV55.DTGRS9Laser'
        PenetrateForce=200
        bPenetrate=True
        Chaos=0.000000
        BotRefireRate=0.999000
        WarnTargetPct=0.010000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire')
    End Object

    Begin Object Class=FireParams Name=ArenaSecondaryFireParams
        FireInterval=0.080000
        AmmoPerFire=0
        FireAnim="Idle"	
        FireEffectParams(0)=InstantEffectParams'ArenaSecondaryEffectParams'
    End Object

	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=ArenaRecoilParams
        ViewBindFactor=0.35
        XCurve=(Points=(,(InVal=0.200000,OutVal=0.12),(InVal=0.300000,OutVal=0.150000),(InVal=0.4,OutVal=0.02),(InVal=0.550000,OutVal=-0.120000),(InVal=0.700000,OutVal=0.050000),(InVal=1.000000,OutVal=0.200000)))
        YCurve=(Points=(,(InVal=0.200000,OutVal=0.25000),(InVal=0.450000,OutVal=0.450000),(InVal=0.650000,OutVal=0.75000),(InVal=0.800000,OutVal=0.820000),(InVal=1.000000,OutVal=1.000000)))
        XRandFactor=0.10000
        YRandFactor=0.10000
        DeclineTime=0.750000
        DeclineDelay=0.350000
        MaxRecoil=6144
        HipMultiplier=1.5
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=ArenaAimParams
        ADSMultiplier=2
        SprintChaos=0.050000
        AimAdjustTime=0.350000
        ChaosDeclineTime=0.450000
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=ArenaParams
		CockAnimRate=1.200000
		ReloadAnimRate=1.350000
		bDualBlocked=True
        SightOffset=(X=-5.000000,Z=5.900000)
        DisplaceDurationMult=0.5
        SightingTime=0.200000
		SightMoveSpeedFactor=0.9
        MagAmmo=18
        InventorySize=3
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}