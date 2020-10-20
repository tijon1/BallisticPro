//=============================================================================
// X82Riflen_TW.
//
// Weapon used for X82 turret. It's deplyoed. Fruits.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class X82Rifle_TW extends X82Rifle
    HideDropDown
	CacheExempt;

var() sound		MountFireSound;

// Rotates the player's view according to Aim
// Split into recoil and aim to accomodate no view decline
simulated function ApplyAimToView()
{
	local Rotator BaseAim, RecoilPivotDelta;

	//DC 110313
	if (Instigator.Controller == None || AIController(Instigator.Controller) != None || !Instigator.IsLocallyControlled())
		return;

	RecoilPivotDelta = RcComponent.GetViewPivotDelta();
	BaseAim = Aim * ViewAimFactor;
	
	if (RcComponent.ShouldUpdateView())
		Instigator.SetViewRotation((BaseAim - ViewAim) + (RecoilPivotDelta));
	else
		Instigator.SetViewRotation(BaseAim - ViewAim);
		
	ViewAim = BaseAim;	
}

function InitTurretWeapon(BallisticTurret Turret)
{
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	if ((BallisticTurret(Owner) != None && BallisticTurret(Owner).bWeaponDeployed) || (BallisticTurret(Instigator) != None && BallisticTurret(Instigator).bWeaponDeployed))
	{
		SelectAnim = IdleAnim;
		SelectAnimRate = IdleAnimRate;
		BringUpTime = 0.1;
	}
}

simulated function Notify_Undeploy ()
{
	if (BallisticTurret(Instigator) != None && Role == ROLE_Authority)
		BallisticTurret(Instigator).UndeployTurret();
}

simulated function Notify_Deploy ();

simulated function PreDrawFPWeapon()
{
	SetRotation(Instigator.Rotation);
}

simulated event AnimEnd (int Channel)
{
    local name anim;
    local float frame, rate;

    GetAnimParams(0, anim, frame, rate);

	if (anim == 'Undeploy')
	{
		Notify_Undeploy();
		return;
	}
	Super.AnimEnd(Channel);
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	Super(BallisticWeapon).GiveTo(Other, Pickup);
}

//attachment fix for deployed
simulated event Timer()
{
	local int Mode;

	ReAim(0.1);

    if (ClientState == WS_BringUp)
    {
		for( Mode = 0; Mode < NUM_FIRE_MODES; Mode++ )
			if (FireMode[Mode] != None)
				FireMode[Mode].InitEffects();
        PlayIdle();
        ClientState = WS_ReadyToFire;
		if (!bOldCrosshairs && PlayerController(Instigator.Controller) != None && PlayerController(Instigator.Controller).MyHud != None)
			PlayerController(Instigator.Controller).MyHud.bCrosshairShow = false;

		if (bNeedCock)
		{
			if (MagAmmo > 0)
				CommonCockGun();
		}
		

		//handle attachment here, hack to force apparition
		//without this tracers will not appear in 1st when 
		//wep is first deployed
		if (Role < ROLE_Authority)
		return;
		
		if (ThirdPersonActor != None )
		{
			ThirdPersonActor.Destroy();
			ThirdPersonActor = Spawn(AttachmentClass,Owner);
			InventoryAttachment(ThirdPersonActor).InitFor(self);
		}

		ThirdPersonActor.SetLocation(Instigator.Location);
		ThirdPersonActor.SetBase(Instigator);
    }
    
    else if (ClientState == WS_PutDown)
    {
		if (SightFX != None)
		{
			SightFX.Destroy();
			SightFX=None;
		}

		if ( Instigator.PendingWeapon == None )
		{
			PlayIdle();
			ClientState = WS_ReadyToFire;
		}
		else
		{
			ClientState = WS_Hidden;
			Instigator.ChangedWeapon();
			for( Mode = 0; Mode < NUM_FIRE_MODES; Mode++ )
				if (FireMode[Mode] != None)
					FireMode[Mode].DestroyEffects();
			if (PlayerSpeedFactor != 0 && PlayerSpeedUp)
			{
				Instigator.GroundSpeed *= (1/PlayerSpeedFactor);
				PlayerSpeedUp = false;
			}
		}
    }
	else if (Clientstate == WS_None && Instigator.PendingWeapon == none && bNeedCock)
	{
		if (MagAmmo > 0)
			CommonCockGun();
	}
}


simulated event RenderOverlays (Canvas C)
{
	DisplayFOV = Instigator.Controller.FovAngle;
	Super.RenderOverlays(C);
}

simulated function PlayReload()
{
	super.PlayReload();
	PlayAnim('ReloadFinishFew', ReloadAnimRate, , 0.25);
}

// Animation notify to make gun cock after reload
simulated function Notify_CockAfterReload()
{
	if (bNeedCock && MagAmmo > 0)
		CommonCockGun(2);
//	else
//		PlayAnim('ReloadFinishHandle', ReloadAnimRate, 0.2);
}

simulated function PlayCocking(optional byte Type)
{
	if (Type == 2 && HasAnim('Cock'))
		PlayAnim('Cock', CockAnimRate, 0.2);
	else
		PlayAnim('Cock', CockAnimRate, 0.2);
}

defaultproperties
{
	MountFireSound=Sound'PackageSounds4Pro.X82.X82-Fire4'
	ReloadAnimRate=1.300000
	ClipHitSound=(Sound=Sound'PackageSounds4Pro.X82.X82-ClipHit',Volume=0.000000)
	ClipOutSound=(Sound=Sound'PackageSounds4Pro.X82.X82-ClipOut')
	ClipInSound=(Sound=Sound'PackageSounds4Pro.X82.X82-ClipIn',Volume=1.500000)
	SightingTime=0.010000
	GunLength=0.000000
	bUseSpecialAim=True
	SightAimFactor=0.100000
	AimSpread=0
	AimDamageThreshold=2000.000000
	ChaosAimSpread=0
	 
	Begin Object Class=RecoilParams Name=X83_TWRecoilParams
		ViewBindFactor=0.35
		PitchFactor=0.350000
		YawFactor=0.000000
		XRandFactor=0.000000
		YRandFactor=0.200000
		DeclineTime=0.500000
		DeclineDelay=0.150000
		MaxRecoil=8192
		HipMultiplier=1
		CrouchMultiplier=1
	End Object
	RecoilParamsList(0)=RecoilParams'X83_TWRecoilParams'

	FireModeClass(0)=Class'BWBPRecolorsPro.X82TW_PrimaryFire'
	SelectAnim="Deploy"
	BringUpTime=1.000000
	bCanThrow=False
	bNoInstagibReplace=True
	DisplayFOV=90.000000
	ClientState=WS_BringUp
	Priority=1
	PlayerViewOffset=(X=-80.000000)
	ItemName="X-83 A1 Turret"
	Mesh=SkeletalMesh'BallisticRecolors4AnimPro.X83A1_Turret'
	DrawScale=0.650000
	CollisionHeight=24.000000
}
