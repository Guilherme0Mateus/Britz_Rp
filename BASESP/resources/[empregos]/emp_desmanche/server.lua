local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_desmanche",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

RegisterServerEvent("desmancharveiculo")
AddEventHandler("desmancharveiculo",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(vRP.vehiclePrice(vname)*0.09))
				vCLIENT.deleteVehicle(source,vehicle)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookdesmanche,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..vname.." [ID]: "..puser_id.." \n[VALOR]: $"..vRP.format(parseInt(vRP.vehiclePrice(vname)*0.1)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)

function emP.checkVehicle()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,work = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
				if #vehicle <= 0 then
					TriggerClientEvent("Notify",source,"negado","Veículo não encontrado na lista do proprietário.",8000)
					return
				end
				if parseInt(vehicle[1].detido) == 1 then
					TriggerClientEvent("Notify",source,"negado","Veículo encontra-se apreendido na seguradora.",8000)
					return
				end
				if banned then
					TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem ser desmanchados.",8000)
					return
				end
			end

	        vRP.giveMoney(user_id,parseInt(randmoney))

			return true
		end
	end
end