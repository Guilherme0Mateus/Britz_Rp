--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
inMenu                      = true
local showblips = true
local atbank = false
local bankMenu = true
local banks = {
	{name="Banco", id=108, x=-1212.63, y=-330.80, z=37.78},
	{name="Banco", id=108, x=-351.02, y=-49.97, z=49.04},
	{name="Banco", id=108, x=314.13, y=-279.09, z=54.17},
	{name="Banco", id=108, x=149.85, y=-1040.71, z=29.37},
	{name="Banco", id=108, x=-2962.56, y=482.95, z=15.70},
	{name="Banco", id=108, x=-111.97, y=6469.19, z=31.62},
    {name="Banco", id=108, x=1175.05, y=2706.90, z=38.09},
}

local atms = {

  	{name="Caixa Eletrônico", id=277, x=00.00, y=00.00, z=00.00},

}

--===============================================
--==             Core Threading                ==
--===============================================
if bankMenu then
	Citizen.CreateThread(function()
		while true do
			local trava = 1000
			if nearBank() or nearATM() then
				trava = 1
				drawTxt("PRESSIONE  ~p~E~w~  PARA ACESSAR A SUA CONTA",4,0.5,0.92,0.35,255,255,255,180)
				if IsControlJustPressed(1, 38) then
					inMenu = true
					SetNuiFocus(true, true)
					SendNUIMessage({type = 'openGeneral'})
					TriggerServerEvent('bank:balance')
					local ped = GetPlayerPed(-1)
				end
				if IsControlJustPressed(1, 322) then
					inMenu = false
					SetNuiFocus(false, false)
					SendNUIMessage({type = 'close'})
				end
			end
			Citizen.Wait(trava)
		end
	end)
end
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)

	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transferir', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 1 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(atms) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 1 then
			return true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
