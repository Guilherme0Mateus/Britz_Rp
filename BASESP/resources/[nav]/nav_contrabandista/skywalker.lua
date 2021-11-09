local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "algema", quantidade = 1, compra = 5000 },
	{ item = "c4", quantidade = 1, compra = 25000 },

	{ item = "rebite", quantidade = 1, compra = 500 },
	{ item = "colete", quantidade = 1, compra = 5000 },
	{ item = "pendrive", quantidade = 1, compra = 500 },

	{ item = "capuz", quantidade = 1, compra = 5000 },
	{ item = "furadeira", quantidade = 1, compra = 7000 },
    { item = "lockpick", quantidade = 1, compra = 1500 },
    { item = "placa", quantidade = 1, compra = 5500 },
    { item = "serra", quantidade = 1, compra = 7000 }
}
-----------------------------------------------------------------------------------------------------------------------------
--[ COMPRAR ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("contrabandista-comprar")
AddEventHandler("contrabandista-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryPayment(user_id,parseInt(v.compra)) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> por <b>$"..vRP.format(parseInt(v.compra)).." dólares</b>.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)