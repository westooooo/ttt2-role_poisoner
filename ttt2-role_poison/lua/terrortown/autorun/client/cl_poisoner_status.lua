hook.Add("Initialize", "PoisonerInitStatus", function()
  STATUS:RegisterStatus("poisoned_status", {
    hud = Material("vgui/ttt/dynamic/roles/icon_poison.vmt"),
    type = "bad"
  })
end)

hook.Add("TTT2FinishedLoading", "poison_devicon", function()
  AddTTT2AddonDev("76561198049910438")
end)

net.Receive("ttt2_poison_msg", function()
  local msg = net.ReadString()
  EPOP:AddMessage({
    text = LANG.TryTranslation(msg),
    color = POISONER.ltcolor}
  )
end)
