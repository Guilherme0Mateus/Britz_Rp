-------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- COPIA NAO COMÉDIA --------------------------------------------------------
-------------------------------------------------------- TRIGUEIRO ------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

local porte = {
    { -78.22,-802.4,243.41 }, --NOIS
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESCRITO DELICIA GOSTOSO
-----------------------------------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        for _,mark in pairs(porte) do
            local x,y,z = table.unpack(mark)
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
            if distance <= 3.5 then
                sleep = 4
				DrawText3Ds(x,y,z+0.7,"[E] - PARA ABRIR")
                if IsControlJustPressed(0,38) then
                    TriggerServerEvent("meenuzinhodotrigueiro")
                end
            end
        end
        Citizen.Wait(sleep)
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




