local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_trafico",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

local src = {
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM BALLAS ]
-----------------------------------------------------------------------------------------------------------------------------------------
    [1] = { ['re'] = "canabis-alta", ['reqtd'] = 5, ['item'] = "maconha-dichavada", ['itemqtd'] = 5 },
	[2] = { ['re'] = "maconha-dichavada", ['reqtd'] = 5, ['item'] = "maconha-alta", ['itemqtd'] = 10 },
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM GROVE ]
-----------------------------------------------------------------------------------------------------------------------------------------
	[3] = { ['re'] = "folhas-coca", ['reqtd'] = 5, ['item'] = "pasta-alta", ['itemqtd'] = 5 },
	[4] = { ['re'] = "pasta-alta", ['reqtd'] = 5, ['item'] = "coca-alta", ['itemqtd'] = 5 },
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM VAGOS ]
-----------------------------------------------------------------------------------------------------------------------------------------
    [5] = { ['re'] = "nitrato-amonia", ['reqtd'] = 5, ['item'] = "composito-alta", ['itemqtd'] = 5 },
	[6] = { ['re'] = "composito-alta", ['reqtd'] = 5, ['item'] = "meta-alta", ['itemqtd'] = 5 },
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FARM HAXIXI ]
-----------------------------------------------------------------------------------------------------------------------------------------
    [7] = { ['re'] = "folha-haxixi", ['reqtd'] = 5, ['item'] = "haxixi-alta", ['itemqtd'] = 5 },

}

function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
					return true
				end
			end
		else
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
				return true
			end
		end
	end
end