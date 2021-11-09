
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
Lserver = {}
Lclient = Tunnel.getInterface("_fuel")
Tunnel.bindInterface("_fuel",Lserver)
local lConfig = module("_fuel","lk_config")

fuels = {}

function Lserver.tryFuel(vehicle,fuel)
  Lclient.syncFuel(-1,vehicle,fuel)
  fuels[vehicle] = fuel
end

function Lserver.returnfuel(veh)
  return fuels[veh] or 65
end

function Lserver.tryFullPayment(valor)
  local user_id = vRP.getUserId(source)
  if valor <= 0 then 
    print(user_id,"tentando dumpar fuel")
    return 
  end
  return vRP.tryFullPayment(user_id,parseInt(valor)) 
end

Citizen.CreateThread(function()
  if GetCurrentResourceName() ~= "_fuel" then print("\27[34m[UniverseFiveM] \27[33mPOR FAVOR, TOME CUIDADO!\nRENOMEAR UMA RESOURCE COM NUI GERALMENTE CAUSA PROBLEMAS E COMPLICA O SUPORTE!\nSubstitua o nome de: \27[31m"..GetCurrentResourceName().." \27[33m para \27[32m _fuel\27[0m") end
  end)