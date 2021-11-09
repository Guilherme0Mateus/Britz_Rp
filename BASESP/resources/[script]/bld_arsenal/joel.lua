local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPex = Tunnel.getInterface("bld_arsenal")

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-- [ Callback das ações dos botões ]
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "m4a1" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),150,0,0)

	elseif data == "m4a4" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),200,0,1)

	elseif data == "mp5" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),100,0,0)

	elseif data == "mpx" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SMG"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),100,0,0)

	elseif data == "shot45" then
		GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),100,0,0)

	--elseif data == "shot12" then
	--	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
	--	GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"),100,0,0)

	elseif data == "fiveseven" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),100,0,0)

	elseif data == "glock18" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PISTOL_MK2"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),100,0,0)
		
	elseif data == "take-kit" then
		GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
		GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
		GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
		TriggerServerEvent('bld_arsenal:colete')
		GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
		
	elseif data == "rem-kit" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_NIGHTSTICK"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_STUNGUN"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_FLASHLIGHT"))
		TriggerServerEvent('bld_arsenal:colete2')
		
	elseif data == "clear" then
		RemoveAllPedWeapons(ped,0)
		TriggerServerEvent('bld_arsenal:colete2')
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)

-- [ Coordenadas ] --
local arsenal = {
	{ ['x'] = 459.92, ['y'] = -978.98, ['z'] = 30.68 }, -- PC
--	{ ['x'] = 825.60, ['y'] =  164.201, ['z'] = 86.38 }, -- BAEP
	{ ['x'] = 470.20, ['y'] = -1086.15, ['z'] = 38.70 }, -- PF
--	{ ['x'] = 1514.18, ['y'] = 789.08, ['z'] = 78.42 }, -- PRF
--	{ ['x'] = -749.89, ['y'] = -1415.26, ['z'] = 5.00 }, -- GRPAE
	{ ['x'] = -2035.62, ['y'] = -476.9, ['z'] = 17.96 }, -- ROTA 
	{ ['x'] = 243.81, ['y'] = 912.07, ['z'] = 214.75 } -- PMESP
}

-- [ Thread do Menu ] --
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local bld = 1000

		for k,v in pairs(arsenal) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local arsenal = arsenal[k]
			
			if distance <= 7 then
				bld = 1
				DrawMarker(21, arsenal.x, arsenal.y, arsenal.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) then
						if vRPex.checkPermission() then
							ToggleActionMenu()
						end
					end
				end
			end
		end
		Citizen.Wait(bld)
	end
end)