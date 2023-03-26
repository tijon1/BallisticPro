class AH208WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0;
}

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=TacticalPrimaryEffectParams
		TraceRange=(Min=7500.000000,Max=7500.000000)
        DecayRange=(Min=1050,Max=2100)
		RangeAtten=0.67
		Damage=60
        HeadMult=2.5
        LimbMult=0.75f
		DamageType=Class'BWBP_SKC_Pro.DTAH208Pistol'
		DamageTypeHead=Class'BWBP_SKC_Pro.DTAH208PistolHead'
		DamageTypeArm=Class'BWBP_SKC_Pro.DTAH208Pistol'
        PenetrationEnergy=48
		PenetrateForce=200
		bPenetrate=True
		PushbackForce=150.000000
		MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
		FlashScaleFactor=0.5
		Recoil=512.000000
		Chaos=0.350000
		BotRefireRate=0.900000
		WarnTargetPct=0.100000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire4',Volume=4.100000)
	End Object

	Begin Object Class=FireParams Name=TacticalPrimaryFireParams
		FireInterval=0.400000
		FireEndAnim=
		AimedFireAnim='SightFire'	
		FireEffectParams(0)=InstantEffectParams'TacticalPrimaryEffectParams'
	End Object

	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=TacticalRecoilParams
        XCurve=(Points=((InVal=0.0,OutVal=0.0),(InVal=0.15,OutVal=0.03),(InVal=0.35,OutVal=-0.05),(InVal=0.5,OutVal=0.00),(InVal=0.7,OutVal=0.03),(InVal=1.0,OutVal=0.00)))
        ViewBindFactor=0.5
        XRandFactor=0.15
        YRandFactor=0.15
        MaxRecoil=4096.000000
        DeclineDelay=0.65
        DeclineTime=1
		HipMultiplier=1.25
		MaxMoveMultiplier=2
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=TacticalAimParams
        ADSMultiplier=0.5
		AimAdjustTime=0.45
        AimSpread=(Min=256,Max=1024)
        ChaosDeclineTime=0.60000
        ChaosSpeedThreshold=300
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=TacticalParams
		WeaponBoneScales(0)=(BoneName="RedDotSight",Slot=54,Scale=0f)
		WeaponBoneScales(1)=(BoneName="LAM",Slot=55,Scale=0f)
		WeaponBoneScales(2)=(BoneName="Compensator",Slot=56,Scale=0f)
		WeaponBoneScales(3)=(BoneName="Scope",Slot=57,Scale=0f)
		InventorySize=3
        SightMoveSpeedFactor=0.6
		SightingTime=0.2
		DisplaceDurationMult=0.5
		MagAmmo=7
		SightOffset=(X=0.000000,Y=-7.350000,Z=45.400002)
		ViewOffset=(X=15.000000,Y=12.000000,Z=-37.000000)
        RecoilParams(0)=RecoilParams'TacticalRecoilParams'
        AimParams(0)=AimParams'TacticalAimParams'
		FireParams(0)=FireParams'TacticalPrimaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'TacticalParams'
}