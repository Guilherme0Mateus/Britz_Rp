local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_minerador")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO/ LOCS 
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),4620.01,-5301.95,0.44)
			if distancia <= 1.8 then 
				DrawMarker(1,4620.01,-5301.95,0.44-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 2
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2938.39,2770.59,39.09)
			if distancia <= 1.8 then 
				DrawMarker(1,2938.39,2770.59,39.09-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 3
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2955.57,2771.08,39.05)
			if distancia <= 1.8 then 
				DrawMarker(1,2955.57,2771.08,39.05-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 4
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2937.75,2773.34,39.24)
			if distancia <= 1.8 then 
				DrawMarker(1,2937.75,2773.34,39.24-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 5
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2926.67,2794.25,40.69)
			if distancia <= 1.8 then 
				DrawMarker(1,2926.67,2794.25,40.69-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 6
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2929.67,2789.19,39.98)
			if distancia <= 1.8 then 
				DrawMarker(1,2929.67,2789.19,39.98-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 7
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2970.82,2775.00,38.23)
			if distancia <= 1.8 then 
				DrawMarker(1,2970.82,2775.00,38.23-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),2958.28,2765.35,41.03)
			if distancia <= 1.8 then 
				DrawMarker(1,2958.28,2765.35,41.03-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),5179.11,-4846.67,1.61)
			if distancia <= 1.8 then 
				DrawMarker(1,5179.11,-4846.67,1.61-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),5177.96,-4844.43,1.81)
			if distancia <= 1.8 then 
				DrawMarker(1,5177.96,-4844.43,1.81-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),5188.52,-4840.22,1.52)
			if distancia <= 1.8 then 
				DrawMarker(1,-4842.01,0.74-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),5187.2,-4832.34,1.57)
			if distancia <= 1.8 then 
				DrawMarker(1,-4840.44,0.65-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOC 8
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not processo then
			idle = 5
			local ped = PlayerPedId()
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),5190.27,-4837.98,3.17)
			if distancia <= 1.8 then 
				DrawMarker(1,5190.27,-4837.98,3.17-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 1.8 then
					drarola("PRESSIONE  ~b~E~w~  PARA COMEÇAR A MINERAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							processo = true
							segundos = 10 
							if not IsEntityPlayingAnim(ped,"amb@world_human_const_drill@male@drill@base","base") then
								vRP._CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			drarola("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ QUEBRAR A PEDRA",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_const_drill@male@drill@base","base") then
					vRP._stopAnim(false)
					vRP._DeletarObjeto()
				end
				TriggerEvent('cancelando',false)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drarola(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end