local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","CVR_OnService")

ykP = {}
Tunnel.bindInterface("vrp_emservico",ykP)

local multa = 250

local webhookadmin = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


RegisterCommand('190', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade = vRP.getUsersByPermission("policia.permissao")

	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.9) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="http://officialyu.me/icones/police-hat.svg"> COPOM:<br>{0} </div>',
            args = { "Existem "..#quantidade.." PM's em Serviço no momento." }
        })
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('med', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("paramedico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 12, 87,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="http://officialyu.me/icones/cardiogram.svg"> HOSPITAL:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." SAMU's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('advogado', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("advogado.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(211, 211, 211,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/2942/2942815.svg"> ESCRITÓRIO:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." ADVOGADOS's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

--[[  RegisterCommand('taxista', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("taxista.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 162, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/2898/2898588.svg"> TAXISTAS:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." TAXISTA's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)]]

RegisterCommand('mec', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("mecanico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(125, 125, 125,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/1995/1995470.svg"> MECÂNICA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." MECÂNICOS's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

--[[  RegisterCommand('conce', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("conce.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 50, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/832/832815.svg"> CONCESSINÁRIA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." VENDEDORES's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)]]

function ykP.emServico()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)

--------------------------
--	Concessionaria
--------------------------
	if vRP.hasGroup(user_id,"Concessionaria") then
		vRP.addUserGroup(user_id,"ConcessionariaPaycheck")
		return true
	 elseif vRP.hasGroup(user_id,"DONOConcessionaria") then
		vRP.addUserGroup(user_id,"DONOConcessionariaPaycheck")
		return true
		--------------------------
---------POLICIAIS		
	elseif vRP.hasGroup(user_id,"COMANDANTE") then
		vRP.addUserGroup(user_id,"COMANDANTEPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
--			["WEAPON_PISTOL_MK2"] = {ammo=90},
--			["WEAPON_SMG"] = {ammo=250},
--			["WEAPON_NIGHTSTICK"] = {ammo=1},
--			["WEAPON_STUNGUN"] = {ammo=1},
--			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"paisanapmesprecruta") then
		vRP.addUserGroup(user_id,"recrutapmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"soldadopmesp-apaisana") then
		vRP.addUserGroup(user_id,"soldadopmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"cabopmesp-apaisana") then
		vRP.addUserGroup(user_id,"cabopmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"sargentopmesp-apaisana") then
		vRP.addUserGroup(user_id,"sargentopmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"tenentepmesp-apaisana") then
		vRP.addUserGroup(user_id,"tenentepmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"capitaopmesp-apaisana") then
		vRP.addUserGroup(user_id,"capitaopmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"majorpmesp-apaisana") then
		vRP.addUserGroup(user_id,"majorpmespk")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"tencoronelpmesp-apaisana") then
		vRP.addUserGroup(user_id,"tencoronelpmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"coronelpmesp-apaisana") then
		vRP.addUserGroup(user_id,"coronelpmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"comandantepmesp-apaisana") then
		vRP.addUserGroup(user_id,"comandantepmesp")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"comandantegeral-apaisana") then
		vRP.addUserGroup(user_id,"comandantegeral")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"soldadorota-apaisana") then
		vRP.addUserGroup(user_id,"soldadorota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

	elseif vRP.hasGroup(user_id,"caborota-apaisana") then
		vRP.addUserGroup(user_id,"caborota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"sargentorota-apaisana") then
		vRP.addUserGroup(user_id,"sargentorota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"tenenterota-apaisana") then
		vRP.addUserGroup(user_id,"tenenterota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"capitaorota-apaisana") then
		vRP.addUserGroup(user_id,"capitaorota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"majorrota-apaisana") then
		vRP.addUserGroup(user_id,"majorrota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"tencoronelrota-apaisana") then
		vRP.addUserGroup(user_id,"tencoronelrota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"coronelrota-apaisana") then
		vRP.addUserGroup(user_id,"coronelrota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"comandanterota-apaisana") then
		vRP.addUserGroup(user_id,"comandanterota")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"agente-apaisana") then
		vRP.addUserGroup(user_id,"agentepc")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"investigador-apaisana") then
		vRP.addUserGroup(user_id,"investigadorpc")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"delegado-apaisana") then
		vRP.addUserGroup(user_id,"delegadopc")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"agentepf-apaisana") then
		vRP.addUserGroup(user_id,"agentepf")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"investigadorpf-apaisana") then
		vRP.addUserGroup(user_id,"investigadorpf")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"delegadopf-apaisana") then
		vRP.addUserGroup(user_id,"delegadopf")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT8") then
		vRP.addUserGroup(user_id,"FT8Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT9") then
		vRP.addUserGroup(user_id,"FT9Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA1") then
		vRP.addUserGroup(user_id,"ROTA1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA2") then
		vRP.addUserGroup(user_id,"ROTA2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA3") then
		vRP.addUserGroup(user_id,"ROTA3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA4") then
		vRP.addUserGroup(user_id,"ROTA4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA5") then
		vRP.addUserGroup(user_id,"ROTA5Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA6") then
		vRP.addUserGroup(user_id,"ROTA6Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA7") then
		vRP.addUserGroup(user_id,"ROTA7Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA8") then
		vRP.addUserGroup(user_id,"ROTA8Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA9") then
		vRP.addUserGroup(user_id,"ROTA9Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM") then
		vRP.addUserGroup(user_id,"ROCAMPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"GRPAE") then
		vRP.addUserGroup(user_id,"GRPAEPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP1") then
		vRP.addUserGroup(user_id,"BAEP1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP2") then
		vRP.addUserGroup(user_id,"BAEP2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP3") then
		vRP.addUserGroup(user_id,"BAEP3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP4") then
		vRP.addUserGroup(user_id,"BAEP4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP5") then
		vRP.addUserGroup(user_id,"BAEP5Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP6") then
		vRP.addUserGroup(user_id,"BAEP6Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP7") then
		vRP.addUserGroup(user_id,"BAEP7Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP8") then
		vRP.addUserGroup(user_id,"BAEP8Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP9") then
		vRP.addUserGroup(user_id,"BAEP9Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
---------HOSPITAL	
	elseif vRP.hasGroup(user_id,"enfermeiropaisana") then
		vRP.addUserGroup(user_id,"enfermeirosamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"paramedico-paisana") then
		vRP.addUserGroup(user_id,"paramedicosamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"medicosamu-paisana") then
		vRP.addUserGroup(user_id,"medicosamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"psicologo-paisana") then
		vRP.addUserGroup(user_id,"psicologosamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"subdiretor-paisana") then
		vRP.addUserGroup(user_id,"subdiretorsamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true	
	elseif vRP.hasGroup(user_id,"diretor-paisana") then
		vRP.addUserGroup(user_id,"diretorsamu")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true	
---------Mecanico	
elseif vRP.hasGroup(user_id,"donomecfolga") then
	vRP.addUserGroup(user_id,"donomec")
	return true
elseif vRP.hasGroup(user_id,"gerentemecfolga") then
	vRP.addUserGroup(user_id,"gerentemec")
	return true
elseif vRP.hasGroup(user_id,"mecfolga") then
    vRP.addUserGroup(user_id,"mec")
	return true 
	
	---------Advogado	
elseif vRP.hasGroup(user_id,"dononews") then
	vRP.addUserGroup(user_id,"dononews.paycheck")
	return true
elseif vRP.hasGroup(user_id,"Juiz") then
    vRP.addUserGroup(user_id,"JuizPaycheck")
	return true 
	
	
--[[--------Taxi
elseif vRP.hasGroup(user_id,"Taxista") then
	vRP.addUserGroup(user_id,"TaxistaPaycheck")
	return true]]
	
	end
end

function ykP.offService()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerEvent('eblips:remove',source)

	--Advocacia
		vRP.removeUserGroup(user_id,"dononews")
		vRP.removeUserGroup(user_id,"dononews.paycheck")
	--Policia
	vRP.removeUserGroup(user_id,"recrutapmesp")
	vRP.removeUserGroup(user_id,"soldadopmesp")
	vRP.removeUserGroup(user_id,"cabopmesp")
	vRP.removeUserGroup(user_id,"sargentopmesp")
	vRP.removeUserGroup(user_id,"tenentepmesp")
	vRP.removeUserGroup(user_id,"capitaopmesp")
	vRP.removeUserGroup(user_id,"majorpmesp")
	vRP.removeUserGroup(user_id,"tencoronelpmesp")
	vRP.removeUserGroup(user_id,"coronelpmesp")
	vRP.removeUserGroup(user_id,"comandantepmesp")
	vRP.removeUserGroup(user_id,"comandantegeral")
	vRP.removeUserGroup(user_id,"soldadorota")
	vRP.removeUserGroup(user_id,"caborota")
	vRP.removeUserGroup(user_id,"sargentorota")
	vRP.removeUserGroup(user_id,"tenenterota")
	vRP.removeUserGroup(user_id,"capitaorota")
	vRP.removeUserGroup(user_id,"majorrota")
	vRP.removeUserGroup(user_id,"tencoronelrota")
	vRP.removeUserGroup(user_id,"coronelrota")
	vRP.removeUserGroup(user_id,"comandanterota")
	vRP.removeUserGroup(user_id,"agentepc")
	vRP.removeUserGroup(user_id,"investigadorpc")
	vRP.removeUserGroup(user_id,"delegadopc")
	vRP.removeUserGroup(user_id,"agentepf")
	vRP.removeUserGroup(user_id,"investigadorpf")
	vRP.removeUserGroup(user_id,"delegadopf")
	vRP.removeUserGroup(user_id,"enfermeirosamu")
	vRP.removeUserGroup(user_id,"paramedicosamu")
	vRP.removeUserGroup(user_id,"medicosamu")
	vRP.removeUserGroup(user_id,"psicologosamu")
	vRP.removeUserGroup(user_id,"subdiretorsamu")
	vRP.removeUserGroup(user_id,"diretorsamu")
	vRP.removeUserGroup(user_id,"donomec")
	vRP.removeUserGroup(user_id,"gerentemec")
	vRP.removeUserGroup(user_id,"mec")
	
end