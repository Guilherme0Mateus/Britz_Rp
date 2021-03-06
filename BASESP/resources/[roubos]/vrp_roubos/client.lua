local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
rob = Tunnel.getInterface("vrp_roubos")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local andamento = false
local segundos = 0
local blip = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ id = 1 , x = 147.27 , y = -1045.04 , z = 29.368 , h = 70.0 },
	{ id = 2 , x = -1211.65 , y = -335.76 , z = 37.79 , h = 300.0 },
	{ id = 3 , x = -2957.61 , y = 481.65 , z = 15.69 , h = 330.0 },
	{ id = 4 , x = -103.53 , y = 6478.01 , z = 31.62 , h = 80.0 },
	{ id = 5 , x = 311.70 , y = -283.37 , z = 54.16 , h = 180.0 },
	{ id = 6 , x = -353.46 , y = -54.39 , z = 49.03 , h = 360.0 },
	{ id = 7 , x = 1175.94 , y = 2711.73 , z = 38.08 , h = 30.0 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTEIRO DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		for _,item in pairs(locais) do
			local ped = GetPlayerPed(-1)
			local px,py,pz = table.unpack(GetEntityCoords(ped,true))
			local unusedBool,coordz = GetGroundZFor_3dCoord(item.x,item.y,item.z,1)
			local distancia = GetDistanceBetweenCoords(item.x,item.y,coordz,px,py,pz,true)
			if andamento then
				idle = 5
				if IsControlJustPressed(0,244) or GetEntityHealth(ped) <= 100 then
					andamento = false
					rob.CancelandoRoubo()
					ClearPedTasks(ped)
				end
			else
				if distancia <= 50 then
					DrawMarker(29,item.x,item.y,item.z,0,0,0,0,0,0,1.0,0.7,1.0,50,150,50,200,1,0,0,1)
					if distancia <= 1.5 then
						DisplayHelpText("Aperte ~INPUT_THROW_GRENADE~ para iniciar o roubo")
						if IsControlJustPressed(0,47) and not IsPedInAnyVehicle(ped,false) then
							if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
								rob.IniciandoRoubo(item.id,item.x,item.y,item.z,item.h)
							else
								TriggerEvent('chatMessage',"ALERTA",{255,70,50},"Voc?? n??o pode iniciar um roubo utilizando skin de personagem.")
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO O ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciarroubo")
AddEventHandler("iniciarroubo",function(secs,head)
	segundos = secs
	andamento = true
	SetEntityHeading(GetPlayerPed(-1),head)
	SetPedComponentVariation(GetPlayerPed(-1),5,45,0,2)
	SetCurrentPedWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_UNARMED"),true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if andamento then
			idle = 5
			local ui = GetMinimapAnchor()
			drarola(ui.right_x+0.230,ui.bottom_y-0.120,1.0,1.0,0.36,"APERTE ~r~M~w~ PARA CANCELAR O ROUBO EM ANDAMENTO",255,255,255,150,4)
			drarola(ui.right_x+0.230,ui.bottom_y-0.100,1.0,1.0,0.50,"RESTAM ~g~"..segundos.." SEGUNDOS ~w~PARA TERMINAR",255,255,255,255,4)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,57,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,245,true)
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM + ENTREGA DA RECOMPENSA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				andamento = false
				ClearPedTasks(GetPlayerPed(-1))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUN????ES
-----------------------------------------------------------------------------------------------------------------------------------------
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function drarola(x,y,width,height,scale,text,r,g,b,a,font)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function GetMinimapAnchor()
	local safezone = GetSafeZoneSize()
	local safezone_x = 1.0 / 20.0
	local safezone_y = 1.0 / 20.0
	local aspect_ratio = GetAspectRatio(0)
	local res_x, res_y = GetActiveScreenResolution()
	local xscale = 1.0 / res_x
	local yscale = 1.0 / res_y
	local Minimap = {}
	Minimap.width = xscale * (res_x / (4 * aspect_ratio))
	Minimap.height = yscale * (res_y / 5.674)
	Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
	Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
	Minimap.right_x = Minimap.left_x + Minimap.width
	Minimap.top_y = Minimap.bottom_y - Minimap.height
	Minimap.x = Minimap.left_x
	Minimap.y = Minimap.top_y
	Minimap.xunit = xscale
	Minimap.yunit = yscale
	return Minimap
end

RegisterNetEvent('criarblip')
AddEventHandler('criarblip',function(x,y,z)
	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(x,y,z)
		SetBlipScale(blip,0.5)
		SetBlipSprite(blip,103)
		SetBlipColour(blip,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo em andamento")
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,false)
		SetBlipRoute(blip,true)
	end
end)

RegisterNetEvent('removerblip')
AddEventHandler('removerblip',function()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end
end)

