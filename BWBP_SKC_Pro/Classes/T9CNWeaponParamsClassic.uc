class T9CNWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{

    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
		
	Begin Object Class=InstantEffectParams Name=ClassicPrimaryEffectParams
		TraceRange=(Max=5000.000000)
		WaterTraceRange=3000.0
		DecayRange=(Min=0.0,Max=0.0)
		RangeAtten=0.700000
		Damage=22
		HeadMult=2.3
		LimbMult=0.5
		DamageType=Class'BWBP_SKC_Pro.DTT9CN'
		DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
		DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
		PenetrationEnergy=16.000000
		PenetrateForce=100
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
		FlashScaleFactor=1.000000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireOld',Volume=1.200000)
		Recoil=600.000000
		Chaos=-1.0
		Inaccuracy=(X=48,Y=48)
		BotRefireRate=0.900000
		WarnTargetPct=0.100000
	End Object

	Begin Object Class=FireParams Name=ClassicPrimaryFireParams
		FireInterval=0.080000
		BurstFireRateFactor=1.00
		FireEndAnim=	
	FireEffectParams(0)=InstantEffectParams'ClassicPrimaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ClassicRecoilParams
		XCurve=(Points=(,(InVal=1.000000,OutVal=1.000000)))
		PitchFactor=0.200000
		YawFactor=0.000000
		XRandFactor=0.250000
		YRandFactor=0.300000
		DeclineTime=0.400000
		DeclineDelay=0.100000
		ViewBindFactor=0.200000
		ADSViewBindFactor=0.400000
		HipMultiplier=1.000000
		CrouchMultiplier=0.800000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ClassicAimParams_Light
		AimSpread=(Min=64,Max=8192)
		AimAdjustTime=0.350000
		ADSMultiplier=0.700000
		ViewBindFactor=0.050000
		SprintChaos=0.050000
		JumpChaos=0.050000
		JumpOffSet=(Pitch=1000,Yaw=-500)
		FallingChaos=0.050000
		AimDamageThreshold=480.000000
		ChaosDeclineTime=0.450000
		ChaosSpeedThreshold=11200.000000
	End Object
 
	Begin Object Class=AimParams Name=ClassicAimParams
		AimSpread=(Min=64,Max=8192)
		AimAdjustTime=0.350000
		ADSMultiplier=0.700000
		ViewBindFactor=0.050000
		SprintChaos=0.400000
		JumpChaos=0.200000
		JumpOffSet=(Pitch=1000,Yaw=-500)
		FallingChaos=0.400000
		AimDamageThreshold=480.000000
		ChaosDeclineTime=0.450000
		ChaosSpeedThreshold=1200.000000
		ChaosTurnThreshold=196608.000000
	End Object
	
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=ClassicParams_Robocop
		//Layout core
		LayoutName="Gauss Mod"
		Weight=10
		//Attachments
		WeaponBoneScales(0)=(BoneName="RCAttachment",Slot=1,Scale=1f)
		WeaponBoneScales(1)=(BoneName="RCSlider",Slot=2,Scale=1f)
		WeaponBoneScales(2)=(BoneName="RCSliderFront",Slot=3,Scale=1f)
		WeaponBoneScales(3)=(BoneName="RCAttachmentIron",Slot=4,Scale=1f)
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MainShine',Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-SlideSilverShine',Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',Index=4,Index=4,PIndex=-1)
		SightPivot=(Pitch=128)
		SightOffset=(X=-10.000000,Y=-2.090000,Z=9.35000)
		ViewOffset=(X=0.000000,Y=6.500000,Z=-8.00000)
		//Functions
		WeaponModes(0)=(ModeName="Semi",ModeID="WM_SemiAuto",Value=1.000000)
		WeaponModes(1)=(ModeName="Burst",ModeID="WM_BigBurst",Value=3.000000)
		WeaponModes(2)=(ModeName="Auto",ModeID="WM_FullAuto",bUnavailable=True)
		InitialWeaponMode=1
		InventorySize=2
		SightMoveSpeedFactor=0.500000
		SightingTime=0.150000
		bNeedCock=True
		MagAmmo=18
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
	End Object
	
	Begin Object Class=WeaponParams Name=ClassicParams
		//Layout core
		LayoutName="Automatic Mod"
		Weight=10
		//Attachments
		WeaponBoneScales(0)=(BoneName="RCAttachment",Slot=1,Scale=0f)
		WeaponBoneScales(1)=(BoneName="RCSlider",Slot=2,Scale=0f)
		WeaponBoneScales(2)=(BoneName="RCSliderFront",Slot=3,Scale=0f)
		WeaponBoneScales(3)=(BoneName="RCAttachmentIron",Slot=4,Scale=0f)
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainE",Index=1)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideE",Index=3)
		WeaponMaterialSwaps(3)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',Index=4,Index=4,PIndex=-1)
		SightPivot=(Pitch=128)
		SightOffset=(X=-10.000000,Y=-2.090000,Z=9.35000)
		ViewOffset=(X=0.000000,Y=6.500000,Z=-8.00000)
		//Functions
		InventorySize=2
		SightMoveSpeedFactor=0.500000
		SightingTime=0.150000
		bNeedCock=True
		MagAmmo=18
		RecoilParams(0)=RecoilParams'ClassicRecoilParams'
		AimParams(0)=AimParams'ClassicAimParams'
		FireParams(0)=FireParams'ClassicPrimaryFireParams'
	End Object
	
	Layouts(0)=WeaponParams'ClassicParams_Robocop' //Robocop
	Layouts(1)=WeaponParams'ClassicParams' //Stock
	
	//Camos =====================================
	
	Begin Object Class=WeaponCamo Name=M9_Inox
		Index=0
		CamoName="Inox"
		Weight=30
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_Silver
		Index=1
		CamoName="Silver"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MainShine',Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-SlideSilverShine',Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',Index=4,Index=4,PIndex=-1)
		Weight=20
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_BlackWorn
		Index=2
		CamoName="Black"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainBlack",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideBlack",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,Index=4,PIndex=-1)
		Weight=20
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_BlackWood
		Index=3
		CamoName="Black n Wood"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,Index=4,PIndex=-1)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_Tan
		Index=4
		CamoName="Desert"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainE",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideE",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,Index=4,PIndex=-1)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_TwoTone
		Index=5
		CamoName="Two-Tone"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineB",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,Index=4,PIndex=-1)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_Toy
		Index=6
		CamoName="Toy"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,Index=4,PIndex=-1)
		Weight=3
	End Object
	
	Begin Object Class=WeaponCamo Name=M9_Gold
		Index=7
		CamoName="Gold"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=3,Index=2,PIndex=1)
		WeaponMaterialSwaps(3)=(MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,Index=4,PIndex=-1)
		Weight=1
	End Object
	
	Camos(0)=WeaponCamo'M9_Inox'
	Camos(1)=WeaponCamo'M9_Silver'
	Camos(2)=WeaponCamo'M9_BlackWorn'
	Camos(3)=WeaponCamo'M9_BlackWood'
	Camos(4)=WeaponCamo'M9_Tan'
	Camos(5)=WeaponCamo'M9_TwoTone'
	Camos(6)=WeaponCamo'M9_Toy'
	Camos(7)=WeaponCamo'M9_Gold'
}