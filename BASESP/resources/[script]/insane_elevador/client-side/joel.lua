------------------------------------------------------------------------------------------------------
-- [ PRODUTO ADQUIRIDO EM E&G VENDAS (discord.gg/bABGBEX) ]   										--
-- [ DESENVOLVIDO POR Edu#0069 // BACK-END Edu#0069 ]   											--
-- [ SE VOCÊ ADQUIRIU ESSE PRODUTO, VOCÊ TEM DIREITO A SUPORTE GRATUITO ]   						--
-- [ OBRIGADO PELA CONFIANÇA // CONTATO: Edu#0069 // GITHUB: https://github.com/badlandproject  ]   --
------------------------------------------------------------------------------------------------------

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
		TriggerEvent("hideHud")
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
		TriggerEvent("showHud")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "-1andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,-418.98,-344.87,24.24,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "-2andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,-436.05,-359.56,34.95,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "-3andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,-487.45,-334.94,91.01,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)
		
	elseif data == "nothing" then
		TriggerEvent("Notify","negado","Botão quebrado.")
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local elevator = {
	{ ['x'] = -418.98, ['y'] = -344.87, ['z'] = 24.24 }, -- -1

	{ ['x'] = -436.05, ['y'] = -359.56, ['z'] = 34.95 }, -- -2

	{ ['x'] = -487.45, ['y'] = -334.94, ['z'] = 91.01 }, -- -3

}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000

		for k,v in pairs(elevator) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local elevator = elevator[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), elevator.x, elevator.y, elevator.z, true ) <= 2 then
				sleep = 5
				DrawText3D(elevator.x, elevator.y, elevator.z, "[~g~E~w~] Para ~g~ABRIR~w~ o elevador.")
			end
			
			if distance <= 15 then
				sleep = 5
				DrawMarker(30, elevator.x, elevator.y, elevator.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,140,255,90,0,0,0,1)
				if distance <= 2.3 then
					if IsControlJustPressed(0,38) then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end