class MRS138SecondaryFire extends BallisticProjectileFire;

var MRS138TazerProj ActiveProj;

function SpawnProjectile (Vector Start, Rotator Dir)
{
	Proj = Spawn (ProjectileClass,,, Start, Dir);
	if (Proj != None)
	{
		Proj.Instigator = Instigator;
		MRS138TazerProj(Proj).Master = MRS138Attachment(BW.ThirdPersonActor);
		ActiveProj = MRS138TazerProj(Proj);
	}
}

simulated event ModeHoldFire()
{
    if (!AllowFire())
        return;
		
	if (BW != None)
	{
		BW.bPreventReload=true;
		BW.FireCount++;

		if (BW.ReloadState != RS_None)
		{
			if (weapon.Role == ROLE_Authority)
				BW.bServerReloading=false;
			BW.ReloadState = RS_None;
		}
	}

	ConsumedLoad += Load;
	SetTimer(FMin(0.1, FireRate/2), false);
    // server
    if (Weapon.Role == ROLE_Authority)
    {
        DoFireEffect();
        if ( (Instigator == None) || (Instigator.Controller == None) )
			return;
        if ( AIController(Instigator.Controller) != None )
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        Instigator.DeactivateSpawnProtection();
    }
	
	BW.LastFireTime = Level.TimeSeconds;

    // client
    if (Instigator.IsLocallyControlled())
    {
        ShakeView();
        PlayFiring();
		MRS138Shotgun(BW).IdleAnim = 'TazerIdle';
        FlashMuzzleFlash();
        StartMuzzleSmoke();
    }
    else // server
    {
        ServerPlayFiring();
    }
    
    Load = AmmoPerFire;

    if (Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != None)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }

	if (BW != None)
		BW.bNeedReload = BW.MayNeedReload(ThisModeNum, ConsumedLoad);
}

simulated event ModeDoFire()
{
	if (!AllowFire())
		return;
		
	if (BW.Role == ROLE_Authority)
	{
		if (ActiveProj != None)
			ActiveProj.Destroy();
		//End tazing.
		else if (MRS138Attachment(BW.ThirdPersonActor) != None)
			MRS138Attachment(BW.ThirdPersonActor).PlayerTazeEnd();
	}
	
	if (MRS138Shotgun(BW) != None)
	{
		MRS138Shotgun(BW).IdleAnim = 'Idle';
		MRS138Shotgun(BW).PlayAnim('TazerEnd');
	}
		
    // set the next firing time. must be careful here so client and server do not get out of sync
    if (bFireOnRelease)
    {
        if (bIsFiring)
            NextFireTime += MaxHoldTime + FireRate;
        else
            NextFireTime = Level.TimeSeconds + FireRate;
    }

    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
	
	HoldTime = 0;
}

defaultproperties
{
     SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
     bUseWeaponMag=False
     FlashBone="tip2"
     //BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.PD97.BloodhoundTazerFire',Volume=2.250000)
     bFireOnRelease=True
     PreFireAnim=
     FireAnim="TazerStart"
     FireForce="AssaultRifleAltFire"
     FireRate=0.900000
     AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
     AmmoPerFire=0
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     ProjectileClass=Class'BallisticProV55.MRS138TazerProj'
	 
	 // AI
	 bInstantHit=False
	 bLeadTarget=True
	 bTossed=False
	 bSplashDamage=False
	 bRecommendSplashDamage=False
	 BotRefireRate=0.3
     WarnTargetPct=0.5
}
