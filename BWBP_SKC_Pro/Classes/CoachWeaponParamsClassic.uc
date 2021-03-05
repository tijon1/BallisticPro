class CoachWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	
		Begin Object Class=InstantEffectParams Name=ClassicPrimaryEffectParams
			TraceRange=(Min=2500.000000,Max=4500.000000)
			WaterTraceRange=5000.0
			DecayRange=(Min=0.0,Max=0.0)
			RangeAtten=0.400000
			Damage=30
			HeadMult=1.5
			LimbMult=0.5
			DamageType=Class'BWBP_SKC_Pro.DTCoachShot'
			DamageTypeHead=Class'BWBP_SKC_Pro.DTCoachShot'
			DamageTypeArm=Class'BWBP_SKC_Pro.DTCoachShot'
			PenetrateForce=100
			bPenetrate=True
			PDamageFactor=0.6
			WallPDamageFactor=0.4
			MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
			FlashScaleFactor=1.500000
			FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.200000)
			Recoil=256.000000
			Chaos=-1.0
			Inaccuracy=(X=900,Y=750)
			BotRefireRate=0.100000
			WarnTargetPct=0.100000
		End Object

		Begin Object Class=FireParams Name=ClassicPrimaryFireParams
			FireInterval=0.150000
			BurstFireRateFactor=1.00	
		FireEffectParams(0)=InstantEffectParams'ClassicPrimaryEffectParams'
		End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	
		Begin Object Class=MeleeEffectParams Name=ClassicSecondaryEffectParams
			TraceRange=(Min=128.000000,Max=128.000000)
			WaterTraceRange=5000.0
			Damage=75
			HeadMult=1.5
			LimbMult=0.5
			DamageType=Class'BWBP_SKC_Pro.DTCoachMelee'
			DamageTypeHead=Class'BWBP_SKC_Pro.DTCoachMeleeHead'
			DamageTypeArm=Class'BWBP_SKC_Pro.DTCoachMelee'
			ChargeDamageBonusFactor=1
			PenetrationEnergy=0.000000
			FireSound=(Sound=Sound'BWBP4-Sounds.Marlin.Mar-Melee',Radius=32.000000,bAtten=True)
			Recoil=0.0
			Chaos=-1.0
			BotRefireRate=0.900000
			WarnTargetPct=0.050000
		End Object
		
		Begin Object Class=FireParams Name=ClassicSecondaryFireParams
			FireInterval=0.700000
			AmmoPerFire=0
			BurstFireRateFactor=1.00
			PreFireAnim="PrepMelee"
			FireAnim="Melee"
			PreFireAnimRate=1.300000
			FireAnimRate=1.200000
			FireEffectParams(0)=MeleeEffectParams'ClassicSecondaryEffectParams'
		End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=0.200000,OutVal=-0.100000),(InVal=0.300000,OutVal=-0.200000),(InVal=1.000000,OutVal=-0.300000)))
		YCurve=(Points=(,(InVal=0.300000,OutVal=0.500000),(InVal=1.000000,OutVal=1.000000)))
		YawFactor=0.000000
		XRandFactor=0.200000
		YRandFactor=0.200000
		MaxRecoil=9192.000000
		DeclineTime=0.900000
		ViewBindFactor=0.900000
		ADSViewBindFactor=0.900000
		HipMultiplier=1.000000
		CrouchMultiplier=0.850000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=32,Max=768)
		CrouchMultiplier=0.850000
		ADSMultiplier=0.650000
		ViewBindFactor=0.150000
		SprintChaos=0.400000
		ChaosDeclineTime=2.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		PlayerSpeedFactor=1.100000
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		MagAmmo=2
		SightOffset=(X=-40.000000,Y=9.500000,Z=32.000000)
		SightPivot=(Pitch=256)
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'ClassicParams'


}