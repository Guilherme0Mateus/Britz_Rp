vRPc = {}
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
Tunnel.bindInterface("_fuel", vRPc)
Proxy.addInterface("_fuel", vRPc)

Lserver = Tunnel.getInterface("_fuel", "_fuel")

local cfg = module("_fuel","lk_config")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local isPrice = 0
local isGallons = 0
local isFuel = false
local isEngine = {}
local vehicle = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCLASS
-----------------------------------------------------------------------------------------------------------------------------------------
local vehClass = {
	[0] = 0.7,
	[1] = 0.7,
	[2] = 0.7,
	[3] = 0.7,
	[4] = 0.7,
	[5] = 0.7,
	[6] = 0.7,
	[7] = 0.7,
	[8] = 0.7,
	[9] = 0.7,
	[10] = 0.7,
	[11] = 0.7,
	[12] = 0.7,
	[13] = 0.0,
	[14] = 0.0,
	[15] = 0.0,
	[16] = 0.0,
	[17] = 0.4,
	[18] = 0.4,
	[19] = 0.7,
	[20] = 0.7,
	[21] = 0.0
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
local vehFuel = {
	[1.0] = 1.1,
	[0.9] = 1.0,
	[0.8] = 0.9,
	[0.7] = 0.8,
	[0.6] = 0.7,
	[0.5] = 0.6,
	[0.4] = 0.5,
	[0.3] = 0.4,
	[0.2] = 0.3,
	[0.1] = 0.2,
	[0.0] = 0.0
}

local fuelLocs = {
	{ 1,265.05,-1262.65,29.3 },
	{ 2,819.14,-1028.65,26.41 },
	{ 3,1208.61,-1402.43,35.23 },
	{ 4,1181.48,-330.26,69.32 },
	{ 5,621.01,268.68,103.09 },
	{ 6,2581.09,361.79,108.47 },
	{ 7,175.08,-1562.12,29.27 },
	{ 8,-319.76,-1471.63,30.55 },
	{ 9,1782.33,3328.46,41.26 },
	{ 10,49.42,2778.8,58.05 },
	{ 11,264.09,2606.56,44.99 },
	{ 12,1039.38,2671.28,39.56 },
	{ 13,1207.4,2659.93,37.9 },
	{ 14,2539.19,2594.47,37.95 },
	{ 15,2679.95,3264.18,55.25 },
	{ 16,2005.03,3774.43,32.41 },
	{ 17,1687.07,4929.53,42.08 },
	{ 18,1701.53,6415.99,32.77 },
	{ 19,180.1,6602.88,31.87 },
	{ 20,-94.46,6419.59,31.48 },
	{ 21,-2555.17,2334.23,33.08 },
	{ 22,-1800.09,803.54,138.72 },
	{ 23,-1437.0,-276.8,46.21 },
	{ 24,-2096.3,-320.17,13.17 },
	{ 25,-724.56,-935.97,19.22 },
	{ 26,-525.26,-1211.19,18.19 },
	{ 27,-70.96,-1762.21,29.54 }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("completar",function(data,cb)
  if data > 0 then 
    completarFuel(data)
  end
end)

RegisterNUICallback("abastecer",function(data,cb)
  print(data.valor)
  if data.valor > 0 then 
    abastecer(data.litros,data.valor)
  end
end)

RegisterNUICallback("close",function(data,cb)
  SendNUIMessage({ hidemenu = true })
  SetNuiFocus(false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
openNui = function()
  SetNuiFocus(true,true)
  SendNUIMessage({ showmenu = true,litro = cfg.litro,fuel = GetVehicleFuelLevel(GetPlayersLastVehicle()) })
end
completarFuel = function(valor)
  local ped = PlayerPedId()
  local vehicle = GetPlayersLastVehicle()
  if Lserver.tryFullPayment(valor) then 
    TriggerEvent("Notify", "sucesso","Você foi cobrado em R$"..valor.." para encher o tanque!")

    if GetVehicleFuelLevel(vehicle) < 100.0 then
      TaskTurnPedToFaceEntity(ped,vehicle,5000)
      loadAnim("timetable@gardener@filling_can")
      TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
      isFuel = true
    end
    local final = 100 
    while true do 
      if isFuel then 
        if (GetVehicleFuelLevel(vehicle) < final) then
        Citizen.Wait(1000)
        SetVehicleFuelLevel(vehicle,GetVehicleFuelLevel(vehicle)  + 1)
        SendNUIMessage({ update = true, fuel = GetVehicleFuelLevel(vehicle) })

        else 
          Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
          StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
          RemoveAnimDict("timetable@gardener@filling_can")
          isFuel = false
          isGallons = 0
          SendNUIMessage({ hidemenu = true })
          SetNuiFocus(false)
        
          isPrice = 0
          break
        end
      else 
        Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
        StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
        RemoveAnimDict("timetable@gardener@filling_can")
        isFuel = false
        isGallons = 0
        SendNUIMessage({ hidemenu = true })
        SetNuiFocus(false)
      
        isPrice = 0
        break 
      end
    end
  end
end
abastecer = function(litros,valor)
  local ped = PlayerPedId()
  local vehicle = GetPlayersLastVehicle()
  if Lserver.tryFullPayment(valor) then 
    print(valor)
    TriggerEvent("Notify", "sucesso","Você foi cobrado em R$"..valor.." para abastecer seu veículo com "..litros.."L de Gasolina!")
    if GetVehicleFuelLevel(vehicle) < 100.0 then
      print('passou')
      TaskTurnPedToFaceEntity(ped,vehicle,5000)
      loadAnim("timetable@gardener@filling_can")
      TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
      isFuel = true
    end
    local final = GetVehicleFuelLevel(vehicle) + litros 
    while true do 
      if isFuel then 
        if (GetVehicleFuelLevel(vehicle) < final and GetVehicleFuelLevel(vehicle) < 100) then
        Citizen.Wait(1000)
        SetVehicleFuelLevel(vehicle,GetVehicleFuelLevel(vehicle)  + 1)
SendNUIMessage({ update = true, fuel = GetVehicleFuelLevel(vehicle) })

        else 
          Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
          StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
          RemoveAnimDict("timetable@gardener@filling_can")
          isFuel = false
          isGallons = 0
          SendNUIMessage({ hidemenu = true })
          SetNuiFocus(false)
        
          isPrice = 0
          break
        end
      else 
        Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
        StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
        RemoveAnimDict("timetable@gardener@filling_can")
        isFuel = false
        SendNUIMessage({ hidemenu = true })
        SetNuiFocus(false)
      
        isGallons = 0
        isPrice = 0
        break 
      end
    end
  end

end


floor = function(num)
	return math.floor(num*10+0.5)/10
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD'S
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  SetNuiFocus(false)

  while true do
    if isFuel then
      local ui = GetMinimapAnchor() 
      drawTxt2(ui.right_x+0.0015,ui.bottom_y-0.040,1.0,1.0,0.45,"~g~Abastecendo~w~ veículo!",255,255,255,255)
      DisableControlAction(0,22)
      DisableControlAction(0,23)
      DisableControlAction(0,24)
      DisableControlAction(0,29)
      DisableControlAction(0,30)
      DisableControlAction(0,31)
      DisableControlAction(0,37)
      DisableControlAction(0,44)
      DisableControlAction(0,56)
      DisableControlAction(0,82)
      DisableControlAction(0,140)
      DisableControlAction(0,166)
      DisableControlAction(0,167)
      DisableControlAction(0,168)
      DisableControlAction(0,170)
      DisableControlAction(0,288)
      DisableControlAction(0,289)
      DisableControlAction(0,311)
      DisableControlAction(0,323)
    end
    Citizen.Wait(1)
  end 
end)

Citizen.CreateThread(function()
	while true do
    local ped = PlayerPedId()
    local likizao = 100
    if not IsPedInAnyVehicle(ped) then
      likizao = 10
      if GetSelectedPedWeapon(ped) == 883325847 then
        likzao = 1
				local vehicle = GetPlayersLastVehicle()
        if DoesEntityExist(vehicle) then
          
          if isFuel and GetVehicleFuelLevel(vehicle) >= 100.0 then isFuel = false return end
					local vehFuel = GetVehicleFuelLevel(vehicle)
					local x,y,z = table.unpack(GetEntityCoords(ped))
					local vX,vY,vZ = table.unpack(GetEntityCoords(vehicle))
					local distance = Vdist(x,y,z,vX,vY,vZ)
					if distance <= 3.0 then
						if not isFuel and GetVehicleFuelLevel(vehicle) < 100.0 then
							if GetVehicleFuelLevel(vehicle) >= 100.0 then
								text3D(vX,vY,vZ+1,"~p~TANQUE CHEIO")
							elseif GetAmmoInPedWeapon(ped,883325847) - 0.02 * 100 <= 0 then
								text3D(vX,vY,vZ+1,"~b~GALÃO VAZIO")
							else
								text3D(vX,vY,vZ+1,"PRESS ~g~E ~w~ ABASTECER")
							end
						else
							if GetVehicleFuelLevel(vehicle) >= 0.0 and GetAmmoInPedWeapon(ped,883325847) - 0.02 * 100 > 0 then
								SetPedAmmo(ped,883325847,math.floor(GetAmmoInPedWeapon(ped,883325847) - 0.02 * 100))

								SetVehicleFuelLevel(vehicle,vehFuel+0.03)
								text3D(vX,vY,vZ+1,"PRESS ~g~E ~w~PARA CANCELAR")
								text3D(vX,vY,vZ+0.85,"TANQUE: ~y~"..parseInt(floor(vehFuel)).."%   ~w~GALÃO: ~y~"..parseInt(GetAmmoInPedWeapon(ped,883325847) / 4500 * 100).."%")

								if not IsEntityPlayingAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",3) then
									TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
								end

								if GetVehicleFuelLevel(vehicle) >= 100.0 or GetAmmoInPedWeapon(ped,883325847) - 0.02 * 100 <= 0 then
									Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
									StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
									RemoveAnimDict("timetable@gardener@filling_can")
                  isFuel = false
                  ClearPedTasks(ped)
								end
							end
						end

						if IsControlJustPressed(1,38) then
							if isFuel then
								Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
								StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
								RemoveAnimDict("timetable@gardener@filling_can")
								isFuel = false
							else
								if GetAmmoInPedWeapon(ped,883325847) - 0.02 * 100 > 0 and GetVehicleFuelLevel(vehicle) < 100.0 then
									TaskTurnPedToFaceEntity(ped,vehicle,5000)
									loadAnim("timetable@gardener@filling_can")
									TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",3.0,3.0,-1,50,0,0,0,0)
									isFuel = true
								end
							end
						end
					end

					if isFuel and distance > 3.0 then
						Lserver.tryFuel(VehToNet(vehicle),GetVehicleFuelLevel(vehicle))
						StopAnimTask(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",1.0)
						RemoveAnimDict("timetable@gardener@filling_can")
						isFuel = false
					end
				end
			end
    end
      Citizen.Wait(likizao)
  end 
end)



Citizen.CreateThread(function()
	while true do
    local ped = PlayerPedId()
    local likizao = 100
		if not IsPedInAnyVehicle(ped) then
      if not (GetSelectedPedWeapon(ped) == 883325847) then
        local pedCds = (GetEntityCoords(ped))
          for k,v in pairs(fuelLocs) do
            local fuelDistance = #(pedCds - vec3(v[2],v[3],v[4]))
            if fuelDistance <= 7.0 then
              local vehicle = GetPlayersLastVehicle()
              if DoesEntityExist(vehicle) then
                local vehFuel = GetVehicleFuelLevel(vehicle)
                local vehCds = (GetEntityCoords(vehicle))
                local vX,vY,vZ = table.unpack(vehCds)
                local distance = #(pedCds - vehCds)
                if distance <= 3.0 then
                  likizao = 1 
                  if GetVehicleFuelLevel(vehicle) >= 100.0 then -- normalmente os giveweaponped estão fazendo qualquer item puxando com isso sumir
                    text3D(vX,vY,vZ+1,"~p~TANQUE CHEIO")
                    text3D(vX,vY,vZ+1.25,"PRESS ~g~G ~w~COMPRAR GALAO")
									else
                      text3D(vX,vY,vZ+1,"PRESS ~g~E ~w~ABASTECER")
                      text3D(vX,vY,vZ+1.25,"PRESS ~g~G ~w~COMPRAR GALAO")

                  end                
                  if IsControlJustPressed(1,38) and (GetVehicleFuelLevel(vehicle) < 100.0) then
                    openNui()
                  end
                  if IsControlJustPressed(0,47) then
                    if Lserver.tryFullPayment(cfg.galao) then 
                      -- GiveWeaponToPed(ped,883325847,1,false,false)
                      vRP.giveWeapons({["WEAPON_PETROLCAN"] = { ammo = 4500 }})
                    end
                  end
                end 
              else 
                if fuelDistance <= 5.0 then 
                  likizao = 1
                  local ui = GetMinimapAnchor() 
                  drawTxt2(ui.right_x+0.0015,ui.bottom_y-0.040,1.0,1.0,0.45,"Pressione ~g~G~w~ para comprar um Galão!",255,255,255,255)
                  if IsControlJustPressed(0,47) then
                    if Lserver.tryFullPayment(cfg.galao) then 
                      -- GiveWeaponToPed(ped,883325847,1,false,false)
                      vRP.giveWeapons({["WEAPON_PETROLCAN"] = { ammo = 4500 }})
                    end
                  end
                end
              end
            end 
          end
      end
    end 
    Citizen.Wait(likizao)
  end 
end)


Citizen.CreateThread(function()
	while true do
    local ped = PlayerPedId()
    local likizao = 100
		if not IsPedInAnyVehicle(ped) then
      if not (GetSelectedPedWeapon(ped) == 883325847) then
        local pedCds = (GetEntityCoords(ped))
          for k,v in pairs(fuelLocs) do
            local fuelDistance = #(pedCds - vec3(v[2],v[3],v[4]))
            if fuelDistance <= 5.0 then
              local vehicle = GetPlayersLastVehicle()
              if not DoesEntityExist(vehicle) then
                local vX,vY,vZ = v[2],v[3],v[4]
                if distance and distance <= 3.0 then
                  likizao = 1 
                     text3D(vX,vY,vZ+1.25,"PRESS ~g~G ~w~COMPRAR GALAO")
                  if IsControlJustPressed(0,47) then
                    if Lserver.tryFullPayment(cfg.galao) then 
                      -- GiveWeaponToPed(ped,883325847,1,false,false)
                      vRP.giveWeapons({["WEAPON_PETROLCAN"] = { ammo = 4500 }})
                    end
                  end
                end 
              end 
            end 
          end
      end
    end 
    Citizen.Wait(likizao)
  end 
end)

function drawTxt2(x,y,width,height,scale,text,r,g,b,a)
  SetTextFont(4)
  SetTextScale(scale,scale)
  SetTextColour(r,g,b,a)
  SetTextDropShadow(0, 0, 0, 0, 200)
  SetTextDropShadow()
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


Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsUsing(ped)
			if IsVehicleEngineOn(vehicle) and GetPedInVehicleSeat(vehicle,-1) == ped then
				Lserver.tryFuel(VehToNet(vehicle),math.ceil(GetVehicleFuelLevel(vehicle) - vehFuel[floor(GetVehicleCurrentRpm(vehicle))] * vehClass[GetVehicleClass(vehicle)] / 10))
      end
		end
		Citizen.Wait(1000)
	end
end)

----------------------------------------------------------
--                FIX ABAIXO
----------------------------------------------------------

 Citizen.CreateThread(function()
 while true do 
  local ped = PlayerPedId()
   if not IsPedInAnyVehicle(ped) then
     if IsPedGettingIntoAVehicle(ped) then 
       Citizen.Wait(2000)
       local veh = GetVehiclePedIsIn(ped, false)
       if veh then 
         Lserver.tryFuel(VehToNet(veh),Lserver.returnfuel(VehToNet(veh)))
       end
     end
   end
   Citizen.Wait(500)
 end
 end) 

function vRPc.syncFuel(index,fuel)
    if NetworkDoesNetworkIdExist(index) then
      local v = NetToVeh(index)
			SetVehicleFuelLevel(v,fuel+0.0)
    else
      if cfg.secondfix then 
      trySync(index,fuel+0.0)
      end
    end
end

trySync = function(vehId,fuel)
  while true do 
    Citizen.Wait(10000)
    if NetworkDoesNetworkIdExist(VehToNet(vehId)) then 
      SetVehicleFuelLevel(NetToVeh(vehId),fuel)
      break
    end 
  end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function text3D(x,y,z,text)
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOADANIM
-----------------------------------------------------------------------------------------------------------------------------------------
function loadAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end