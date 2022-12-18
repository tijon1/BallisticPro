class M75WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=ClassicPrimaryEffectParams
		TraceRange=(Min=20000.000000,Max=20000.000000)
		WaterTraceRange=5000.0
		DecayRange=(Min=0.0,Max=0.0)
		Damage=325.0
		HeadMult=1.1
		LimbMult=0.5
		DamageType=Class'BallisticProV55.DTM75Railgun'
		DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
		DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
		PenetrationEnergy=1280.000000
		PenetrateForce=700
		bPenetrate=True
		PDamageFactor=0.95
		WallPDamageFactor=0.7
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
		FireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Radius=350.000000)
		Recoil=3072.000000
		Chaos=-1.0
		PushbackForce=1300.000000
		BotRefireRate=0.300000
		WarnTargetPct=0.050000
	End Object

	Begin Object Class=FireParams Name=ClassicPrimaryFireParams
        TargetState="ClassicRail"
		FireInterval=0.300000
		BurstFireRateFactor=1.00
		bCockAfterFire=True	
	FireEffectParams(0)=InstantEffectParams'ClassicPrimaryEffectParams'
	End Object

    //=================================================================
    // SECONDARY FIRE
    //=================================================================	

	Begin Object Class=FireEffectParams Name=ClassicSecondaryEffectParams
		BotRefireRate=0.300000
	End Object
	
	Begin Object Class=FireParams Name=ClassicSecondaryFireParams
		FireInterval=0.200000
		AmmoPerFire=0
		FireEffectParams(0)=FireEffectParams'ClassicSecondaryEffectParams'
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
		SprintOffSet=(Pitch=-8000,Yaw=-10000)
		JumpOffSet=(Pitch=2000,Yaw=-5000)
		ChaosDeclineTime=2.500000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams
		Weight=30
		PlayerSpeedFactor=0.850000
		PlayerJumpFactor=0.750000
		InventorySize=25
		SightMoveSpeedFactor=0.500000
		MagAmmo=7
		ReloadAnimRate=1.000000
		CockAnimRate=1.000000
		ZoomType=ZT_Logarithmic
		ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	
	Begin Object Class=WeaponParams Name=ClassicParams-Irons
		Weight=30
		WeaponBoneScales(0)=(BoneName="Scope",Slot=1,Scale=0f)
		ZoomType=ZT_Irons
		PlayerSpeedFactor=0.850000
		PlayerJumpFactor=0.750000
		InventorySize=25
		SightMoveSpeedFactor=0.500000
		MagAmmo=7
		ReloadAnimRate=1.000000
		CockAnimRate=1.000000
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	
	Begin Object Class=WeaponParams Name=ClassicParams-Arctic
		Weight=10
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(Material=Shader'BWBP_CC_Tex.M75.M75-Scope-S1',Index=1)
		WeaponMaterialSwaps(2)=(Material=Texture'BWBP_CC_Tex.M75.M75-Clip-D1',Index=2)
		WeaponMaterialSwaps(3)=(Material=Shader'BWBP_CC_Tex.M75.M75-Main-S1',Index=3)
		WeaponMaterialSwaps(4)=(Material=Shader'BWBP_CC_Tex.M75.M75-Main2-S1',Index=4)
		WeaponBoneScales(0)=(BoneName="Scope",Slot=1,Scale=1f)
		ZoomType=ZT_Irons
		PlayerSpeedFactor=0.850000
		PlayerJumpFactor=0.750000
		InventorySize=25
		SightMoveSpeedFactor=0.500000
		MagAmmo=7
		ReloadAnimRate=1.000000
		CockAnimRate=1.000000
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
		AltFireParams(0)=FireParams'ClassicSecondaryFireParams'
	End Object
	
	Layouts(0)=WeaponParams'ClassicParams'
	Layouts(1)=WeaponParams'ClassicParams-Irons'
	Layouts(2)=WeaponParams'ClassicParams-Arctic'

}