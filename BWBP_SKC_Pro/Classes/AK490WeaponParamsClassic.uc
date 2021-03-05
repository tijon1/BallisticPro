class AK490WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=ClassicPrimaryEffectParams
		TraceRange=(Min=12000.000000,Max=13000.000000)
		WaterTraceRange=10400.0
		DecayRange=(Min=0.0,Max=0.0)
		RangeAtten=0.800000
		Damage=35
		HeadMult=2.85
		LimbMult=0.5
		DamageType=Class'BWBP_SKC_Pro.DT_AK47Assault'
		DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK47AssaultHead'
		DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK47Assault'
		PenetrationEnergy=70.000000
		PenetrateForce=180
		bPenetrate=True
		PDamageFactor=0.600000
		WallPDamageFactor=0.600000
		MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
		FlashScaleFactor=0.800000
		FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.ak47.ak47-Fire',Volume=1.500000,Slot=SLOT_Interact,bNoOverride=False)
		Recoil=256.000000
		Chaos=-1.0
		Inaccuracy=(X=12,Y=12)
		WarnTargetPct=0.200000
	End Object

	Begin Object Class=FireParams Name=ClassicPrimaryFireParams
		FireInterval=0.140000
		BurstFireRateFactor=1.00
		FireEndAnim=	
	FireEffectParams(0)=InstantEffectParams'ClassicPrimaryEffectParams'
	End Object
				
	//=================================================================
	// RECOIL
	//=================================================================
	
	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=0.200000,OutVal=0.100000),(InVal=0.400000,OutVal=0.300000),(InVal=0.800000,OutVal=-0.400000),(InVal=1.000000,OutVal=-0.200000)))
		YCurve=(Points=(,(InVal=0.200000,OutVal=0.100000),(InVal=0.400000,OutVal=0.650000),(InVal=0.600000,OutVal=0.800000),(InVal=0.800000,OutVal=0.900000),(InVal=1.000000,OutVal=1.000000)))
		YawFactor=0.400000
		XRandFactor=0.300000
		YRandFactor=0.200000
		MaxRecoil=1524.000000
		DeclineTime=1.500000
		ViewBindFactor=0.600000
		ADSViewBindFactor=0.600000
		HipMultiplier=1.000000
		CrouchMultiplier=0.700000
		bViewDecline=True
	End Object
	
	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=128,Max=1024)
		CrouchMultiplier=0.700000
		ADSMultiplier=0.700000
		ViewBindFactor=0.200000
		SprintChaos=0.400000
		ChaosDeclineTime=0.500000
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================		
	
	Begin Object Class=WeaponParams Name=ClassicParams
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		SightingTime=0.300000
		MagAmmo=20
		SightOffset=(X=-5.000000,Y=-10.020000,Z=20.600000)
		SightPivot=(Pitch=64)
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
	End Object
	
    Layouts(0)=WeaponParams'ClassicParams'
}