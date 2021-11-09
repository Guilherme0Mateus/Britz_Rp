---gambiarra quase pronta porem funcional by iND :*


local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')

vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface("vRP")


RegisterCommand("som", function(source, args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,mNet,mPlaca,mName,lock,mBanido = vRPclient.vehList(source,7)
		if vehicle and mPlaca then
			local placa_user_id = vRP.getUserByRegistration(mPlaca)
			if user_id == placa_user_id then
				if not args[1] then
					TriggerClientEvent("chatMessage", source, "Use /som ON ou /som DESLIGAR")
				elseif args[1] == 'ligar' or args[1] == 'LIGAR' then
					TriggerClientEvent("chatMessage",source, "Som LIGADO ")
					TriggerClientEvent("jbl:myRadio",-1, mName)
					TriggerClientEvent("jbl:RadioON",-1, mNet,user_id,50)
				elseif args[1] == 'musica' or args[1] == 'MUSICA' then
					local url = vRP.prompt(source,"Som do carro ligado, coloque uma musica.","")
						if url == "" then
							return
						end
					TriggerClientEvent("jbl:PlayOnOneRadio",-1, url,50,user_id)
					TriggerClientEvent("JBL:Play_URL", -1, url,50,user_id,mName)
				elseif args[1] == 'volume' or args[1] == 'VOLUME' then
					local volume = vRP.prompt(source,"Volume 0 a 100.","")
						if volume == "" then
							return
						end
						TriggerClientEvent("jbl:setvolumeRadio",-1, volume,user_id)
				elseif args[1] == 'desligar' then
					TriggerClientEvent("jbl:RadioOFF",-1,user_id)
				end
			end
		else
			TriggerClientEvent("chatMessage", source, "Longe do veiculo.")
		end
	end
end)