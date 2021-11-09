-------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- COPIA NAO COMÉDIA --------------------------------------------------------
-------------------------------------------------------- TRIGUEIRO ------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------


Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")





RegisterCommand("vporte",function(source,args)
  local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
      local nuser_id = args[1]  
      local data = vRP.getUData(nuser_id,"vRP:portearmas:licensa")
      local license = json.decode(data)
      if nuser_id == nil then
        nuser_id = 0
      end  
      if license == nil then
        TriggerClientEvent("Notify",source,"negado","Passaporte "..parseInt(args[1]).." não possui Porte De Arma")
      end       
      if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
        TriggerClientEvent("Notify",source,"sucesso","Passaporte "..parseInt(args[1]).." possui Porte De Arma")
      end
    else
      TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
    end  
end)

RegisterCommand("rporte",function(source,args)
  local source = source
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"policia.permissao") then
    local nuser_id = args[1]  
    vRP.setUData(nuser_id,"vRP:portearmas:licensa",json.encode())
    TriggerClientEvent("Notify",source,"sucesso","Porte De Arma removido do passaporte: "..parseInt(args[1]).."")
  else    
    TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
  end  
end)

RegisterCommand("mporte",function(source,args)
  local source = source
  local user_id = vRP.getUserId(source)
    local user_id = vRP.getUserId(source)
    local data = vRP.getUData(user_id,"vRP:portearmas:licensa")
    local license = json.decode(data)
    if user_id == nil then
      user_id = 0
    end  
    if license == nil then
      TriggerClientEvent("Notify",source,"negado","Você não possui Porte De Arma")
    end    
    if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
      TriggerClientEvent("Notify",source,"sucesso","Você possui Porte De Arma")
    end
end)

RegisterServerEvent("meenuzinhodotrigueiro")
AddEventHandler("meenuzinhodotrigueiro", function()
    local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
    local data = vRP.getUData(user_id,"vRP:portearmas:licensa")
    local license = json.decode(data)
    local custo = parseInt(25000)
    if user_id then
        local menu = {name="SERVIÇOS", css={top="75px",header_color="rgba(0, 0, 0, 0.8)"}}
        menu["PORTE DE ARMAS"] = {function(player,choice)       
            if user_id then  
              if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
                TriggerClientEvent("Notify", source, "negado","Você ja possui o porte de armas!")
              else
                  if vRP.tryPayment(user_id,custo) then
                      TriggerClientEvent("Notify", source, "sucesso","Você adquiriu seu porte de armas, /mporte para ver !")
                      vRP.setUData(user_id,"vRP:portearmas:licensa",json.encode("adquirido"))
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

