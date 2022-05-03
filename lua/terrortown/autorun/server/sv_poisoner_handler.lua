util.AddNetworkString("ttt2_poison_msg")

local function resetPoison()
  local plys = player.GetAll()
  for i = 1, #plys do
    local ply = plys[i]
    ply:SetNWBool("isPoisoned", false)
    ply.poisonTime = nil
    ply.poisonPly = nil
  end
end

hook.Add("TTTEndRound", "resetPoison", resetPoison)
hook.Add("TTTPrepRound", "resetPoison", resetPoison)
hook.Add("TTTBeginRound", "resetPoison", resetPoison)

local function FindPoisonPly()
  local plys = player.GetAll()
  for i = 1, #plys do
    if plys[i]:GetSubRole() == ROLE_POISONER then return plys[i] end
  end
end

hook.Add("Think", "PoisonThink", function()
  if GetRoundState() ~= ROUND_ACTIVE then return end
  local plys = util.GetAlivePlayers()
  for i = 1, #plys do
    local ply = plys[i]
    if not ply:GetNWBool("isPoisoned") then continue end
    local poison_ply
    if ply.poisonPly then
      poison_ply = player.GetBySteamID(ply.poisonPly)
    else
      poison_ply = FindPoisonPly()
    end

    local poison_delay = GetConVar("ttt2_poison_delay"):GetInt()
    local poison_min = GetConVar("ttt2_poison_min"):GetInt()
    local poison_heal_cure = GetConVar("ttt2_poison_heal_cure"):GetBool()
    if not ply.poisonTime then ply.poisonTime = CurTime() + poison_delay end

    if ply.poisonTime <= CurTime() then
      local poison_dmg = GetConVar("ttt2_poison_dmg"):GetInt()
      if ply:Health() - poison_dmg < poison_min then
        poison_dmg = ply:Health() - poison_min
      end
      if ply:Health() > ply.health_check_poison and poison_heal_cure then
        poison_dmg = 0
      end
      local dmginfo = DamageInfo()
      dmginfo:SetDamage(poison_dmg)
      dmginfo:SetDamageType(DMG_RADIATION)
      dmginfo:SetAttacker(poison_ply)
      ply:TakeDamageInfo(dmginfo)
      if ply:Health() <= poison_min or (ply:Health() > ply.health_check_poison and poison_heal_cure) then
        ply:SetNWBool("isPoisoned", false)
        ply.poisonTime = nil
        ply.poisonPly = nil

        events.Trigger(EVENT_POISON_CURE, ply)

        STATUS:RemoveStatus(ply, "poisoned_status")
        net.Start("ttt2_poison_msg")
        net.WriteString("ttt2_poison_cured")
        net.Send(ply)
      else
        ply.health_check_poison = ply:Health()
        ply.poisonTime = CurTime() + poison_delay
      end
    end
  end
end)

hook.Add("TTTPlayerUsedHealthStation", "PoisonHealthStation", function(ply)
  if ply:GetNWBool("isPoisoned") and GetConVar("ttt2_poison_healstation_cure"):GetBool() then
    ply:SetNWBool("isPoisoned", false)
    ply.poisonTime = nil
    ply.poisonPly = nil

    events.Trigger(EVENT_POISON_CURE, ply)

    STATUS:RemoveStatus(ply, "poisoned_status")
    net.Start("ttt2_poison_msg")
    net.WriteString("ttt2_poison_cured")
    net.Send(ply)
  end
end)

hook.Add("DoPlayerDeath", "PoisonerKilled", function(ply, attacker, dmgInfo)
  if GetRoundState() ~= ROUND_ACTIVE then return end
  if not IsValid(ply) or not IsValid(attacker) or not attacker:IsPlayer() then return end
  if ply:GetSubRole() ~= ROLE_POISONER then return end
  if SpecDM and (ply.IsGhost and ply:IsGhost() or (attacker.IsGhost and attacker:IsGhost())) then return end

  events.Trigger(EVENT_POISON_SICK, ply, attacker, dmgInfo)

  attacker:SetNWBool("isPoisoned", true)
  attacker.poisonTime = CurTime() + GetConVar("ttt2_poison_delay"):GetInt()
  attacker.poisonPly = ply:SteamID()
  attacker.health_check_poison = attacker:Health()
  STATUS:AddStatus(attacker, "poisoned_status")
  net.Start("ttt2_poison_msg")
  net.WriteString("ttt2_poison_sick")
  net.Send(attacker)
end)
