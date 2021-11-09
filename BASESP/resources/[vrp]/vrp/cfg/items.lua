local cfg = {}

cfg.items = {
	---------------------------------------------------------
	--[ Ultilitários legais ]--------------------------------
	---------------------------------------------------------
	["mochila"] = { "Mochila",0 },
	["celular"] = { "iFruit XI",0.3 },
	["radio"] = { "WalkTalk",0.3 },
	["mascara"] = { "Mascara",0.3 },
	["oculos"] = { "Óculos",0.1 },
	["identidade"] = { "Identidade",0.1 },
	["portearmas"] = { "Porte de Armas",0.1 },
	["colete"] = { "Colete",2.0 },
	["militec"] = { "Militec",1.0 },
	["repairkit"] = { "Kit de Reparos",1.0 },
	["roupas"] = { "Roupas",5.0 },
	["pecadearma"] = { "Peça De Arma",0.1 },
	["dourado"] = { "Dourado",0.6 },
	["corvina"] = { "Corvina",0.6 },
	["salmao"] = { "Salmão",0.6 },
	["pacu"] = { "Pacu",0.6 },
	["pintado"] = { "Pintado",0.6 },
	["pirarucu"] = { "Pirarucu",0.6 },
	["tilapia"] = { "Tilápia",0.6 },
	["tucunare"] = { "Tucunaré",0.6 },
	["isca"] = { "Isca",0.6 },
	["alianca"] = { "Aliança",0 },
	["garrafavazia"] = { "Garrafa Vazia",0.2 },
	["garrafadeleite"] = { "Garrafa de Leite",0.5 },
	["agua"] = { "Água",0.5 },	
    ["limonada"] = { "Limonada",0.4 },	
    ["refrigerante"] = { "Refrigerante",0.4 },	
    ["cafe"] = { "Café",0.4 },	
    ["pao"] = { "Pão",0.1 },	
    ["sanduiche"] = { "Sanduiche",0.1 },
    ["chocolate"] = { "chocolate",0.1 },
    ["salgadinho"] = { "salgadinho",0.1 },
    ["rosquinha"] = { "rosquinha",0.1 },
	["pizza"] = { "pizza",0.2 },	
	["cerveja"] = { "Cerveja",0.7 },
	["tequila"] = { "Tequila",0.7 },
	["vodka"] = { "Vodka",0.7 },
	["whisky"] = { "Whisky",0.7 },
	["conhaque"] = { "Conhaque",0.7 },
	["absinto"] = { "Absinto",0.7 },
	["lanche"] = {"Lanche",0.2},
	---------------------------------------------------------
	--[ Ultilitários Ilegais]--------------------------------
	---------------------------------------------------------
	["dinheirosujo"] = { "Dinheiro Sujo", 0.0 },
	["algema"] = { "Algema",0.4 },
	["lockpick"] = { "Lockpick",0.2 },
	["capuz"] = { "Capuz",0.1 },
	["placa"] = { "Placa",0.6 },
	["c4"] = { "c4",2.0 },
	["pendrive"] = { "c4",2.0 },
	["serra"] = { "Serra",1.0 },
	["furadeira"] = { "Furadeira",1.0 },
	------[MINERADOR]----------------------------------------
	["mouro"] = { "Ouro",0.8 },	
	["mferro"] = { "Ferro",0.5 },	
	["mbronze"] = { "Bronze",0.3 },	
	["mesmeralda"] = { "Esmeralda",0.6 },	
	["mrubi"] = { "Rubi",0.6 },	
	["diamante"] = { "Diamante",0.5 },	
	---------------------------------------------------------
	--[ Bebidas Não Alcoólicas ]-----------------------------
	---------------------------------------------------------
	["energetico"] = { "Energético",0.6 },
	---------------------------------------------------------
	--[ Remédios ]-------------------------------------------
	---------------------------------------------------------
	["paracetamil"] = { "Paracetamil",0.2 },
	["voltarom"] = { "Voltarom",0.2 },
	["trandrylux"] = { "Trandrylux",0.2 },
	["dorfrex"] = { "Dorfrex",0.2 },
	["buscopom"] = { "Buscopom",0.2 },
	---------------------------------------------------------
	--[ Organização Criminosa de Meta ]----------------------
	---------------------------------------------------------
	["meta-alta"] = { "Metanfetamina",0.1 },
	--[ Ingredientes ]---------------------------------------
	["composito-alta"] = { "Anfetamina",1.0 },
	--[ Ingredientes ]---------------------------------------
	["nitrato-amonia"] = { "Nitrato de Amônia",0.5 },
	---------------------------------------------------------
	--[ Organização Criminosa de Cocaína ]-------------------
	---------------------------------------------------------
	["coca-alta"] = { "Cocaina",0.1 },
	--[ Sub produto ]----------------------------------------
	["pasta-alta"] = { "Pasta de Coca",1.0 },
	--[ Ingredientes ]---------------------------------------
	["folhas-coca"] = { "Folhas de Coca",0.5 },
	---------------------------------------------------------
	--[ Haxixi ]-------------------
	---------------------------------------------------------
	["folhas-haxixi"] = { "Folhas de Haxixi",0.5 },
	---------------------------------------------------------
	--[ Organização Criminosa de Maconha ]-------------------
	---------------------------------------------------------
	["maconha-alta"] = { "Maconha",0.1 },
	--[ Sub produto ]----------------------------------------
	["maconha-dichavada"] = { "Maconha Dichavada",1.0 },
	["canabis-alta"] = { "Pé de Maconha",1.0 },
	---------------------------------------------------------
	--[ Organizações Criminosas de Armas ]-------------------
	---------------------------------------------------------
	["molas"] = { "Pacote de Molas",0.2 },
	["placa-metal"] = { "Placa de Metal",1.0 },
	["gatilho"] = { "Gatilho",0.1 },
	["capsulas"] = { "Pacote de Capsulas",0.2 },
	["polvora"] = { "Pacote de Pólvora",0.5 },
	---------------------------------------------------------
	--[ Empregos ]-------------------------------------------
	---------------------------------------------------------
	["sacodelixo"] = { "Saco de lixo",0.20 },
	["encomenda"] = { "Encomenda",0.5 },
	["laranja"] = { "Laranja",1.0 },
	["lanche"] = { "Tacos",1.0 },
	["graos"] = { "Graos",0.5 },
	["graosimpuros"] = { "Graos Impuros",0.5 }--
}

local function load_item_pack(name)
	local items = module("cfg/item/"..name)
	if items then
		for k,v in pairs(items) do
			cfg.items[k] = v
		end
	end
end

load_item_pack("armamentos")

return cfg