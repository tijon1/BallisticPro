class LonghornWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	//=================================================================
	// PRIMARY FIRE
	//=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=TacticalPrimaryEffectParams
		MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
		FlashScaleFactor=1.500000
		Recoil=1024.000000
		PushbackForce=300.000000
		Chaos=1.000000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-Fire',Volume=1.500000)
		BotRefireRate=0.5
     	WarnTargetPct=0.300000
		ProjectileClass=Class'BWBP_SKC_Pro.LonghornClusterGrenade'
     	Speed=6000.000000
     	MaxSpeed=6000.000000
		Damage=150.000000
     	DamageRadius=450.000000
		MomentumTransfer=100000.000000
	End Object

	Begin Object Class=FireParams Name=TacticalPrimaryFireParams
		FireInterval=0.400000
		bCockAfterFire=True
		FireAnimRate=1.5
		AimedFireAnim="SightFire"
		FireEffectParams(0)=ProjectileEffectParams'TacticalPrimaryEffectParams'
	End Object
		
	//=================================================================
	// SECONDARY FIRE
	//=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=TacticalSecondaryEffectParams
		Recoil=1024.000000
     	PushbackForce=800.000000
     	Chaos=1.000000
		Inaccuracy=(X=256,Y=256)
		SplashDamage=True
		RecommendSplashDamage=True
		BotRefireRate=0.7
     	WarnTargetPct=0.3
		ProjectileClass=Class'BWBP_SKC_Pro.LonghornMicroClusterAlt'
     	Speed=7500.000000
    	MaxSpeed=7500.000000
    	Damage=30.000000
    	DamageRadius=256.000000
   	  	MomentumTransfer=25000.000000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-FireAlt',Volume=1.700000)
	End Object

	Begin Object Class=FireParams Name=TacticalSecondaryFireParams
		FireInterval=0.800000
		bCockAfterFire=True
		FireAnimRate=2.00000
		AimedFireAnim="SightFire"
		FireEffectParams(0)=ProjectileEffectParams'TacticalSecondaryEffectParams'
	End Object

	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=TacticalRecoilParams
		XRandFactor=1.500000
		YRandFactor=0.700000
		DeclineDelay=0.5
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=TacticalAimParams
		AimSpread=(Min=64,Max=512)
        ADSMultiplier=0.5
		SprintOffset=(Pitch=-3072,Yaw=-4096)
		JumpChaos=0.200000
		FallingChaos=0.200000
		SprintChaos=0.200000
		AimAdjustTime=0.900000
		ChaosDeclineTime=2.000000
		ChaosSpeedThreshold=300
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=TacticalParams
		CockAnimRate=1.50000
		ViewOffset=(X=-30.000000,Y=5.000000,Z=-20.000000)
		SightPivot=(Pitch=150)
		SightOffset=(Y=19.600000,Z=26.400000)
		InventorySize=20
		SightMoveSpeedFactor=0.9
		SightingTime=0.25
		DisplaceDurationMult=1
		MagAmmo=4
        RecoilParams(0)=RecoilParams'TacticalRecoilParams'
        AimParams(0)=AimParams'TacticalAimParams'
		FireParams(0)=FireParams'TacticalPrimaryFireParams'
		AltFireParams(0)=FireParams'TacticalSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'TacticalParams'
}