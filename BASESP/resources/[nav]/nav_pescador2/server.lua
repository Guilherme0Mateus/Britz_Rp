local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "dourado", venda = 960 },
	{ item = "corvina", venda = 780 },
	{ item = "salmao", venda = 720 },
	{ item = "pacu", venda = 600},
	{ item = "pintado", venda = 720 },
	{ item = "pirarucu", venda = 900},
	{ item = "tilapia", venda = 780},
	{ item = "tucunare", venda = 900},
	{ item = "lambari", venda = 1000},
	{ item = "mouro", venda = 1020},
	{ item = "mferro", venda = 500 },
	{ item = "mbronze", venda =700 },
	{ item = "mrubi", venda = 1350},
	{ item = "mesmeralda", venda = 1500},
	{ item = "diamante", venda = 2000}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("meuovo-vender")
AddEventHandler("meuovo-vender",function(item)
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