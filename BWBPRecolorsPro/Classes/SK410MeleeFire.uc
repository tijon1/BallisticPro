class SK410MeleeFire extends BallisticMeleeFire;

defaultproperties
{
     Damage=60.000000
     
     
     DamageType=Class'BWBPRecolorsPro.DT_SK410Hit'
     DamageTypeHead=Class'BWBPRecolorsPro.DT_SK410HitHead'
     DamageTypeArm=Class'BWBPRecolorsPro.DT_SK410Hit'
     bUseWeaponMag=False
     bReleaseFireOnDie=False
     bIgnoreReload=True
     ScopeDownOn=SDO_PreFire
     BallisticFireSound=(Sound=Sound'BallisticSounds3.M763.M763Swing',Volume=0.5,Radius=32.000000,Pitch=0.800000,bAtten=True)
     bAISilent=True
     bFireOnRelease=True
     PreFireAnim="PrepBash"
     FireAnim="Bash"
     PreFireAnimRate=2.000000
     FireAnimRate=1.500000
     TweenTime=0.000000
     FireRate=0.650000
     AmmoClass=Class'BWBPRecolorsPro.Ammo_8GaugeHE'
     AmmoPerFire=0
     ShakeRotTime=1.000000
     ShakeOffsetMag=(X=5.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.000000
     BotRefireRate=0.900000
     WarnTargetPct=0.050000
}
