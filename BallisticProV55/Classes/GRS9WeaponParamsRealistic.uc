class GRS9WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{

	//=================================================================
	// PRIMARY FIRE
	//=================================================================	
	
	Begin Object Class=InstantEffectParams Name=RealisticPrimaryEffectParams
		TraceRange=(Min=800.000000Max=4000.000000)
		WaterTraceRange=800.0
		DecayRange=(Min=0.0,Max=0.0)
		Damage=33.0
		HeadMult=2.181818
		LimbMult=0.606060
		PenetrationEnergy=6.000000
		PenetrateForce=16
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
		FlashScaleFactor=1.500000
		FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.200000)
		Recoil=512.000000
		Chaos=0.070000
		Inaccuracy=(X=13,Y=13)
		BotRefireRate=0.900000
		WarnTargetPct=0.100000
	End Object

	Begin Object Class=FireParams Name=RealisticPrimaryFireParams
		FireInterval=0.150000
		BurstFireRateFactor=1.00
		FireEndAnim=
		FireAnimRate=1.550000	
	FireEffectParams(0)=InstantEffectParams'RealisticPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=ClassicSecondaryEffectParams
		TraceRange=(Min=3000.000000,Max=3000.000000)
		WaterTraceRange=2100.0
		DecayRange=(Min=0.0,Max=0.0)
		RangeAtten=0.350000
		Damage=6.0
		HeadMult=2.8
		LimbMult=0.5
		DamageType=Class'BallisticProV55.DTGRS9Laser'
		DamageTypeHead=Class'BallisticProV55.DTGRS9LaserHead'
		DamageTypeArm=Class'BallisticProV55.DTGRS9Laser'
		PenetrateForce=200
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire')
		Recoil=0.0
		Chaos=-1.0
		Inaccuracy=(X=2,Y=2)
		BotRefireRate=0.999000
		WarnTargetPct=0.010000
	End Object

	Begin Object Class=FireParams Name=ClassicSecondaryFireParams
		FireInterval=0.080000
		AmmoPerFire=0
		BurstFireRateFactor=1.00
		FireAnim="Idle"	
	FireEffectParams(0)=InstantEffectParams'ClassicSecondaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=RealisticRecoilParams
		XCurve=(Points=(,(InVal=1.000000,OutVal=1.000000)))
		PitchFactor=0.600000
		YawFactor=0.000000
		XRandFactor=0.4000000
		YRandFactor=0.400000
		MaxRecoil=2048.000000
		DeclineTime=0.400000
		DeclineDelay=0.120000
		ViewBindFactor=0.200000
		ADSViewBindFactor=0.200000
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
		ChaosDeclineTime=0.600000
		ChaosSpeedThreshold=800.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=RealisticParams
		PlayerSpeedFactor=1.100000
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		MagAmmo=19
		ViewOffset=(X=6.000000,Y=7.000000,Z=-8.000000)
		SightOffset=(X=-15.000000,Y=-1.000000,Z=17.600000)
		SightPivot=(Pitch=-25,Roll=-0)
		InitialWeaponMode=1
		RecoilParams(0)=RecoilParams'RealisticRecoilParams'
		AimParams(0)=AimParams'RealisticAimParams'
		FireParams(0)=FireParams'RealisticPrimaryFireParams'
		AltFireParams(0)=FireParams'RealisticSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'RealisticParams'


}