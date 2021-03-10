class X4WeaponParams extends BallisticWeaponParams;

defaultproperties
{    
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaPrimaryEffectParams
        TraceRange=(Min=130.000000,Max=130.000000)
        Damage=55
        DamageType=Class'BallisticProV55.DTX4Knife'
        DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
        DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimb'
        BotRefireRate=0.9900000
        WarnTargetPct=0.300000
    End Object
    
    Begin Object Class=FireParams Name=ArenaPrimaryFireParams
        FireInterval=0.350000
        AmmoPerFire=0
        FireAnim="Slash1"
        FireAnimRate=1.500000
        FireEffectParams(0)=MeleeEffectParams'ArenaPrimaryEffectParams'
    End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaSecondaryEffectParams
        TraceRange=(Min=130.000000,Max=130.000000)
        Damage=70
        DamageType=Class'BallisticProV55.DTX4Knife'
        DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
        DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimb'
        HookStopFactor=1.700000
        HookPullForce=100.000000
        BotRefireRate=0.500000
        WarnTargetPct=0.50000
    End Object
    
    Begin Object Class=FireParams Name=ArenaSecondaryFireParams
        AmmoPerFire=0
        PreFireAnim="PrepMelee"
        FireAnim="Melee"
        FireEffectParams(0)=MeleeEffectParams'ArenaSecondaryEffectParams'
    End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=UniversalRecoilParams
        ViewBindFactor=0.00
        PitchFactor=0
        YawFactor=0
        DeclineTime=1.500000
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=UniversalAimParams
        ViewBindFactor=0.00
        SprintOffSet=(Pitch=-3000,Yaw=-4000)
        AimSpread=(Min=0,Max=0)
        ChaosDeclineTime=0.320000
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=UniversalParams
        PlayerSpeedFactor=1.10
        DisplaceDurationMult=0.25
        MagAmmo=1
        InventorySize=2
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'UniversalParams'
}