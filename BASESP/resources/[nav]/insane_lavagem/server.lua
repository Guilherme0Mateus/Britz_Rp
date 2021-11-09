--########################################################--
--########################################################--
--##           Script feito por SuricatoX#0001          ##--
--##           Duvidas, entre em contato comigo:        ##--
--##                  discord.gg/tqHWCEZ                ##--
--##  Tudo que está comentado está explicando o script  ##--
--########################################################--
--########################################################-- 
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("insane_lavagem",emP)

--########################################################--
--#            Lavagem de dinheiro de 1.000             ##--
--########################################################--
RegisterServerEvent("serverlavagem-1k")
AddEventHandler("serverlavagem-1k",function(item)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",1000) then -- O 1000 representa quanto de dinheiro ele puxa na lavagem de 1000
            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
            TriggerClientEvent('fechando_menu',source)
            Citizen.Wait(10000)
            vRPclient._stopAnim(source)
            vRP.giveMoney(user_id,1000) -- O 700 representa quanto de dinheiro ele ganha na lavagem de 1000
            TriggerClientEvent("Notify",source,"sucesso","Você lavou <b>R$1.000</b> e recebeu <b>R$1.000</b>, Parabéns!") -- Se alterar algum valor, altere a notificação
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente.")
        end
    end
end)
--########################################################--
--#            Lavagem de dinheiro de 10.000            ##--
--########################################################--
RegisterServerEvent("serverlavagem-10k")
AddEventHandler("serverlavagem-10k",function(item)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then -- O 10000 representa quanto de dinheiro ele puxa na lavagem de 10000
            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
            TriggerClientEvent('fechando_menu',source)
            Citizen.Wait(10000)
            vRPclient._stopAnim(source)
            vRP.giveMoney(user_id,10000)  -- O 7000 representa quanto de dinheiro ele ganha na lavagem de 10000
            TriggerClientEvent("Notify",source,"sucesso","Você lavou <b>R$10.000</b> e recebeu <b>R$10.000</b>, Parabéns!") -- Se alterar algum valor, altere a notificação
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente.")
        end
    end
end)
--########################################################--
--#            Lavagem de dinheiro de 100.000           ##--
--########################################################--
RegisterServerEvent("serverlavagem-100k")
AddEventHandler("serverlavagem-100k",function(item)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",100000) then -- O 100000 representa quanto de dinheiro ele puxa na lavagem de 100000
            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
            TriggerClientEvent('fechando_menu',source)
            Citizen.Wait(10000)
            vRPclient._stopAnim(source)
            vRP.giveMoney(user_id,100000) -- O 70000 representa quanto de dinheiro ele ganha na lavagem de 100000
            TriggerClientEvent("Notify",source,"sucesso","Você lavou <b>R$100.000</b> e recebeu <b>R$100.000</b>, Parabéns!") -- Se alterar algum valor, altere a notificação
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente.")
        end
    end
end)

function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"vanilla.permissao") -- Permissao a colocar se for ativada
end

function emP.checarPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"bahamas.permissao") -- Permissao a colocar se for ativada
end