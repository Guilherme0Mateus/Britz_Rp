local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("rout_cocaine",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(5,10)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"cp.permissao")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("folhas-coca")*quantidade[source] <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"folhas-coca",quantidade[source])
		quantidade[source] = nil
		return true
		end
	end
end
