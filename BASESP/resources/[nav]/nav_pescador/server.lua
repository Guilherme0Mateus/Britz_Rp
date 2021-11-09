local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "dourado", venda = 160 },
	{ item = "corvina", venda = 130 },
	{ item = "salmao", venda = 120 },
	{ item = "pacu", venda = 100 },
	{ item = "pintado", venda = 120 },
	{ item = "pirarucu", venda = 150 },
	{ item = "tilapia", venda = 130 },
	{ item = "tucunare", venda = 150 },
	{ item = "lambari", venda = 100 },
	{ item = "mouro", venda = 170 },
	{ item = "mferro", venda = 50 },
	{ item = "mbronze", venda =85 },
	{ item = "mrubi", venda = 175 },
	{ item = "mesmeralda", venda = 200 },
	{ item = "diamante", venda = 250 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("pescador-vender")
AddEventHandler("pescador-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getUserDataTable(user_id)
	local quantidade = 0
	if data and data.inventory then
		for k,v in pairs(valores) do
			if item == v.item then
				for i,o in pairs(data.inventory) do
					if i == item then
						quantidade = o.amount
					end
				end
				if parseInt(quantidade) > 0 then
					if vRP.tryGetInventoryItem(user_id,v.item,quantidade) then
						vRP.giveMoney(user_id,parseInt(v.venda*quantidade))
					end
				else
					TriggerClientEvent('Notify',source,"sucesso","Sucesso")
				end
			end
		end
	end
end)