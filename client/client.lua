local greenzone = false

local function GreenZone(zmiena)
    if zmiena == false then
        if greenzone then
            lib.notify(Config.Zones.notify)
            greenzone = zmiena
            Citizen.CreateThread(function()
                Wait(Config.Zones.time * 1000)
                SetLocalPlayerAsGhost(zmiena)
            end)
        end
    else
        greenzone = zmiena
        SetLocalPlayerAsGhost(zmiena)
    end
end

for k, v in pairs(Config.Greenzones) do
    blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
    SetBlipSprite(blip, v.blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, v.blip.scale)
    SetBlipColour(blip, v.blip.colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(v.blip.title)
    EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local isInAnyZone = false
        local visibleAlpha = 150

        for k, v in pairs(Config.Greenzones) do
            local dist = #(playerCoords - v.coords)

            if v.colorA then
                visibleAlpha = 100
            else
                visibleAlpha = 0
            end

            if dist <= v.dist then
                DrawMarker(28, v.coords.x, v.coords.y, v.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size, v.size, v.size, v.colorR, v.colorG, v.colorB, visibleAlpha, false, false, 2, nil, nil, false)

                if dist < v.size then
                    lib.showTextUI('Znajdujesz się w greenzonie', Config.Zones.textui)
                    GreenZone(true)
                    isInAnyZone = true
                end
            end
        end

        if not isInAnyZone then
            lib.hideTextUI()
            GreenZone(false)
        end

        Wait(0)
    end
end)