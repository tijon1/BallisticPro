class XK2WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	
		Begin Object Class=InstantEffectParams Name=ClassicPrimaryEffectParams
			WaterTraceRange=2500.0
			DecayRange=(Min=0.0,Max=0.0)
			RangeAtten=0.500000
			Damage=15.0
			HeadMult=4.0
			LimbMult=0.466666
			DamageType=Class'BallisticProV55.DTXK2SMG'
			DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
			DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
			PenetrationEnergy=24.000000
			PenetrateForce=150
			bPenetrate=True
			PDamageFactor=0.6
			WallPDamageFactor=0.4
			SpreadMode=None
			MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
			FireSound=(Sound=Sound'BallisticSounds3.XK2.XK2-Fire',Volume=0.500000)
			Recoil=48.000000
			Chaos=-1.0
			Inaccuracy=(X=8,Y=8)
		End Object

		Begin Object Class=FireParams Name=ClassicPrimaryFireParams
			FireInterval=0.070000
			BurstFireRateFactor=1.00	
		FireEffectParams(0)=InstantEffectParams'ClassicPrimaryEffectParams'
		End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	
		Begin Object Class=FireEffectParams Name=ClassicSecondaryEffectParams
			SpreadMode=None
			FireSound=(Volume=1.000000,Radius=255.000000,Pitch=1.000000,bNoOverride=True)
			Recoil=0.0
			Chaos=-1.0
			BotRefireRate=0.300000
		End Object
		
		Begin Object Class=FireParams Name=ClassicSecondaryFireParams
			FireInterval=0.700000
			AmmoPerFire=0
			BurstFireRateFactor=1.00
			FireEffectParams(0)=FireEffectParams'ClassicSecondaryEffectParams'
		End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=0.200000,OutVal=0.100000),(InVal=0.400000,OutVal=-0.200000),(InVal=0.600000,OutVal=0.300000),(InVal=0.800000,OutVal=-0.300000),(InVal=1.000000)))
		YCurve=(Points=(,(InVal=0.100000,OutVal=0.100000),(InVal=0.200000,OutVal=0.400000),(InVal=0.400000,OutVal=0.500000),(InVal=0.600000,OutVal=0.600000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.100000
		YRandFactor=0.200000
		DeclineTime=1.000000
		ViewBindFactor=0.200000
		ADSViewBindFactor=0.200000
		HipMultiplier=1.000000
		CrouchMultiplier=0.800000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=24,Max=2560)
		AimAdjustTime=0.400000
		ADSMultiplier=0.700000
		ViewBindFactor=0.050000
		SprintChaos=0.400000
		ChaosDeclineTime=2.000000
		ChaosSpeedThreshold=650.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		MagAmmo=50
		SightOffset=(Y=-0.550000,Z=14.900000)
		SightPivot=(Pitch=600,Roll=-512)
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'ClassicParams'


}