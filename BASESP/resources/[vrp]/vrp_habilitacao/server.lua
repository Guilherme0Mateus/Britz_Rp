Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
htmlEntities = module("vrp", "lib/htmlEntities")

vRPdmv = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
DMVclient = Tunnel.getInterface("vrp_habilitacao")
Tunnel.bindInterface("vrp_habilitacao",vRPdmv)
Proxy.addInterface("vrp_habilitacao",vRPdmv)
cfg = module("vrp_habilitacao", "cfg/dmv")

function vRPdmv.setLicense()
	local user_id = vRP.getUserId(source)
	vRP.setUData(user_id,"vRP:dmv:license",json.encode(os.date("%x")))
end

function vRPdmv.payTheory()
	local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
    if vRP.tryGetInventoryItem(user_id,"money",2500) then
	 TriggerClientEvent("Notify", source, "sucesso","Agora Você Esta Abilitado Mentalise /mcnh Para Chegar Sua Cnh!")
          vRPdmv.setLicense()
    else
          TriggerClientEvent("Notify", source, "negado","Você não tem dinheiro!")
    end
end 

function vRPdmv.payPractical()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if vRP.tryGetInventoryItem(user_id,"money",2500) then
        vRPdmv.setLicense()
        TriggerClientEvent("Notify", source, "sucesso","Você está agora com uma CNH!")
	else
		    TriggerClientEvent("Notify", source, "negado","Você não tem dinheiro!")
	end
end

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local data = vRP.getUData(user_id,"vRP:dmv:license")
	if data then
	  local license = json.decode(data)
	  if license and license ~= 0 then
        DMVclient.setLicense(player, true)
	  end
	end
end)

RegisterCommand("cnh",function(source,args)
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"policia.permissao") then

      local nuser_id = args[1]  

      local data = vRP.getUData(nuser_id,"vRP:dmv:license")
      local license = json.decode(data)

      if nuser_id == nil then
        nuser_id = 0
      end  

      print(license)

      if license == nil then
        TriggerClientEvent("Notify",source,"negado","Passaporte "..parseInt(args[1]).." não possui CNH")
      end 
      
      if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
        TriggerClientEvent("Notify",source,"sucesso","Passaporte "..parseInt(args[1]).." possui CNH")
      end
    else
      TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
    end  
end)

RegisterCommand("rcnh",function(source,args)
  local user_id = vRP.getUserId(source)

  if vRP.hasPermission(user_id,"policia.permissao") then

    local nuser_id = args[1]  

    vRP.setUData(nuser_id,"vRP:dmv:license",json.encode())

    TriggerClientEvent("Notify",source,"sucesso","CNH removida do passaporte: "..parseInt(args[1]).."")
  else    
    TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
  end  
end)

RegisterCommand("mcnh",function(source,args)
  local user_id = vRP.getUserId(source)

    local user_id = vRP.getUserId(source)

    local data = vRP.getUData(user_id,"vRP:dmv:license")
    local license = json.decode(data)

    if user_id == nil then
      user_id = 0
    end  

    print(license)

    if license == nil then
      TriggerClientEvent("Notify",source,"negado","Você não possui CNH")
    end 
    
    if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
      TriggerClientEvent("Notify",source,"sucesso","Você possui CNH")
    end
end)