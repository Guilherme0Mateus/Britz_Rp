local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
rob = {}
Tunnel.bindInterface("vrp_roubos",rob)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local variavel = 0
local assaltante = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO RECOMPENSA
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ id = 1 , nome = "Banco" , segundos = 86400 , cops = 5, recompensa = math.random(420000,500000) },
	{ id = 2 , nome = "Banco" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) },
	{ id = 3 , nome = "Banco" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) },
	{ id = 4 , nome = "Banco Paleto" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) },
	{ id = 5 , nome = "Banco" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) },
	{ id = 6 , nome = "Banco" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) },
	{ id = 7 , nome = "Banco" , segundos = 86400 , cops = 5 , recompensa = math.random(420000,500000) }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function rob.IniciandoRoubo(id,x,y,z,head)
	local source = source
	local user_id = vRP.getUserId(source)
	local soldado = vRP.getUsersByPermission("policia.permissao")
	for _,item in pairs(locais) do
		if item.id == id then
			if #soldado < item.cops then
				TriggerClientEvent('Notify',source,"negado","Número insuficiente de policiais no momento para iniciar um roubo.")
			elseif (os.time() - variavel) < 1500 then
				TriggerClientEvent('Notify',source,"negado","Os cofres estão vazios, aguarde até que os seguranças retornem com o dinheiro.")
			else
				assaltante = true
				variavel = os.time()
				TriggerClientEvent('iniciarroubo',source,item.segundos,head)
				vRPclient.playAnim(source,false,{{"anim@heists@ornate_bank@grab_cash_heels","grab",1}},true)
				for l,w in pairs(soldado) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						async(function()
							TriggerClientEvent('criarblip',player,x,y,z)
							vRPclient.playSound(player,"HUD_MINI_GAME_SOUNDSET","CHECKPOINT_AHEAD")
							TriggerClientEvent('chatMessage',player,"190",{65,130,255},"O roubo começou no(a) ^1"..item.nome.."^0, dirija-se até o local e intercepte os assaltantes.")
						end)
					end
				end
				SetTimeout(item.segundos*1000,function()
					if assaltante then
						for l,w in pairs(soldado) do
							local player = vRP.getUserSource(parseInt(w))
							if player then
								async(function()
									TriggerClientEvent('chatMessage',player,"190",{65,130,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
								end)
							end
						end
						TriggerClientEvent('removerblip',-1)
						vRP.giveInventoryItem(user_id,"dinheirosujo",item.recompensa,false)
						assaltante = false
					end
				end)
			end
		end
	end
end

function rob.CancelandoRoubo()
	if assaltante then
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					TriggerClientEvent('chatMessage',player,"190",{65,130,255},"O assaltante saiu correndo e deixou tudo para trás.")
				end)
			end
		end
		TriggerClientEvent('removerblip',-1)
		assaltante = false
	end
end