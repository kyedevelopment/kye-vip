local Config = require('config')

--RegisterKeyMapping('vip', 'kvip', 'keyboard', 'm')

RegisterNetEvent('vip:menuopen')
AddEventHandler('vip:menuopen', function(source)
    lib.showMenu('kvip-menu')
end)


local function RGB(frequency)
    local result = {}
    local curtime = GetGameTimer() / 2000
    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
  
    return result
end

lib.registerMenu({
    id = 'kvip-menu',
    title = 'Vip Menu',
    position = 'bottom-right',
    options = {
        {
            label = 'No Clip',
            args = { noclip = 'placeholder'},
            icon = 'fa-regular fa-eye-slash',
            close = false,
        },
        {
            label = 'Heal',
            args = { heal = '200' },
            icon = 'fa-solid fa-star-of-life',
            close = false,
        },
        {
            label = 'Skin',
            args = { skin = 'placeholder' },
            icon = 'fa-solid fa-person',
            close = true,
        },
        {
            label = 'Repair Vehicle',
            args = { rveh = 'placeholder' },
            icon = 'fa-solid fa-car',
            close = false,
        },
        {
            label = 'Clean Vehicle',
            args = { cveh = 'placeholder' },
            icon = 'fa-solid fa-car',
            close = false,
        },
        {
            label = 'Flip Vehicle',
            args = { fveh = 'placeholder' },
            icon = 'fa-solid fa-car',
            close = false,
        },
        {
            label = 'Teleport Ramps',
            args = { ramps = -959.32, -779.78, 17.84 },
            icon = 'fa-solid fa-t',
            close = false,
        },
        {
            label = 'Teleport RZ',
            args = { rz = 217.95, -2566.02, 6.07 },
            icon = 'fa-solid fa-t',
            close = false,
        },
        {
            label = 'AP Pistol',
            description = Config.apcost,
            args = { ap = 'WEAPON_APPISTOL' },
            icon = 'fa-solid fa-gun',
            close = false,
        },
        {
            label = 'Armour',
            description = Config.armcost,
            args = { item = 'bulletproof', amount = Config.armcost, label = 'BulletProof' },
            icon = 'fa-solid fa-shield-halved',
            close = false,
        },
        {
            label = 'Ammo',
            description = Config.ammcost,
            args = { item = 'weaclip', amount = Config.ammcost, label = 'Weapon Clip' },
            icon = 'fa-regular fa-hand',
            close = false,
        },
        {
            label = 'RGB Vehicle',
            args = { rgbveh = 'placeholder' },
            icon = 'fa-solid fa-star',
            close = false,
        }
    }

}, function(selected, scrollIndex, args)
    if args.noclip then
        ExecuteCommand('noclip')
    elseif args.heal then
        local ped = PlayerPedId()
		SetEntityHealth(ped, args.heal)
    elseif args.skin then
        local target = PlayerPedId()
        TriggerEvent(Config.skin, target, true)
    elseif args.rveh then
        local player = PlayerPedId()
		local poorwhip = GetVehiclePedIsIn(player, false)
        if IsPedInAnyVehicle(player, true) then
            SetVehicleEngineHealth(poorwhip, 1000)
            SetVehicleEngineOn(poorwhip, true, true)
            SetVehicleFixed(poorwhip)
        end
    elseif args.cveh then
        local player = PlayerPedId()
		local poorwhip = GetVehiclePedIsIn(player, false)
		if IsPedInAnyVehicle(player, true) then
			SetVehicleDirtLevel(poorwhip, 0)
        end
    elseif args.fveh then
        local player = PlayerPedId()
		local poorwhip = GetVehiclePedIsIn(player)
		if IsPedInAnyVehicle(player, true) then
			if not IsVehicleOnAllWheels(poorwhip) then
				SetVehicleOnGroundProperly(poorwhip)
            end
        end
    elseif args.ramps then
        SetEntityCoords(PlayerPedId(), -959.32, -779.78, 17.84)
    elseif args.rz then
        SetEntityCoords(PlayerPedId(), 217.95, -2566.02, 6.07)
    elseif args.ap then
        TriggerServerEvent('kye:3167gvh0b1826735timpoor', args.ap)
    elseif args.item then
        TriggerServerEvent('kye:08713fg6gc18673twhatisthistrigger89h13tclickmeimpoor', args.amount, args.label, args.item)
    elseif args.rgbveh then
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(100)
                
                local rgb = RGB(2.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), rgb.r, rgb.g, rgb.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), rgb.r, rgb.g, rgb.b)
            end
        end)
    end
end)


RegisterNetEvent('kvip:notify')
AddEventHandler('kvip:notify', function(title, message)
    lib.notify({
        title = title,
        description = message,
        position = 'top',
        type = 'error'
    })
end)