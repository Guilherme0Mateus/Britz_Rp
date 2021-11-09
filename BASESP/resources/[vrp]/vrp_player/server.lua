local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local idgens = Tools.newIDGenerator()

src = {}
Tunnel.bindInterface("vrp_player",src)

vDIAGNOSTIC = Tunnel.getInterface("vrp_diagnostic")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ WEBHOOK ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookenviardinheiro = ""
local webhookgarmas = ""
local webhooksaquear = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CHECK ROUPAS ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"insanesuper.paycheck") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ITEMLIST ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários legais ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["mochila"] = { index = "mochila", nome = "Mochila" },
	["celular"] = { index = "celular", nome = "iFruit XI" },
	["radio"] = { index = "radio", nome = "WalkTalk" },
	["mascara"] = { index = "mascara", nome = "Mascara" },
	["identidade"] = { index = "identidade", nome = "Identidade" },
	["colete"] = { index = "colete", nome = "Colete Balístico" },
	["militec"] = { index = "militec", nome = "Militec" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["roupas"] = { index = "roupas", nome = "Roupas", },
	["pecadearma"] = { index = "pecadearma", nome = "Peça De Arma", },
	["alianca"] = { index = "alianca", nome = "Aliança" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["tequila"] = { index = "tequila", nome = "Tequila" },
	["vodka"] = { index = "vodka", nome = "Vodka" },
	["whisky"] = { index = "whisky", nome = "Whisky" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite" },
	["agua"] = { index = "agua", nome = "Água" },
	["limonada"] = { index = "limonada", nome = "Limonada" },
	["refrigerante"] = { index = "refrigerante", nome = "Refrigerante" },
	["cafe"] = { index = "cafe", nome = "Café" },
	["pao"] = { index = "pao", nome = "Pão" },
	["chocolate"] = { index = "chocolate", nome = "chocolate" },
	["salgadinho"] = { index = "salgadinho", nome = "salgadinho" },
	["rosquinha"] = { index = "rosquinha", nome = "rosquinha" },
	["sanduiche"] = { index = "sanduiche", nome = "sanduiche" },
	["pizza"] = { index = "pizza", nome = "pizza" },
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários Ilegais]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["algema"] = { index = "algema", nome = "Algema" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["placa"] = { index = "placa", nome = "Placa" },
	["c4"] = { index = "c4", nome = "C4" },
	["pendrive"] = { index = "pendrive", nome = "Pen Drive" },
	["serra"] = { index = "serra", nome = "Serra" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	---------------------------------------------------------------------------------------------------
	--[ Empregos ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de lixo" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["laranja"] = { index = "laranja", nome = "Laranja", },
	["lanche"] = { index = "lanche", nome = "Tacos", },
	["graos"] = { index = "graos", nome = "Graos" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros" },
	---------------------------------------------------------------------------------------------------
	--[ Bebidas Não Alcoólicas ]-----------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["energetico"] = { index = "energetico", nome = "Energético" },
	--[ PESCARIA]
	["dourado"] = { index = "dourado", nome = "Dourado" },
	["corvina"] = { index = "corvina", nome = "Corvina" },
	["salmao"] = { index = "salmao", nome = "Salmão" },
	["pacu"] = { index = "pacu", nome = "Pacu" },
	["pintado"] = { index = "pintado", nome = "Pintado" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré" },
	["lambari"] = { index = "lambari", nome = "Lambari" },
	["isca"] = { index = "isca", nome = "Isca" },
	---[MINERADOR]-------------------------------------------------------------------------------
	["mouro"] = { index = "ouro", nome = "Ouro" },
	["mbronze"] = { index = "bronze", nome = "Bronze" },
	["mferro"] = { index = "ferro", nome = "Ferro" },
	["mrubi"] = { index = "rubi", nome = "Rubi" },
	["mesmeralda"] = { index = "esmeralda", nome = "Esmeralda" },
	["diamante"] = { index = "diamante", nome = "Diamante" },
	---------------------------------------------------------------------------------------------------
	--[ Remédios ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	-----------------------------------------------GAZ
	["BotijaoVazio"] = { index = "gaz", nome = "Botijao Vazio" },
	["BotijaoCheio"] = { index = "gaz", nome = "Botijao Cheio" },
	---------------------------------------------------------------------------------------------------
	["paracetamil"] = { index = "paracetamil", nome = "Paracetamil" },
	["voltarom"] = { index = "voltarom", nome = "Voltarom" },
	["trandrylux"] = { index = "trandrylux", nome = "Trandrylux" },
	["dorfrex"] = { index = "dorfrex", nome = "Dorfrex" },
	["buscopom"] = { index = "buscopom", nome = "Buscopom" },
	--------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 01 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["meta-alta"] = { index = "meta-alta", nome = "Metanfetamina HQ" }, -- 8 Processos;
	--[ Sub produto ]----------------------------------------------------------------------------------
	["composito-alta"] = { index = "composito-alta", nome = "Anfetamina" },
	--[ Ingredientes ]---------------------------------------------------------------------------------
	["nitrato-amonia"] = { index = "nitrato-amonia", nome = "Nitrato de Amônia" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["coca-alta"] = { index = "coca-alta", nome = "Cocaina" }, -- 8 Processos;
	--[ Sub produto ]----------------------------------------------------------------------------------
	["pasta-alta"] = { index = "pasta-alta", nome = "Pasta de Coca" },
	--[ Ingredientes ]---------------------------------------------------------------------------------
	["folhas-coca"] = { index = "folhas-coca", nome = "Folhas de Coca" },

	["folhas-haxixi"] = { index = "folhas-haxixi", nome = "Folhas de Haxixi" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Maconha ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["maconha-alta"] = { index = "maconha-alta", nome = "Maconha" },
	--[ Sub produto ]----------------------------------------
	["maconha-dichavada"] = { index = "maconha-dichavada", nome = "Maconha Dichavada" },
	["canabis-alta"] = { index = "canabis-alta", nome = "Cannabis sativa HQ" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["molas"] = { index = "molas", nome = "Molas" },
	["placa-metal"] = { index = "placa-metal", nome = "Placa de Metal" },
	["gatilho"] = { index = "gatilho", nome = "Gatilho", },
	["capsulas"] = { index = "capsulas", nome = "Capsulas" },
	["polvora"] = { index = "polvora", nome = "Polvora" },
	---------------------------------------------------------------------------------------------------
	--[ ARMAS / OUTROS ]-------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	---------------------------------------------------------------------------------------------------
	--[ CORPO A CORPO ]--------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
    ---------------------------------------------------------------------------------------------------
    --[ PISTOLA ]-------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },
    ["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
    ["wbody|WEAPON_SNSPISTOL"] = { index = "pistolhk", nome = "Pistol HK" },
    ["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser" },
    ---------------------------------------------------------------------------------------------------
    --[ FUZIL ]----------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak47", nome = "AK-47" },
    ["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a4", nome = "M4A4", },
    ["wbody|WEAPON_SPECIALCARBINE"] = { index = "m4spec", nome = "M4 SPEC", },
    ---------------------------------------------------------------------------------------------------
    --[ SMG ]------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5" },
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9", },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX", },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44", },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar", nome = "MTAR-21", },
	---------------------------------------------------------------------------------------------------
	--[ SHOTGUN ]--------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	---------------------------------------------------------------------------------------------------
	--[ RIFLES ]---------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
    ---------------------------------------------------------------------------------------------------
    --[ MUNIÇÕES ]-------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas" },
    ["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" },
    ["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador" },
    ["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor" },
    ["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19" },
    ["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven" },
    ["wammo|WEAPON_SNSPISTOL"] = { index = "m-pistolhk", nome = "M.Pistol HK" },
    ["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser" },
    ["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak47", nome = "M.AK47", },
    ["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a4", nome = "M.M4A4", },
    ["wammo|WEAPON_SPECIALCARBINE"] = { index = "m-m4spec", nome = "M.M4 Spec", },
    ["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5" },
    ["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.TEC-9", },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870" },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer MPX" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "M.MTAR-21" },
    ["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ITEM ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mindmaster.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))

			local nomeItem = itemlist[args[1]]
			local quantItem = parseInt(args[2])
			
			PerformHttpRequest(logAdminItem, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE COMANDO /ITEM:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://i.imgur.com/PnvMzHA.png"
						}, 
						fields = {
							{ 
								name = "**Quem pegou:**", 
								value = "` "..identity.name.." "..identity.firstname.." ` "
							},
							{ 
								name = "**Nº de Passaporte:**", 
								value = "` "..user_id.." ` "
							},
							{ 
								name = "**Item:**", 
								value = "` "..nomeItem.." ` "
							},
							{ 
								name = "**Quantidade:**", 
								value = "` "..quantItem.." `\n⠀"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://i.imgur.com/PnvMzHA.png" 
						},
						color = 15914080 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ USER VEHS [ADMIN]]-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"admin.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ RESKIN ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reskin',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
	vRPclient._setCustomization(vRPclient.getCustomization(source))		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ID ]---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SALÁRIO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local salarios = {
	-----------------POLICIA CIVIL
	{ ['permissao'] = "agentepc.paycheck", ['nome'] = "Agente PC", ['payment'] = 9900 },
	{ ['permissao'] = "investigador.paycheck", ['nome'] = "Investigador PC", ['payment'] = 14300 },
	{ ['permissao'] = "delegado.paycheck", ['nome'] = "Delegado PC", ['payment'] = 17600 },

	------------------JUIZ
	{ ['permissao'] = "juiz.paycheck", ['nome'] = "Juiz", ['payment'] = 30000 },
	{ ['permissao'] = "advogado.paycheck", ['nome'] = "Advogado", ['payment'] = 8000 },

	------------------mec
	{ ['permissao'] = "donomec.paycheck", ['nome'] = "DONO MEC", ['payment'] = 8000 },
	{ ['permissao'] = "gerentemec.paycheck", ['nome'] = "GERENTE MEC", ['payment'] = 7000 },
	{ ['permissao'] = "mec.paycheck", ['nome'] = "MECANICO", ['payment'] = 5000 },

	---------------PREFEITURA
	{ ['permissao'] = "prefeito.paycheck", ['nome'] = "Prefeito", ['payment'] = 10000 },
	{ ['permissao'] = "chefe.paycheck", ['nome'] = "Chefe Seguranca", ['payment'] = 8000 },
	{ ['permissao'] = "subchefe.paycheck", ['nome'] = "SubChefe Seguranca", ['payment'] = 6500 },
	{ ['permissao'] = "seguranca.paycheck", ['nome'] = "Seguranca", ['payment'] = 5000 },

    --------REPORTAGEM
	{ ['permissao'] = "chefenews.paycheck", ['nome'] = "Chefe insaneNews", ['payment'] = 30000 },
	{ ['permissao'] = "insanenews.paycheck", ['nome'] = "insane News", ['payment'] = 20000 },


	--------------------SAMU
	{ ['permissao'] = "enfermeiro.paycheck", ['nome'] = "Enfermeiro SAMU", ['payment'] = 14800 },
	{ ['permissao'] = "paramedico.paycheck", ['nome'] = "Paramedico SAMU", ['payment'] = 16500 },
	{ ['permissao'] = "medico.paycheck", ['nome'] = "Medico SAMU", ['payment'] = 16900 },
	{ ['permissao'] = "psicologo.paycheck", ['nome'] = "Psicologo SAMU", ['payment'] = 21000 },
	{ ['permissao'] = "subdiretor.paycheck", ['nome'] = "SubDiretor SAMU", ['payment'] = 22500 },
	{ ['permissao'] = "diretor.paycheck", ['nome'] = "Diretor SAMU", ['payment'] = 25800 },

	-----------------POLICIA MILITAR
	{ ['permissao'] = "recrutapmesp.paycheck", ['nome'] = "Recruta pmesp", ['payment'] = 7150 },
	{ ['permissao'] = "soldadopmesp.paycheck", ['nome'] = "Soldado pmesp", ['payment'] = 9790 },
	{ ['permissao'] = "cabopmesp.paycheck", ['nome'] = "Cabo pmesp", ['payment'] = 10340 },
	{ ['permissao'] = "sargentopmesp.paycheck", ['nome'] = "Sargento pmesp", ['payment'] = 12870 },
	{ ['permissao'] = "subtenentepmesp.paycheck", ['nome'] = "SubTenente pmesp", ['payment'] = 13156 },
	{ ['permissao'] = "tenentepmesp.paycheck", ['nome'] = "Tenente pmesp", ['payment'] = 13420 },
	{ ['permissao'] = "capitaopmesp.paycheck", ['nome'] = "Capitao pmesp", ['payment'] = 14300 },
	{ ['permissao'] = "majorpmesp.paycheck", ['nome'] = "Major pmesp", ['payment'] = 15180 },
	{ ['permissao'] = "tencoronelpmesp.paycheck", ['nome'] = "Tenente Coronel pmesp", ['payment'] = 16500 },
	{ ['permissao'] = "coronelpmesp.paycheck", ['nome'] = "Coronel pmesp", ['payment'] = 18040 },
	{ ['permissao'] = "comandantepmesp.paycheck", ['nome'] = "Comandante pmesp", ['payment'] = 19800 },

	--------------RONDAS OSTENSIVAS
	{ ['permissao'] = "soldadorota.paycheck", ['nome'] = "Soldado rota", ['payment'] = 9790 },
	{ ['permissao'] = "caborota.paycheck", ['nome'] = "Cabo rota", ['payment'] = 10560 },
	{ ['permissao'] = "sargentorota.paycheck", ['nome'] = "Sargento rota", ['payment'] = 12100 },
	{ ['permissao'] = "tenenterota.paycheck", ['nome'] = "Tenente rota", ['payment'] = 12760 },
	{ ['permissao'] = "capitaorota.paycheck", ['nome'] = "Capitao rota", ['payment'] = 14300 },
	{ ['permissao'] = "majorrota.paycheck", ['nome'] = "Major rota", ['payment'] = 15840 },
	{ ['permissao'] = "tencoronelrota.paycheck", ['nome'] = "Tenente Coronel rota", ['payment'] = 17160 },
	{ ['permissao'] = "coronelrota.paycheck", ['nome'] = "Coronel rota", ['payment'] = 19360 },
	{ ['permissao'] = "comandanterota.paycheck", ['nome'] = "Comandante rota", ['payment'] = 21560 },

	--------------PC E PF
	{ ['permissao'] = "agentepc.paycheck", ['nome'] = "AGENTE PC", ['payment'] = 9790 },
	{ ['permissao'] = "investigador.paycheck", ['nome'] = "INVESTIGADOR PC", ['payment'] = 10560 },
	{ ['permissao'] = "delegado.paycheck", ['nome'] = "DELEGADO PC", ['payment'] = 25000 },
	{ ['permissao'] = "agentepf.paycheck", ['nome'] = "AGENTE PF", ['payment'] = 12760 },
	{ ['permissao'] = "investigadorpf.paycheck", ['nome'] = "INVESTIGADOR PF", ['payment'] = 14300 },
	{ ['permissao'] = "delegadopf.paycheck", ['nome'] = "DELEGADO PF", ['payment'] = 25000 },
	{ ['permissao'] = "tencoronelbope.paycheck", ['nome'] = "Tenente Coronel BOPE", ['payment'] = 17160 },
	{ ['permissao'] = "coronelbope.paycheck", ['nome'] = "Coronel BOPE", ['payment'] = 19360 },
	{ ['permissao'] = "comandantebope.paycheck", ['nome'] = "Comandante BOPE", ['payment'] = 21560 },

	--------------DONATES
	{ ['permissao'] = "prata.paycheck", ['nome'] = "Donate Prata", ['payment'] = 1000 },
	{ ['permissao'] = "ouro.paycheck", ['nome'] = "Donate Ouro", ['payment'] = 2500 },
	{ ['permissao'] = "platina.paycheck", ['nome'] = "Donate Platina", ['payment'] = 4000 },
	{ ['permissao'] = "empresario.paycheck", ['nome'] = "Donate Empresario", ['payment'] = 6000 },
	{ ['permissao'] = "super.paycheck", ['nome'] = "Donate Super", ['payment'] = 8000 },
	{ ['permissao'] = "permanente.paycheck", ['nome'] = "Donate Permanente", ['payment'] = 8000 },
	{ ['permissao'] = "insanesuper.paycheck", ['nome'] = "Donate insane Super", ['payment'] = 20000 },
	{ ['permissao'] = "insane.paycheck", ['nome'] = "Donate insane", ['payment'] = 10000 }
}

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(salarios) do
			if vRP.hasPermission(user_id,v.permissao) then
				TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
				TriggerClientEvent("Notify",source,"importante","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
				vRP.giveBankMoney(user_id,parseInt(v.payment))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ NOCARJACK ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SEQUESTRO ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ENVIAR ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	local identity = vRP.getUserIdentity(user_id)
	  local identitynu = vRP.getUserIdentity(nuser_id)
	  
	if nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			SendWebhookMessage(webhookenviardinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[1])).." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.",8000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ GARMAS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local rtime = math.random(3,8)

	TriggerClientEvent("Notify",source,"aviso","<b>Aguarde!</b> Suas armas estão sendo desequipadas.",9500)
	TriggerClientEvent("progress",source,10000,"guardando")

	SetTimeout(1000*rtime,function()
		if user_id then
			local weapons = vRPclient.replaceWeapons(source,{})
			for k,v in pairs(weapons) do
				vRP.giveInventoryItem(user_id,"wbody|"..k,1)
				if v.ammo > 0 then
					vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
				end
				SendWebhookMessage(webhookgarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList("wbody|"..k).." \n[QUANTIDADE]: "..v.ammo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
			--TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
		end
	end)
	SetTimeout(10000,function()
		TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ROUBAR ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('roubar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia > 0 then
			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo?",30) then
				local vida = vRPclient.getHealth(nplayer)
				if vida <= 100 then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											vRP.giveInventoryItem(user_id,k,v.amount)
										end
									else
										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
						vRPclient.setStandBY(source,parseInt(600))
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
					end)
				else
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					TriggerClientEvent("Notify",source,"sucesso","Roubo concluido com sucesso.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa está resistindo ao roubo.")
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRYTOW ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRUNK ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ WINS ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ HOOD ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ DOORS ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CALL ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false
		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
			especialidade = "policiais"
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("paramedico.permissao")
			especialidade = "colaboradores do <b>Departamento Médico</b>"
		elseif args[1] == "mec" then
			players = vRP.getUsersByPermission("mecanico.permissao")
			especialidade = "mecânicos"
		elseif args[1] == "taxi" then
			players = vRP.getUsersByPermission("taxista.permissao")
			especialidade = "taxistas"
		elseif args[1] == "adv" then
			players = vRP.getUsersByPermission("advogado.permissao")
			especialidade = "advogados"
		elseif args[1] == "juiz" then
			players = vRP.getUsersByPermission("juiz.permissao")	
			especialidade = "juizes"
		elseif args[1] == "css" then
			players = vRP.getUsersByPermission("conce.permissao")	
			especialidade = "vendedores"
		elseif args[1] == "jornal" then
			players = vRP.getUsersByPermission("news.permissao")	
			especialidade = "jornalistas"
		elseif args[1] == "mecanicochat" then
			players = vRP.getUsersByPermission("bennys.permissao")	
			especialidade = "ninguém da Bennys"
		elseif args[1] == "god" then
			players = vRP.getUsersByPermission("chamados.permissao")	
			especialidade = "Administradores"
		end
		local adm = ""
		if especialidade == "Administradores" then
			adm = "[ADM] "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		if #players == 0  and especialidade ~= "policiais" then
			TriggerClientEvent("Notify",source,"importante","Não há "..especialidade.." em serviço.")
		else
			local identitys = vRP.getUserIdentity(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player and player ~= uplayer then
					async(function()
						vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
						TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
						local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
						if ok then
							if not answered then
								answered = true
								local identity = vRP.getUserIdentity(nuser_id)
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								vRPclient._setGPS(player,x,y)
							else
								TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
								vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
						local id = idgens:gen()
						blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
						SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('revistar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(user_id)
		local weapons = vRPclient.getWeapons(nplayer)
		local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)

		TriggerClientEvent('cancelando',source,true)
		TriggerClientEvent('cancelando',nplayer,true)
		--TriggerClientEvent('carregar',nplayer,source)
		--vRPclient._playAnim(source,false,{{"misscarsteal4@director_grip","end_loop_grip"}},true)
	--	vRPclient._playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
		TriggerClientEvent("progress",source,5000,"revistando")
		SetTimeout(5000,function()

			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
			if data and data.inventory then
				for k,v in pairs(data.inventory) do
					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k))
				end
			end
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
			for k,v in pairs(weapons) do
				if v.ammo < 1 then
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k))
				else
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k).." | "..vRP.format(parseInt(v.ammo)).."x Munições")
				end
			end

			--vRPclient._stopAnim(source,false)
		--	vRPclient._stopAnim(nplayer,false)
			TriggerClientEvent('cancelando',source,false)
			TriggerClientEvent('cancelando',nplayer,false)
		--	TriggerClientEvent('carregar',nplayer,source)
			TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
		end)
		TriggerClientEvent("Notify",nplayer,"aviso","Você está sendo <b>Revistado</b>.")
		--TriggerClientEvent("Notify",nplayer,"aviso","Revistado por <b>"..identity.name.." "..identity.firstname.."</b>.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MEC ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mec',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Central Mecânica",{255,128,0},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MR ]---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mecanico',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "mecanico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,191,128},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setblusa",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setjaqueta",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmaos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcalca",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setacessorios",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setsapatos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
-- [ /ME ] ----------------------------------------------
--------------------------------------------------------------------------------------------
RegisterServerEvent('ChatMe')
AddEventHandler('ChatMe',function(text)
    local user_id = vRP.getUserId(source)
    if user_id then
        TriggerClientEvent('DisplayMe',-1,text,source)
    end
end)
