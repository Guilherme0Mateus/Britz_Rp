
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "dourado" then
		TriggerServerEvent("meuovo-vender","dourado")
	elseif data == "corvina" then
		TriggerServerEvent("meuovo-vender","corvina")
	elseif data == "salmao" then
		TriggerServerEvent("meuovo-vender","salmao")
	elseif data == "pacu" then
		TriggerServerEvent("meuovo-vender","pacu")
	elseif data == "pintado" then
		TriggerServerEvent("meuovo-vender","pintado")
	elseif data == "pirarucu" then
		TriggerServerEvent("meuovo-vender","pirarucu")
	elseif data == "tilapia" then
		TriggerServerEvent("meuovo-vender","tilapia")
	elseif data == "tucunare" then
		TriggerServerEvent("meuovo-vender","tucunare")
	elseif data == "lambari" then
		TriggerServerEvent("meuovo-vender","lambari")
	elseif data == "mferro" then
		TriggerServerEvent("meuovo-vender","mferro")
	elseif data == "mbronze" then
		TriggerServerEvent("meuovo-vender","mbronze")
	elseif data == "mrubi" then
		TriggerServerEvent("meuovo-vender","mrubi")
	elseif data == "mesmeralda" then
		TriggerServerEvent("meuovo-vender","mesmeralda")
	elseif data == "diamante" then
		TriggerServerEvent("meuovo-vender","diamante")
	elseif data == "mouro" then
	TriggerServerEvent("meuovo-vender","mouro")


	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),4520.23,-4515.47,4.49,true)
		if distance <= 30 then
			DrawMarker(23,4520.23,-4515.47,4.49-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)