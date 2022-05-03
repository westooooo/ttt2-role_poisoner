CreateConVar("ttt2_poison_dmg", "5", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_poison_kill", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_poison_delay", "3", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_poison_healstation_cure", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_poison_min", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("ttt2_poison_heal_cure", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY})

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_poisoner_dynamic_convars", function(tbl)
  tbl[ROLE_POISONER] = tbl[ROLE_POISONER] or {}

  table.insert(tbl[ROLE_POISONER], {
    cvar = "ttt2_poison_healstation_cure",
    checkbox = true,
    desc = "ttt2_poison_healstation_cure (def. 1)"
  })

  table.insert(tbl[ROLE_POISONER], {
    cvar = "ttt2_poison_heal_cure",
    checkbox = true,
    desc = "ttt2_poison_heal_cure (def. 1)"
  })

  table.insert(tbl[ROLE_POISONER], {
    cvar = "ttt2_poison_delay",
    slider = true,
    min = 0,
    max = 100,
    desc = "ttt2_poison_delay (def. 3)"
  })

  table.insert(tbl[ROLE_POISONER], {
    cvar = "ttt2_poison_min",
    slider = true,
    min = 1,
    max = 100,
    desc = "ttt2_poison_min (def. 1)"
  })

  table.insert(tbl[ROLE_POISONER], {
    cvar = "ttt2_poison_dmg",
    slider = true,
    min = 1,
    max = 20,
    desc = "ttt2_poison_dmg (def. 5)"
  })
end)
