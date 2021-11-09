local cfg = module("cfg/inventory")

local itemlist = {
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários legais ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["mochila"] = { index = "mochila", nome = "Mochila", type = "usar" },
	["celular"] = { index = "celular", nome = "iPhone 11", type = "usar" },
	["radio"] = { index = "radio", nome = "WalkTalk", type = "usar" },
	["mascara"] = { index = "mascara", nome = "Mascara", type = "usar" },
	["oculos"] = { index = "oculos", nome = "Óculos", type = "usar" },
	["identidade"] = { index = "identidade", nome = "Identidade", type = "usar" },
	["colete"] = { index = "colete", nome = "Colete Balístico", type = "usar" },
	["militec"] = { index = "militec", nome = "Militec", type = "usar" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos", type = "usar" },
	["roupas"] = { index = "roupas", nome = "Roupas", type = "usar" },
	["pecadearma"] = { index = "pecadearma", nome = "Peça De Arma", type = "usar" },
	["alianca"] = { index = "alianca", nome = "Aliança", type = "usar" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia", type = "usar" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite", type = "usar" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja", type = "usar" },
	["tequila"] = { index = "tequila", nome = "Tequila", type = "usar" },
	["vodka"] = { index = "vodka", nome = "Vodka", type = "usar" },
	["whisky"] = { index = "whisky", nome = "Whisky", type = "usar" },
	["agua"] = { index = "agua", nome = "Água", type = "usar" },
	["limonada"] = { index = "limonada", nome = "Limonada", type = "usar" },
	["refrigerante"] = { index = "refrigerante", nome = "Refrigerante", type = "usar" },
	["cafe"] = { index = "cafe", nome = "Cafe", type = "usar" },
	["chocolate"] = { index = "chocolate", nome = "Chocolate", type = "usar" },
	["salgadinho"] = { index = "salgadinho", nome = "Salgadinho", type = "usar" },
	["rosquinha"] = { index = "rosquinha", nome = "Rosquinha", type = "usar" },
	["sanduiche"] = { index = "sanduiche", nome = "Sanduiche", type = "usar" },
	["pizza"] = { index = "pizza", nome = "Pizza", type = "usar" },
	["absinto"] = { index = "absinto", nome = "Absinto", type = "usar" },
	["pao"] = { index = "pao", nome = "Pão", type = "usar" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários Ilegais]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo", type = "usar" },
	["algema"] = { index = "algema", nome = "Algema", type = "usar" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick", type = "usar" },
	["capuz"] = { index = "capuz", nome = "Capuz", type = "usar" },
	["placa"] = { index = "placa", nome = "Placa", type = "usar" },
	["c4"] = { index = "c4", nome = "C4", type = "usar" },
	["pendrive"] = { index = "Pen Drive", nome = "Pen Drive", type = "usar" },
	["serra"] = { index = "serra", nome = "Serra", type = "usar" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Bebidas Não Alcoólicas ]-----------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------
	--------------------[MINERADOR]------------------------------------------------
	["diamante"] = { index = "diamante", nome = "Min. Diamante", type = "usar" },
	["mouro"] = { index = "mouro", nome = "Ouro", type = "usar" },
	["mferro"] = { index = "mferro", nome = "Min. Ferro", type = "usar" },
	["mrubi"] = { index = "mrubi", nome = "Min. Rubi", type = "usar" },
	["mesmeralda"] = { index = "mesmeralda", nome = "Min. Esmeralda", type = "usar" },
	["mbronze"] = { index = "mbronze", nome = "Bronze", type = "usar" },
	------------------------------------------------------------------------------------
	["energetico"] = { index = "energetico", nome = "Energético", type = "usar" },
	--[PESCARIA]
	["dourado"] = { index = "dourado", nome = "Dourado", type = "usar" },
	["corvina"] = { index = "corvina", nome = "Corvina", type = "usar" },
	["salmao"] = { index = "salmao", nome = "Salmão", type = "usar" },
	["pacu"] = { index = "pacu", nome = "Pacu", type = "usar" },
	["pintado"] = { index = "pintado", nome = "Pintado", type = "usar" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu", type = "usar" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia", type = "usar" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré", type = "usar" },
	["lambari"] = { index = "lambari", nome = "Lambari", type = "usar" },
	["isca"] = { index = "isca", nome = "Isca", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Remédios ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["paracetamil"] = { index = "paracetamil", nome = "Paracetamil", type = "usar" },
	["voltarom"] = { index = "voltarom", nome = "Voltarom", type = "usar" },
	["trandrylux"] = { index = "trandrylux", nome = "Trandrylux", type = "usar" },
	["dorfrex"] = { index = "dorfrex", nome = "Dorfrex", type = "usar" },
	["buscopom"] = { index = "buscopom", nome = "Buscopom", type = "usar" },
    -------------- BOTIJAO
	["BotijaoVazio"] = { index = "gaz", nome = "Botijao Vazio", type = "usar" },
	["BotijaoCheio"] = { index = "gaz", nome = "Botijao Cheio", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 01 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["meta-alta"] = { index = "meta-alta", nome = "Metanfetamina", type = "usar" }, -- 6 Processos;
	--[ Sub produto ]----------------------------------------------------------------------------------
	["composito-alta"] = { index = "composito-alta", nome = "Anfetamina", type = "usar" },
	--[ Ingredientes ]---------------------------------------------------------------------------------
	["nitrato-amonia"] = { index = "nitrato-amonia", nome = "Nitrato de Amônia", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["coca-alta"] = { index = "coca-alta", nome = "Cocaina", type = "usar" }, -- 6 Processos;
	--[ Sub produto ]----------------------------------------------------------------------------------
	["pasta-alta"] = { index = "pasta-alta", nome = "Pasta de Coca", type = "usar" },
	--[ Ingredientes ]---------------------------------------------------------------------------------
	["folhas-coca"] = { index = "folhas-coca", nome = "Folhas de Coca", type = "usar" },
	["folhas-haxixi"] = { index = "folhas-haxixi", nome = "Folhas de Haxixi", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 03 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["maconha-alta"] = { index = "maconha-alta", nome = "Maconha", type = "usar" }, -- 6 Processos;
	--[ Sub produto ]----------------------------------------------------------------------------------
	["maconha-dichavada"] = { index = "maconha-dichavada", nome = "Maconha Dichavada", type = "usar" },
	["canabis-alta"] = { index = "canabis-alta", nome = "Pé de Maconha", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["molas"] = { index = "molas", nome = "Molas", type = "usar" },
	["placa-metal"] = { index = "placa-metal", nome = "Placa de Metal", type = "usar" },
	["gatilho"] = { index = "gatilho", nome = "Gatilho", type = "usar" },
	["capsulas"] = { index = "capsulas", nome = "Capsulas", type = "usar" },
	["polvora"] = { index = "polvora", nome = "Polvora", type = "usar" },
	--------------------------------------------------------------------------------------------------
	--[ Empregos ]------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de lixo", type = "usar" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda", type = "usar" },
	["laranja"] = { index = "laranja", nome = "Laranja", type = "usar" },
	["lanche"] = { index = "lanche", nome = "Tacos", type = "usar" },
	["graos"] = { index = "graos", nome = "Graos", type = "usar" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ ARMAS / OUTROS ]-------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas", type = "equipar" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina", type = "equipar" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador", type = "equipar" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ CORPO A CORPO ]--------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca", type = "equipar" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga", type = "equipar" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês", type = "equipar" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete", type = "equipar" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete", type = "equipar" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo", type = "equipar" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo", type = "equipar" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf", type = "equipar" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra", type = "equipar" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado", type = "equipar" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna", type = "equipar" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol", type = "equipar" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa", type = "equipar" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha", type = "equipar" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca", type = "equipar" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra", type = "equipar" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ PISTOLA ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19", type = "equipar" },
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven", type = "equipar" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "pistolhk", nome = "Pistol HK", type = "equipar" },
	["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser", type = "equipar" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ FUZIL ]----------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak47", nome = "AK-47", type = "equipar" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a4", nome = "M4A4", type = "equipar" },
	["wbody|WEAPON_SPECIALCARBINE"] = { index = "m4spec", nome = "M4 SPEC", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ SMG ]------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5", type = "equipar" },
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9", type = "equipar" },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX", type = "equipar" },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar", nome = "MTAR-21", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ SHOTGUN ]--------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ RIFLES ]---------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22", type = "equipar" },
	---------------------------------------------------------------------------------------------------
	--[ MUNIÇÕES ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer MPX", type = "recarregar" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas", type = "recarregar" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível", type = "recarregar" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador", type = "recarregar" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor", type = "recarregar" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19", type = "recarregar" },
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven", type = "recarregar" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-pistolhk", nome = "M.Pistol HK", type = "recarregar" },
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak47", nome = "M.AK47", type = "recarregar" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a4", nome = "M.M4A4", type = "recarregar" },
	["wammo|WEAPON_SPECIALCARBINE"] = { index = "m-m4spec", nome = "M.M4 Spec", type = "recarregar" },
	["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser", type = "recarregar" },
	["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5", type = "recarregar" },
	["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.TEC-9", type = "recarregar" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870", type = "recarregar" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "M.MTAR-21", type = "recarregar" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44", type = "recarregar" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22", type = "recarregar" }--
}

function vRP.itemNameList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].nome
	end
end

function vRP.itemIndexList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].index
	end
end

function vRP.itemTypeList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].type
	end
end

function vRP.itemBodyList(item)
	if itemlist[item] ~= nil then
		return itemlist[item]
	end
end

vRP.items = {}
function vRP.defInventoryItem(idname,name,weight)
	if weight == nil then
		weight = 0
	end
	local item = { name = name, weight = weight }
	vRP.items[idname] = item
end

function vRP.clearInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		data.inventory = {}
	end
end


function vRP.computeItemName(item,args)
	if type(item.name) == "string" then
		return item.name
	else
		return item.name(args)
	end
end

function vRP.computeItemWeight(item,args)
	if type(item.weight) == "number" then
		return item.weight
	else
		return item.weight(args)
	end
end

function vRP.parseItem(idname)
	return splitString(idname,"|")
end

function vRP.getItemDefinition(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemName(item,args),vRP.computeItemWeight(item,args)
	end
	return nil,nil
end

function vRP.getItemWeight(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemWeight(item,args)
	end
	return 0
end

function vRP.computeItemsWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		local iweight = vRP.getItemWeight(k)
		weight = weight+iweight*v.amount
	end
	return weight
end

function vRP.giveInventoryItem(user_id,idname,amount)
	local amount = parseInt(amount)
	local data = vRP.getUserDataTable(user_id)
	if data and amount > 0 then
		local entry = data.inventory[idname]
		if entry then
			entry.amount = entry.amount + amount
		else
			data.inventory[idname] = { amount = amount }
		end
	end
end

--local creative_itens = "https://discordapp.com/api/webhooks/604945979023687691/8XKL0ByvuyQxjnW5JtWVb8FdtDyPYa0mKcP2wcifM2LGzMGSHpFchQhD8-PAdYG-QfQq"

function vRP.tryGetInventoryItem(user_id,idname,amount)
	local amount = parseInt(amount)
	local data = vRP.getUserDataTable(user_id)
	if data and amount > 0 then
		--if idname == "tora" or idname == "carnedepuma" or idname == "etiqueta" then
			--creativeLogs(creative_itens,"**USER_ID:** "..user_id.." **ITEM:** "..idname.." - **QUANTIDADE:** "..parseInt(amount).." - "..os.date("%H:%M:%S"))
		--end
		local entry = data.inventory[idname]
		if entry and entry.amount >= amount then
			entry.amount = entry.amount - amount

			if entry.amount <= 0 then
				data.inventory[idname] = nil
			end
			return true
		end
	end
	return false
end

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		local entry = data.inventory[idname]
		if entry then
			return entry.amount
		end
	end
	return 0
end

function vRP.getInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		return data.inventory
	end
end

function vRP.getInventoryWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		return vRP.computeItemsWeight(data.inventory)
	end
	return 0
end

function vRP.getInventoryMaxWeight(user_id)
	return math.floor(vRP.expToLevel(vRP.getExp(user_id,"physical","strength")))*3
end

RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            data.inventory = {}
        end

        vRP.setMoney(user_id,0)
        vRPclient._clearWeapons(source)
        vRPclient._setHandcuffed(source,false)

        if not vRP.hasPermission(user_id,"mochila.permissao") then
            vRP.setExp(user_id,"physical","strength",20)
        end
    end
end)

AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)

local chests = {}
local function build_itemlist_menu(name,items,cb)
	local menu = { name = name }
	local kitems = {}

	local choose = function(player,choice)
		local idname = kitems[choice]
		if idname then
			cb(idname)
		end
	end

	for k,v in pairs(items) do 
		local name,weight = vRP.getItemDefinition(k)
		if name then
			kitems[name] = k
			menu[name] = { choose,"<text01>Quantidade:</text01> <text02>"..v.amount.."</text02><text01>Peso:</text01> <text02>"..string.format("%.2f",weight).."kg</text02>" }
		end
	end

	return menu
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local vehglobal = {
	--------------CARROS-----------------------

	["amarok"] = { ['name'] = "Amarok", ['price'] = 108500, ['tipo'] = "carros" },
	["civic2017"] = { ['name'] = "Civic", ['price'] = 71000, ['tipo'] = "carros" },
	["c7"] = { ['name'] = "Corvette", ['price'] = 253333, ['tipo'] = "carros" },
	["gtoxx"] = { ['name'] = "Ferrari F12", ['price'] = 1300000, ['tipo'] = "carros" },
	["fox"] = { ['name'] = "Fox", ['price'] = 25745, ['tipo'] = "carros" },
	--["fusion"] = { ['name'] = "Fusion", ['price'] = 91495, ['tipo'] = "carros" },
	--["gol"] = { ['name'] = "GOL", ['price'] = 24000, ['tipo'] = "carros" },
	["golquadrado"] = { ['name'] = "Gol", ['price'] = 7500, ['tipo'] = "carros" },
	["jetta2017"] = { ['name'] = "Jetta TSI", ['price'] = 73500, ['tipo'] = "carros" },
	["kadett"] = { ['name'] = "Kadett", ['price'] = 6000, ['tipo'] = "carros" },
	["a45amg"] = { ['name'] = "Mercedes A45", ['price'] = 50000, ['tipo'] = "carros" },
	["c63w205"] = { ['name'] = "Mercedes C63", ['price'] = 277500, ['tipo'] = "carros" },
	["911gtrs"] = { ['name'] = "Porsche 911", ['price'] = 895000, ['tipo'] = "carros" },
	["saveiro"] = { ['name'] = "Saveiro", ['price'] = 27185, ['tipo'] = "carros" },
	["up"] = { ['name'] = "UP Tsi", ['price'] = 24795, ['tipo'] = "carros" },
	["voyage"] = { ['name'] = "Voyage", ['price'] = 28175, ['tipo'] = "carros" },
	["amv19"] = { ['name'] = "Aston Martin", ['price'] = 395000, ['tipo'] = "carros" },
	["audia3"] = { ['name'] = "Audi A3", ['price'] = 125000, ['tipo'] = "carros" },
	["audirs3"] = { ['name'] = "Audi TT", ['price'] = 195000, ['tipo'] = "carros" },
	["bmw130i"] = { ['name'] = "Bmw 130i", ['price'] = 134975, ['tipo'] = "carros" },
	["19z4S"] = { ['name'] = "Bmw Z4", ['price'] = 214500, ['tipo'] = "carros" },
	["corolla2017"] = { ['name'] = "Corolla", ['price'] = 65000, ['tipo'] = "carros" },
	["golfgti"] = { ['name'] = "Golf GTI", ['price'] = 100000, ['tipo'] = "carros" },
	["l200civil"] = { ['name'] = "L200", ['price'] = 72500, ['tipo'] = "carros" },
	["mst"] = { ['name'] = "Mustang", ['price'] = 165500, ['tipo'] = "carros" },
	["pturismo"] = { ['name'] = "Porsche Panamera", ['price'] = 430000, ['tipo'] = "carros" },
	["992t"] = { ['name'] = "Porsche 992", ['price'] = 500000, ['tipo'] = "carros" },
	["astra"] = { ['name'] = "Astra", ['price'] = 9500, ['tipo'] = "carros" },
	["celta"] = { ['name'] = "Celta", ['price'] = 13000, ['tipo'] = "carros" },
	["chevette"] = { ['name'] = "Chevette", ['price'] = 5500, ['tipo'] = "carros" },
	["uno"] = { ['name'] = "Uno", ['price'] = 5500, ['tipo'] = "carros" },
	["brasilia"] = { ['name'] = "Brasilia", ['price'] = 4999, ['tipo'] = "carros" },
	["audirs6"] = { ['name'] = "Audi RS6", ['price'] = 394500, ['tipo'] = "carros" },
	["bmwm3f80"] = { ['name'] = "Bmw M3", ['price'] = 242475, ['tipo'] = "carros" },
	["bmwm4gts"] = { ['name'] = "Bmw M4", ['price'] = 251475, ['tipo'] = "carros" },
	["lancerevolutionx"] = { ['name'] = "Lancer Evolution", ['price'] = 251475, ['tipo'] = "carros" },
	["nissan370z"] = { ['name'] = "Nissan 370Z", ['price'] = 66902, ['tipo'] = "carros" },
	["2013LP560"] = { ['name'] = "Lamborghini Galardo", ['price'] = 66902, ['tipo'] = "carros" },
	["amggtc"] = { ['name'] = "Mercedes AMG", ['price'] = 66902, ['tipo'] = "carros" },
	["civicsi"] = { ['name'] = "Civic Si", ['price'] = 66902, ['tipo'] = "carros" },
	["ferrarif360"] = { ['name'] = "Ferrari F360", ['price'] = 66902, ['tipo'] = "carros" },
	["newbeetle"] = { ['name'] = "New Beetle", ['price'] = 66902, ['tipo'] = "carros" },
	["opala"] = { ['name'] = "Opala", ['price'] = 66902, ['tipo'] = "carros" },
	["16ss"] = { ['name'] = "Camaro SS", ['price'] = 66902, ['tipo'] = "carros" },
	["2016rs7"] = { ['name'] = "Audi RS7", ['price'] = 66902, ['tipo'] = "carros" },
	["bravo"] = { ['name'] = "Fiat Bravo", ['price'] = 66902, ['tipo'] = "carros" },
	["fusion"] = { ['name'] = "Fusion", ['price'] = 66902, ['tipo'] = "carros" },
	["hb20"] = { ['name'] = "HB20", ['price'] = 66902, ['tipo'] = "carros" },
	["ix35"] = { ['name'] = "IX35", ['price'] = 66902, ['tipo'] = "carros" },
	["jeepreneg"] = { ['name'] = "Renegade", ['price'] = 66902, ['tipo'] = "carros" },
	["minicooper"] = { ['name'] = "Mini Cooper", ['price'] = 66902, ['tipo'] = "carros" },
	["xc90"] = { ['name'] = "Volvo X90", ['price'] = 66902, ['tipo'] = "carros" },
	["tofaslimo"] = { ['name'] = "Limousine", ['price'] = 66902, ['tipo'] = "carros" },
	["pounder"] = { ['name'] = "Caminhao", ['price'] = 66902, ['tipo'] = "carros" },
	["RAPTOR150"] = { ['name'] = "Raptor Johw", ['price'] = 66902, ['tipo'] = "carros" },
	["blista"] = { ['name'] = "Blista", ['price'] = 60000, ['tipo'] = "carros" },
	["brioso"] = { ['name'] = "Brioso", ['price'] = 35000, ['tipo'] = "carros" },
	["emperor"] = { ['name'] = "Emperor", ['price'] = 50000, ['tipo'] = "carros" },
	["emperor2"] = { ['name'] = "Emperor 2", ['price'] = 50000, ['tipo'] = "carros" },
	["dilettante"] = { ['name'] = "Dilettante", ['price'] = 60000, ['tipo'] = "carros" },
	["issi2"] = { ['name'] = "Issi2", ['price'] = 90000, ['tipo'] = "carros" },
	["panto"] = { ['name'] = "Panto", ['price'] = 5000, ['tipo'] = "carros" },
	["prairie"] = { ['name'] = "Prairie", ['price'] = 1000, ['tipo'] = "carros" },
	["rhapsody"] = { ['name'] = "Rhapsody", ['price'] = 7000, ['tipo'] = "carros" },
	["cogcabrio"] = { ['name'] = "Cogcabrio", ['price'] = 130000, ['tipo'] = "carros" },
	["exemplar"] = { ['name'] = "Exemplar", ['price'] = 80000, ['tipo'] = "carros" },
	["f620"] = { ['name'] = "F620", ['price'] = 55000, ['tipo'] = "carros" },
	["felon"] = { ['name'] = "Felon", ['price'] = 70000, ['tipo'] = "carros" },
	["ingot"] = { ['name'] = "Ingot", ['price'] = 160000, ['tipo'] = "carros" },
	["jackal"] = { ['name'] = "Jackal", ['price'] = 60000, ['tipo'] = "carros" },
	["oracle"] = { ['name'] = "Oracle", ['price'] = 60000, ['tipo'] = "carros" },
	["oracle2"] = { ['name'] = "Oracle2", ['price'] = 80000, ['tipo'] = "carros" },
	["sentinel"] = { ['name'] = "Sentinel", ['price'] = 50000, ['tipo'] = "carros" },
	["sentinel2"] = { ['name'] = "Sentinel2", ['price'] = 60000, ['tipo'] = "carros" },
	["windsor"] = { ['name'] = "Windsor", ['price'] = 150000, ['tipo'] = "carros" },
	["windsor2"] = { ['name'] = "Windsor2", ['price'] = 170000, ['tipo'] = "carros" },
	["zion"] = { ['name'] = "Zion", ['price'] = 50000, ['tipo'] = "carros" },
	["zion2"] = { ['name'] = "Zion2", ['price'] = 60000, ['tipo'] = "carros" },
	["blade"] = { ['name'] = "Blade", ['price'] = 110000, ['tipo'] = "carros" },
	["buccaneer"] = { ['name'] = "Buccaneer", ['price'] = 130000, ['tipo'] = "carros" },
	["buccaneer2"] = { ['name'] = "Buccaneer2", ['price'] = 260000, ['tipo'] = "carros" },
	["primo"] = { ['name'] = "Primo", ['price'] = 130000, ['tipo'] = "carros" },
	["chino"] = { ['name'] = "Chino", ['price'] = 130000, ['tipo'] = "carros" },
	["coquette3"] = { ['name'] = "Coquette3", ['price'] = 195000, ['tipo'] = "carros" },
	["dukes"] = { ['name'] = "Dukes", ['price'] = 150000, ['tipo'] = "carros" },
	["faction"] = { ['name'] = "Faction", ['price'] = 150000, ['tipo'] = "carros" },
	["faction3"] = { ['name'] = "Faction3", ['price'] = 350000, ['tipo'] = "exclusive" },
	["gauntlet"] = { ['name'] = "Gauntlet", ['price'] = 165000, ['tipo'] = "carros" },
	["gauntlet2"] = { ['name'] = "Gauntlet2", ['price'] = 165000, ['tipo'] = "carros" },
	["hermes"] = { ['name'] = "Hermes", ['price'] = 280000, ['tipo'] = "carros" },
	["hotknife"] = { ['name'] = "Hotknife", ['price'] = 180000, ['tipo'] = "carros" },
	["moonbeam"] = { ['name'] = "Moonbeam", ['price'] = 220000, ['tipo'] = "carros" },
	["moonbeam2"] = { ['name'] = "Moonbeam2", ['price'] = 250000, ['tipo'] = "carros" },
	["nightshade"] = { ['name'] = "Nightshade", ['price'] = 270000, ['tipo'] = "carros" },
	["picador"] = { ['name'] = "Picador", ['price'] = 150000, ['tipo'] = "carros" },
	["ruiner"] = { ['name'] = "Ruiner", ['price'] = 150000, ['tipo'] = "carros" },
	["sabregt"] = { ['name'] = "Sabregt", ['price'] = 260000, ['tipo'] = "carros" },
	["sabregt2"] = { ['name'] = "Sabregt2", ['price'] = 150000, ['tipo'] = "carros" },
	["slamvan"] = { ['name'] = "Slamvan", ['price'] = 180000, ['tipo'] = "carros" },
	["slamvan3"] = { ['name'] = "Slamvan3", ['price'] = 230000, ['tipo'] = "carros" },
	["stalion"] = { ['name'] = "Stalion", ['price'] = 150000, ['tipo'] = "carros" },
	["stalion2"] = { ['name'] = "Stalion2", ['price'] = 150000, ['tipo'] = "carros" },
	["tampa"] = { ['name'] = "Tampa", ['price'] = 170000, ['tipo'] = "carros" },
	["vigero"] = { ['name'] = "Vigero", ['price'] = 170000, ['tipo'] = "carros" },
	["virgo"] = { ['name'] = "Virgo", ['price'] = 150000, ['tipo'] = "carros" },
	["virgo2"] = { ['name'] = "Virgo2", ['price'] = 250000, ['tipo'] = "carros" },
	["virgo3"] = { ['name'] = "Virgo3", ['price'] = 180000, ['tipo'] = "carros" },
	["voodoo"] = { ['name'] = "Voodoo", ['price'] = 220000, ['tipo'] = "carros" },
	["voodoo2"] = { ['name'] = "Voodoo2", ['price'] = 220000, ['tipo'] = "carros" },
	["yosemite"] = { ['name'] = "Yosemite", ['price'] = 350000, ['tipo'] = "carros" },
	["bfinjection"] = { ['name'] = "Bfinjection", ['price'] = 80000, ['tipo'] = "exclusive" },
	["bifta"] = { ['name'] = "Bifta", ['price'] = 190000, ['tipo'] = "carros" },
	["bodhi2"] = { ['name'] = "Bodhi2", ['price'] = 170000, ['tipo'] = "carros" },
	["brawler"] = { ['name'] = "Brawler", ['price'] = 250000, ['tipo'] = "carros" },
	["trophytruck"] = { ['name'] = "Trophytruck", ['price'] = 400000, ['tipo'] = "exclusive" },
	["trophytruck2"] = { ['name'] = "Trophytruck2", ['price'] = 400000, ['tipo'] = "exclusive" },
	["dubsta3"] = { ['name'] = "Dubsta3", ['price'] = 300000, ['tipo'] = "carros" },
	["mesa3"] = { ['name'] = "Mesa3", ['price'] = 200000, ['tipo'] = "exclusive" },
	["rancherxl"] = { ['name'] = "Rancherxl", ['price'] = 220000, ['tipo'] = "carros" },
	["rebel2"] = { ['name'] = "Rebel2", ['price'] = 250000, ['tipo'] = "exclusive" },
	["riata"] = { ['name'] = "Riata", ['price'] = 250000, ['tipo'] = "carros" },
	["dloader"] = { ['name'] = "Dloader", ['price'] = 150000, ['tipo'] = "carros" },
	["sandking"] = { ['name'] = "Sandking", ['price'] = 400000, ['tipo'] = "carros" },
	["sandking2"] = { ['name'] = "Sandking2", ['price'] = 370000, ['tipo'] = "carros" },
	["baller"] = { ['name'] = "Baller", ['price'] = 150000, ['tipo'] = "carros" },
	["baller2"] = { ['name'] = "Baller2", ['price'] = 160000, ['tipo'] = "carros" },
	["baller3"] = { ['name'] = "Baller3", ['price'] = 175000, ['tipo'] = "carros" },
	["baller4"] = { ['name'] = "Baller4", ['price'] = 185000, ['tipo'] = "carros" },
	["baller5"] = { ['name'] = "Baller5", ['price'] = 270000, ['tipo'] = "carros" },
	["baller6"] = { ['name'] = "Baller6", ['price'] = 280000, ['tipo'] = "carros" },
	["bjxl"] = { ['name'] = "Bjxl", ['price'] = 110000, ['tipo'] = "carros" },
	["cavalcade"] = { ['name'] = "Cavalcade", ['price'] = 110000, ['tipo'] = "carros" },
	["cavalcade2"] = { ['name'] = "Cavalcade2", ['price'] = 130000, ['tipo'] = "carros" },
	["contender"] = { ['name'] = "Contender", ['price'] = 300000, ['tipo'] = "carros" },
	["dubsta"] = { ['name'] = "Dubsta", ['price'] = 210000, ['tipo'] = "carros" },
	["dubsta2"] = { ['name'] = "Dubsta2", ['price'] = 240000, ['tipo'] = "carros" },
	["fq2"] = { ['name'] = "Fq2", ['price'] = 110000, ['tipo'] = "carros" },
	["granger"] = { ['name'] = "Granger", ['price'] = 345000, ['tipo'] = "carros" },
	["gresley"] = { ['name'] = "Gresley", ['price'] = 150000, ['tipo'] = "carros" },
	["habanero"] = { ['name'] = "Habanero", ['price'] = 110000, ['tipo'] = "carros" },
	["seminole"] = { ['name'] = "Seminole", ['price'] = 110000, ['tipo'] = "carros" },
	["serrano"] = { ['name'] = "Serrano", ['price'] = 150000, ['tipo'] = "carros" },
	["xls"] = { ['name'] = "Xls", ['price'] = 150000, ['tipo'] = "carros" },
	["xls2"] = { ['name'] = "Xls2", ['price'] = 350000, ['tipo'] = "carros" },
	["asea"] = { ['name'] = "Asea", ['price'] = 55000, ['tipo'] = "carros" },
	["asterope"] = { ['name'] = "Asterope", ['price'] = 65000, ['tipo'] = "carros" },
	["cog552"] = { ['name'] = "Cog552", ['price'] = 400000, ['tipo'] = "carros" },
	["cognoscenti"] = { ['name'] = "Cognoscenti", ['price'] = 280000, ['tipo'] = "carros" },
	["cognoscenti2"] = { ['name'] = "Cognoscenti2", ['price'] = 400000, ['tipo'] = "carros" },
	["stanier"] = { ['name'] = "Stanier", ['price'] = 60000, ['tipo'] = "carros" },
	["stratum"] = { ['name'] = "Stratum", ['price'] = 90000, ['tipo'] = "carros" },
	["surge"] = { ['name'] = "Surge", ['price'] = 110000, ['tipo'] = "carros" },
	["tailgater"] = { ['name'] = "Tailgater", ['price'] = 110000, ['tipo'] = "carros" },
	["warrener"] = { ['name'] = "Warrener", ['price'] = 90000, ['tipo'] = "carros" },
	["washington"] = { ['name'] = "Washington", ['price'] = 130000, ['tipo'] = "carros" },
	["alpha"] = { ['name'] = "Alpha", ['price'] = 230000, ['tipo'] = "carros" },
	["banshee"] = { ['name'] = "Banshee", ['price'] = 300000, ['tipo'] = "carros" },
	["bestiagts"] = { ['name'] = "Bestiagts", ['price'] = 290000, ['tipo'] = "carros" },
	["blista2"] = { ['name'] = "Blista2", ['price'] = 55000, ['tipo'] = "carros" },
	["blista3"] = { ['name'] = "Blista3", ['price'] = 80000, ['tipo'] = "exclusive" },
	["buffalo"] = { ['name'] = "Buffalo", ['price'] = 300000, ['tipo'] = "carros" },
	["buffalo2"] = { ['name'] = "Buffalo2", ['price'] = 300000, ['tipo'] = "carros" },
	["buffalo3"] = { ['name'] = "Buffalo3", ['price'] = 300000, ['tipo'] = "exclusive" },
	["carbonizzare"] = { ['name'] = "Carbonizzare", ['price'] = 290000, ['tipo'] = "carros" },
	["comet2"] = { ['name'] = "Uno Escada", ['price'] = 250000, ['tipo'] = "carros" },
	["comet3"] = { ['name'] = "Comet3", ['price'] = 290000, ['tipo'] = "carros" },
	["comet5"] = { ['name'] = "Comet5", ['price'] = 300000, ['tipo'] = "carros" },
	["coquette"] = { ['name'] = "Coquette", ['price'] = 250000, ['tipo'] = "carros" },
	["elegy"] = { ['name'] = "Elegy", ['price'] = 350000, ['tipo'] = "carros" },
	["elegy2"] = { ['name'] = "Elegy2", ['price'] = 355000, ['tipo'] = "carros" },
	["feltzer2"] = { ['name'] = "Feltzer2", ['price'] = 255000, ['tipo'] = "carros" },
	["furoregt"] = { ['name'] = "Furoregt", ['price'] = 290000, ['tipo'] = "carros" },
	["fusilade"] = { ['name'] = "Fusilade", ['price'] = 210000, ['tipo'] = "carros" },
	["futo"] = { ['name'] = "Futo", ['price'] = 170000, ['tipo'] = "carros" },
	["jester"] = { ['name'] = "Jester", ['price'] = 150000, ['tipo'] = "carros" },
	["khamelion"] = { ['name'] = "Khamelion", ['price'] = 210000, ['tipo'] = "carros" },
	["kuruma"] = { ['name'] = "Kuruma", ['price'] = 330000, ['tipo'] = "carros" },
	["massacro"] = { ['name'] = "Massacro", ['price'] = 330000, ['tipo'] = "carros" },
	["massacro2"] = { ['name'] = "Massacro2", ['price'] = 330000, ['tipo'] = "exclusive" },
	["ninef"] = { ['name'] = "Ninef", ['price'] = 290000, ['tipo'] = "carros" },
	["ninef2"] = { ['name'] = "Ninef2", ['price'] = 290000, ['tipo'] = "carros" },
	["omnis"] = { ['name'] = "Omnis", ['price'] = 240000, ['tipo'] = "exclusive" },
	["pariah"] = { ['name'] = "Pariah", ['price'] = 500000, ['tipo'] = "carros" },
	["penumbra"] = { ['name'] = "Penumbra", ['price'] = 150000, ['tipo'] = "carros" },
	["raiden"] = { ['name'] = "Raiden", ['price'] = 240000, ['tipo'] = "carros" },
	["rapidgt"] = { ['name'] = "Rapidgt", ['price'] = 250000, ['tipo'] = "carros" },
	["rapidgt2"] = { ['name'] = "Rapidgt2", ['price'] = 300000, ['tipo'] = "carros" },
	["ruston"] = { ['name'] = "Ruston", ['price'] = 370000, ['tipo'] = "carros" },
	["schafter3"] = { ['name'] = "Schafter3", ['price'] = 275000, ['tipo'] = "carros" },
	["schafter4"] = { ['name'] = "Schafter4", ['price'] = 275000, ['tipo'] = "carros" },
	["schafter5"] = { ['name'] = "Schafter5", ['price'] = 275000, ['tipo'] = "carros" },
	["schwarzer"] = { ['name'] = "Schwarzer", ['price'] = 170000, ['tipo'] = "carros" },
	["sentinel3"] = { ['name'] = "Sentinel3", ['price'] = 170000, ['tipo'] = "carros" },
	["seven70"] = { ['name'] = "Seven70", ['price'] = 370000, ['tipo'] = "carros" },
	["specter"] = { ['name'] = "Specter", ['price'] = 320000, ['tipo'] = "carros" },
	["specter2"] = { ['name'] = "Specter2", ['price'] = 355000, ['tipo'] = "carros" },
	["streiter"] = { ['name'] = "Streiter", ['price'] = 250000, ['tipo'] = "carros" },
	["sultan"] = { ['name'] = "Sultan", ['price'] = 210000, ['tipo'] = "carros" },
	["surano"] = { ['name'] = "Surano", ['price'] = 310000, ['tipo'] = "carros" },
	["tampa2"] = { ['name'] = "Tampa2", ['price'] = 200000, ['tipo'] = "carros" },
	["tropos"] = { ['name'] = "Tropos", ['price'] = 170000, ['tipo'] = "carros" },
	["verlierer2"] = { ['name'] = "Verlierer2", ['price'] = 380000, ['tipo'] = "carros" },
	["btype2"] = { ['name'] = "Btype2", ['price'] = 460000, ['tipo'] = "carros" },
	["btype3"] = { ['name'] = "Btype3", ['price'] = 390000, ['tipo'] = "carros" },
	["casco"] = { ['name'] = "Casco", ['price'] = 355000, ['tipo'] = "carros" },
	["cheetah"] = { ['name'] = "Cheetah", ['price'] = 425000, ['tipo'] = "carros" },
	["coquette2"] = { ['name'] = "Coquette2", ['price'] = 285000, ['tipo'] = "carros" },
	["feltzer3"] = { ['name'] = "Feltzer3", ['price'] = 220000, ['tipo'] = "carros" },
	["gt500"] = { ['name'] = "Gt500", ['price'] = 250000, ['tipo'] = "carros" },
	["infernus2"] = { ['name'] = "Infernus2", ['price'] = 250000, ['tipo'] = "carros" },
	["jb700"] = { ['name'] = "Jb700", ['price'] = 220000, ['tipo'] = "exclusive" },
	["mamba"] = { ['name'] = "Mamba", ['price'] = 300000, ['tipo'] = "carros" },
	["manana"] = { ['name'] = "Manana", ['price'] = 130000, ['tipo'] = "carros" },
	["monroe"] = { ['name'] = "Monroe", ['price'] = 260000, ['tipo'] = "carros" },
	["peyote"] = { ['name'] = "Peyote", ['price'] = 150000, ['tipo'] = "carros" },
	["pigalle"] = { ['name'] = "Pigalle", ['price'] = 250000, ['tipo'] = "carros" },
	["rapidgt3"] = { ['name'] = "Rapidgt3", ['price'] = 220000, ['tipo'] = "carros" },
	["retinue"] = { ['name'] = "Retinue", ['price'] = 150000, ['tipo'] = "carros" },
	["stinger"] = { ['name'] = "Stinger", ['price'] = 220000, ['tipo'] = "carros" },
	["stingergt"] = { ['name'] = "Stingergt", ['price'] = 230000, ['tipo'] = "carros" },
	["torero"] = { ['name'] = "Torero", ['price'] = 160000, ['tipo'] = "carros" },
	["tornado"] = { ['name'] = "Tornado", ['price'] = 150000, ['tipo'] = "carros" },
	["tornado2"] = { ['name'] = "Tornado2", ['price'] = 160000, ['tipo'] = "carros" },
	["tornado6"] = { ['name'] = "Tornado6", ['price'] = 250000, ['tipo'] = "carros" },
	["turismo2"] = { ['name'] = "Turismo2", ['price'] = 250000, ['tipo'] = "carros" },
	["ztype"] = { ['name'] = "Ztype", ['price'] = 400000, ['tipo'] = "carros" },
	["adder"] = { ['name'] = "Adder", ['price'] = 620000, ['tipo'] = "carros" },
	["autarch"] = { ['name'] = "Autarch", ['price'] = 760000, ['tipo'] = "carros" },
	["banshee2"] = { ['name'] = "Banshee2", ['price'] = 370000, ['tipo'] = "carros" },
	["bullet"] = { ['name'] = "Bullet", ['price'] = 400000, ['tipo'] = "carros" },
	["cheetah2"] = { ['name'] = "Cheetah2", ['price'] = 240000, ['tipo'] = "carros" },
	["entityxf"] = { ['name'] = "Entityxf", ['price'] = 460000, ['tipo'] = "carros" },
	["fmj"] = { ['name'] = "Fmj", ['price'] = 520000, ['tipo'] = "carros" },
	["gp1"] = { ['name'] = "Gp1", ['price'] = 495000, ['tipo'] = "carros" },
	["infernus"] = { ['name'] = "Infernus", ['price'] = 470000, ['tipo'] = "carros" },
	["nero"] = { ['name'] = "Nero", ['price'] = 450000, ['tipo'] = "carros" },
	["nero2"] = { ['name'] = "Nero2", ['price'] = 480000, ['tipo'] = "carros" },
	["osiris"] = { ['name'] = "Osiris", ['price'] = 460000, ['tipo'] = "carros" },
	["penetrator"] = { ['name'] = "Penetrator", ['price'] = 480000, ['tipo'] = "carros" },
	["pfister811"] = { ['name'] = "Pfister811", ['price'] = 530000, ['tipo'] = "carros" },
	["reaper"] = { ['name'] = "Reaper", ['price'] = 620000, ['tipo'] = "carros" },
	["sc1"] = { ['name'] = "Sc1", ['price'] = 495000, ['tipo'] = "carros" },
	["sultanrs"] = { ['name'] = "Sultan RS", ['price'] = 450000, ['tipo'] = "carros" },
	["t20"] = { ['name'] = "T20", ['price'] = 670000, ['tipo'] = "carros" },
	["tempesta"] = { ['name'] = "Tempesta", ['price'] = 600000, ['tipo'] = "carros" },
	["turismor"] = { ['name'] = "Turismor", ['price'] = 620000, ['tipo'] = "carros" },
	["tyrus"] = { ['name'] = "Tyrus", ['price'] = 620000, ['tipo'] = "carros" },
	["vacca"] = { ['name'] = "Vacca", ['price'] = 620000, ['tipo'] = "carros" },
	["visione"] = { ['name'] = "Visione", ['price'] = 690000, ['tipo'] = "carros" },
	["voltic"] = { ['name'] = "Voltic", ['price'] = 440000, ['tipo'] = "carros" },
	["zentorno"] = { ['name'] = "Zentorno", ['price'] = 920000, ['tipo'] = "carros" },
	["sadler"] = { ['name'] = "Sadler", ['price'] = 180000, ['tipo'] = "carros" },
	["bison"] = { ['name'] = "Bison", ['price'] = 220000, ['tipo'] = "carros" },
	["bison2"] = { ['name'] = "Bison2", ['price'] = 180000, ['tipo'] = "carros" },
	["bobcatxl"] = { ['name'] = "Bobcatxl", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito"] = { ['name'] = "Burrito", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito2"] = { ['name'] = "Burrito2", ['price'] = 260000, ['tipo'] = "exclusive" },
	["burrito3"] = { ['name'] = "Burrito3", ['price'] = 260000, ['tipo'] = "exclusive" },
	["burrito4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "exclusive" },
	["mule4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["rallytruck"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "exclusive" },
	["minivan"] = { ['name'] = "Minivan", ['price'] = 110000, ['tipo'] = "carros" },
	["minivan2"] = { ['name'] = "Minivan2", ['price'] = 220000, ['tipo'] = "carros" },
	["paradise"] = { ['name'] = "Paradise", ['price'] = 260000, ['tipo'] = "exclusive" },
	["pony"] = { ['name'] = "Pony", ['price'] = 260000, ['tipo'] = "exclusive" },
	["pony2"] = { ['name'] = "Pony2", ['price'] = 260000, ['tipo'] = "exclusive" },
	["rumpo"] = { ['name'] = "Van Weazel", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo2"] = { ['name'] = "Rumpo2", ['price'] = 260000, ['tipo'] = "exclusive" },
	["rumpo3"] = { ['name'] = "Rumpo3", ['price'] = 350000, ['tipo'] = "exclusive" },
	["surfer"] = { ['name'] = "Surfer", ['price'] = 55000, ['tipo'] = "carros" },
	["youga"] = { ['name'] = "Youga", ['price'] = 260000, ['tipo'] = "carros" },
	["huntley"] = { ['name'] = "Huntley", ['price'] = 110000, ['tipo'] = "carros" },
	["landstalker"] = { ['name'] = "Landstalker", ['price'] = 130000, ['tipo'] = "carros" },
	["mesa"] = { ['name'] = "Mesa", ['price'] = 90000, ['tipo'] = "carros" },
	["patriot"] = { ['name'] = "Patriot", ['price'] = 250000, ['tipo'] = "carros" },
	["radi"] = { ['name'] = "Radi", ['price'] = 110000, ['tipo'] = "carros" },
	["rocoto"] = { ['name'] = "Rocoto", ['price'] = 110000, ['tipo'] = "carros" },
	["tyrant"] = { ['name'] = "Tyrant", ['price'] = 690000, ['tipo'] = "carros" },
	["entity2"] = { ['name'] = "Entity2", ['price'] = 550000, ['tipo'] = "carros" },
	["cheburek"] = { ['name'] = "Cheburek", ['price'] = 170000, ['tipo'] = "carros" },
	["hotring"] = { ['name'] = "Hotring", ['price'] = 300000, ['tipo'] = "exclusive" },
	["jester3"] = { ['name'] = "Jester3", ['price'] = 345000, ['tipo'] = "carros" },
	["flashgt"] = { ['name'] = "Flashgt", ['price'] = 370000, ['tipo'] = "carros" },
	["ellie"] = { ['name'] = "Ellie", ['price'] = 320000, ['tipo'] = "exclusive" },
	["michelli"] = { ['name'] = "Michelli", ['price'] = 160000, ['tipo'] = "carros" },
	["fagaloa"] = { ['name'] = "Fagaloa", ['price'] = 320000, ['tipo'] = "carros" },
	["dominator"] = { ['name'] = "Dominator", ['price'] = 230000, ['tipo'] = "carros" },
	["dominator2"] = { ['name'] = "Dominator2", ['price'] = 230000, ['tipo'] = "carros" },
	["dominator3"] = { ['name'] = "Dominator3", ['price'] = 370000, ['tipo'] = "carros" },
	["issi3"] = { ['name'] = "Issi3", ['price'] = 190000, ['tipo'] = "exclusive" },
	["taipan"] = { ['name'] = "Taipan", ['price'] = 620000, ['tipo'] = "carros" },
	["gb200"] = { ['name'] = "Gb200", ['price'] = 195000, ['tipo'] = "carros" },
	["stretch"] = { ['name'] = "Stretch", ['price'] = 520000, ['tipo'] = "carros" },
	["guardian"] = { ['name'] = "Guardian", ['price'] = 540000, ['tipo'] = "carros" },
	["kamacho"] = { ['name'] = "Kamacho", ['price'] = 460000, ['tipo'] = "exclusive" },
	["neon"] = { ['name'] = "Neon", ['price'] = 370000, ['tipo'] = "carros" },
	["cyclone"] = { ['name'] = "Cyclone", ['price'] = 920000, ['tipo'] = "carros" },
	["italigtb"] = { ['name'] = "Italigtb", ['price'] = 600000, ['tipo'] = "carros" },
	["italigtb2"] = { ['name'] = "Italigtb2", ['price'] = 610000, ['tipo'] = "carros" },
	["vagner"] = { ['name'] = "Vagner", ['price'] = 680000, ['tipo'] = "carros" },
	["xa21"] = { ['name'] = "Xa21", ['price'] = 630000, ['tipo'] = "carros" },
	["tezeract"] = { ['name'] = "Tezeract", ['price'] = 920000, ['tipo'] = "carros" },
	["prototipo"] = { ['name'] = "Prototipo", ['price'] = 1030000, ['tipo'] = "carros" },
	["patriot2"] = { ['name'] = "Patriot2", ['price'] = 550000, ['tipo'] = "carros" },
	["swinger"] = { ['name'] = "Swinger", ['price'] = 250000, ['tipo'] = "carros" },
	["clique"] = { ['name'] = "Clique", ['price'] = 360000, ['tipo'] = "carros" },
	["deveste"] = { ['name'] = "Deveste", ['price'] = 920000, ['tipo'] = "carros" },
	["deviant"] = { ['name'] = "Deviant", ['price'] = 370000, ['tipo'] = "exclusive" },
	["impaler"] = { ['name'] = "Impaler", ['price'] = 320000, ['tipo'] = "carros" },
	["italigto"] = { ['name'] = "Italigto", ['price'] = 800000, ['tipo'] = "carros" },
	["schlagen"] = { ['name'] = "Schlagen", ['price'] = 690000, ['tipo'] = "carros" },
	["toros"] = { ['name'] = "Toros", ['price'] = 520000, ['tipo'] = "carros" },
	["tulip"] = { ['name'] = "Tulip", ['price'] = 320000, ['tipo'] = "carros" },
	["vamos"] = { ['name'] = "Vamos", ['price'] = 320000, ['tipo'] = "carros" },
	["freecrawler"] = { ['name'] = "Freecrawler", ['price'] = 350000, ['tipo'] = "carros" },
	["fugitive"] = { ['name'] = "Fugitive", ['price'] = 50000, ['tipo'] = "carros" },
	["glendale"] = { ['name'] = "Glendale", ['price'] = 70000, ['tipo'] = "carros" },
	["intruder"] = { ['name'] = "Intruder", ['price'] = 60000, ['tipo'] = "carros" },
	["le7b"] = { ['name'] = "Le7b", ['price'] = 700000, ['tipo'] = "carros" },
	["lurcher"] = { ['name'] = "Lurcher", ['price'] = 150000, ['tipo'] = "carros" },
	["lynx"] = { ['name'] = "Lynx", ['price'] = 370000, ['tipo'] = "exclusive" },
	["phoenix"] = { ['name'] = "Phoenix", ['price'] = 250000, ['tipo'] = "exclusive" },
	["premier"] = { ['name'] = "Premier", ['price'] = 35000, ['tipo'] = "carros" },
	["raptor"] = { ['name'] = "Raptor", ['price'] = 300000, ['tipo'] = "carros" },
	["sheava"] = { ['name'] = "Sheava", ['price'] = 700000, ['tipo'] = "carros" },
	["z190"] = { ['name'] = "Z190", ['price'] = 350000, ['tipo'] = "carros" },

	--MOTOS
	
	["akuma"] = { ['name'] = "Akuma", ['price'] = 500000, ['tipo'] = "motos" },
	["avarus"] = { ['name'] = "Avarus", ['price'] = 440000, ['tipo'] = "motos" },
	["bagger"] = { ['name'] = "Bagger", ['price'] = 300000, ['tipo'] = "motos" },
	["bati"] = { ['name'] = "Bati", ['price'] = 370000, ['tipo'] = "motos" },
	["bati2"] = { ['name'] = "Bati2", ['price'] = 300000, ['tipo'] = "motos" },
	["bf400"] = { ['name'] = "Bf400", ['price'] = 320000, ['tipo'] = "motos" },
	["carbonrs"] = { ['name'] = "Carbonrs", ['price'] = 370000, ['tipo'] = "motos" },
	["chimera"] = { ['name'] = "Chimera", ['price'] = 345000, ['tipo'] = "motos" },
	["cliffhanger"] = { ['name'] = "Cliffhanger", ['price'] = 310000, ['tipo'] = "motos" },
	["daemon2"]  = { ['name'] = "Daemon2", ['price'] = 240000, ['tipo'] = "motos" },
	["defiler"] = { ['name'] = "Defiler", ['price'] = 460000, ['tipo'] = "motos" },
	["diablous"] = { ['name'] = "Diablous", ['price'] = 430000, ['tipo'] = "motos" },
	["diablous2"] = { ['name'] = "Diablous2", ['price'] = 460000, ['tipo'] = "motos" },
	["double"] = { ['name'] = "Double", ['price'] = 370000, ['tipo'] = "motos" },
	["enduro"] = { ['name'] = "Enduro", ['price'] = 195000, ['tipo'] = "motos" },
	["esskey"] = { ['name'] = "Esskey", ['price'] = 320000, ['tipo'] = "motos" },
	["faggio"] = { ['name'] = "Faggio", ['price'] = 4000, ['tipo'] = "motos" },
	["faggio2"] = { ['name'] = "Faggio2", ['price'] = 5000, ['tipo'] = "motos" },
	["faggio3"] = { ['name'] = "Faggio3", ['price'] = 5000, ['tipo'] = "motos" },
	["fcr"] = { ['name'] = "Fcr", ['price'] = 390000, ['tipo'] = "motos" },
	["fcr2"] = { ['name'] = "Fcr2", ['price'] = 390000, ['tipo'] = "motos" },
	["gargoyle"] = { ['name'] = "Gargoyle", ['price'] = 345000, ['tipo'] = "motos" },
	["hakuchou"] = { ['name'] = "Hakuchou", ['price'] = 380000, ['tipo'] = "motos" },
	["hakuchou2"] = { ['name'] = "Hakuchou2", ['price'] = 550000, ['tipo'] = "motos" },
	["hexer"] = { ['name'] = "Hexer", ['price'] = 250000, ['tipo'] = "motos" },
	["innovation"] = { ['name'] = "Innovation", ['price'] = 250000, ['tipo'] = "motos" },
	["lectro"] = { ['name'] = "Lectro", ['price'] = 380000, ['tipo'] = "motos" },
	["manchez"] = { ['name'] = "Manchez", ['price'] = 355000, ['tipo'] = "motos" },
	["nemesis"] = { ['name'] = "Nemesis", ['price'] = 345000, ['tipo'] = "motos" },
	["nightblade"] = { ['name'] = "Nightblade", ['price'] = 415000, ['tipo'] = "motos" },
	["pcj"] = { ['name'] = "Pcj", ['price'] = 230000, ['tipo'] = "motos" },
	["ruffian"] = { ['name'] = "Ruffian", ['price'] = 345000, ['tipo'] = "motos" },
	["sanchez"] = { ['name'] = "Sanchez", ['price'] = 185000, ['tipo'] = "motos" },
	["sanchez2"] = { ['name'] = "Sanchez2", ['price'] = 185000, ['tipo'] = "motos" },
	["sovereign"] = { ['name'] = "Sovereign", ['price'] = 285000, ['tipo'] = "motos" },
	["thrust"] = { ['name'] = "Thrust", ['price'] = 375000, ['tipo'] = "motos" },
	["vader"] = { ['name'] = "Vader", ['price'] = 345000, ['tipo'] = "motos" },
	["vindicator"] = { ['name'] = "Vindicator", ['price'] = 340000, ['tipo'] = "motos" },
	["vortex"] = { ['name'] = "Vortex", ['price'] = 375000, ['tipo'] = "motos" },
	["wolfsbane"] = { ['name'] = "Wolfsbane", ['price'] = 290000, ['tipo'] = "motos" },
	["zombiea"] = { ['name'] = "Zombiea", ['price'] = 290000, ['tipo'] = "motos" },
	["zombieb"] = { ['name'] = "Zombieb", ['price'] = 300000, ['tipo'] = "motos" },
	["shotaro"] = { ['name'] = "Shotaro", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["ratbike"] = { ['name'] = "Ratbike", ['price'] = 230000, ['tipo'] = "motos" },
	["blazer"] = { ['name'] = "Blazer", ['price'] = 230000, ['tipo'] = "motos" },
	["blazer4"] = { ['name'] = "Blazer4", ['price'] = 370000, ['tipo'] = "motos" },

	--MOTOS
	
	["25anos"] = { ['name'] = "Fan 160", ['price'] = 9750, ['tipo'] = "motos" },
	["bros"] = { ['name'] = "Bros 160", ['price'] = 7062, ['tipo'] = "motos" },
	["falcon"] = { ['name'] = "Falcon", ['price'] = 5196, ['tipo'] = "motos" },
	["hornet"] = { ['name'] = "Hornet", ['price'] = 21000, ['tipo'] = "motos" },
	["mt17"] = { ['name'] = "MT 09", ['price'] = 24500, ['tipo'] = "motos" },
	["sr1"] = { ['name'] = "S1000R Naked", ['price'] = 44500, ['tipo'] = "motos" },
	["160"]  = { ['name'] = "Titan Montadinha", ['price'] = 8250, ['tipo'] = "motos" },
	["150"] = { ['name'] = "CG 150", ['price'] = 5000, ['tipo'] = "motos" },
	["transalp"] = { ['name'] = "Transalp 700", ['price'] = 18500, ['tipo'] = "motos" },
	["CBTWISTER"] = { ['name'] = "Twister 250", ['price'] = 10000, ['tipo'] = "motos" },
	["xj6"] = { ['name'] = "Yamaha XJ6", ['price'] = 20500, ['tipo'] = "motos" },
	["xrepcr"] = { ['name'] = "Xre 300", ['price'] = 12500, ['tipo'] = "motos" },
	["xtz"] = { ['name'] = "XT 660", ['price'] = 17500, ['tipo'] = "motos" },
	["biz"] = { ['name'] = "Biz 125", ['price'] = 41000, ['tipo'] = "motos" },
	["pop110"] = { ['name'] = "POP 110", ['price'] = 4000, ['tipo'] = "motos" },
	["450crf"] = { ['name'] = "CRF 450", ['price'] = 4750, ['tipo'] = "motos" },
	["f800grau"] = { ['name'] = "F800 D Manobras", ['price'] = 8250, ['tipo'] = "motos" },
	["hornetgrau"] = { ['name'] = "Hornet D Manobras", ['price'] = 5750, ['tipo'] = "motos" },
	["nmax"] = { ['name'] = "NMAX 160", ['price'] = 8250, ['tipo'] = "motos" },
	["fazer250"] = { ['name'] = "Fazer 250", ['price'] = 5750, ['tipo'] = "motos" },
	["start"] = { ['name'] = "Start 160", ['price'] = 5750, ['tipo'] = "motos" },
	["Africa"] = { ['name'] = "Africa Twin", ['price'] = 5750, ['tipo'] = "motos" },

    ---------- VIP`S

	--["acsr"] = { ['name'] = "AGUERA", ['price'] = 250000, ['tipo'] = "carros" },
	["r820"] = { ['name'] = "AUDI R8", ['price'] = 100000, ['tipo'] = "carros" },
	["BentleyContinental"] = { ['name'] = "BENTLEY CONTINENTAL", ['price'] = 100000, ['tipo'] = "carros" },
	["bmwi8"] = { ['name'] = "BMW i8", ['price'] = 100000, ['tipo'] = "import" },
	["chiron17"] = { ['name'] = "BUGATTI CHIRON", ['price'] = 100000, ['tipo'] = "carros" },
	["Carreta"] = { ['name'] = "CARRETA", ['price'] = 100000, ['tipo'] = "carros" },
	["Treme"] = { ['name'] = "PAREDAO TREME", ['price'] = 100000, ['tipo'] = "carros" },
	["TremeTreme"] = { ['name'] = "PAREDAO TREME TREME", ['price'] = 100000, ['tipo'] = "carros" },
	["fxxk"] = { ['name'] = "FERRARI FXXK", ['price'] = 100000, ['tipo'] = "carros" },
	["Hilux2019"] = { ['name'] = "HILLUX", ['price'] = 100000, ['tipo'] = "carros" },
	["PAREDAOG8"] = { ['name'] = "PAREDAO G8", ['price'] = 100000, ['tipo'] = "carros" },
	["SomHulk"] = { ['name'] = "SOM", ['price'] = 100000, ['tipo'] = "carros" },
	["lp610"] = { ['name'] = "LAMBORGHINI 610", ['price'] = 100000, ['tipo'] = "carros" },
	["m3kean"] = { ['name'] = "Bmw M3", ['price'] = 100000, ['tipo'] = "carros" },
	["aperta"] = { ['name'] = "LA FERRARI", ['price'] = 100000, ['tipo'] = "carros" },
	["mclarenp1"] = { ['name'] = "MC LAREN P1", ['price'] = 100000, ['tipo'] = "carros" },
	["675lt"] = { ['name'] = "MCLAREN 675LT", ['price'] = 100000, ['tipo'] = "carros" },
	["gtr"] = { ['name'] = "NISSAN GTR", ['price'] = 100000, ['tipo'] = "carros" },
	["urus"] = { ['name'] = "LAMBORGHINI URUS", ['price'] = 100000, ['tipo'] = "carros" },
	["veneno"] = { ['name'] = "Lamborghini Aventador", ['price'] = 100000, ['tipo'] = "carros" },
	["ferrariitalia"] = { ['name'] = "FERRARI ITALIA", ['price'] = 100000, ['tipo'] = "carros" },
	["lamborghinihuracan"] = { ['name'] = "LAMBORGHINI HURACAN", ['price'] = 100000, ['tipo'] = "carros" },
	["teslaprior"] = { ['name'] = "TESLA PRIOR", ['price'] = 100000, ['tipo'] = "carros" },
	["evoque"] = { ['name'] = "LAND ROVER EVOQUE", ['price'] = 100000, ['tipo'] = "carros" },
	["s1000docandidato"] = { ['name'] = "BMW S1000RR", ['price'] = 100000, ['tipo'] = "carros" },
	["tiger"] = { ['name'] = "TIGER 800", ['price'] = 100000, ['tipo'] = "carros" },
	["R1200GS"] = { ['name'] = "Bmw R1200GS", ['price'] = 100000, ['tipo'] = "carros" },
	["cbr"] = { ['name'] = "CBR 1000", ['price'] = 100000, ['tipo'] = "carros" },
	["xjturbo"] = { ['name'] = "YAMAHA XJ6 TURBO", ['price'] = 100000, ['tipo'] = "carros" },
	["r1m"] = { ['name'] = "R1 Jhow", ['price'] = 100000, ['tipo'] = "carros" },
	["m4lean"] = { ['name'] = "Bmw Kabuto", ['price'] = 100000, ['tipo'] = "carros" },
	["cayenne"] = { ['name'] = "Porsche Cayenne", ['price'] = 100000, ['tipo'] = "carros" },
	["ramlh20"] = { ['name'] = "Dodge Ram", ['price'] = 100000, ['tipo'] = "carros" },
	["x6m"] = { ['name'] = "Bmw X6M", ['price'] = 100000, ['tipo'] = "carros" },
	["cbb"] = { ['name'] = "CB 1000", ['price'] = 100000, ['tipo'] = "carros" },
	["manchez"] = { ['name'] = "S1000 XR", ['price'] = 100000, ['tipo'] = "carros" },
	["stretch"] = { ['name'] = "Limousine", ['price'] = 100000, ['tipo'] = "carros" },

	["tanker2"] = { ['name'] = "CARGA 1", ['price'] = 1000, ['tipo'] = "work" },	
	["armytanker"] = { ['name'] = "CARGA 2", ['price'] = 1000, ['tipo'] = "work" },	
	["tvtrailer"] = { ['name'] = "CARGA 3", ['price'] = 1000, ['tipo'] = "work" },	
	["trailerlogs"] = { ['name'] = "CARGA 4", ['price'] = 1000, ['tipo'] = "work" },	
	["tr4"] = { ['name'] = "CARGA 5", ['price'] = 1000, ['tipo'] = "work" },	
    -----------------------VIATURAS

	["golpmesp"] = { ['name'] = "GOL PMESP", ['price'] = 1000, ['tipo'] = "work" },	
	["paliopmrp1"] = { ['name'] = "PALIO PMESP", ['price'] = 1000, ['tipo'] = "work" },
	["as350"] = { ['name'] = "HELICOPTERO PMESP", ['price'] = 1000, ['tipo'] = "work" },
	--["xtrocam"] = { ['name'] = "XT660 PMESP", ['price'] = 1000, ['tipo'] = "work" },
	["spinpmesp"] = { ['name'] = "SPIN PMESP", ['price'] = 1000, ['tipo'] = "work" },
	["policeb"] = { ['name'] = "BMW PMESP", ['price'] = 1000, ['tipo'] = "work" },
	["trailcfp"] = { ['name'] = "TRIAL PMESP", ['price'] = 1000, ['tipo'] = "work" },
	["riot"] = { ['name'] = "Caveirao PMESP", ['price'] = 1000, ['tipo'] = "work" },

	----------------------CIVIL
	
	["spinrp4"] = { ['name'] = "SPIN CIVIL", ['price'] = 1000, ['tipo'] = "work" },	
	["sw4pc1"] = { ['name'] = "SW4 CIVIL", ['price'] = 1000, ['tipo'] = "work" },
	["trail19goe"] = { ['name'] = "TRAILBLAZER GOE", ['price'] = 1000, ['tipo'] = "work" },
	["trailcivileie"] = { ['name'] = "TRAILBLAZER CIVIL", ['price'] = 1000, ['tipo'] = "work" },
	["trailgarra1"] = { ['name'] = "TRAILBLAZER GARRA", ['price'] = 1000, ['tipo'] = "work" },

    -----------------------ROTA
	
	["sw4revrota1"] = { ['name'] = "SW4 ROTA", ['price'] = 1000, ['tipo'] = "work" },	
	["trailrota2"] = { ['name'] = "TRAIL ROTA", ['price'] = 1000, ['tipo'] = "work" },
	["rota4"] = { ['name'] = "TRAIL ROTA 2", ['price'] = 1000, ['tipo'] = "work" },

	-----------------------PF	

	["hiluxpf"] = { ['name'] = "HILUX PF", ['price'] = 1000, ['tipo'] = "work" },	
	["trailpf"] = { ['name'] = "TRAIL PF", ['price'] = 1000, ['tipo'] = "work" },
	["2015polstang"] = { ['name'] = "MUSTANG PF", ['price'] = 1000, ['tipo'] = "work" },
	["supervolito"] = { ['name'] = "HELI PF", ['price'] = 1000, ['tipo'] = "work" },

	-----------------------Samu	
	
	["speedo2"] = { ['name'] = "RABECAO SAMU", ['price'] = 1000, ['tipo'] = "work" },	
	["motosamu"] = { ['name'] = "BMW SAMU", ['price'] = 1000, ['tipo'] = "work" },	
	["ambulance"] = { ['name'] = "AMBULANCIA SAMU", ['price'] = 1000, ['tipo'] = "work" },
	["samumav"] = { ['name'] = "HELICOPTERO SAMU", ['price'] = 1000, ['tipo'] = "work" },		
	
	-----------------------INSANE NEWS
	["rumpo"] = { ['name'] = "Van NEWS", ['price'] = 1000, ['tipo'] = "work" },		
		
   ---------------EMPREGOS

   ["volatus"] = { ['name'] = "Volatus", ['price'] = 1000, ['tipo'] = "work" },	
   ["cargobob2"] = { ['name'] = "Cargobob", ['price'] = 1000, ['tipo'] = "work" },	
   ["picador"] = { ['name'] = "Entrega Gas", ['price'] = 1000, ['tipo'] = "work" },	
   ["comet2"] = { ['name'] = "SP Luz", ['price'] = 1000, ['tipo'] = "work" },	
   ["flatbed3"] = { ['name'] = "Guincho", ['price'] = 1000, ['tipo'] = "work" },	
   ["towtruck"] = { ['name'] = "Guincho 2", ['price'] = 1000, ['tipo'] = "work" },	
   ["towtruck2"] = { ['name'] = "Guincho PMESP", ['price'] = 1000, ['tipo'] = "work" },	
   ["taxi"] = { ['name'] = "Taxi", ['price'] = 1000, ['tipo'] = "work" },	
   ["coach"] = { ['name'] = "Onibus", ['price'] = 1000, ['tipo'] = "work" },	
   ["bus"] = { ['name'] = "Onibus", ['price'] = 1000, ['tipo'] = "work" },	
   ["boxville4"] = { ['name'] = "Carro Carteiro", ['price'] = 1000, ['tipo'] = "work" },	
   ["tribike3"] = { ['name'] = "Bike Carteiro", ['price'] = 1000, ['tipo'] = "work" },	
   ["trash2"] = { ['name'] = "Caminhao Lixeiro", ['price'] = 1000, ['tipo'] = "work" },
   ["tiptruck"] = { ['name'] = "Caminhao Minerador", ['price'] = 1000, ['tipo'] = "work" },	
   ["ratloader"] = { ['name'] = "Carro Lenhador", ['price'] = 1000, ['tipo'] = "work" },	
   ["youga2"] = { ['name'] = "Van Lenhador", ['price'] = 1000, ['tipo'] = "work" },	
   ["rebel"] = { ['name'] = "Frete", ['price'] = 1000, ['tipo'] = "work" },
   ["rumpo"] = { ['name'] = "Insane News", ['price'] = 920000, ['tipo'] = "carros" },
   ["ratloader"] = { ['name'] = "Carro Lenhador", ['price'] = 1000, ['tipo'] = "work" },	
   ["youga2"] = { ['name'] = "Van Lenhador", ['price'] = 1000, ['tipo'] = "work" },	
   ["rebel"] = { ['name'] = "Frete", ['price'] = 1000, ['tipo'] = "work" },
   ["rumpo"] = { ['name'] = "Van Insane News", ['price'] = 1000, ['tipo'] = "carros" },
   ["frogger"] = { ['name'] = "Heli Insane News", ['price'] = 1000, ['tipo'] = "carros" },
   ["surge"] = { ['name'] = "Tesla", ['price'] = 1000, ['tipo'] = "carros" },
   ["phantom3"] = { ['name'] = "Caminhao 1", ['price'] = 1000, ['tipo'] = "carros" },
   ["hauler"] = { ['name'] = "Caminhao 2", ['price'] = 1000, ['tipo'] = "carros" },
   ["hauler2"] = { ['name'] = "Caminhao 3", ['price'] = 1000, ['tipo'] = "carros" },
   ["scorcher"] = { ['name'] = "Bicicleta 1", ['price'] = 1000, ['tipo'] = "carros" },
   ["tribike"] = { ['name'] = "Bicicleta 2", ['price'] = 1000, ['tipo'] = "carros" },
   ["tribike2"] = { ['name'] = "Bicicleta 3", ['price'] = 1000, ['tipo'] = "carros" },
   ["tribike3"] = { ['name'] = "Bicicleta 4", ['price'] = 1000, ['tipo'] = "carros" },
   ["fixter"] = { ['name'] = "Bicicleta 5", ['price'] = 1000, ['tipo'] = "carros" },
   ["cruiser"] = { ['name'] = "Bicicleta 6", ['price'] = 1000, ['tipo'] = "carros" },
   ["bmx"] = { ['name'] = "Bicicleta 7", ['price'] = 1000, ['tipo'] = "carros" },
   ["tractor2"] = { ['name'] = "Trator", ['price'] = 1000, ['tipo'] = "carros" },
   ["rebel"] = { ['name'] = "Caminhonete", ['price'] = 1000, ['tipo'] = "carros" },
   ["mi4"] = { ['name'] = "Onibus", ['price'] = 1000, ['tipo'] = "work" },
   ["rangerrota"] = { ['name'] = "RANGER ROTA", ['price'] = 1000, ['tipo'] = "work" },
   ["as350rota"] = { ['name'] = "Helicoptero ROTA", ['price'] = 1000, ['tipo'] = "work" },
   ["helipc"] = { ['name'] = "Helicoptero PC", ['price'] = 1000, ['tipo'] = "work" },
   ["bate"] = { ['name'] = "Bate Bate", ['price'] = 1000, ['tipo'] = "work" },
   ["tug"] = { ['name'] = "Pescador", ['price'] = 1000, ['tipo'] = "work" },

   ------------------------------ Helicoptero e Barcos VIP ------------------------------
   ["dinghy"] = { ['name'] = "Barco de Pesca", ['price'] = 1000, ['tipo'] = "work" },
   ["jetmax"] = { ['name'] = "Jetmax", ['price'] = 1000, ['tipo'] = "work" },
   ["marquis"] = { ['name'] = "Marquis", ['price'] = 1000, ['tipo'] = "work" },
   ["seashark3"] = { ['name'] = "Seashark3", ['price'] = 1000, ['tipo'] = "work" },
   ["speeder"] = { ['name'] = "Speeder", ['price'] = 1000, ['tipo'] = "work" },
   ["speeder2"] = { ['name'] = "Speeder2", ['price'] = 1000, ['tipo'] = "work" },
   ["surfboard"] = { ['name'] = "Prancha de Surf", ['price'] = 2000, ['tipo'] = "work" },
   ["squalo"] = { ['name'] = "Squalo", ['price'] = 1000, ['tipo'] = "work" },
   ["suntrap"] = { ['name'] = "Suntrap", ['price'] = 1000, ['tipo'] = "work" },
   ["toro"] = { ['name'] = "Toro", ['price'] = 1000, ['tipo'] = "work" },
   ["toro2"] = { ['name'] = "Toro2", ['price'] = 1000, ['tipo'] = "work" },
   ["tropic"] = { ['name'] = "Tropic", ['price'] = 1000, ['tipo'] = "work" },
   ["tropic2"] = { ['name'] = "Tropic2", ['price'] = 1000, ['tipo'] = "work" },
   ["packer"] = { ['name'] = "Packer", ['price'] = 1000, ['tipo'] = "work" },
   ["supervolito"] = { ['name'] = "Supervolito", ['price'] = 1000, ['tipo'] = "work" },
   ["supervolito2"] = { ['name'] = "Supervolito2", ['price'] = 1000, ['tipo'] = "work" },
   ["cuban800"] = { ['name'] = "Cuban800", ['price'] = 1000, ['tipo'] = "work" },
   ["mammatus"] = { ['name'] = "Mammatus", ['price'] = 1000, ['tipo'] = "work" },
   ["vestra"] = { ['name'] = "Vestra", ['price'] = 1000, ['tipo'] = "work" },
   ["velum2"] = { ['name'] = "Velum2", ['price'] = 1000, ['tipo'] = "work" },
   ["buzzard2"] = { ['name'] = "Buzzard2", ['price'] = 1000, ['tipo'] = "work" },
   ["btsupra94"] = { ['name'] = "Supra Furiosos", ['price'] = 1000, ['tipo'] = "work" },
   ["trans69"] = { ['name'] = "Pontiac", ['price'] = 1000, ['tipo'] = "work" },
   ["dodge"] = { ['name'] = "Dodge", ['price'] = 1000, ['tipo'] = "work" },
   ["gt3"] = { ['name'] = "Bentley GT3", ['price'] = 1000, ['tipo'] = "work" },
   ["burrito4"] = { ['name'] = "Oficina do Kabutinho", ['price'] = 1000, ['tipo'] = "work" },
   ["guaxinim"] = { ['name'] = "Carro do Guaxinim", ['price'] = 1000, ['tipo'] = "work" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleGlobal()
	return vehglobal
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLENAME
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleName(vname)
	return vehglobal[vname].name
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEPRICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehiclePrice(vname)
	return vehglobal[vname].price
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleType(vname)
	return vehglobal[vname].tipo
end

function vRP.openChest2(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					if amount > 0 and amount <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*amount
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,amount)
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							citem.amount = citem.amount - amount

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,amount)
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.")
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.")
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*amount
					if new_weight <= max_weight then
						if amount > 0 and vRP.tryGetInventoryItem(user_id,idname,amount) then
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + amount
							else
								chest.items[idname] = { amount = amount }
							end

							if cb_in then
								cb_in(idname,amount)
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.")
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count+1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","O baú está sendo utilizado no momento.")
			end
		end
	end
end