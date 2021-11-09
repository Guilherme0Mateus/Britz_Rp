local Locales = module('rise_hud', 'locales/languages')

local ind = {l = false, r = false}
local CintoSeguranca = false
local sBuffer = {}
local vBuffer = {}

local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')

function _U(entry)
	return Locales[ 'br' ][entry] 
end

RegisterNetEvent('hud:hideHud')
AddEventHandler('hud:hideHud',function(status)
	SendNUIMessage({ action = 'hideHud', value = status })
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local vida = (100*GetEntityHealth(ped)/GetEntityMaxHealth(ped))
		SendNUIMessage({ action = 'ui', colete = GetPedArmour(ped), vida = vida })
		SendNUIMessage({ action = 'setText', id = 'day', value = gameData() })
    end
end)

local isPauseMenu = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if IsPauseMenuActive() then
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = true })
			end
		end
	end
end)

function gameData()
	local timeString = nil
	local rola = "withHours"
	local day = _U('day_' .. GetClockDayOfMonth())
	local weekDay = _U('weekDay_' .. GetClockDayOfWeek())
	local month = _U('month_' .. GetClockMonth())
	local day = _U('day_' .. GetClockDayOfMonth())
	local year = GetClockYear()
	local hour = GetClockHours()
	local minutes = GetClockMinutes()
	local time = nil
	local AmPm = ''

	if hour <= 9 then
		hour = '0' .. hour
	end

	if minutes <= 9 then
		minutes = '0' .. minutes
	end

	time = hour .. ':' .. minutes .. ' ' .. AmPm

	local date_format = Locales['br']['date_format'][rola]

	if rola == 'default' then
		timeString = string.format(date_format, day, month, year)
	elseif rola == 'simple' then
		timeString = string.format(date_format, day, month)
	elseif rola == 'simpleWithHours' then
		timeString = string.format(date_format, time, day, month)	
	elseif rola == 'withWeekday' then
		timeString = string.format(date_format, weekDay, day, month, year)
	elseif rola == 'withHours' then
		timeString = string.format(date_format, day, month, time)
	elseif rola == 'withWeekdayAndHours' then
		timeString = string.format(date_format, time, weekDay, day, month, year)
	end

	return timeString
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if IsPedInAnyVehicle(PlayerPedId()) then
			local getPedCar = GetVehiclePedIsIn(PlayerPedId(),false)
			if GetPedInVehicleSeat(getPedCar,-1) == PlayerPedId() then
		        while true do
		        	local velocidade = GetEntitySpeed(getPedCar)
		        	local fuel = GetVehicleFuelLevel(getPedCar)
					local carSpeed = math.ceil(velocidade*2.636936)
					DisplayRadar(true)
					SendNUIMessage({ action = 'element', task = 'enable', value = 'xupeta' })
					SendNUIMessage({ action = 'carUI', value = true, speed = carSpeed })
					SendNUIMessage({ action = 'carUI', showfuel = true, fuel = fuel })
					if not IsPedInAnyVehicle(PlayerPedId()) or not GetPedInVehicleSeat(getPedCar,-1) == PlayerPedId() then break end
					Citizen.Wait(200)
		        end
		    else
				DisplayRadar(false)
				SendNUIMessage({ action = 'element', task = 'disable', value = 'xupeta' })
			end
		else
			DisplayRadar(false)
			SendNUIMessage({ action = 'element', task = 'disable', value = 'xupeta' })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CINTO DE SEGURANÇA
-----------------------------------------------------------------------------------------------------------------------------------------
IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
	local hr = GetEntityHeading(entity) + 90.0
	if hr < 0.0 then
		hr = 360.0 + hr
	end
	hr = hr * 0.0174533
	return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

local segundos = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)
		local setDisplay = false
		if car ~= 0 and (ExNoCarro or IsCar(car)) then
			while true do
				ExNoCarro = true
				if CintoSeguranca then
					DisableControlAction(0,75)
					if setDisplay then
					    SendNUIMessage({ action = 'element', task = 'disable', value = 'cinto' })
					    setDisplay = false
					end
				else
					if not setDisplay then
					    SendNUIMessage({ action = 'element', task = 'enable', value = 'cinto' })
					    setDisplay = true
					end
				end

				sBuffer[2] = sBuffer[1]
				sBuffer[1] = GetEntitySpeed(car)

				if sBuffer[2] ~= nil and not CintoSeguranca and GetEntitySpeedVector(car,true).y > 1.0 and sBuffer[1] > 10.25 and (sBuffer[2] - sBuffer[1]) > (sBuffer[1] * 0.255) then
					local co = GetEntityCoords(ped)
					local fw = Fwv(ped)
					SetEntityHealth(ped,GetEntityHealth(ped)-150)
					SetEntityCoords(ped,co.x+fw.x,co.y+fw.y,co.z-0.47,true,true,true)
					SetEntityVelocity(ped,vBuffer[2].x,vBuffer[2].y,vBuffer[2].z)
					segundos = 20
				end

				vBuffer[2] = vBuffer[1]
				vBuffer[1] = GetEntityVelocity(car)

				if IsControlJustReleased(1,47) then
					TriggerEvent("cancelando",true)
					if CintoSeguranca then
						TriggerEvent("vrp_sound:source",'unbelt',0.5)
						SetTimeout(2000,function()
							CintoSeguranca = false
							TriggerEvent("cancelando",false)
						end)
					else
						TriggerEvent("vrp_sound:source",'belt',0.5)
						SetTimeout(3000,function()
							CintoSeguranca = true
							TriggerEvent("cancelando",false)
						end)
					end
				end

				if not IsPedInAnyVehicle(ped) or not IsCar(car) then SendNUIMessage({ action = 'element', task = 'disable', value = 'cinto' }) break end
				Citizen.Wait(5)
			end
		elseif ExNoCarro then
			ExNoCarro = false
			CintoSeguranca = false
			sBuffer[1],sBuffer[2] = 0.0,0.0
		end
	end
end)


-- Weapons
Citizen.CreateThread(function()
	if true then
		while true do
			Citizen.Wait(100)

			local player = GetPlayerPed(-1)
			local status = {}

			if IsPedArmed(player, 7) then

				local weapon = GetSelectedPedWeapon(player)
				local ammoTotal = GetAmmoInPedWeapon(player,weapon)
				local bool,ammoClip = GetAmmoInClip(player,weapon)
				local ammoRemaining = math.floor(ammoTotal - ammoClip)
				
				status['armed'] = true

				for key,value in pairs(AllWeapons) do

					for keyTwo,valueTwo in pairs(AllWeapons[key]) do
						if weapon == GetHashKey('weapon_'..keyTwo) then
							status['weapon'] = keyTwo


							if key == 'melee' then
								SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
							else
								if keyTwo == 'stungun' then
									SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
								else
									SendNUIMessage({ action = 'element', task = 'enable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'enable', value = 'bullets' })
								end
							end

						end
					end

				end

				SendNUIMessage({ action = 'setText', id = 'weapon_clip', value = "<img src=\"assets/bullet.svg\"> "..ammoClip.." | "..ammoRemaining })

			else
				status['armed'] = false	
			end

			SendNUIMessage({ action = 'updateWeapon', status = status })

		end
	end
end)

