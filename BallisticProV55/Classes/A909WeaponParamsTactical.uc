class A909WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{    
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	

    Begin Object Class=MeleeEffectParams Name=TacticalPriEffectParams
        TraceRange=(Min=150.000000,Max=150.000000)
        Damage=75.000000
        Fatigue=0.030000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=0.5,Radius=32.000000,bAtten=True)
        DamageType=Class'BallisticProV55.DTA909Blades'
        DamageTypeHead=Class'BallisticProV55.DTA909Head'
        DamageTypeArm=Class'BallisticProV55.DTA909Limb'
        MomentumTransfer=100
        WarnTargetPct=0.300000
        BotRefireRate=0.99
    End Object

    Begin Object Class=FireParams Name=TacticalPriFireParams
        AmmoPerFire=0
        FireAnim="PrepHack"
        FireAnimRate=1.200000
        FireInterval=0.350000
        FireEffectParams(0)=MeleeEffectParams'TacticalPriEffectParams'
    End Object

    //=================================================================
    // SECONDARY FIRE
    //=================================================================	

    Begin Object Class=MeleeEffectParams Name=TacticalSecEffectParams
        Fatigue=0.200000
        TraceRange=(Min=150.000000,Max=150.000000)
        Damage=100.000000
        DamageType=Class'BallisticProV55.DTA909Blades'
        DamageTypeHead=Class'BallisticProV55.DTA909Head'
        DamageTypeArm=Class'BallisticProV55.DTA909Limb'
        MomentumTransfer=100
        HookStopFactor=1.700000
        HookPullForce=100.000000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=0.5,Radius=32.000000,bAtten=True)
        WarnTargetPct=0.5
        BotRefireRate=0.5
    End Object

    Begin Object Class=FireParams Name=TacticalSecFireParams
        AmmoPerFire=0
        PreFireAnim="PrepBigHack3"
        FireAnim="BigHack3"
        FireInterval=1.000000
        FireEffectParams(0)=MeleeEffectParams'TacticalSecEffectParams'
    End Object

	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=UniversalRecoilParams
        ViewBindFactor=0.00
        PitchFactor=0
        YawFactor=0
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=UniversalAimParams
        ViewBindFactor=0.00
        SprintOffSet=(Pitch=0,Yaw=0)
        AimSpread=(Min=0,Max=0)
        ChaosDeclineTime=0.320000
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=UniversalParams
        DisplaceDurationMult=0.0
        MagAmmo=1
        InventorySize=1
		//ViewOffset=(X=63.000000,Y=-4.000000,Z=-6.000000)
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
        FireParams(0)=FireParams'TacticalPriFireParams'
        AltFireParams(0)=FireParams'TacticalSecFireParams'
    End Object 
    Layouts(0)=WeaponParams'UniversalParams'
}