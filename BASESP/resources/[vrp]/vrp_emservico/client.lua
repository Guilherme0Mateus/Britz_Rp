local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ykP = Tunnel.getInterface("vrp_emservico")
local onservicePOLICE = false
local onserviceEMS = false
local onserviceTAXI = false
local onserviceMEC = false
local onserviceConce = false
local onserviceAdv = false

local emservicoPolicia = {
    {443.71032714844,-975.10162353516,30.68966293335},
    {814.91693115234,157.8193359375,86.386657714844},
    {474.4211730957,-1090.3758544922,38.706527709961},
    {-1095.3076171875,-829.74438476563,14.28279876709},
    {249.19,915.01,214.75}, 
    {-2048.3090820313,-460.51068115234,12.240758895874},
    {-747.8037109375,-1417.7218017578,5.0005211830139},
    {1511.4241943359,782.24688720703,78.429870605469},
}

local emservicoEMS = {
    {-437.14581298828,-307.3928527832,34.910556793213},
}
local emservicoTaxi = {
    {894.29254150391,-173.13482666016,81.594970703125}
}

local emservicoConce = {
    {-31.468246459961,-1112.2546386719,26.422323226929}
}

local emservicoAdv = {
    {166.88432312012,-1102.2434082031,29.323265075684}
}

local emservicoMecanico = {
{963.53576660156,-978.35064697266,39.753036499023}

}

local contador = 0

Citizen.CreateThread(function()
    while true do
        local skips = 1000
        for k,v in ipairs(emservicoPolicia) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onservicePOLICE and contador == 0 and distance <= 1.5 then
                    skips = 5
					DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,246)) then
                        local ped = PlayerPedId()
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        onservicePOLICE = false
                        contador = 2
                    end
                elseif not onservicePOLICE and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onservicePOLICE = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoEMS) do
            local x,y,z = table.unpack(v)
            local ped = PlayerPedId()
            local pCoords = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceEMS and contador == 0 and distance <= 1.5 then
                    skips = 5
					DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,246)) then
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        TriggerEvent('emp_paramedico:encerrarJob')
                        onserviceEMS = false
                        contador = 2
                    end
                elseif not onserviceEMS and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1, 49)) and ykP.emServico() then
                        TriggerEvent('emp_paramedico:iniciarJob')
                        TriggerEvent('paycheck:iniciarContador')
                        onserviceEMS = true
                        contador = 2
                    end
                end
            end
        end


        for k,v in ipairs(emservicoTaxi) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceTAXI and contador == 0 and distance <= 1.5 then
                    skips = 5
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceTAXI = false
                        contador = 2
                    end
                elseif not onserviceTAXI and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceTAXI = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoConce) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceConce and contador == 0 and distance <= 1.5 then
                    skips = 5
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceConce = false
                        contador = 2
                    end
                elseif not onserviceConce and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceConce = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoAdv) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceAdv and contador == 0 and distance <= 1.5 then
                    skips = 5
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceAdv = false
                        contador = 2
                    end
                elseif not onserviceAdv and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceAdv = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoMecanico) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceMEC and contador == 0 and distance <= 1.5 then
                    skips = 5
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        onserviceMEC = false
                        contador = 2
                    end
                elseif not onserviceMEC and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceMEC = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end
        Citizen.Wait(skips)
    end
end)


RegisterNetEvent('vrp_emservico:receberColete')
AddEventHandler('vrp_emservico:receberColete', function()
    local ped = PlayerPedId()
    SetPedArmour(ped, 100)
end)

------------ CONTADOR
Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if contador > 0 then
            contador = contador - 2
        end
    end
end)
------------

function DrawText3d(x,y,z, text, alpha)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, alpha)
        SetTextDropshadow(0, 0, 0, 0, alpha)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end