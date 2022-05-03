L = LANG.GetLanguageTableReference("ja")

-- GENERAL ROLE LANGUAGE STRINGS
L[POISONER.name] = "Poisoner"
L["info_popup_" .. POISONER.name] = [[体内に毒を持つ、Poisonerとなりました！ 自身を殺した人は即座に毒に侵されます！]]
L["body_found_" .. POISONER.abbr] = "奴はPoisonerだったな！"
L["search_role_" .. POISONER.abbr] = "こいつはPoisonerだったようだな！"
L["target_" .. POISONER.name] = "Poisoner"
L["ttt2_desc_" .. POISONER.name] = [[Poisonerは自身を殺した人を毒に侵す、Innocent陣営の仲間です！]]

-- OTHER ROLE LANGUAGE STRINGS
L["ttt2_poison_sick"] = "毒を盛られてしまったようだ..."
L["ttt2_poison_cured"] = "気分がよくなった！"

-- EVENT STRINGS
L["title_poison_sick"] = "Poisonerが殺害された"
L["desc_poison_sick"] = "{nick}が毒に侵された。"
L["tooltip_poison_sick"] = "被毒: {score}"
L["title_poison_cure"] = "解毒された。"
L["desc_poison_cure"] = "{nick}が解毒された。"
L["tooltip_poison_cure"] = "解毒: {score}"
