local choice_store_weapons = {function(player, choice)
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
        if(storedWeps[user_id] == nil)then
            vRPclient.notify(player, {"~g~Vei primii armele in 1 minut!"})
            storedWeps[user_id] = true
            SetTimeout(storeTime*1000, function()
                vRPclient.getWeapons(player,{},function(weapons)
                    for k,v in pairs(weapons) do
                        -- convert weapons to parametric weapon items
                        vRP.giveInventoryItem({user_id, "wbody|"..k, 1, true})
                        if v.ammo > 0 then
                            vRP.giveInventoryItem({user_id, "wammo|"..k, v.ammo, true})
                        end
                        if v.supressor > 0 then
                            vRP.giveInventoryItem({user_id, "supressor", 1, true})
                        end
                        if v.flash > 0 then
                            vRP.giveInventoryItem({user_id, "flash",1, true})
                        end
                        if v.yusuf > 0 then
                            vRP.giveInventoryItem({user_id, "yusuf", 1, true})
                        end
                    end
                  -- clear all weapons
                  vRPclient.giveWeapons(player,{{},true})
                end)
                storedWeps[user_id] = nil
            end)
        else
            vRPclient.notify(player,{"~r~Ai dat deja "})
            return
        end
    end
end, lang.police.menu.store_weapons.description()}