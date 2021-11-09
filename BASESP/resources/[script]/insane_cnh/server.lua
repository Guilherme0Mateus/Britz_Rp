-------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- COPIA NAO COMÉDIA --------------------------------------------------------
-------------------------------------------------------- TRIGUEIRO ------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------


Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
htmlEntities = module("vrp", "lib/htmlEntities")

vRPdmv = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
DMVclient = Tunnel.getInterface("insane_cnh")
Tunnel.bindInterface("insane_cnh",vRPdmv)
Proxy.addInterface("insane_cnh",vRPdmv)



RegisterCommand("vcnh",function(source,args)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
      local nuser_id = args[1]  
      local data = vRP.getUData(nuser_id,"vRP:carteira:licensa")
      local license = json.decode(data)
      if nuser_id == nil then
        nuser_id = 0
      end  
      if license == nil then
        TriggerClientEvent("Notify",source,"negado","Passaporte "..parseInt(args[1]).." não possui Carteira de Motorista")
      end       
      if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
        TriggerClientEvent("Notify",source,"sucesso","Passaporte "..parseInt(args[1]).." Carteira de Motorista")
      end
    else
      TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
    end  
end)

-- OK 
RegisterCommand("rcnh",function(source,args)
  local source = source
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"policia.permissao") then
    local nuser_id = args[1]  
    vRP.setUData(nuser_id,"vRP:carteira:licensa",json.encode())
    TriggerClientEvent("Notify",source,"sucesso","CNH removida do passaporte: "..parseInt(args[1]).."")
  else    
    TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
  end  
end)

-- OK
RegisterCommand("mcnh",function(source,args)
  local source = source
    local user_id = vRP.getUserId(source)
    if user_id then 
      local data = vRP.getUData(user_id,"vRP:carteira:licensa")
      local license = json.decode(data) or ""
      if license == "" then
        TriggerClientEvent("Notify",source,"negado","Você não possui Carteira de Motorista")
      else
        TriggerClientEvent("Notify",source,"sucesso","Você possui Carteira de Motorista")
      end
    end
end)

-- OK 
RegisterServerEvent("meenuzinhodotrigueiroCNH")
AddEventHandler("meenuzinhodotrigueiroCNH", function()
    local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
    local data = vRP.getUData(user_id,"vRP:portearmas:licensa")
    local license = json.decode(data)
    local custo = parseInt(25000)
    if user_id then
        local menu = {name="SERVIÇOS", css={top="75px",header_color="rgba(0, 0, 0, 0.8)"}}
        menu["Carteira de motorista"] = {function(player,choice)       
            if user_id then  
              if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
                TriggerClientEvent("Notify", source, "negado","Você ja possui Carteira de Motorista!")
              else
                  if vRP.tryPayment(user_id,custo) then
                      TriggerClientEvent("Notify", source, "sucesso","Você adquiriu sua CNH, /mcnh para ver !")
                      vRP.setUData(user_id,"vRP:carteira:licensa",json.encode("Adquirido"))
                  else
                      TriggerClientEvent("Notify", source, "negado","Você não tem dinheiro! O custo é de R$ "..custo.." reais")
                  end         
              vRP.closeMenu(player)       
              end 
            end    
        end,""}
        vRP.openMenu(player,menu)
    end
end)

-- OK 
RegisterServerEvent("cnh:verificar") 
AddEventHandler("cnh:verificar", function() 
local source = source
local user_id = vRP.getUserId(source)
local data = vRP.getUData(user_id,"vRP:carteira:licensa")
local decodedata = json.decode(data) or ""
  if decodedata ~= "adquirido" then 
  TriggerClientEvent("cnh:set", source, true)
  else 
    TriggerClientEvent("cnh:set", source, false)
  end
end)



--[[
RegisterServerEvent("jatem") 
AddEventHandler("jatem", function() 
local user_id = vRP.getUserId(source)
local data = vRP.getUData(user_id,"vRP:carteira:licensa")
local decodedata = json.decode(data) or ""
  if decodedata == nil then
    TriggerClientEvent("cnh:set", source, false)
  end
end)]]