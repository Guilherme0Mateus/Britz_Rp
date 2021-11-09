local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPex = {}
Tunnel.bindInterface("bld_arsenal",vRPex)

function vRPex.checkPermission()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"paisana.permissao") then
		TriggerClientEvent("Notify",source,"negado","Você está fora de serviço, bata seu ponto e tente novamente.")
	elseif vRP.hasPermission(user_id,"policia.permissao") then
		return true
	else
		TriggerClientEvent("Notify",source,"negado","Você está fora de serviço, bata seu ponto e tente novamente.",15000)
		return false
	end
end

RegisterServerEvent('bld_arsenal:colete')
AddEventHandler('bld_arsenal:colete', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local colete = 100
		vRPclient.setArmour(src,100)
		vRP.setUData(user_id,"vRP:colete", json.encode(colete))
	end
end)

RegisterServerEvent('bld_arsenal:colete2')
AddEventHandler('bld_arsenal:colete2', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local colete = -100
		vRPclient.setArmour(src,-100)
		vRP.setUData(user_id,"vRP:colete", json.encode(colete))
	end
end)
