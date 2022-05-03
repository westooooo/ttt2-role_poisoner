if CLIENT then
    EVENT.title = "title_poison_cure"
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_poison.vmt")

    function EVENT:GetText()
        return {
            {
                string = "desc_poison_cure",
                params = {
                    nick = self.event.nick
                }
            }
        }
    end
end

if SERVER then
    function EVENT:Trigger(ply)
        return self:Add({
            nick = ply:Nick()
        })
    end
end

function EVENT:Serialize()
    return self.event.nick .. " cured their poison."
end