class M75WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	
		Begin Object Class=FireEffectParams Name=ClassicPrimaryEffectParams
			SpreadMode=None
			MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
			FireSound=(Sound=Sound'BallisticSounds3.M75.M75Fire',Radius=350.000000)
			Recoil=3072.000000
			Chaos=-1.0
			BotRefireRate=0.300000
			WarnTargetPct=0.050000
		End Object
		
		Begin Object Class=FireParams Name=ClassicPrimaryFireParams
			FireInterval=0.300000
			BurstFireRateFactor=1.00
			bCockAfterFire=True
			FireEffectParams(0)=FireEffectParams'ClassicPrimaryEffectParams'
		End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=1.000000,OutVal=1.000000)))
		YawFactor=0.100000
		XRandFactor=0.200000
		YRandFactor=0.200000
		MaxRecoil=3072.000000
		DeclineTime=1.000000
		ViewBindFactor=0.500000
		ADSViewBindFactor=0.500000
		HipMultiplier=1.000000
		CrouchMultiplier=0.400000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=8,Max=2560)
		AimAdjustTime=0.800000
		CrouchMultiplier=0.400000
		ADSMultiplier=0.700000
		ViewBindFactor=0.300000
		SprintChaos=0.400000
		ChaosDeclineTime=2.500000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		PlayerSpeedFactor=0.850000
		PlayerJumpFactor=0.750000
		InventorySize=45
		SightMoveSpeedFactor=0.500000
		MagAmmo=7
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'ClassicParams'


}