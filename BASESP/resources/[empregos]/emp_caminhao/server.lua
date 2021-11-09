local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_caminhao",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local gas = 1
local cars = 1
local show = 1
local woods = 1
local ilha = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local paylist = {
	["ilha"] = {
		[1] = { pay = math.random(4550,4850) },
		[2] = { pay = math.random(4550,4850) },
		[3] = { pay = math.random(4550,4850) },
		[4] = { pay = math.random(4550,4850) },
		[5] = { pay = math.random(4550,4850) },
		[6] = { pay = math.random(4550,4850) }
	},
	["gas"] = {
		[1] = { pay = math.random(450,750) },
		[2] = { pay = math.random(450,750) },
		[3] = { pay = math.random(450,750) },
		[4] = { pay = math.random(450,750) },
		[5] = { pay = math.random(450,750) },
		[6] = { pay = math.random(450,750) },
		[7] = { pay = math.random(450,750) },
		[8] = { pay = math.random(450,750) },
		[9] = { pay = math.random(450,750) },
		[10] = { pay = math.random(550,850) },
		[11] = { pay = math.random(550,850) },
		[12] = { pay = math.random(450,1150) }
	},
	["cars"] = {
		[1] = { pay = math.random(450,750) },
		[2] = { pay = math.random(450,750) },
		[3] = { pay = math.random(450,750) },
		[4] = { pay = math.random(450,750) },
		[5] = { pay = math.random(550,850) }
	},
	["woods"] = {
		[1] = { pay = math.random(450,650) },
		[2] = { pay = math.random(450,650) },
		[3] = { pay = math.random(450,650) },
		[4] = { pay = math.random(450,650) }
	},
	["show"] = {
		[1] = { pay = math.random(550,850) },
		[2] = { pay = math.random(550,850) },
		[3] = { pay = math.random(550,850) },
		[4] = { pay = math.random(550,850) }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment(id,mod,health)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveMoney(user_id,parseInt(paylist[mod][id].pay+health))
		if mod == "cars" then
			local value = vRP.getSData("meta:concessionaria")
			local metas = json.decode(value) or 0
			if metas then
				vRP.setSData("meta:concessionaria",json.encode(parseInt(metas+1)))
			end
		end
		if vRP.tryGetInventoryItem(user_id,"rebite",1) then
			vRP.giveInventoryItem(user_id,"dinheirosujo",math.random(30,60))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300000)
		ilha = math.random(#paylist["ilha"])
		gas = math.random(#paylist["gas"])
		cars = math.random(#paylist["cars"])
		woods = math.random(#paylist["woods"])
		show = math.random(#paylist["show"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETTRUCKPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.getTruckpoint(point)
	if point == "ilha" then
		return parseInt(ilha)
	elseif point == "gas" then
		return parseInt(gas)
	elseif point == "cars" then
		return parseInt(cars)
	elseif point == "woods" then
		return parseInt(woods)
	elseif point == "show" then
		return parseInt(show)
	end
end