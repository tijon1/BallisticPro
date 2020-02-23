//=============================================================================
// SK410Shotgun.
//
// The SK410 auto shottie, aka the LASERLASER
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class ARShotgun extends BallisticProShotgun;


var Name			BulletBone;
var() bool		bLoaded;

var() bool 	bIHaveFiredAGrenade;		//Cheap shit
var() BUtil.FullSound		GrenLoadSound;		//Grenade shovel load sound

var() Name 	ShovelAnim; 	//Anim for alt shovelling
var() Array<Name> 	SGPrepAnim;			//Anim to use for Loading each shell individually
var() Array<Name> 	ReloadAltAnim;			//Anim to use for Reloading each shell individually

var() float 	GrenadeLoadAnimRate;		//Grenade loading speed
var() float 	ShovelReloadAnimRate;		//Grenade reloading speed

var() float       	VisGrenades;		//Rockets currently visible in tube.
var() int       	Grenades;		//Rockets currently in the gun.
var() int		StartingGrenades;
var() bool		bReady;			//Weapon ready for alt fire

var() name		SightsBone;			// Bone to use for hiding sight; temporary
var() name  	SightsBoneHinge;			//Bone to use for hiding sight; temporary

var   actor GLIndicator;


struct RevInfo
{
	var() name	GrenName;
};
var() RevInfo	GrenadeBones[3]; 	//Bones for Grenades in holder
var() RevInfo	GLLoadGrenadeBones[3]; 	//Bones for Grenades in animation


replication
{
	// Things the server should send to the client.
	reliable if(Role==ROLE_Authority)
		Grenades, VisGrenades, bReady, bLoaded, bIHaveFiredAGrenade;
}


//=============================================
//End Variables
//=============================================


//Now adds initial ammo in all cases


function GiveAmmo(int m, WeaponPickup WP, bool bJustSpawned)
{
    if ( FireMode[m] != None && FireMode[m].AmmoClass != None )
    {
		Ammo[m] = Ammunition(Instigator.FindInventoryType(FireMode[m].AmmoClass));
        if (Ammo[m] == None)
        {
            Ammo[m] = Spawn(FireMode[m].AmmoClass, instigator);
            Instigator.AddInventory(Ammo[m]);
        }
		//Dropped pickup, just add ammo
        if ((WP != None) && (WP.bDropped || WP.AmmoAmount[m] > 0))
			Ammo[m].AddAmmo(WP.AmmoAmount[m]);
		//else add initial complement
		//if was just spawned and (wasn't dropped or there's no pickup) and (firemodes don't match)
		else if (bJustSpawned && (WP==None || !WP.bDropped) && m == 0)
			Ammo[m].AddAmmo(Ammo[m].InitialAmount);
        Ammo[m].GotoState('');
	}
}


//=============================================
//Start Server Stuff
//=============================================


simulated function PostNetBeginPlay()
{
	local int i;
	//Temporary hide bones
	SetBoneScale(8, 0.0, SightsBone);
	SetBoneScale(9, 0.0, SightsBoneHinge);
	
	for (i=0; i<=1; i++)
		SetBoneScale(i+3, 1.0, GLLoadGrenadeBones[i].GrenName);
	
	Super.PostNetBeginPlay();
	Grenades = StartingGrenades;
	VisGrenades = Grenades;
	UpdateBones();
}


//Ensure integrity of bones


simulated function PostNetReceive()
{
	super.PostNetReceive();
	UpdateBones();
}


//=============================================
//Start Notifies
//=============================================


//Delete a holder grenade


simulated function Special_ShellRemove()
{
	local int i;
	VisGrenades=Grenades-1;
	
	for (i=0; i<=1; i++)
		SetBoneScale(i+3, 1.0, GLLoadGrenadeBones[i].GrenName);
	
	SetBoneScale(5, 0.0, GLLoadGrenadeBones[2].GrenName);
	UpdateBones();
}


//Add a holder grenade


simulated function Special_ShellsIn()
{
	local int i;
	for (i=0; i<=1; i++)
		SetBoneScale(i+3, 1.0, GLLoadGrenadeBones[i].GrenName);

	if (ReloadState == RS_Shovel)
	{
		ReloadState = RS_PostShellIn;	
		if (Role == ROLE_Authority)
		{
			bLoaded = true;
			Grenades += 1;
			Ammo[1].UseAmmo (1, True);
		}
		PlaySound(GrenLoadSound.Sound, SLOT_Misc, 0.5, ,64);
		VisGrenades=Grenades;
	}
	UpdateBones();
}


//Triggered when the SG pump animation finishes


simulated function Special_GrenadeReady()
{
	local int i;
	ReloadState = RS_None;	
	bReady = true;
	bIHaveFiredAGrenade = false;
	Grenades -=1;	
	
	for (i=0; i<=2; i++)
		SetBoneScale(i+3, 1.0, GLLoadGrenadeBones[i].GrenName);
}


//Delete animation grenade when loading


simulated function Notify_RemoveGrenadeGLLoad()
{
	local int i;
	for (i=0; i<=1; i++)
		SetBoneScale(i+3, 0.0, GLLoadGrenadeBones[i].GrenName);
		
	SetBoneScale(5, 1.0, GLLoadGrenadeBones[2].GrenName);
}


//Add grenade back to hand


simulated function Notify_ReturnGrenadeToHand()
{
	local int i;
	for (i=0; i<=1; i++)
		SetBoneScale(i+3, 1.0, GLLoadGrenadeBones[i].GrenName);
}

//=============================================
//End Notifies
//=============================================


simulated function BringUp(optional Weapon PrevWeapon)
{
	UpdateBones();
	Super.BringUp(PrevWeapon);
	GunLength = default.GunLength;
}


//=============================================
//Reloading
//=============================================


simulated event AnimEnded (int Channel, name anim, float frame, float rate) 
{
	
	//Phase out Channel 1 if a sight fire animation has just ended.
	if (anim == BFireMode[0].AimedFireAnim || anim == BFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0);
		//Cut the basic fire anim if it's too long.
		if (SightingState > FireAnimCutThreshold && SafePlayAnim(IdleAnim, 1.0))
			FreezeAnimAt(0.0);
		bPreventReload=False;
	}

	// Modified stuff from Engine.Weapon
	if ((ClientState == WS_ReadyToFire || (ClientState == WS_None && Instigator.Weapon == self)) && ReloadState == RS_None)
    {
        if (anim == FireMode[0].FireAnim && HasAnim(FireMode[0].FireEndAnim)) // rocket hack
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0);
        else if (FireMode[1]!=None && anim== FireMode[1].FireAnim && HasAnim(FireMode[1].FireEndAnim))
            SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0);
        else if (MeleeState < MS_Held)
			bPreventReload=false;
		if (Channel == 0 && (bNeedReload || ((FireMode[0] == None || !FireMode[0].bIsFiring) && (FireMode[1] == None || !FireMode[1].bIsFiring))) && MeleeState < MS_Held)
			PlayIdle();
    }
	// End stuff from Engine.Weapon

	// Start Shovel ended, move on to Shovel loop
	if (ReloadState == RS_StartShovel)
	{
		ReloadState = RS_Shovel;
		PlayShovelLoop();
		return;
	}
	// Shovel loop ended, start it again
	// This is only applicable to the Altfire
	if (ReloadState == RS_PostShellIn)
	{
		if (Grenades >= 3 || Ammo[1].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = RS_EndShovel;
			return;
		}
		ReloadState = RS_Shovel;
		PlayShovelLoop();
		return;
	}
	
	if (ReloadState == RS_PostClipIn || ReloadState == RS_EndShovel)
	{
		if (bNeedCock && MagAmmo > 0)
			CommonCockGun();
		else
		{
			bNeedCock=false;
			ReloadState = RS_None;
			ReloadFinished();
			PlayIdle();
			ReAim(0.05);
		}
		return;
	}
	
	//Cock anim ended, goto idle
	if (ReloadState == RS_Cocking)
	{
		bNeedCock=false;
		ReloadState = RS_None;
		ReloadFinished();
		PlayIdle();
	}
}


// Load in a grenade


simulated function LoadGrenadeLoop()
{
	if (Ammo[1].AmmoAmount < 1 && Grenades > 3)
		return;
	if ((ReloadState == RS_None || ReloadState == RS_StartShovel)&& Ammo[1].AmmoAmount >= 1)
	{
		PlayAnim(StartShovelAnim, 1.0, , 0);
		ReloadState = RS_StartShovel;
	}
}


// Initiate Alt Reloading Spaghetti


simulated function EmptyAltFire (byte Mode)
{
	if (Grenades <= 0 && ClientState == WS_ReadyToFire && FireCount < 1 && Instigator.IsLocallyControlled())
		ServerStartReload(Mode);
}


// Reload on Server, decide which ammo type to reload


function ServerStartReload (optional byte i)
{
	local int m;
	local array<byte> Loadings[2];
	
	if (bPreventReload)
		return;
	if (ReloadState != RS_None)
		return;
	if (MagAmmo < default.MagAmmo && Ammo[0].AmmoAmount > 0)
		Loadings[0] = 1;
	if (Grenades < 3 && Ammo[1].AmmoAmount > 0)
		Loadings[1] = 1;
	if (Loadings[0] == 0 && Loadings[1] == 0)
		return;

	for (m=0; m < NUM_FIRE_MODES; m++)
		if (FireMode[m] != None && FireMode[m].bIsFiring)
			StopFire(m);

	bServerReloading = true;
	
	if (i == 1)
		m = 0;
	else m = 1;
	
	if (Loadings[i] == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);
	}
	
	else if (Loadings[m] == 1)
	{
		ClientStartReload(m);
		CommonStartReload(m);
	}
	
	if (BallisticAttachment(ThirdPersonActor) != None && BallisticAttachment(ThirdPersonActor).ReloadAnim != '')
		Instigator.SetAnimAction('ReloadGun');
}


// Reload on Client


simulated function ClientStartReload(optional byte i)
{
	if (Level.NetMode == NM_Client)
	{
		if (i == 1)
			CommonStartReload(1);
		else
			CommonStartReload(0);
	}
}


// Prepare to reload, set reload state, start anims. Called on client and server


simulated function CommonStartReload (optional byte i)
{
	local int m;
	if (ClientState == WS_BringUp)
		ClientState = WS_ReadyToFire;
	if (i == 1)
	{
		ReloadState = RS_StartShovel;
		PlayReloadAlt();
	}	
	else
	{
		ReloadState = RS_PreClipOut;
		PlayReload();
	}
	
	if (bScopeView && Instigator.IsLocallyControlled())
		TemporaryScopeDown(Default.SightingTime*Default.SightingTimeScale);
	for (m=0; m < NUM_FIRE_MODES; m++)
		if (BFireMode[m] != None)
			BFireMode[m].ReloadingGun(i);

	if (bCockAfterReload)
		bNeedCock=true;
	if (bCockOnEmpty && MagAmmo < 1)
		bNeedCock=true;
	bNeedReload=false;
}


simulated function PlayReloadAlt()
{
	SafePlayAnim(StartShovelAnim, StartShovelAnimRate, , 0, "RELOAD");
}


simulated function PlayShovelLoop()
{
	SafePlayAnim(ReloadAltAnim[VisGrenades], ShovelReloadAnimRate, 0.0, , "RELOAD");
}


simulated function PlayShovelEnd()
{
	SafePlayAnim(EndShovelAnim, EndShovelAnimRate, 0.0, , "RELOAD");
}


simulated event WeaponTick(float DT)
{
	super.WeaponTick(DT);

	if (AIController(Instigator.Controller) != None && !IsGrenadeLoaded()&& AmmoAmount(1) > 0 && BotShouldReloadGrenade() && !IsReloadingGrenade())
		LoadGrenadeLoop();
}


simulated function UpdateBones()
{
	local int i;

	if (VisGrenades<0)
	VisGrenades=0;
	for(i=2;i>=VisGrenades;i--)
		SetBoneScale(i, 0.0, GrenadeBones[i].GrenName);
	if (VisGrenades>2)
		VisGrenades=3;
	for(i=0;i<VisGrenades;i++)
		SetBoneScale(i, 1.0, GrenadeBones[i].GrenName);
}


//=============================================
//End Reloading
//=============================================


//=============================================
//Start Drawing
//=============================================


//Modified to subtract active grenades and add little icons
simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i,Count;
	local float ScaleFactor2;

	local float		ScaleFactor, XL, YL, YL2, SprintFactor;
	local string	Temp;
	local int	TempNum;

	DrawCrosshairs(C);
	
	//Draw grenades, they're not accounted for in alternative HUD
	ScaleFactor = C.ClipX / 1600;
	ScaleFactor2 = 99 * C.ClipX/3200;
	C.Style = ERenderStyle.STY_Alpha;
	C.DrawColor = class'HUD'.Default.WhiteColor;
	Count = Min(8,Grenades);
    for( i=0; i<Count; i++ )
    {
		C.SetPos(C.ClipX - (0.5*i+1) * ScaleFactor2, C.ClipY - 100 * ScaleFactor * class'HUD'.default.HudScale);
		C.DrawTile( Texture'BallisticRecolors4TexPro.M1014.M1014-SGIcon',ScaleFactor2, ScaleFactor2, 0, 0, 128, 128);
	}

	if (bSkipDrawWeaponInfo)
		return;

	// Draw the spare ammo amount
	C.Font = GetFontSizeIndex(C, -2 + int(2 * class'HUD'.default.HudScale));
	C.DrawColor = class'hud'.default.WhiteColor;
	if (!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = C.ClipX - 20 * ScaleFactor * class'HUD'.default.HudScale - XL;
		C.CurY = C.ClipY - 140 * ScaleFactor * class'HUD'.default.HudScale - YL;
		C.DrawText(Temp, false);
	}
	if (Ammo[1] != None && Ammo[1] != Ammo[0])
	{
		
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(TempNum, XL, YL);
		C.CurX = C.ClipX - 160 * ScaleFactor * class'HUD'.default.HudScale - XL;
		C.CurY = C.ClipY - 140 * ScaleFactor * class'HUD'.default.HudScale - YL;
		C.DrawText(TempNum, false);
	}

	if (CurrentWeaponMode < WeaponModes.length && !WeaponModes[CurrentWeaponMode].bUnavailable && WeaponModes[CurrentWeaponMode].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(2 * class'HUD'.default.HudScale));
		C.TextSize(WeaponModes[CurrentWeaponMode].ModeName, XL, YL2);
		C.CurX = C.ClipX - 15 * ScaleFactor * class'HUD'.default.HudScale - XL;
		C.CurY = C.ClipY - 150 * ScaleFactor * class'HUD'.default.HudScale - YL2 - YL;
		C.DrawText(WeaponModes[CurrentWeaponMode].ModeName, false);
	}

	// This is pretty damn disgusting, but the weapon seems to be the only way we can draw extra info on the HUD
	// Would be nice if someone could have a HUD function called along the inventory chain
	if (SprintControl != None && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX  + 5    * ScaleFactor * class'HUD'.default.HudScale;
		C.CurY = C.ClipY - 330  * ScaleFactor * class'HUD'.default.HudScale;
		if (SprintFactor < 0.2)
			C.SetDrawColor(255, 0, 0);
		else if (SprintFactor < 0.5)
			C.SetDrawColor(64, 128, 255);
		else
			C.SetDrawColor(0, 0, 255);
		C.DrawTile(Texture'Engine.MenuWhite', 200 * ScaleFactor * class'HUD'.default.HudScale * SprintFactor, 30 * ScaleFactor * class'HUD'.default.HudScale, 0, 0, 1, 1);
	}
}


//Function called by alt fire to play SG special load animation.


simulated function PrepAltFire()
{
	PlayAnim(SGPrepAnim[Grenades-1],GrenadeLoadAnimRate, 0.0);
	ReloadState = RS_Cocking;
}


simulated function bool IsGrenadeLoaded()
{
	return bLoaded;
}


//=============================================
//Start Other Stuff
//=============================================


function AdjustPlayerDamage( out int Damage, Pawn InstigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
	super.AdjustPlayerDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType);
}

//simulated function PlayReload()
//{
//	SafePlayAnim(ReloadAnim, ReloadAnimRate, , 0, "RELOAD");
//}

// Animation notify for when the clip is stuck in
simulated function Notify_ClipUp()
{
	SetBoneScale(0,1.0,BulletBone);
}

simulated function Notify_ClipOut()
{
	Super.Notify_ClipOut();

	if(MagAmmo < 1)
		SetBoneScale(0,0.0,BulletBone);
}

// Animation notify for when cocking action starts. Used to time sounds
simulated function Notify_CockSim()
{
	PlayOwnedSound(CockSound.Sound,CockSound.Slot,CockSound.Volume,CockSound.bNoOverride,CockSound.Radius,CockSound.Pitch,CockSound.bAtten);
}

simulated function float RateSelf()
{
	if (!HasAmmo())
		CurrentRating = 0;
	if (PlayerController(Instigator.Controller) != None && Ammo[0].AmmoAmount <=0 && MagAmmo <= 0)
		CurrentRating = Super.RateSelf() * 0.2;
	else
		return Super.RateSelf();
	return CurrentRating;
}
// AI Interface =====
// choose between regular or alt-fire
function byte BestMode()
{
	local Bot B;
	local float Dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return 0;

	Dir = Instigator.Location - B.Enemy.Location;
	Dist = VSize(Dir);

	if (Dist > 1024 || B.Enemy.Weapon != None && B.Enemy.Weapon.bMeleeWeapon)
		return 1;
		
	return 0;
}


function float GetAIRating()
{
	local Bot B;
	
	local float Dist;
	local float Rating;

	B = Bot(Instigator.Controller);
	
	if ( B == None )
		return AIRating;

	Rating = Super.GetAIRating();

	if (B.Enemy == None)
		return Rating;

	Dist = VSize(B.Enemy.Location - Instigator.Location);
	
	return class'BUtil'.static.DistanceAtten(Rating, 0.35, Dist, 768, 1536); 
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()
{
	if (AIController(Instigator.Controller) == None)
		return 0.5;
	return AIController(Instigator.Controller).Skill / 7;
}

// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, Dist;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return -0.5;

	Dist = VSize(B.Enemy.Location - Instigator.Location);

	Result = -1 * (B.Skill / 6);
	Result *= (1 - (Dist/4000));
    return FClamp(Result, -1.0, -0.3);
}
function bool BotShouldReloadGrenade ()
{
	if ( (Level.TimeSeconds - Instigator.LastPainTime > 1.0) )
		return true;
	return false;
}

simulated function bool IsReloadingGrenade()
{
    local name anim;
    local float frame, rate;
    GetAnimParams(0, anim, frame, rate);
	if (Anim == ReloadAltAnim[0] || Anim == ReloadAltAnim[1] || Anim == ReloadAltAnim[2])
 		return true;
	return false;
}

// End AI Stuff =====

simulated function Notify_BrassOut();

defaultproperties
{
     BulletBone="Bullet1"
     GrenLoadSound=(Sound=Sound'BWBPJiffyPackSounds.AA12.GLShovel',Volume=1.800000)
     SGPrepAnim(0)="GLLoad1"
	 SGPrepAnim(1)="GLLoad2"
	 SGPrepAnim(2)="GLLoad3"
	 GrenadeLoadAnimRate=1.200000
     ReloadAltAnim(0)="GLReload1"
	 ReloadAltAnim(1)="GLReload2"
	 ReloadAltAnim(2)="GLReload3"
	 ShovelReloadAnimRate=1.500000
	 SightsBone="LadderSight" 	//Temporary
	 SightsBoneHinge="LadderSightHinge" 	//Temporary
     Grenades=3
     StartingGrenades=3
     GrenadeBones(0)=(GrenName="Grenade1")
     GrenadeBones(1)=(GrenName="Grenade2")
     GrenadeBones(2)=(GrenName="Grenade3")
	 GLLoadGrenadeBones(0)=(GrenName="GrenadeHandle")
	 GLLoadGrenadeBones(1)=(GrenName="HeldGrenade")
	 GLLoadGrenadeBones(2)=(GrenName="EmptyGrenade")
     PlayerSpeedFactor=0.800000
     PlayerJumpFactor=0.870000
     TeamSkins(0)=(RedTex=Shader'BallisticWeapons2.Hands.RedHand-Shiny',BlueTex=Shader'BallisticWeapons2.Hands.BlueHand-Shiny')
     BigIconMaterial=Texture'BallisticRecolors3TexPro.SK410.BigIcon_SK410'
     BigIconCoords=(Y1=40)
     BCRepClass=Class'BallisticProV55.BallisticReplicationInfo'
     bWT_Shotgun=True
     bWT_Splash=True
     bWT_Machinegun=True
     bWT_Projectile=True
     ManualLines(0)="Fires shotgun blasts with wide spread. These blasts inflict heavy damage and knock the enemy back."
     ManualLines(1)="Fires an explosive slug. Deals good impact damage and minor radius damage. Targets hit will be knocked back a significant distance."
     ManualLines(2)="Has a melee attack. Damage improves over hold time, with a max bonus being reached at 1.5 seconds of holding. As a blunt attack, has lower damage than sharp melee attacks but inflicts a minor blind effect upon striking. Deals more damage from behind.||Extremely effective at close range and against charges and melee."
     SpecialInfo(0)=(Info="300.0;30.0;0.5;60.0;0.0;1.0;0.0")
     BringUpSound=(Sound=Sound'BallisticSounds2.M763.M763Pullout')
     PutDownSound=(Sound=Sound'BallisticSounds2.M763.M763Putaway')
     MagAmmo=24
	 CockSelectAnim="PulloutFancy"
     CockAnimRate=1.000000
     CockSound=(Sound=Sound'BWBPJiffyPackSounds.AA12.Cock',Volume=1.400000)
     ReloadAnimRate=0.750000
	 StartShovelAnim="PrepReload"
	 EndShovelAnim="FinishReload"
     StartShovelAnimRate=1.300000
     EndShovelAnimRate=1.300000
	 ShovelAnim="GLReload1"
     ClipOutSound=(Sound=Sound'BWBPJiffyPackSounds.AA12.MagOut',Volume=1.300000)
     ClipInSound=(Sound=Sound'BWBPJiffyPackSounds.AA12.MagIn',Volume=1.300000)
     WeaponModes(0)=(ModeName="Automatic",ModeID="WM_FullAuto")
     WeaponModes(1)=(ModeName="Automatic Slug",bUnavailable=True,ModeID="WM_FullAuto")
     WeaponModes(2)=(ModeName="0451-EXECUTE",bUnavailable=True)
     CurrentWeaponMode=0
     bNotifyModeSwitch=True
     bNoCrosshairInScope=False
     SightZoomFactor=20
     SightOffset=(X=60.000000,Y=5.690000,Z=36)
     SightDisplayFOV=40.000000
     SightingTime=0.330000
     GunLength=48.000000
     SprintOffSet=(Pitch=-4096,Yaw=-4096)
     JumpOffSet=(Pitch=-1024,Yaw=-1024)
     AimSpread=0
     ChaosAimSpread=0
     RecoilXCurve=(Points=(,(InVal=0.200000,OutVal=-0.070000),(InVal=0.300000,OutVal=-0.150000),(InVal=0.500000,OutVal=0.050000),(InVal=0.750000,OutVal=0.120000),(InVal=1.000000,OutVal=-0.050000)))
     RecoilYCurve=(Points=(,(InVal=0.300000,OutVal=0.500000),(InVal=1.000000,OutVal=1.000000)))
     RecoilXFactor=0.150000
     RecoilYFactor=0.100000
     RecoilMinRandFactor=0.150000
     RecoilMax=8192.000000
     RecoilDeclineDelay=1.000000
     FireModeClass(0)=Class'BallisticJiffyPack.ARPrimaryFire'
     FireModeClass(1)=Class'BallisticJiffyPack.ARSecondaryFire'
     SelectAnimRate=0.900000
     PutDownTime=0.550000
     BringUpTime=0.700000
     AIRating=0.850000
     CurrentRating=0.850000
     Description="The SK-410 shotgun is a large-bore, compact shotgun based off the popular AK-490 design. While it is illegal on several major planets, this powerful weapon and its signature explosive shotgun shells are almost ubiquitous. A weapon originally designed for breaching use, the SK-410 is now found in the hands of civillians and terrorists throughout the worlds. It had become so prolific with outer colony terrorist groups that the UTC began the SKAS assault weapon program in an effort to find a powerful shotgun of their own."
     Priority=245
     HudColor=(G=25)
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
     InventoryGroup=7
     GroupOffset=7
     PickupClass=Class'BallisticJiffyPack.ARPickup'
     PlayerViewOffset=(Y=16.000000,Z=-25.000000)
     AttachmentClass=Class'BallisticJiffyPack.ARAttachment'
     IconMaterial=Texture'BallisticRecolors3TexPro.SK410.SmallIcon_SK410'
     IconCoords=(X2=127,Y2=35)
     ItemName="RCS-715 Tactical Buster"
     LightType=LT_Pulse
     LightEffect=LE_NonIncidence
     LightHue=25
     LightSaturation=150
     LightBrightness=150.000000
     LightRadius=5.000000
     Mesh=SkeletalMesh'BWBPJiffyPackAnims.AA12_FP'
     DrawScale=0.600000
}