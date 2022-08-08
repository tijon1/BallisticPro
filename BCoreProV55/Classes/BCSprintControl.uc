//=============================================================================
// BCSprintControl.
//
// A special inventory actor used to control player sprinting. Key events must
// be sent from somewhere like a mutator.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class BCSprintControl extends Inventory;

var() float		Stamina;			// Stamina level of player. Players can't sprint when this is out
var() float		MaxStamina;			// Max level of stamina
var() float		StaminaDrainRate;	// Amount of stamina lost each second when sprinting
var() float		StaminaChargeRate;	// Amount of stamina gained each second when not sprinting
var   bool		bSprinting;			// Currently sprinting
var   bool		bSprintActive;		// Sprint key is held down
var() float		SpeedFactor;		// Player speed multiplied by this when sprinting
var float		SprintRechargeDelay; // Retrigger delay
var float		NextAlignmentCheckTime;
var float       JumpDrainFactor;

replication
{
	reliable if (Role == ROLE_Authority)
		bSprintActive, ClientJumped;
}

//If Stamina's less than 0 or Sprint's active
//return
singular function StartSprint()
{
	if (Stamina <= 0  || Instigator.Physics != PHYS_Walking || Instigator.bIsCrouched || bSprintActive || !CheckDirection())
		return;

	bSprintActive = true;

	if (Instigator != None)
        UpdateSpeed();
}

function UpdateSpeed()
{
	local float NewSpeed;

	NewSpeed = Instigator.default.GroundSpeed;
    
	if (BallisticWeapon(Instigator.Weapon) != None)
    {
        NewSpeed *= BallisticWeapon(Instigator.Weapon).PlayerSpeedFactor;
        //log("SC UpdateSpeed: "$Instigator.default.GroundSpeed$" * "$BallisticWeapon(Instigator.Weapon).PlayerSpeedFactor);
    }

	/*if (ComboSpeed(xPawn(Instigator).CurrentCombo) != None)
    {
        //log("SC UpdateSpeed: "$NewSpeed$" * 1.4");
		NewSpeed *= 1.4;
    }*/

    if (bSprintActive)
    {
        //log("SC UpdateSpeed: "$NewSpeed$" * "$SpeedFactor);
        NewSpeed *= SpeedFactor;
    }

	if (Instigator.GroundSpeed != NewSpeed)
		Instigator.GroundSpeed = NewSpeed;

    //log("SC UpdateSpeed: "$NewSpeed);
}

// Sprint Key released. Used on Client and Server
singular function StopSprint()
{
	if (!bSprintActive)
		return;

	bSprintActive = false;
	
	if (Instigator != None)
		UpdateSpeed();
}

simulated function OwnerEvent(name EventName)
{
	super.OwnerEvent(EventName);
	if (EventName == 'Jumped' || EventName == 'Dodged')
	{
		ClientJumped();
		Stamina = FMax(0, Stamina - StaminaDrainRate * 0.5 * JumpDrainFactor);
	}
}
simulated function ClientJumped()
{
	if (level.NetMode != NM_Client)
		return;
	Stamina = FMax(0, Stamina - StaminaDrainRate * 0.5 * JumpDrainFactor);
}

simulated function bool CheckDirection()
{
	if (Normal(Instigator.Velocity) Dot Vector(Instigator.Rotation) < 0.2)
		return false;
	NextAlignmentCheckTime=Level.TimeSeconds + 0.35;
	return true;	
}

simulated event Tick(float DT)
{
	// Add a check here to see if sprint can continue
	// Timed, based on dot product of rotation
	// Drain stamina while sprinting
	
	if (Instigator == None)
		Destroy();
		
	if (bSprintActive && Instigator.Physics != PHYS_Falling && VSize(Instigator.Acceleration) > 100 && VSize(Instigator.Velocity) > 50)
	{
		if (!bSprinting)
		{
			bSprinting=true;
			if (BallisticWeapon(Instigator.Weapon) != None)
				BallisticWeapon(Instigator.Weapon).PlayerSprint(true);
			if (Instigator != None && Instigator.Inventory != None)
				Instigator.Inventory.OwnerEvent('StartSprint');
		}
		
		if (Instigator.bIsCrouched)
			Stamina -= StaminaDrainRate * DT * 1.5;
		else Stamina -= StaminaDrainRate * DT;
		if (Role == ROLE_Authority)
		{
			if (Stamina <= 0 || Instigator.Physics != PHYS_Walking ||(Level.TimeSeconds >= NextAlignmentCheckTime && !CheckDirection()))
				StopSprint();
		}
	}
	// Stamina charges when not sprinting
	else// if (VSize(RV) < Instigator.default.GroundSpeed * 0.8)
	{
		if (bSprinting)
		{
			bSprinting=False;
			if (BallisticWeapon(Instigator.Weapon) != None)
				BallisticWeapon(Instigator.Weapon).PlayerSprint(false);
			if (Instigator != None && Instigator.Inventory != None)
				Instigator.Inventory.OwnerEvent('StopSprint');
		}
		if (Stamina < MaxStamina)
		{
			if (VSize(Instigator.Velocity) == 0)
				Stamina += StaminaChargeRate * DT;
			else if (Instigator.bIsCrouched)
				Stamina += StaminaChargeRate * DT/2;
			if (Level.TimeSeconds > SprintRechargeDelay)
				Stamina += StaminaChargeRate * DT;
		}
	}
	Stamina = FClamp(Stamina, 0, MaxStamina);
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	Super.GiveTo(Other);

	if (Instigator != None && Instigator.Weapon != None && BallisticWeapon(Instigator.Weapon) != None && BallisticWeapon(Instigator.Weapon).SprintControl == None)
		BallisticWeapon(Instigator.Weapon).SprintControl = self;
}

defaultproperties
{
     Stamina=100.000000
     MaxStamina=100.000000
     StaminaDrainRate=15.000000
     StaminaChargeRate=20.000000
     SpeedFactor=1.350000
     bReplicateInstigator=True
}
