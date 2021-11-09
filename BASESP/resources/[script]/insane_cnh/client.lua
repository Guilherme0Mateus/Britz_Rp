local cnh = {
    { 216.26742553711,-1389.3988037109,30.587497711182 }, --NOIS
}

local blips = {		
	{nome = "Detran", id = 351, cor = 24, x= 216.4263, y= -1389.4433, z= 30.5874},
}


-----------------------------------------------------------------------------------------------------------------------------------------
-- ESCRITO DELICIA GOSTOSO
-----------------------------------------------------------------------------------------------------------------------------------------

local comprado = false

Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        for _,mark in pairs(cnh) do
            local x,y,z = table.unpack(mark)
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
            if distance <= 3.5 then
                sleep = 4
				DrawText3Ds(x,y,z+0.7,"[E] - PARA ABRIR")
                if IsControlJustPressed(0,38) then
                    TriggerServerEvent("meenuzinhodotrigueiroCNH")
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)


Citizen.CreateThread(function()
    while true do 
        Wait(1000)
        TriggerServerEvent("cnh:verificar")
    end
end)

RegisterNetEvent("cnh:set")
AddEventHandler("cnh:set", function(value)
comprado = value
end) 

Citizen.CreateThread(function() -- VOCÊ É GAY
    while true do
        local sleep = 4
        if not comprado then
            local ped = PlayerPedId()  -- TRIGUEIRO É LINDO <3 3>   E VOCÊ NAO 
            if IsPedInAnyVehicle(ped) then
                sleep = 4
                local vehicle = GetVehiclePedIsIn(ped)
                if GetPedInVehicleSeat(vehicle,-1) == ped then
                    Citizen.Wait(15000) 
                    TriggerEvent("Notify","negado","Você nao possui carteira de motorista")
                    PlaySoundFrontend(-1,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET",false) -- FUNFA CLIENT PORRRRRRRAAAAAAAAAAAAAAAAAAAAAAA
                end
            end
        end
        Citizen.Wait(sleep) 
    end
  end) 


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNC BLÁ BLÁ BLÁ
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    for _, item in pairs(blips) do
          item.blip = AddBlipForCoord(item.x, item.y, item.z)
          SetBlipSprite(item.blip, item.id)
		  SetBlipColour(item.blip, item.cor)
		  SetBlipDisplay(item.blip, 4)
		  SetBlipScale  (item.blip, 0.8)
          SetBlipAsShortRange(item.blip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(item.nome)
          EndTextCommandSetBlipName(item.blip)
    end
end)


function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    SetTextFont(4)
    SetTextScale(0.35,0.35)
    SetTextColour(255,255,255,150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text))/370
    DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end


---- COPIA NAO VACILAO <3
  
  
  