ESX = exports["es_extended"]:getSharedObject()
local Config = require('config')

RegisterServerEvent('kye:3167gvh0b1826735timpoor')
AddEventHandler('kye:3167gvh0b1826735timpoor', function(weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount = Config.apcost
    local label = 'AP'
    if xPlayer.hasWeapon(weapon) then
        TriggerClientEvent('kvip:notify', source, "", "You Already Have An " .. label)
    else
        if xPlayer.getMoney() >= amount then
            xPlayer.removeMoney(amount)
            xPlayer.addWeapon(weapon, 5000)
        else
            local missingBread = amount - xPlayer.getMoney()
            TriggerClientEvent('kvip:notify', source, "",  "You Cannot Afford " .. label .. "\nMissing $" .. missingBread .. "!")
        end
    end
end)

RegisterServerEvent('kye:08713fg6gc18673twhatisthistrigger89h13tclickmeimpoor')
AddEventHandler('kye:08713fg6gc18673twhatisthistrigger89h13tclickmeimpoor', function(amount, label, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= amount then
            xPlayer.removeMoney(amount)
            xPlayer.addInventoryItem(item, 1)
        else
            local missingBread = amount - xPlayer.getMoney()
            TriggerClientEvent('kvip:notify', source, "",   "You Cannot Afford " .. label .. "\nMissing $" .. missingBread .. "!")
        end
end)


RegisterCommand('vip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if IsPlayerAceAllowed(source, Config.ace) then
        TriggerClientEvent('vip:menuopen', source)
    else
        TriggerClientEvent('kvip:notify', source, "","Missing VIP Permissions", "error")
        return
     end
end)