local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

txg = {}
Tunnel.bindInterface("emp_mecanico",txg)

RegisterServerEvent('nk_repair:RimuoviItem')
AddEventHandler('nk_repair:RimuoviItem', function(ped, coords, veh)
	local _source = source
	local user_id = vRP.getUserId(_source)
	if vRP.tryGetInventoryItem(user_id,'repairkit',1) then
		TriggerClientEvent('nk_repair:MettiCrick', _source, ped, coords, veh)
		TriggerClientEvent("cancelado", source,true)
		TriggerClientEvent("Notify",source,"sucesso","Kit de Reparo usado com Sucesso")
	else
		TriggerClientEvent("Notify",source,"negado","Falta 1 Kit de Reparo")
	end
end)

function txg.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"mecanico.permissao")
end