L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[POISONER.name] = "Poisoner"
L["info_popup_" .. POISONER.name] = [[You are a Poisoner! Infect whoever kills you!]]
L["body_found_" .. POISONER.abbr] = "They were a Poisoner!"
L["search_role_" .. POISONER.abbr] = "This person was a Poisoner!"
L["target_" .. POISONER.name] = "Poisoner"
L["ttt2_desc_" .. POISONER.name] = [[The Poisoner is an Innocent who infects the person who kills them!]]

-- OTHER ROLE LANGUAGE STRINGS
L["ttt2_poison_sick"] = "You feel sick"
L["ttt2_poison_cured"] = "You feel much better"

-- EVENT STRINGS
L["title_poison_sick"] = "A Poisoner was killed"
L["desc_poison_sick"] = "{nick} was poisoned."
L["tooltip_poison_sick"] = "Poisoned: {score}"
L["title_poison_cure"] = "A player's poison was cured"
L["desc_poison_cure"] = "{nick} recovered from their poison."
L["tooltip_poison_cure"] = "Cured of Poison: {score}"
