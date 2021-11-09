local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
job = {}
Tunnel.bindInterface("emp_sedex",job)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('emp_sedex:permissao')
AddEventHandler('emp_sedex:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	TriggerClientEvent('emp_sedex:permissao',player)
end)

RegisterServerEvent('emp_sedex:receber')
AddEventHandler('emp_sedex:receber', function(pagamento)
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.giveMoney(user_id,parseInt(pagamento))
		TriggerClientEvent("vrp_sound:source",source,'dinheiro',0.1)
	end
end)

RegisterServerEvent('emp_sedex:roupa')
AddEventHandler('emp_sedex:roupa', function()
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.removeCloak(source)
	end
end)

function job.SaveIdleCustom(old_custom)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.save_idle_custom(source,old_custom)
end