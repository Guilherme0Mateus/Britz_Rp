local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	["MARABUNTA"] = {
		positionFrom = { ['x'] = 2848.5, ['y'] = 4450.17, ['z'] = 48.52, ['perm'] = "okaida.permissao" },
		positionTo = { ['x'] = 2849.89, ['y'] = 4451.06, ['z'] = 48.54, ['perm'] = "okaida.permissao" }
	},
	["MAFIA"] = {
		positionFrom = { ['x'] = -991.13635253906, ['y'] = -1518.8889160156, ['z'] = 4.9042081832886, ['perm'] = "okaida.permissao" },
		positionTo = { ['x'] = 894.49, ['y'] = -3245.88, ['z'] = -98.25, ['perm'] = "okaida.permissao" }	
	},
	["HOSPITAL"] = {
		positionFrom = { ['x'] = 327.13, ['y'] = -603.77, ['z'] =43.28, ['perm'] = "paramedico.permissao" },
		positionTo = { ['x'] = 275.74, ['y'] = -1361.42, ['z'] = 24.53, ['perm'] = "paramedico.permissao" }
	},
	["VANILLA"] = {
		positionFrom = { ['x'] = 132.46098327637, ['y'] = -1287.6186523438, ['z'] = 29.272006988525, ['perm'] = "vanilla.permissao" },
		positionTo = { ['x'] = 133.22789001465, ['y'] = -1293.6748046875, ['z'] = 29.269538879395, ['perm'] = "vanilla.permissao" },
	},
	["BAHAMAS"] = {
		positionFrom = { ['x'] = -1390.9655761719, ['y'] = -597.88464355469, ['z'] = 30.319547653198, ['perm'] = "bahamas.permissao" },
		positionTo = { ['x'] = -1385.1534423828, ['y'] = -606.42657470703, ['z'] = 30.319549560547, ['perm'] = "bahamas.permissao" },
	},
	["BAHAMAS2"] = {
		positionFrom = { ['x'] = -1373.7279052734, ['y'] = -624.78381347656, ['z'] = 30.81958770752, ['perm'] = "bahamas.permissao" },
		positionTo = { ['x'] = -1371.4138183594, ['y'] = -626.09515380859, ['z'] = 30.819585800171, ['perm'] = "bahamas.permissao" },
	},
	["TEQUILA"] = {
		positionFrom = { ['x'] = -562.923828125, ['y'] = 281.76754760742, ['z'] = 85.675788879395, ['perm'] = "tequila.permissao" },
		positionTo = { ['x'] = -565.45971679688, ['y'] = 284.69192504883, ['z'] = 85.377639770508, ['perm'] = "tequila.permissao" },
	},
}

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for k,v in pairs(Teleport) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.positionFrom.x,v.positionFrom.y,v.positionFrom.z)
			local distance = GetDistanceBetweenCoords(v.positionFrom.x,v.positionFrom.y,cdz,x,y,z,true)
			local bowz,cdz2 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance2 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz2,x,y,z,true)

			if distance <= 3 then
				idle = 5
				DrawMarker(21,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionTo.perm) then
						TeleportPlayer(PlayerPedId(),v.positionTo.x,v.positionTo.y,v.positionTo.z-0.50)
					end
				end
				Citizen.Wait(idle)
			end

			if distance2 <= 3 then
				idle = 5 
				DrawMarker(21,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionFrom.perm) then
						TeleportPlayer(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM BALLAS ]
-----------------------------------------------------------------------------------------------------------------------------------------
	{ ['id'] = 1, ['x'] = 98.81, ['y'] = 6343.61, ['z'] = 31.44, ['text'] = "DICHAVAR MACONHA", ['perm'] = "bdm.permissao" },
	{ ['id'] = 1, ['x'] = 101.42, ['y'] = 6344.5, ['z'] = 31.42, ['text'] = "DICHAVAR MACONHA", ['perm'] = "bdm.permissao" },
	{ ['id'] = 1, ['x'] = 95.87, ['y'] = 6349.9, ['z'] = 31.38, ['text'] = "DICHAVAR MACONHA", ['perm'] = "bdm.permissao" },
	{ ['id'] = 1, ['x'] = 97.42, ['y'] = 6350.39, ['z'] = 31.38, ['text'] = "DICHAVAR MACONHA", ['perm'] = "bdm.permissao" },
	{ ['id'] = 2, ['x'] = 114.25, ['y'] = 6360.35, ['z'] = 32.31, ['text'] = "BOLAR BASEADO", ['perm'] = "bdm.permissao" },
	{ ['id'] = 2, ['x'] = 118.26, ['y'] = 6362.6, ['z'] = 32.3, ['text'] = "BOLAR BASEADO", ['perm'] = "bdm.permissao" },
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM GROVE ]
-----------------------------------------------------------------------------------------------------------------------------------------
	{ ['id'] = 3, ['x'] = -1107.15, ['y'] = 4941.68, ['z'] = 218.65, ['text'] = "PRODUZIR PASTA", ['perm'] = "cp.permissao" },
	{ ['id'] = 3, ['x'] = -1107.75, ['y'] = 4939.43, ['z'] = 218.65, ['text'] = "PRODUZIR PASTA", ['perm'] = "cp.permissao" },
	{ ['id'] = 4, ['x'] = -1106.45, ['y'] = 4951.2, ['z'] = 218.65, ['text'] = "PRODUZIR COCA", ['perm'] = "cp.permissao" },
	{ ['id'] = 4, ['x'] = -1107.33, ['y'] = 4948.79, ['z'] = 218.65, ['text'] = "PRODUZIR COCA", ['perm'] = "cp.permissao" },
	{ ['id'] = 4, ['x'] = -1108.19, ['y'] = 4946.39, ['z'] = 218.65, ['text'] = "PRODUZIR COCA", ['perm'] = "cp.permissao" },
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM VAGOS ]
-----------------------------------------------------------------------------------------------------------------------------------------
	{ ['id'] = 5, ['x'] = 1498.64, ['y'] = 6394.54, ['z'] = 20.79, ['text'] = "PRODUZIR COMPOSITO", ['perm'] = "caveira.permissao" },
	{ ['id'] = 5, ['x'] = 1500.73, ['y'] = 6394.17, ['z'] = 20.79, ['text'] = "PRODUZIR COMPOSITO", ['perm'] = "caveira.permissao" },
	{ ['id'] = 5, ['x'] = 1502.93, ['y'] = 6393.64, ['z'] = 20.79, ['text'] = "PRODUZIR COMPOSITO", ['perm'] = "caveira.permissao" },
	{ ['id'] = 6, ['x'] = 1493.18, ['y'] = 6390.3, ['z'] = 21.26, ['text'] = "PRODUZIR META", ['perm'] = "caveira.permissao" },
	{ ['id'] = 6, ['x'] = 1490.7, ['y'] = 6391.35, ['z'] = 20.79, ['text'] = "PRODUZIR META", ['perm'] = "caveira.permissao" },
	{ ['id'] = 7, ['x'] = -33.754997253418, ['y'] = -2539.6413574219, ['z'] = 6.0099983215332, ['text'] = "encher botijao", ['perm'] = "gas.permissao" },
}

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.2 and not processo then
				idle = 5
				draw3DText(v.x, v.y, v.z, "PRESSIONE  ~r~E~w~  PARA "..v.text,4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
					if func.checkPayment(v.id) then
						TriggerEvent('cancelando',true)
						processo = true
						segundos = 5
					end
				end
			end
		end
		if processo then
			daleminhapikatxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR O PROCESSO",4,0.5,0.90,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function daleminhapikatxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function draw3DText(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

