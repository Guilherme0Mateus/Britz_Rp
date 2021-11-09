local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_rouboarmas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local andamento = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1, ['x'] = 253.91, ['y'] = -51.94, ['z'] = 69.95 },
	{ ['id'] = 2, ['x'] = 841.01, ['y'] = -1035.94, ['z'] = 28.2 },
	{ ['id'] = 3, ['x'] = -1303.78, ['y'] = -396.06, ['z'] = 36.7 },
	{ ['id'] = 4, ['x'] = 24.08, ['y'] = -1105.35, ['z'] = 29.8 },
	{ ['id'] = 5, ['x'] = 808.9, ['y'] = -2159.7, ['z'] = 29.62 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTEIRO DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local faizen = 1000
		local ped = PlayerPedId()
		local x,y,z = GetEntityCoords(ped)
		if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_UNARMED") and not IsPedInAnyVehicle(ped) then
			for k,v in pairs(locais) do
				if Vdist(v.x,v.y,v.z,x,y,z) <= 1 and not andamento then
					faizen = 5
				 DrawMarker(21,v.x,v.y,v.z-0.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,255,0,0,50,1,0,0,1)
					if IsControlJustPressed(0,38) and func.checkPermission() then
						func.checkRobbery(v.id,v.x,v.y,v.z)
					end
				end
			end
		end
		Citizen.Wait(faizen)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO O ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciandolojadearmas")
AddEventHandler("iniciandolojadearmas",function(x,y,z)
	segundos = 30
	andamento = true
	SetEntityHeading(PlayerPedId())
	TeleportPlayer(PlayerPedId(),x,y,z-1,false,false,false,false)
	TriggerEvent('cancelando',true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				andamento = false
				ClearPedTasks(PlayerPedId())
				TriggerEvent('cancelando',false)
			end
		end
	end
end)

