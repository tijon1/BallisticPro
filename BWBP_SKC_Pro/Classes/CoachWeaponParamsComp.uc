class CoachWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	//=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=ShotgunEffectParams Name=ArenaPrimaryShotEffectParams
		TraceRange=(Min=2560.000000,Max=3072.000000)
        DecayRange=(Min=1000,Max=3000)
		RangeAtten=0.25
		TraceCount=10
		TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
		ImpactManager=Class'BallisticProV55.IM_Shell'
		MaxHits=14 // inflict maximum of 156 damage to a single target
		Damage=12
		PushbackForce=100.000000
		DamageType=Class'BWBP_SKC_Pro.DTCoachShot'
		DamageTypeHead=Class'BWBP_SKC_Pro.DTCoachShot'
		DamageTypeArm=Class'BWBP_SKC_Pro.DTCoachShot'
		MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
		FlashScaleFactor=1.500000
		Recoil=1280.000000
		Chaos=1.000000
		BotRefireRate=0.60000
		WarnTargetPct=0.500000
		Inaccuracy=(X=220,Y=220)
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.200000)	
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireShotParams
		FireInterval=0.300000
		MaxHoldTime=0.0
		AimedFireAnim="Fire"
		FireAnimRate=1.35	
		FireEffectParams(0)=ShotgunEffectParams'ArenaPrimaryShotEffectParams'
	End Object

	Begin Object Class=ShotgunEffectParams Name=ArenaPrimarySlugEffectParams
		TraceRange=(Min=9000.000000,Max=9000.000000)
        DecayRange=(Min=1500,Max=5500)
		RangeAtten=0.25
		TraceCount=1
	    TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
		ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
		MaxHits=14 // inflict maximum of 156 damage to a single target
		Damage=80
		PushbackForce=250.000000
		DamageType=Class'BWBP_SKC_Pro.DTCoachSlug'
		DamageTypeHead=Class'BWBP_SKC_Pro.DTCoachSlug'
		DamageTypeArm=Class'BWBP_SKC_Pro.DTCoachSlug'
        HeadMult=1.5f
        LimbMult=0.8f
        PenetrateForce=500
		bPenetrate=True
		MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
		FlashScaleFactor=3.000000
		Recoil=1280.000000
		Chaos=1.000000
		BotRefireRate=0.60000
		WarnTargetPct=0.500000	
		Inaccuracy=(X=16,Y=0)
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.SuperMagnum-Fire',Volume=7.100000)
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireSlugParams
		FireInterval=0.300000
		AmmoPerFire=2
		MaxHoldTime=0.0
		AimedFireAnim="Fire"
		FireAnimRate=1.35	
		FireEffectParams(0)=ShotgunEffectParams'ArenaPrimarySlugEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.350000
		XCurve=(Points=(,(InVal=1.000000,OutVal=0.100000)))
		YCurve=(Points=(,(InVal=0.300000,OutVal=0.300000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.200000
		YRandFactor=0.200000
		MaxRecoil=8192.000000
		ClimbTime=0.06
		DeclineDelay=0.400000
		DeclineTime=0.750000
		CrouchMultiplier=0.85
		HipMultiplier=1.25
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ArenaAimParams
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=ArenaParams
		CockAnimRate=0.700000
		ReloadAnimRate=1.500000
		PlayerJumpFactor=1.000000
		InventorySize=4
		SightMoveSpeedFactor=0.9
		SightingTime=0.250000
		DisplaceDurationMult=1
		MagAmmo=2
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireShotParams'
		FireParams(1)=FireParams'ArenaPrimaryFireSlugParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
	
	//Camos ====================================
	Begin Object Class=WeaponCamo Name=Coach_Black
		Index=0
		CamoName="Blued"
		Weight=30
	End Object
	
	Begin Object Class=WeaponCamo Name=Coach_Hunter
		Index=1
		CamoName="Hunter"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,AIndex=1,PIndex=0)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=Coach_Veteran
		Index=2
		CamoName="Bloodied"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,AIndex=1,PIndex=0)
		Weight=5
	End Object
	
	Begin Object Class=WeaponCamo Name=Coach_Silver
		Index=3
		CamoName="Nickel"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,AIndex=1,PIndex=0)
		Weight=5
	End Object
	
	Begin Object Class=WeaponCamo Name=Coach_Gold
		Index=4
		CamoName="Gold"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,AIndex=1,PIndex=0)
		Weight=1
	End Object
	
	Camos(0)=WeaponCamo'Coach_Black'
	Camos(1)=WeaponCamo'Coach_Hunter'
	Camos(2)=WeaponCamo'Coach_Veteran'
	Camos(3)=WeaponCamo'Coach_Silver'
	Camos(4)=WeaponCamo'Coach_Gold'
}