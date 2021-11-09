local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

rzT = {}
Tunnel.bindInterface("rz-taxi",rzT)

rzS = Tunnel.getInterface("rz-taxi")


-- // -------------------------------------------------------
-- // Taxistas
-- // -------------------------------------------------------

function taxista()
	local quantidade = 0
	local taxista = vRP.getUsersByPermission("taxista.permissao")

	for k,v in pairs(taxista) do
		quantidade = quantidade + 1
	end

	return parseInt(quantidade)
end



-- // -------------------------------------------------------
-- // Comando
-- // -------------------------------------------------------

RegisterCommand('chamartaxi', function(source,args,rawCommand)
	print('true')
	local user_id = vRP.getUserId(source)
	print('true')
	local ok = vRP.request(source,"Deseja chamar um taxi?",60)
	print('true')
	local taxista = taxista()
	print('true')
	if taxista >= 1 then
		print('true')
		TriggerClientEvent("Notify",source,"importante","Há taxistas em serviço. Chame um taxista utilizando o comando /chamar taxi.")
	else
		if ok then
			TriggerClientEvent("iniciarTaxi",source)
            TriggerClientEvent("Notify",source,"sucesso","O táxi foi chamado com sucesso.")
		else
			TriggerClientEvent("andarRandom",source)
		end
	end
end)

-- // -------------------------------------------------------
-- // Eventos
-- // -------------------------------------------------------

RegisterServerEvent("pgto")
AddEventHandler("pgto", function(distancia)
--function rzT.distancia(distancia)
--	local pgto = math.random(450, 650)        -- O pagamento irá variar entre dois números. Altere para aumentar ou diminuir o valor.
--	local pgto = 500                          -- O pagamento será em um valor específico.
	local pgto = math.floor(distancia / 2)    -- O pagamento consiste na distância do waypoint dividido por 2.

	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)

	local request = vRP.request(source,"Deseja pagar o taxi? O valor cobrado será de R$ "..pgto, 60)

	if request then
		if vRP.tryFullPayment(user_id,pgto) then 
			TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
			TriggerClientEvent("Notify",source,"sucesso","Você pagou <b>$"..vRP.format(parseInt(pgto)).." reais</b>.")
			print('blz')
			--return 'entrarVeiculo'
			TriggerClientEvent("entrarVeiculo", source)
		else
			TriggerClientEvent("Notify", source, "importante", "Dinheiro insuficiente! O taxi irá embora.")
			--return 'semDinheiro'
			TriggerClientEvent("andarRandom",source)
		end
	else
		TriggerClientEvent("Notify", source, "importante", "O taxi irá embora e não será cobrado nenhum valor.")
		--return 'andarRandom'
		TriggerClientEvent("andarRandom",source)
	end
end)
