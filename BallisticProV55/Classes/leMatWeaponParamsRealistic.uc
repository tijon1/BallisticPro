class leMatWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{

	//=================================================================
	// PRIMARY FIRE
	//=================================================================	
	
	Begin Object Class=InstantEffectParams Name=RealisticPrimaryEffectParams
		TraceRange=(Min=1000.000000,Max=5000.000000)
		WaterTraceRange=5000.0
		DecayRange=(Min=0.0,Max=0.0)
		Damage=51.0
		HeadMult=2.254901
		LimbMult=0.647058
		PenetrationEnergy=11.000000
		PenetrateForce=40
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
		FlashScaleFactor=0.600000
		FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Fire',Volume=1.200000)
		Recoil=800.000000
		Chaos=0.080000
		Inaccuracy=(X=8,Y=8)
		BotRefireRate=0.900000
		WarnTargetPct=0.100000
	End Object

	Begin Object Class=FireParams Name=RealisticPrimaryFireParams
		FireInterval=0.240000
		BurstFireRateFactor=1.00
		FireEndAnim=
		FireAnimRate=1.900000	
	FireEffectParams(0)=InstantEffectParams'RealisticPrimaryEffectParams'
	End Object
		
	//=================================================================
	// SECONDARY FIRE
	//=================================================================	
	
	Begin Object Class=ShotgunEffectParams Name=RealisticSecondaryEffectParams
		TraceRange=(Min=600.000000,Max=3000.000000)
		WaterTraceRange=5000.0
		TraceCount=9
		TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
		ImpactManager=Class'BallisticProV55.IM_Shell'
		Damage=20.0
		HeadMult=2.05
		LimbMult=0.6
		PenetrationEnergy=5.000000
		PenetrateForce=8
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
		FlashScaleFactor=2.000000
		FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFire',Volume=1.300000)
		Recoil=1536.000000
		Chaos=0.240000
		Inaccuracy=(X=1100,Y=1100)
		BotRefireRate=0.900000
		WarnTargetPct=0.100000	
	End Object

	Begin Object Class=FireParams Name=RealisticSecondaryFireParams
		BurstFireRateFactor=1.00
		FireAnim="Fire2"
		FireEndAnim=	
	FireEffectParams(0)=ShotgunEffectParams'RealisticSecondaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=RealisticRecoilParams
		XCurve=(Points=(,(InVal=1.000000,OutVal=1.000000)))
		YCurve=(Points=(,(InVal=0.60000,OutVal=0.40000),(InVal=7.00000,OutVal=0.50000),(InVal=1.00000,OutVal=0.50000)))
		PitchFactor=0.600000
		YawFactor=0.200000
		XRandFactor=0.500000
		YRandFactor=0.500000
		MaxRecoil=1840.000000
		DeclineTime=0.500000
		DeclineDelay=0.145000
		ViewBindFactor=0.300000
		ADSViewBindFactor=0.300000
		HipMultiplier=1.000000
		CrouchMultiplier=0.700000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=RealisticAimParams
		AimSpread=(Min=16,Max=1024)
		CrouchMultiplier=0.700000
		ADSMultiplier=0.700000
		ViewBindFactor=0.050000
		SprintChaos=0.400000
		ChaosDeclineTime=0.700000
		ChaosSpeedThreshold=675.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=RealisticParams
		PlayerSpeedFactor=1.100000
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		MagAmmo=9
		ViewOffset=(X=14.000000,Y=8.000000,Z=-8.000000)
		ViewPivot=(Pitch=512)
		SightOffset=(X=-33.000000,Y=-1.5600000,Z=15.800000)
		SightPivot=(Pitch=95,Roll=-50)
		RecoilParams(0)=RecoilParams'RealisticRecoilParams'
		AimParams(0)=AimParams'RealisticAimParams'
		FireParams(0)=FireParams'RealisticPrimaryFireParams'
		AltFireParams(0)=FireParams'RealisticSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'RealisticParams'


}