local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ WEBHOOK ]------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local webhookmultas = ""
local webhookocorrencias = ""
local webhookdetido = ""
local webhookprender = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PLACA ]--------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
			end
		else
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			local placa_user = vRP.getUserByRegistration(placa)
			if placa then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						local vehicleName = vRP.vehicleName(vname)
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Modelo: ^0"..vehicleName.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PTR ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ptr', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("policia.permissao")
 	local paramedicos = 0
 	local oficiais_nomes = ""
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
 		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Policial</b> em serviço.")
 		if parseInt(paramedicos) > 0 then
 			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
 		end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PTR ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('samu', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("paramedico.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Paramedico</b> em serviço.")
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PTR ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adv', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("advogado.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Advogado</b> em serviço.")
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PTR ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('taxi', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("taxi.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Taxista</b> em serviço.")
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ MECS ]---------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mec', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("mecanico.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Mecanico</b> em serviço.")
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ P ]------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 101 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,304,3,"Localização de "..identity.name.." "..identity.firstname,0.6,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.",10000)
						vRPclient._playSound(player,"Place_Prop_Fail","DLC_Dmod_Prop_Editor_Sounds")
						SetTimeout(30000,function()
							idgens:free(id)
							vRPclient.removeBlip(player,policia[id])
							policia[id] = nil
						end)
					end)
				end
				Citizen.Wait(10)
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ 911 ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('911',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"juiz.permissao") or vRP.hasPermission(user_id,"advogado.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{64,64,255},rawCommand:sub(4))
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PD ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pd',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,179,255},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ MULTAR ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		local motivo = vRP.prompt(source,"Motivo:","")
		if id == "" or valor == "" or motivo == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))
		
		SendWebhookMessage(webhookmultas,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============MULTOU==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(valor)).." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		randmoney = math.random(90,150)
		vRP.giveMoney(user_id,parseInt(randmoney))
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
		TriggerClientEvent("Notify",nplayer,"importante","Você foi multado em <b>$"..vRP.format(parseInt(valor)).." dólares</b>.<br><b>Motivo:</b> "..motivo..".")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ OCORRENCIA ]---------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ocorrencia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Ocorrência:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		SendWebhookMessage(webhookocorrencias,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============OCORRENCIA==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.."\n[IDENTIDADE]: "..identity.registration.." \n[TELEFONE]: "..identity.phone.." \n[OCORRENCIA]: "..ocorrencia.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Ocorrência registrada com sucesso.")
		TriggerClientEvent("Notify",nplayer,"importante","Sua <b>Ocorrência</b> foi registrada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ DETIDO ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
            if rows[1] then
                if parseInt(rows[1].detido) == 1 then
                    TriggerClientEvent("Notify",source,"importante","Este veículo já se encontra detido.",8000)
                else
                	local identity = vRP.getUserIdentity(puser_id)
					local nplayer = vRP.getUserSource(parseInt(puser_id))
					
                	SendWebhookMessage(webhookdetido,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[CARRO]: "..vname.." \n[PASSAPORTE]: "..puser_id.." "..identity.name.." "..identity.firstname.." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					
					vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify",nplayer,"importante","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PRENDER ]------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		local crimes = vRP.prompt(source,"Crimes:","")
		if crimes == "" then
			return
		end

		local player = vRP.getUserSource(parseInt(args[1]))
		if player then
			vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1779.49,2583.63,45.8)
			prison_lock(parseInt(args[1]))
			TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)

			
			local oficialid = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			
			SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(args[1]).." "..identity.name.." "..identity.firstname.." \n[TEMPO]: "..vRP.format(parseInt(args[2])).." Meses \n[CRIMES]: "..crimes.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			
			randmoney = math.random(90,150)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("Notify",source,"sucesso","Prisão efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
			TriggerClientEvent("Notify",nplayer,"importante","Você foi preso por <b>"..vRP.format(parseInt(args[2])).." meses</b>.<br><b>Motivo:</b> "..crimes..".")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
		end 
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RG ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rg',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer == nil then
				TriggerClientEvent("Notify",source,"aviso","Passaporte <b>"..vRP.format(args[1]).."</b> indisponível no momento.")
				return
			end
			nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		else
			local nplayer = vRPclient.getNearestPlayer(source,2)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identityv = vRP.getUserIdentity(user_id)
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				TriggerClientEvent("Notify",nplayer,"importante","Seu documento está sendo verificado por <b>"..identityv.name.." "..identityv.firstname.."</b>.")
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:algemar")
AddEventHandler("vrp_policia:algemar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algema") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
					SetTimeout(5000,function()
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.hasPermission(user_id,"fsafsafsaf.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"safasfsafsa.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(5000,function()
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
						SetTimeout(3500,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STAFF
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('staff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	----------------------------POLICIA--------------------------
	if vRP.hasPermission(user_id,"sogpolicia.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSOG")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanasog.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"SOG")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- Policia Militar
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"krawk.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"krawkstorefolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"krawk.paisana") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"krawkstore")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------RONDAS OSTENSIVA TOBIAR DE AGUIAR--------------------------
    elseif vRP.hasPermission(user_id,"ademiro.paisana") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"adminfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"admin.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"admin")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    -------------------------------------------------------------
	-- COMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"mdgrl.paisana") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"moderadorgeralfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"moderador.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"moderadorgeral")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SUBCOMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"supset.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"suportefolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"sup.paisana") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"suporte")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- TENENTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"auxiliarset.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"auxiliarfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"auxiliar.paisana") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"auxiliar")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CAPITÃO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"estagiarioset.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"ajudantefolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"estagiario.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"ajudante")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------MECANICO--------------------------
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('toogle',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	----------------------------POLICIA--------------------------
	if vRP.hasPermission(user_id,"sogpolicia.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSOG")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanasog.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"SOG")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- Policia Militar
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"comandantepmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"comandantepmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-comandantepmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"comandantepmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------RONDAS OSTENSIVA TOBIAR DE AGUIAR--------------------------
    elseif vRP.hasPermission(user_id,"coronelpmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"coronelpmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-coronelpmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"coronelpmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    -------------------------------------------------------------
	-- COMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"tencoronelpmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"tencoronelpmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-tenentecoronelpmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"tencoronelpmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SUBCOMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"majorpmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"majorpmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-majorpmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"majorpmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- TENENTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"capitaopmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"capitaopmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-capitaopmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"capitaopmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CAPITÃO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"tenentepmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"tenentepmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-tenentepmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"tenentepmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SARGENTO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sargentopmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"sargentopmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-sargentopmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"sargentopmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CABO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"cabopmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"cabopmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-cabopmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"cabopmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SOLDADO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"soldadopmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"soldadopmesp-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-soldadopmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"soldadopmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- RECRUTA
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"recrutapmesp.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"paisanapmesprecruta")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanarecrutapmesp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"recrutapmesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    -------------------------------------------------------------
	-- rota
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"comandanterota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"comandanterota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-comandanterota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"comandanterota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------RONDAS OSTENSIVA TOBIAR DE AGUIAR--------------------------
    elseif vRP.hasPermission(user_id,"coronelrota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"coronelrota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-coronelrota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"coronelrota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    -------------------------------------------------------------
	-- COMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"tencoronelrota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"tencoronelrota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-tencoronelrota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"tencoronelrota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SUBCOMANDANTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"majorrota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"majorrota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-majorrota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"majorrota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- TENENTE
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"capitaorota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"capitaorota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-capitaorota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"capitaorota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CAPITÃO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"tenenterota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"tenenterota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-tenenterota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"tenenterota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SARGENTO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sargentorota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"sargentorota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-sargentorota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"sargentorota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CABO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"caborota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"caborota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-caborota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"caborota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- SOLDADO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"soldadorota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"soldadorota-apaisana")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanasoldadorota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"soldadorota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- RECRUTA
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"recrutarota.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"paisanarecruta")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanarecrutarota.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
		vRP.addUserGroup(user_id,"recrutarota")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- BOPE
	-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"pcivil.permissao") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"agente-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"agenteapaisana.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"agentepc")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
----------------------------RONDAS OSTENSIVA TOBIAR DE AGUIAR--------------------------
elseif vRP.hasPermission(user_id,"investigador.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"investigador-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"investigadorpaisana.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"investigadorpc")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- COMANDANTE
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"delegado.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"delegado-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"delegadopcivil.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"delegadopc")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- SUBCOMANDANTE
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"majorbope.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"agentepf-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"apaisanafederal.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"agentepf")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- TENENTE
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"agentepf.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"agentepf-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"agenteapaisanafederal.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"agentepf")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- CAPITÃO
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"investigador.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"investigadorpf-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"investigadorapaisanafederal.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"investigadorpf")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- SARGENTO
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"delegadopf.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"delegadopf-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"delegadoapaisanafederal.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"delegadopf")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- CABO
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"cabobope.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"cabobope-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"paisana-cabobope.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"cabobope")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- SOLDADO
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"soldadobope.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"soldadobope-apaisana")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"paisanasoldadobope.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"soldadobope")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------------------------------------
-- RECRUTA
-------------------------------------------------------------
elseif vRP.hasPermission(user_id,"recrutabope.paycheck") then
	TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"paisanarecruta")
	vRPclient.setArmour(source,0)
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	TriggerClientEvent('desligarRadios',source)
elseif vRP.hasPermission(user_id,"paisanarecrutabope.permissao") then
	TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 57 })
	vRP.addUserGroup(user_id,"recrutabope")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookpolicia,"```prolog\n[POLICIAL]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------HOSPITAL--------------------------
	-------------------------------------------------------------
	-- PSICOLOGO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"psicologosalario.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaPsicologo")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PSICOLOGO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanapsicologo.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Psicologo")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PSICOLOGO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- ENFERMEIRO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"enfermeirosalario.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaEnfermeiro")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanaenfermeiro.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Enfermeiro")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- CIRURGIÃO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"enfermeiro.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"enfermeiro-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-enfermeiro.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"enfermeirosamu")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- FISIOTERAPEUTA
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"paramedico.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"paramedico-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-paramedico.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"paramedicosamu")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- MEDICORESIDENTE
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"medico.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"medicosamu-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-medico.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"medicosamu")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- MEDICO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"psicologo.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"psicologo-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-psicologo.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"psicologosamu")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- PRESIDENTE EMS
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"subdiretor.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"subdiretor-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PRESIDENTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-subdiretor.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"subdiretorsamu")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PRESIDENTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- DIRETOR EMS
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"diretor.paycheck") then
	TriggerEvent('eblips:remove',source)
	    vRP.addUserGroup(user_id,"diretor-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"paisana-diretor.permissao") then
	    TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
	    vRP.addUserGroup(user_id,"diretorsamu")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------HOSPITAL--------------------------

	----------------------------MECANICO--------------------------
		-------------------------------------------------------------
	-- DRIFT KING
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"donomec.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"donomecfolga")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-chefebennys.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"donomec")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- PRESIDENTE EMS
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"gerentemec.paycheck") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"gerentemecfolga")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PRESIDENTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-gerentebennys.permissao") then
		TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"gerentemec")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PRESIDENTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- DIRETOR EMS
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"mec.paycheck") then
	TriggerEvent('eblips:remove',source)
	    vRP.addUserGroup(user_id,"mecfolga")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"paisana-bennys.permissao") then
	    TriggerEvent('eblips:add',{ name = "Paramedico", src = source, color = 61 })
	    vRP.addUserGroup(user_id,"mec")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--------------------------------------------------------- TAXI
	---------------------------------------------------------
    ---------------------------------------------------------
    elseif vRP.hasPermission(user_id,"chefetaxi.permissao") then
	    vRP.addUserGroup(user_id,"chefetaxi-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"chefetaxi.paisana") then
	    vRP.addUserGroup(user_id,"chefetaxi")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		----------------------------------------------------------------------
		    elseif vRP.hasPermission(user_id,"gerentetaxi.permissao") then
	    vRP.addUserGroup(user_id,"gerentetaxi-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"gerentetaxi.paisana") then
	    vRP.addUserGroup(user_id,"gerentetaxi")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")	
		---------------------------------------------------------------------------
				    elseif vRP.hasPermission(user_id,"taxista.permissao") then
	    vRP.addUserGroup(user_id,"taxi-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"taxista.paisana") then
	    vRP.addUserGroup(user_id,"taxi")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")	
	-------------------------------------------------------------
	-- BENNYS
	-------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"chefebennys.permissao") then
	    vRP.addUserGroup(user_id,"chefebennys-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"paisana-chefebennys.permissao") then
	    vRP.addUserGroup(user_id,"chefebennys")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		----------------------------------------------------------------------
		    elseif vRP.hasPermission(user_id,"gerentebennys.permissao") then
	    vRP.addUserGroup(user_id,"gerentebennys-paisana")
	    TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	    TriggerClientEvent('desligarRadios',source)
    elseif vRP.hasPermission(user_id,"paisana-gerentebennys.permissao") then
	    vRP.addUserGroup(user_id,"gerentebennys")
	    TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	    SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------
	-- MECANICO
	-------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"bennys.permissao") then
		vRP.addUserGroup(user_id,"bennys-paisana")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisana-bennys.permissao") then
		vRP.addUserGroup(user_id,"bennys")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	----------------------------MECANICO--------------------------
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.hasPermission(user_id,"paramedico.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then	
		if nplayer then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent('carregar',nplayer,source)
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RMASCARA ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rmascara',nplayer)
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RCHAPEU ]------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rchapeu',nplayer)
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RCAPUZ ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isCapuz(nplayer) then
				vRPclient.setCapuz(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa não está com o capuz na cabeça.")
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ CV ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"safas.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RV ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"safsaffsa.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ APREENDER ]----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	"dinheirosujo",
	"algema",
	"lockpick",
	"capuz",
	"placa",
	"c4",
	"meta-alta",
	"composito-alta",
	"nitrato-amonia",
	"pecadearma",
	"hidroxido-sodio",
	"pseudoefedrina",
	"eter",
	"coca-alta",
	"pasta-alta",
	"acido-sulfurico",
	"folhas-coca",
	"folhas-haxixi",
	"calcio-po",
	"querosene",
	"maconha-alta",
	"canabis-alta",
	"corpo-ak47",
	"corpo-m4",
	"corpo-m4spec",
	"corpo-tec9",
	"corpo-fs",
	"corpo-sns",
	"molas",
	"placa-metal",
	"gatilho",
	"capsulas",
	"polvora",
	"wbody|WEAPON_FLARE",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_DAGGER",
	"wbody|WEAPON_KNUCKLE",
	"wbody|WEAPON_MACHETE",
	"wbody|WEAPON_SWITCHBLADE",
	"wbody|WEAPON_WRENCH",
	"wbody|WEAPON_HAMMER",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_HATCHET",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_BOTTLE",
	"wbody|WEAPON_BATTLEAXE",
	"wbody|WEAPON_POOLCUE",
	"wbody|WEAPON_STONE_HATCHET",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_SNSPISTOL",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_ASSAULTRIFLE",
	"wbody|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_SPECIALCARBINE",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_REVOLVER",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_REVOLVER",
	"wammo|WEAPON_ASSAULTSMG",
	"wbody|WEAPON_ASSAULTSMG",
	"wammo|WEAPON_COMBATPDW",
	"wammo|WEAPON_FLARE",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_SNSPISTOL",
	"wammo|WEAPON_PISTOL50",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_ASSAULTRIFLE",
	"wammo|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_SPECIALCARBINE",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_PUMPSHOTGUN_MK2",
	"wammo|WEAPON_MUSKET"

}

RegisterCommand('apreender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local user_id = vRP.getUserId(source)

		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local nidentity = vRP.getUserIdentity(nuser_id)
				local itens_apreendidos = {}
				local weapons = vRPclient.replaceWeapons(nplayer,{})
				for k,v in pairs(weapons) do
					vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
					if v.ammo > 0 then
						vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
					end
				end

				local inv = vRP.getInventory(nuser_id)
				for k,v in pairs(itemlist) do
					local sub_items = { v }
					if string.sub(v,1,1) == "*" then
						local idname = string.sub(v,2)
						sub_items = {}
						for fidname,_ in pairs(inv) do
							if splitString(fidname,"|")[1] == idname then
								table.insert(sub_items,fidname)

							end
						end
					end

					for _,idname in pairs(sub_items) do
						local amount = vRP.getInventoryItemAmount(nuser_id,idname)
						if amount > 0 then
							local item_name,item_weight = vRP.getItemDefinition(idname)
							if item_name then
								if vRP.tryGetInventoryItem(nuser_id,idname,amount,true) then
									vRP.giveInventoryItem(user_id,idname,amount)
									table.insert(itens_apreendidos, "[ITEM]: "..vRP.itemNameList(idname).." [QUANTIDADE]: "..amount)
								end
							end
						end
					end
				end
				local apreendidos = table.concat(itens_apreendidos, "\n")
				
				SendWebhookMessage(webhookpoliciaapreendidos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APREENDEU DE]:  "..nuser_id.." "..nidentity.name.." "..nidentity.firstname.."\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				
				TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
				TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ EXTRAS ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mecanico',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
        if vRPclient.isInVehicle(source) then
            TriggerClientEvent('extras',source)
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ TRYEXTRAS ]----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryextras")
AddEventHandler("tryextras",function(index,extra)
    TriggerClientEvent("syncextras",-1,index,parseInt(extra))
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ CONE ]---------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ BARREIRA ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ SPIKE ]--------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ DISPAROS ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"policia.permissao") then
			local policiais = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(policiais) do
				local player = vRP.getUserSource(w)
				if player then
					TriggerClientEvent('notificacao',player,x,y,z,user_id)
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ ANÚNCIO ]------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('anuncio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"administrativo.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		local identity = vRP.getUserIdentity(user_id)
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,128,192,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 7%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 15px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: "..identity.name.." "..identity.firstname)
		
		SetTimeout(30000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ PRISÃO ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ DIMINUIR PENA ]------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("minhapikapenadd")
AddEventHandler("minhapikapenadd",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 20 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-4))
		TriggerClientEvent("Notify",source,"importante","Sua pena foi reduzida em <b>4 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify",source,"importante","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)