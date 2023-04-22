class BOGPWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	

    Begin Object Class=GrenadeEffectParams Name=TacticalGrenadeEffectParams
        ProjectileClass=Class'BallisticProV55.BOGPGrenade'
        SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
        MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
        Speed=2700.000000 // 4200 = 80 m/s, we slow it down in accordance with the ranges we're playing at
        MaxSpeed=2700.000000
        AccelSpeed=0
        Damage=150.000000
        ImpactDamage=50
        DamageRadius=1024.000000
		Recoil=3072
        Chaos=0.700000
        Inaccuracy=(X=128,Y=128)
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.BOGP.BOGP_Fire',Volume=1.750000)
        SplashDamage=True
        RecommendSplashDamage=True
        WarnTargetPct=0.300000
		BotRefireRate=0.300000	
    End Object

    Begin Object Class=FireParams Name=TacticalGrenadeFireParams
        PreFireAnim=
        FireEffectParams(0)=ProjectileEffectParams'TacticalGrenadeEffectParams'
        bCockAfterFire=True
    End Object 

    Begin Object Class=GrenadeEffectParams Name=TacticalFlareEffectParams
        ProjectileClass=Class'BallisticProV55.BOGPFlare'
        SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
        Speed=4200.000000 // 80 m/s
        MaxSpeed=4200.000000
        AccelSpeed=0.000000
        Damage=40.000000
        ImpactDamage=40
        DamageRadius=64.000000
        MomentumTransfer=0.000000
        MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
		Recoil=1536
        Chaos=0.700000
        Inaccuracy=(X=128,Y=128)
        FireSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareFire',Volume=2.000000,Radius=255.000000,Pitch=1.000000,bNoOverride=True)
        WarnTargetPct=0.100000
        BotRefireRate=0.300000
    End Object

    Begin Object Class=FireParams Name=TacticalFlareFireParams
        PreFireAnim=
        FireEffectParams(0)=ProjectileEffectParams'TacticalFlareEffectParams'
        bCockAfterFire=True
    End Object 

    //=================================================================
    // SECONDARY FIRE
    //=================================================================	

    Begin Object Class=FireEffectParams Name=TacticalAltEffectParams
        EffectString="Switch grenade"
    End Object

    Begin Object Class=FireParams Name=TacticalAltFireParams
        AmmoPerFire=0
        FireInterval=0.200000
        FireEffectParams(0)=FireEffectParams'TacticalAltEffectParams'
    End Object

	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=TacticalRecoilParams
		ViewBindFactor=0.15
		ADSViewBindFactor=0.5
		EscapeMultiplier=1.1
        YawFactor=0.000000
        XRandFactor=0.250000
        YRandFactor=0.250000
		ClimbTime=0.075
		DeclineDelay=0.200000
        DeclineTime=1.000000
		CrouchMultiplier=1
		HipMultiplier=1.25
		MaxMoveMultiplier=1.25
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=TacticalAimParams
		ADSViewBindFactor=0.0
		ADSMultiplier=0.35
		AimAdjustTime=0.5
        AimSpread=(Min=256,Max=768)
		SprintOffset=(Pitch=-2048,Yaw=-1024)
        JumpChaos=0.750000
        ChaosDeclineTime=1.000000
        ChaosSpeedThreshold=300
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=TacticalParams
		WeaponBoneScales(0)=(BoneName="Scope",Slot=5,Scale=0f)
	    DisplaceDurationMult=0.75
        MagAmmo=1
        SightingTime=0.2
        InventorySize=5
        SightMoveSpeedFactor=0.6
		SightPivot=(Pitch=300)
		//SightOffset=(X=-5.000000,Y=0.080000,Z=8.550000)
        RecoilParams(0)=RecoilParams'TacticalRecoilParams'
        AimParams(0)=AimParams'TacticalAimParams'
        FireParams(0)=FireParams'TacticalGrenadeFireParams'
        FireParams(1)=FireParams'TacticalFlareFireParams'
        AltFireParams(0)=FireParams'TacticalAltFireParams'
    End Object 
    Layouts(0)=WeaponParams'TacticalParams'
}