-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local sanitizes = module("cfg/sanitizes")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_homes",src)
vCLIENT = Tunnel.getInterface("vrp_homes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaucasas = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("homes/get_homeuser","SELECT * FROM vrp_homes_permissions WHERE user_id = @user_id AND home = @home")
vRP._prepare("homes/get_homeuserid","SELECT * FROM vrp_homes_permissions WHERE user_id = @user_id")
vRP._prepare("homes/get_homeuserowner","SELECT * FROM vrp_homes_permissions WHERE user_id = @user_id AND home = @home AND owner = 1")
vRP._prepare("homes/get_homeuseridowner","SELECT * FROM vrp_homes_permissions WHERE home = @home AND owner = 1")
vRP._prepare("homes/get_homepermissions","SELECT * FROM vrp_homes_permissions WHERE home = @home")
vRP._prepare("homes/add_permissions","INSERT IGNORE INTO vrp_homes_permissions(home,user_id) VALUES(@home,@user_id)")
vRP._prepare("homes/buy_permissions","INSERT IGNORE INTO vrp_homes_permissions(home,user_id,owner,tax,garage) VALUES(@home,@user_id,1,@tax,1)")
vRP._prepare("homes/count_homepermissions","SELECT COUNT(*) as qtd FROM vrp_homes_permissions WHERE home = @home")
vRP._prepare("homes/upd_permissions","UPDATE vrp_homes_permissions SET garage = 1 WHERE home = @home AND user_id = @user_id")
vRP._prepare("homes/rem_permissions","DELETE FROM vrp_homes_permissions WHERE home = @home AND user_id = @user_id")
vRP._prepare("homes/upd_taxhomes","UPDATE vrp_homes_permissions SET tax = @tax WHERE user_id = @user_id, home = @home AND owner = 1")
vRP._prepare("homes/rem_allpermissions","DELETE FROM vrp_homes_permissions WHERE home = @home")
vRP._prepare("homes/get_allhomes","SELECT * FROM vrp_homes_permissions WHERE owner = @owner")
vRP._prepare("homes/get_allvehs","SELECT * FROM vrp_vehicles")
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOMESINFO
-----------------------------------------------------------------------------------------------------------------------------------------
local homes = {
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------FORTHILLS-----------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["FH01"] = { 4000000,4,1000 },
	["FH02"] = { 4000000,4,1000 },
	["FH03"] = { 4000000,4,1000 },
	["FH04"] = { 4000000,4,1000 },
	["FH05"] = { 4000000,4,1000 },
	["FH06"] = { 4000000,4,1000 },
	["FH07"] = { 4000000,4,1000 },
	["FH08"] = { 4000000,4,1000 },
	["FH09"] = { 4000000,4,1000 },
	["FH10"] = { 4000000,4,1000 },
	["FH11"] = { 4000000,4,1000 },
	["FH12"] = { 4000000,4,1000 },
	["FH13"] = { 4000000,4,1000 },
	["FH14"] = { 4000000,4,1000 },
	["FH15"] = { 4000000,4,1000 },
	["FH16"] = { 4000000,4,1000 },
	["FH17"] = { 4000000,4,1000 },
	["FH18"] = { 4000000,4,1000 },
	["FH19"] = { 4000000,4,1000 },
	["FH20"] = { 4000000,4,1000 },
	["FH21"] = { 4000000,4,1000 },
	["FH22"] = { 4000000,4,1000 },
	["FH23"] = { 4000000,4,1000 },
	["FH24"] = { 4000000,4,1000 },
	["FH25"] = { 4000000,4,1000 },
	["FH26"] = { 4000000,4,1000 },
	["FH27"] = { 4000000,4,1000 },
	["FH28"] = { 4000000,4,1000 },
	["FH29"] = { 4000000,4,1000 },
	["FH30"] = { 4000000,4,1000 },
	["FH31"] = { 4000000,4,1000 },
	["FH32"] = { 4000000,4,1000 },
	["FH33"] = { 4000000,4,1000 },
	["FH34"] = { 4000000,4,1000 },
	["FH35"] = { 4000000,4,1000 },
	["FH36"] = { 4000000,4,1000 },
	["FH37"] = { 4000000,4,1000 },
	["FH38"] = { 4000000,4,1000 },
	["FH39"] = { 4000000,4,1000 },
	["FH40"] = { 4000000,4,1000 },
	["FH41"] = { 4000000,4,1000 },
	["FH42"] = { 4000000,4,1000 },
	["FH43"] = { 4000000,4,1000 },
	["FH44"] = { 4000000,4,1000 },
	["FH45"] = { 4000000,4,1000 },
	["FH46"] = { 4000000,4,1000 },
	["FH47"] = { 4000000,4,1000 },
	["FH48"] = { 4000000,4,1000 },
	["FH49"] = { 4000000,4,1000 },
	["FH50"] = { 4000000,4,1000 },
	["FH51"] = { 4000000,4,1000 },
	["FH52"] = { 4000000,4,1000 },
	["FH53"] = { 4000000,4,1000 },
	["FH54"] = { 4000000,4,1000 },
	["FH55"] = { 4000000,4,1000 },
	["FH56"] = { 4000000,4,1000 },
	["FH57"] = { 4000000,4,1000 },
	["FH58"] = { 4000000,4,1000 },
	["FH59"] = { 4000000,4,1000 },
	["FH60"] = { 4000000,4,1000 },
	["FH61"] = { 4000000,4,1000 },
	["FH62"] = { 4000000,4,1000 },
	["FH63"] = { 4000000,4,1000 },
	["FH64"] = { 4000000,4,1000 },
	["FH65"] = { 4000000,4,1000 },
	["FH66"] = { 4000000,4,1000 },
	["FH67"] = { 4000000,4,1000 },
	["FH68"] = { 4000000,4,1000 },
	["FH69"] = { 4000000,4,1000 },
	["FH70"] = { 4000000,4,1000 },
	["FH71"] = { 4000000,4,1000 },
	["FH72"] = { 4000000,4,1000 },
	["FH73"] = { 4000000,4,1000 },
	["FH74"] = { 4000000,4,1000 },
	["FH75"] = { 4000000,4,1000 },
	["FH76"] = { 4000000,4,1000 },
	["FH77"] = { 4000000,4,1000 },
	["FH78"] = { 4000000,4,1000 },
	["FH79"] = { 4000000,4,1000 },
	["FH80"] = { 4000000,4,1000 },
	["FH81"] = { 4000000,4,1000 },
	["FH82"] = { 4000000,4,1000 },
	["FH83"] = { 4000000,4,1000 },
	["FH84"] = { 4000000,4,1000 },
	["FH85"] = { 4000000,4,1000 },
	["FH86"] = { 4000000,4,1000 },
	["FH87"] = { 4000000,4,1000 },
	["FH88"] = { 4000000,4,1000 },
	["FH89"] = { 4000000,4,1000 },
	["FH90"] = { 4000000,4,1000 },
	["FH91"] = { 4000000,4,1000 },
	["FH92"] = { 4000000,4,1000 },
	["FH93"] = { 4000000,4,1000 },
	["FH94"] = { 4000000,4,1000 },
	["FH95"] = { 4000000,4,1000 },
	["FH96"] = { 4000000,4,1000 },
	["FH97"] = { 4000000,4,1000 },
	["FH98"] = { 4000000,4,1000 },
	["FH99"] = { 4000000,4,1000 },
	["FH100"] = { 4000000,4,1000 },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------LUXURY--------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["LX02"] = { 4000000,4,1000 },
	["LX01"] = { 4000000,4,1000 },
	["LX03"] = { 4000000,4,1000 },
	["LX04"] = { 4000000,4,1000 },
	["LX05"] = { 4000000,4,1000 },
	["LX06"] = { 4000000,4,1000 },
	["LX07"] = { 4000000,4,1000 },
	["LX08"] = { 4000000,4,1000 },
	["LX09"] = { 4000000,4,1000 },
	["LX10"] = { 4000000,4,1000 },
	["LX11"] = { 4000000,4,1000 },
	["LX12"] = { 4000000,4,1000 },
	["LX13"] = { 4000000,4,1000 },
	["LX14"] = { 4000000,4,1000 },
	["LX15"] = { 4000000,4,1000 },
	["LX16"] = { 4000000,4,1000 },
	["LX17"] = { 4000000,4,1000 },
	["LX18"] = { 4000000,4,1000 },
	["LX19"] = { 4000000,4,1000 },
	["LX20"] = { 4000000,4,1000 },
	["LX21"] = { 4000000,4,1000 },
	["LX22"] = { 4000000,4,1000 },
	["LX23"] = { 4000000,4,1000 },
	["LX24"] = { 4000000,4,1000 },
	["LX25"] = { 4000000,4,1000 },
	["LX26"] = { 4000000,4,1000 },
	["LX27"] = { 4000000,4,1000 },
	["LX28"] = { 4000000,4,1000 },
	["LX29"] = { 4000000,4,1000 },
	["LX30"] = { 4000000,4,1000 },
	["LX31"] = { 4000000,4,1000 },
	["LX32"] = { 4000000,4,1000 },
	["LX33"] = { 4000000,4,1000 },
	["LX34"] = { 4000000,4,1000 },
	["LX35"] = { 4000000,4,1000 },
	["LX36"] = { 4000000,4,1000 },
	["LX37"] = { 4000000,4,1000 },
	["LX38"] = { 4000000,4,1000 },
	["LX39"] = { 4000000,4,1000 },
	["LX40"] = { 4000000,4,1000 },
	["LX41"] = { 4000000,4,1000 },
	["LX42"] = { 4000000,4,1000 },
	["LX43"] = { 4000000,4,1000 },
	["LX44"] = { 4000000,4,1000 },
	["LX45"] = { 4000000,4,1000 },
	["LX46"] = { 4000000,4,1000 },
	["LX47"] = { 4000000,4,1000 },
	["LX48"] = { 4000000,4,1000 },
	["LX49"] = { 4000000,4,1000 },
	["LX50"] = { 4000000,4,1000 },
	["LX51"] = { 4000000,4,1000 },
	["LX52"] = { 4000000,4,1000 },
	["LX53"] = { 4000000,4,1000 },
	["LX54"] = { 4000000,4,1000 },
	["LX55"] = { 4000000,4,1000 },
	["LX56"] = { 4000000,4,1000 },
	["LX57"] = { 4000000,4,1000 },
	["LX58"] = { 4000000,4,1000 },
	["LX59"] = { 4000000,4,1000 },
	["LX60"] = { 4000000,4,1000 },
	["LX61"] = { 4000000,4,1000 },
	["LX62"] = { 4000000,4,1000 },
	["LX63"] = { 4000000,4,1000 },
	["LX64"] = { 4000000,4,1000 },
	["LX65"] = { 4000000,4,1000 },
	["LX66"] = { 4000000,4,1000 },
	["LX67"] = { 4000000,4,1000 },
	["LX68"] = { 4000000,4,1000 },
	["LX69"] = { 4000000,4,1000 },
	["LX70"] = { 4000000,4,1000 },	
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------SAMIR-------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["LS01"] = { 500000,3,300 },
	["LS02"] = { 500000,3,300 },
	["LS03"] = { 500000,3,300 },
	["LS04"] = { 500000,3,300 },
	["LS05"] = { 500000,3,300 },
	["LS06"] = { 500000,3,300 },
	["LS07"] = { 500000,3,300 },
	["LS08"] = { 500000,3,300 },
	["LS09"] = { 500000,3,300 },
	["LS10"] = { 500000,3,300 },
	["LS11"] = { 500000,3,300 },
	["LS12"] = { 500000,3,300 },
	["LS13"] = { 500000,3,300 },
	["LS14"] = { 500000,3,300 },
	["LS15"] = { 500000,3,300 },
	["LS16"] = { 500000,3,300 },
	["LS17"] = { 500000,3,300 },
	["LS18"] = { 500000,3,300 },
	["LS19"] = { 500000,3,300 },
	["LS20"] = { 500000,3,300 },
	["LS21"] = { 500000,3,300 },
	["LS22"] = { 500000,3,300 },
	["LS23"] = { 500000,3,300 },
	["LS24"] = { 500000,3,300 },
	["LS25"] = { 500000,3,300 },
	["LS26"] = { 500000,3,300 },
	["LS27"] = { 500000,3,300 },
	["LS28"] = { 500000,3,300 },
	["LS29"] = { 500000,3,300 },
	["LS30"] = { 500000,3,300 },
	["LS31"] = { 500000,3,300 },
	["LS32"] = { 500000,3,300 },
	["LS33"] = { 500000,3,300 },
	["LS34"] = { 500000,3,300 },
	["LS35"] = { 500000,3,300 },
	["LS36"] = { 500000,3,300 },
	["LS37"] = { 500000,3,300 },
	["LS38"] = { 500000,3,300 },
	["LS39"] = { 500000,3,300 },
	["LS40"] = { 500000,3,300 },
	["LS41"] = { 500000,3,300 },
	["LS42"] = { 500000,3,300 },
	["LS43"] = { 500000,3,300 },
	["LS44"] = { 500000,3,300 },
	["LS45"] = { 500000,3,300 },
	["LS46"] = { 500000,3,300 },
	["LS47"] = { 500000,3,300 },
	["LS48"] = { 500000,3,300 },
	["LS49"] = { 500000,3,300 },
	["LS50"] = { 500000,3,300 },
	["LS51"] = { 500000,3,300 },
	["LS52"] = { 500000,3,300 },
	["LS53"] = { 500000,3,300 },
	["LS54"] = { 500000,3,300 },
	["LS55"] = { 500000,3,300 },
	["LS56"] = { 500000,3,300 },
	["LS57"] = { 500000,3,300 },
	["LS58"] = { 500000,3,300 },
	["LS59"] = { 500000,3,300 },
	["LS60"] = { 500000,3,300 },
	["LS61"] = { 500000,3,300 },
	["LS62"] = { 500000,3,300 },
	["LS63"] = { 500000,3,300 },
	["LS64"] = { 500000,3,300 },
	["LS65"] = { 500000,3,300 },
	["LS66"] = { 500000,3,300 },
	["LS67"] = { 500000,3,300 },
	["LS68"] = { 500000,3,300 },
	["LS69"] = { 500000,3,300 },
	["LS70"] = { 500000,3,300 },
	["LS71"] = { 500000,3,300 },
	["LS72"] = { 500000,3,300 },
-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------BOLLINI------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["BL01"] = { 250000,2,200 },
	["BL02"] = { 250000,2,200 },
	["BL03"] = { 250000,2,200 },
	["BL04"] = { 250000,2,200 },
	["BL05"] = { 250000,2,200 },
	["BL06"] = { 250000,2,200 },
	["BL07"] = { 250000,2,200 },
	["BL08"] = { 250000,2,200 },
	["BL09"] = { 250000,2,200 },
	["BL10"] = { 250000,2,200 },
	["BL11"] = { 250000,2,200 },
	["BL12"] = { 250000,2,200 },
	["BL13"] = { 250000,2,200 },
	["BL14"] = { 250000,2,200 },
	["BL15"] = { 250000,2,200 },
	["BL16"] = { 250000,2,200 },
	["BL17"] = { 250000,2,200 },
	["BL18"] = { 250000,2,200 },
	["BL19"] = { 250000,2,200 },
	["BL20"] = { 250000,2,200 },
	["BL21"] = { 250000,2,200 },
	["BL22"] = { 250000,2,200 },
	["BL23"] = { 250000,2,200 },
	["BL24"] = { 250000,2,200 },
	["BL25"] = { 250000,2,200 },
	["BL26"] = { 250000,2,200 },
	["BL27"] = { 250000,2,200 },
	["BL28"] = { 250000,2,200 },
	["BL29"] = { 250000,2,200 },
	["BL30"] = { 250000,2,200 },
	["BL31"] = { 250000,2,200 },
	["BL32"] = { 250000,2,200 },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------LOSVAGOS------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["LV01"] = { 250000,2,200 },
	["LV02"] = { 250000,2,200 },
	["LV03"] = { 250000,2,200 },
	["LV04"] = { 250000,2,200 },
	["LV05"] = { 250000,2,200 },
	["LV06"] = { 250000,2,200 },
	["LV07"] = { 250000,2,200 },
	["LV08"] = { 250000,2,200 },
	["LV09"] = { 250000,2,200 },
	["LV10"] = { 250000,2,200 },
	["LV11"] = { 250000,2,200 },
	["LV12"] = { 250000,2,200 },
	["LV13"] = { 250000,2,200 },
	["LV14"] = { 250000,2,200 },
	["LV15"] = { 250000,2,200 },
	["LV16"] = { 250000,2,200 },
	["LV17"] = { 250000,2,200 },
	["LV18"] = { 250000,2,200 },
	["LV19"] = { 250000,2,200 },
	["LV20"] = { 250000,2,200 },
	["LV21"] = { 250000,2,200 },
	["LV22"] = { 250000,2,200 },
	["LV23"] = { 250000,2,200 },
	["LV24"] = { 250000,2,200 },
	["LV25"] = { 250000,2,200 },
	["LV26"] = { 250000,2,200 },
	["LV27"] = { 250000,2,200 },
	["LV28"] = { 250000,2,200 },
	["LV29"] = { 250000,2,200 },
	["LV30"] = { 250000,2,200 },
	["LV31"] = { 250000,2,200 },
	["LV32"] = { 250000,2,200 },
	["LV33"] = { 250000,2,200 },
	["LV34"] = { 250000,2,200 },
	["LV35"] = { 250000,2,200 },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------KRONDORS------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["KR01"] = { 250000,2,200 },
	["KR02"] = { 250000,2,200 },
	["KR03"] = { 250000,2,200 },
	["KR04"] = { 250000,2,200 },
	["KR05"] = { 250000,2,200 },
	["KR06"] = { 250000,2,200 },
	["KR07"] = { 250000,2,200 },
	["KR08"] = { 250000,2,200 },
	["KR09"] = { 250000,2,200 },
	["KR10"] = { 250000,2,200 },
	["KR11"] = { 250000,2,200 },
	["KR12"] = { 250000,2,200 },
	["KR13"] = { 250000,2,200 },
	["KR14"] = { 250000,2,200 },
	["KR15"] = { 250000,2,200 },
	["KR16"] = { 250000,2,200 },
	["KR17"] = { 250000,2,200 },
	["KR18"] = { 250000,2,200 },
	["KR19"] = { 250000,2,200 },
	["KR20"] = { 250000,2,200 },
	["KR21"] = { 250000,2,200 },
	["KR22"] = { 250000,2,200 },
	["KR23"] = { 250000,2,200 },
	["KR24"] = { 250000,2,200 },
	["KR25"] = { 250000,2,200 },
	["KR26"] = { 250000,2,200 },
	["KR27"] = { 250000,2,200 },
	["KR28"] = { 250000,2,200 },
	["KR29"] = { 250000,2,200 },
	["KR30"] = { 250000,2,200 },
	["KR31"] = { 250000,2,200 },
	["KR32"] = { 250000,2,200 },
	["KR33"] = { 250000,2,200 },
	["KR34"] = { 250000,2,200 },
	["KR35"] = { 250000,2,200 },
	["KR36"] = { 250000,2,200 },
	["KR37"] = { 250000,2,200 },
	["KR38"] = { 250000,2,200 },
	["KR39"] = { 250000,2,200 },
	["KR40"] = { 250000,2,200 },
	["KR41"] = { 250000,2,200 },
-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------GROOVEMOTEL--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["GR01"] = { 250000,2,200 },
	["GR02"] = { 250000,2,200 },
	["GR03"] = { 250000,2,200 },
	["GR04"] = { 250000,2,200 },
	["GR05"] = { 250000,2,200 },
	["GR06"] = { 250000,2,200 },
	["GR07"] = { 250000,2,200 },
	["GR08"] = { 250000,2,200 },
	["GR09"] = { 250000,2,200 },
	["GR10"] = { 250000,2,200 },
	["GR11"] = { 250000,2,200 },
	["GR12"] = { 250000,2,200 },
	["GR13"] = { 250000,2,200 },
	["GR14"] = { 250000,2,200 },
	["GR15"] = { 250000,2,200 },
-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------ALLSUELLMOTEL------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["AS01"] = { 250000,2,200 },
	["AS02"] = { 250000,2,200 },
	["AS03"] = { 250000,2,200 },
	["AS04"] = { 250000,2,200 },
	["AS05"] = { 250000,2,200 },
	["AS06"] = { 250000,2,200 },
	["AS07"] = { 250000,2,200 },
	["AS08"] = { 250000,2,200 },
	["AS09"] = { 250000,2,200 },
	["AS10"] = { 250000,2,200 },
	["AS12"] = { 250000,2,200 },
	["AS13"] = { 250000,2,200 },
	["AS14"] = { 250000,2,200 },
	["AS15"] = { 250000,2,200 },
	["AS16"] = { 250000,2,200 },
	["AS17"] = { 250000,2,200 },
	["AS18"] = { 250000,2,200 },
	["AS19"] = { 250000,2,200 },
	["AS20"] = { 250000,2,200 },
	["AS21"] = { 250000,2,200 },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------PINKCAGEMOTEL-----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["PC01"] = { 250000,2,150 },
	["PC02"] = { 250000,2,150 },
	["PC03"] = { 250000,2,150 },
	["PC04"] = { 250000,2,150 },
	["PC05"] = { 250000,2,150 },
	["PC06"] = { 250000,2,150 },
	["PC07"] = { 250000,2,150 },
	["PC08"] = { 250000,2,150 },
	["PC09"] = { 250000,2,150 },
	["PC10"] = { 250000,2,150 },
	["PC11"] = { 250000,2,150 },
	["PC12"] = { 250000,2,150 },
	["PC13"] = { 250000,2,150 },
	["PC14"] = { 250000,2,150 },
	["PC15"] = { 250000,2,150 },
	["PC16"] = { 250000,2,150 },
	["PC17"] = { 250000,2,150 },
	["PC18"] = { 250000,2,150 },
	["PC19"] = { 250000,2,150 },
	["PC20"] = { 250000,2,150 },
	["PC21"] = { 250000,2,150 },
	["PC22"] = { 250000,2,150 },
	["PC23"] = { 250000,2,150 },
	["PC24"] = { 250000,2,150 },
	["PC25"] = { 250000,2,150 },
	["PC26"] = { 250000,2,150 },
	["PC27"] = { 250000,2,150 },
	["PC28"] = { 250000,2,150 },
	["PC29"] = { 250000,2,150 },
	["PC30"] = { 250000,2,150 },
	["PC31"] = { 250000,2,150 },
	["PC32"] = { 250000,2,150 },
	["PC33"] = { 250000,2,150 },
	["PC34"] = { 250000,2,150 },
	["PC35"] = { 250000,2,150 },
	["PC36"] = { 250000,2,150 },
	["PC37"] = { 250000,2,150 },
	["PC38"] = { 250000,2,150 },
-----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------PALETOMOTEL------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["PL01"] = { 250000,2,150 },
	["PL02"] = { 250000,2,150 },
	["PL03"] = { 250000,2,150 },
	["PL04"] = { 250000,2,150 },
	["PL05"] = { 250000,2,150 },
	["PL06"] = { 250000,2,150 },
	["PL07"] = { 250000,2,150 },
	["PL08"] = { 250000,2,150 },
	["PL09"] = { 250000,2,150 },
	["PL11"] = { 250000,2,150 },
	["PL12"] = { 250000,2,150 },
	["PL13"] = { 250000,2,150 },
	["PL14"] = { 250000,2,150 },
	["PL15"] = { 250000,2,150 },
	["PL16"] = { 250000,2,150 },
	["PL17"] = { 250000,2,150 },
	["PL18"] = { 250000,2,150 },
	["PL19"] = { 250000,2,150 },
	["PL20"] = { 250000,2,150 },
	["PL21"] = { 250000,2,150 },
	["PL22"] = { 250000,2,150 },
-----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["PB01"] = { 250000,2,250 },
	["PB02"] = { 250000,2,250 },
	["PB03"] = { 250000,2,250 },
	["PB04"] = { 250000,2,250 },
	["PB05"] = { 250000,2,250 },
	["PB06"] = { 250000,2,250 },
	["PB07"] = { 250000,2,250 },
	["PB08"] = { 250000,2,250 },
	["PB09"] = { 250000,2,250 },
	["PB10"] = { 250000,2,250 },
	["PB11"] = { 250000,2,250 },
	["PB12"] = { 250000,2,250 },
	["PB13"] = { 250000,2,250 },
	["PB14"] = { 250000,2,250 },
	["PB15"] = { 250000,2,250 },
	["PB16"] = { 250000,2,250 },
	["PB17"] = { 250000,2,250 },
	["PB18"] = { 250000,2,250 },
	["PB19"] = { 250000,2,250 },
	["PB20"] = { 250000,2,250 },
	["PB21"] = { 250000,2,250 },
	["PB22"] = { 250000,2,250 },
	["PB23"] = { 250000,2,250 },
	["PB24"] = { 250000,2,250 },
	["PB25"] = { 250000,2,250 },
	["PB26"] = { 250000,2,250 },
	["PB27"] = { 250000,2,250 },
	["PB28"] = { 250000,2,250 },
	["PB29"] = { 250000,2,250 },
	["PB30"] = { 250000,2,250 },
	["PB31"] = { 250000,2,250 },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------MANSAO------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["MS01"] = { 99999999,5,1500 },
	["MS02"] = { 99999999,5,1500 },
	["MS03"] = { 99999999,5,1500 },
	["MS04"] = { 99999999,5,1500 },
	["MS05"] = { 99999999,5,1500 },
	["MS06"] = { 99999999,5,1500 },
	["MS07"] = { 99999999,5,1500 },
	["MS08"] = { 99999999,5,1500 },
	["MS09"] = { 99999999,5,1500 },
-----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------SANDYSHORE------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["SS01"] = { 99999999,5,1000 },
	["SS02"] = { 99999999,5,1000 },
	["SS03"] = { 99999999,5,1000 },
	["SS05"] = { 99999999,5,1000 },
	["SS06"] = { 99999999,5,1000 },
	["juiz"] = { 99999999,5,1000 },
-----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------SANDYSHORE------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	["FZ01"] = { 99999999,5,1500 },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local blipHomes = {}
local opened = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPHOMES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		blipHomes = {}
		for k,v in pairs(homes) do
			local checkHomes = vRP.query("homes/get_homeuseridowner",{ home = tostring(k) })
			if checkHomes[1] == nil then
				table.insert(blipHomes,{ name = tostring(k), price = parseInt(v[1]) })
				Citizen.Wait(10)
			end
		end
		Citizen.Wait(30*60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOMES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('homes',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] == "add" and homes[tostring(args[2])] then
			local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(user_id), home = tostring(args[2]) })
			if myHomes[1] then
				local totalResidents = vRP.query("homes/count_homepermissions",{ home = tostring(args[2]) })
				if parseInt(totalResidents[1].qtd) >= parseInt(homes[tostring(args[2])][2]) then
					TriggerClientEvent("Notify",source,"negado","Negado","A residência "..tostring(args[2]).." atingiu o máximo de moradores.",10000)
					return
				end

				vRP.execute("homes/add_permissions",{ home = tostring(args[2]), user_id = parseInt(args[3]) })
				local identity = vRP.getUserIdentity(parseInt(args[3]))
				if identity then
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Permissão na residência <b>"..tostring(args[2]).."</b> adicionada para <b>"..identity.name.." "..identity.firstname.."</b>.",10000)
				end
			end
		elseif args[1] == "rem" and homes[tostring(args[2])] then
			local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(user_id), home = tostring(args[2]) })
			if myHomes[1] then
				local userHomes = vRP.query("homes/get_homeuser",{ user_id = parseInt(args[3]), home = tostring(args[2]) })
				if userHomes[1] then
					vRP.execute("homes/rem_permissions",{ home = tostring(args[2]), user_id = parseInt(args[3]) })
					local identity = vRP.getUserIdentity(parseInt(args[3]))
					if identity then
						TriggerClientEvent("Notify",source,"importante","Permissão na residência <b>"..tostring(args[2]).."</b> removida de <b>"..identity.name.." "..identity.firstname.."</b>.",10000)
					end
				end
			end
		elseif args[1] == "garage" and homes[tostring(args[2])] then
			local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(user_id), home = tostring(args[2]) })
			if myHomes[1] then
				local userHomes = vRP.query("homes/get_homeuser",{ user_id = parseInt(args[3]), home = tostring(args[2]) })
				if userHomes[1] then
					if vRP.tryPayment(user_id,50000) then
						vRP.execute("homes/upd_permissions",{ home = tostring(args[2]), user_id = parseInt(args[3]) })
						local identity = vRP.getUserIdentity(parseInt(args[3]))
						if identity then
							TriggerClientEvent("Notify",source,"sucesso","Adicionado a permissão da garagem a <b>"..identity.name.." "..identity.firstname.."</b>.",10000)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
					end
				end
			end
		elseif args[1] == "list" then
			vCLIENT.setBlipsHomes(source,blipHomes)
		elseif args[1] == "check" and homes[tostring(args[2])] then
			local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(user_id), home = tostring(args[2]) })
			if myHomes[1] then
				local userHomes = vRP.query("homes/get_homepermissions",{ home = tostring(args[2]) })
				if parseInt(#userHomes) > 1 then
					local permissoes = ""
					for k,v in pairs(userHomes) do
						if v.user_id ~= user_id then
							local identity = vRP.getUserIdentity(v.user_id)
							permissoes = permissoes.."<b>Nome:</b> "..identity.name.." "..identity.firstname.." - <b>Passaporte:</b> "..v.user_id
							if k ~= #userHomes then
								permissoes = permissoes.."<br>"
							end
						end
						Citizen.Wait(10)
					end
					TriggerClientEvent("Notify",source,"importante","Permissões da residência <b>"..tostring(args[2]).."</b>: <br>"..permissoes,20000)
				else
					TriggerClientEvent("Notify",source,"negado","Nenhuma permissão encontrada.",20000)
				end
			end
		elseif args[1] == "transfer" and homes[tostring(args[2])] then
			local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(user_id), home = tostring(args[2]) })
			if myHomes[1] then
				local identity = vRP.getUserIdentity(parseInt(args[3]))
				if identity then
					local ok = vRP.request(source,"Transferir a residência <b>"..tostring(args[2]).."</b> para <b>"..identity.name.." "..identity.firstname.."</b>?",30)
					if ok then
						vRP.execute("homes/rem_allpermissions",{ home = tostring(args[2]) })
						vRP.execute("homes/buy_permissions",{ home = tostring(args[2]), user_id = parseInt(args[3]), tax = parseInt(myHomes[1].tax) })
						TriggerClientEvent("Notify",source,"importante","Transferiu a residência <b>"..tostring(args[2]).."</b> para <b>"..identity.name.." "..identity.firstname.."</b>.",10000)
					end
				end
			end
		elseif args[1] == "tax" and homes[tostring(args[2])] then
			local ownerHomes = vRP.query("homes/get_homeuseridowner",{ home = tostring(args[2]) })
			if ownerHomes[1] then
				--if not vRP.hasGroup(user_id,"Platina") then
					local house_price = parseInt(homes[tostring(args[2])][1])
					local house_tax = 0.10
					local calc_tax = parseInt(house_price * house_tax)
					if house_price >= 7000000 then
						house_tax = 0.00
					end
					if calc_tax > 100000 then
						calc_tax = 100000
					end

					if vRP.tryPayment(user_id,calc_tax) then
						vRP.execute("homes/rem_permissions",{ home = tostring(args[2]), user_id = parseInt(ownerHomes[1].user_id) })
						vRP.execute("homes/buy_permissions",{ home = tostring(args[2]), user_id = parseInt(ownerHomes[1].user_id), tax = parseInt(os.time()) })
						TriggerClientEvent("Notify",source,"sucesso","Pagamento de <b>R$"..vRP.format(calc_tax).." reais</b> efetuado com sucesso.",10000)
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
					end
				--end
			end
		else
			local myHomes = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
			if parseInt(#myHomes) >= 1 then
				for k,v in pairs(myHomes) do
					local ownerHomes = vRP.query("homes/get_homeuseridowner",{ home = tostring(v.home) })
					if ownerHomes[1] then
						local house_price = parseInt(homes[tostring(v.home)][1])
						local house_tax = 0.10
						local calc_tax = parseInt(house_price * house_tax)
						if house_price >= 7000000 then
							house_tax = 0.00
						end
						if calc_tax > 100000 then
							calc_tax = 100000
						end

						if parseInt(os.time()) >= parseInt(ownerHomes[1].tax+24*10*60*60) then
							TriggerClientEvent("Notify",source,"negado","<b>Residência:</b> "..v.home.."<br><b>Property Tax:</b> Atrasado<br>Valor: <b>R$"..vRP.format(calc_tax).." reais</b>",20000)
						else
							TriggerClientEvent("Notify",source,"importante","<b>Residência:</b> "..v.home.."<br>Taxa em: "..vRP.getDayHours(parseInt(86400*10-(os.time()-ownerHomes[1].tax))).."<br>Valor: <b>R$"..vRP.format(calc_tax).." reais</b>",20000)
						end
						Citizen.Wait(10)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local myHomes = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
		if parseInt(#myHomes) >= 1 then
			for k,v in pairs(myHomes) do
				vCLIENT.setBlipsOwner(source,v.home)
				Citizen.Wait(10)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDOWNTIME
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		for k,v in pairs(actived) do
			if v > 0 then
				actived[k] = v - 2
				if v == 0 then
					actived[k] = nil
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
local answered = {}
function src.checkPermissions(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			if not vRP.searchReturn(source,user_id) then
				local homeResult = vRP.query("homes/get_homepermissions",{ home = tostring(homeName) })
				if parseInt(#homeResult) >= 1 then
					local myResult = vRP.query("homes/get_homeuser",{ user_id = parseInt(user_id), home = tostring(homeName) })
					local resultOwner = vRP.query("homes/get_homeuseridowner",{ home = tostring(homeName) })
					if myResult[1] then

						if homes[homeName][1] > 10000000 then
							return true
						end

						if parseInt(os.time()) >= parseInt(resultOwner[1].tax+24*13*60*60) then

							local cows = vRP.getSData("chest:"..tostring(homeName))
							local rows = json.decode(cows) or {}
							if rows then
								vRP.execute("creative/rem_srv_data",{ dkey = "chest:"..tostring(homeName) })
							end

							vRP.execute("homes/rem_allpermissions",{ home = tostring(homeName) })
							TriggerClientEvent("Notify",source,"aviso","A <b>Property Tax</b> venceu por <b>3 dias</b> e a casa foi vendida.",10000)
							return false
						elseif parseInt(os.time()) <= parseInt(resultOwner[1].tax+24*10*60*60) then
							return true
						else
							TriggerClientEvent("Notify",source,"aviso","A <b>Property Tax</b> da residência está atrasada.",10000)
							return false
						end
					else
						if parseInt(os.time()) >= parseInt(resultOwner[1].tax+24*13*60*60)then
							local cows = vRP.getSData("chest:"..tostring(homeName))
							local rows = json.decode(cows) or {}
							if rows then
								vRP.execute("creative/rem_srv_data",{ dkey = "chest:"..tostring(homeName) })
							end

							vRP.execute("homes/rem_allpermissions",{ home = tostring(homeName) })
							return false
						end

						if parseInt(os.time()) >= parseInt(resultOwner[1].tax+24*10*60*60) then
							TriggerClientEvent("Notify",source,"aviso","A <b>Property Tax</b> da residência está atrasada.",10000)
							return false
						end

						answered[user_id] = nil
						for k,v in pairs(homeResult) do
							local player = vRP.getUserSource(parseInt(v.user_id))
							if player then
								if not answered[user_id] then
									TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> tocou o interfone da residência <b>"..tostring(homeName).."</b>.<br>Deseja permitir a entrada do mesmo?",10000)
									local ok = vRP.request(player,"Permitir acesso a residência?",30)
									if ok then
										answered[user_id] = true
										return true
									end
								end
							end
							Citizen.Wait(10)
						end
					end
				else
					local ok = vRP.request(source,"Deseja efetuar a compra da residência <b>"..tostring(homeName).."</b> por <b>R$"..vRP.format(parseInt(homes[tostring(homeName)][1])).."</b> ?",30)
					if ok then
						if vRP.tryPayment(user_id,parseInt(homes[tostring(homeName)][1])) then
							vRP.execute("homes/buy_permissions",{ home = tostring(homeName), user_id = parseInt(user_id), tax = parseInt(os.time()) })
							TriggerClientEvent("Notify",source,"sucesso",'Sucesso',"A residência <b>"..tostring(homeName).."</b> foi comprada com sucesso.",10000)
						else
							TriggerClientEvent("Notify",source,"negado",'Negado',"Dinheiro insuficiente.")
						end
					end
					return false
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINTPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkIntPermissions(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			local myResult = vRP.query("homes/get_homeuser",{ user_id = parseInt(user_id), home = tostring(homeName) })
			if myResult[1] or vRP.hasPermission(user_id,"policia.permissao") then
			--if myResult[1] then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('outfit',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local homeName = vCLIENT.getHomeStatistics(source)
		local myResult = vRP.query("homes/get_homeuser",{ user_id = parseInt(user_id), home = tostring(homeName) })
		if myResult[1] then
			local data = vRP.getSData("outfit:"..tostring(homeName))
			local result = json.decode(data) or {}
			if result then
				if args[1] == "save" and args[2] then
					local custom = vRPclient.getCustomPlayer(source)
					if custom then
						local outname = sanitizeString(rawCommand:sub(13),sanitizes.homename[1],sanitizes.homename[2])
						if result[outname] == nil and string.len(outname) > 0 then
							result[outname] = custom
							vRP.setSData("outfit:"..tostring(homeName),json.encode(result))
							TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> adicionado com sucesso.",10000)
						else
							TriggerClientEvent("Notify",source,"aviso","Nome escolhido já existe na lista de <b>Outfits</b>.",10000)
						end
					end
				elseif args[1] == "rem" and args[2] then
					local outname = sanitizeString(rawCommand:sub(12),sanitizes.homename[1],sanitizes.homename[2])
					if result[outname] ~= nil and string.len(outname) > 0 then
						result[outname] = nil
						vRP.setSData("outfit:"..tostring(homeName),json.encode(result))
						TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> removido com sucesso.",10000)
					else
						TriggerClientEvent("Notify",source,"negado","Nome escolhido não encontrado na lista de <b>Outfits</b>.",10000)
					end
				elseif args[1] == "apply" and args[2] then
					local outname = sanitizeString(rawCommand:sub(14),sanitizes.homename[1],sanitizes.homename[2])
					if result[outname] ~= nil and string.len(outname) > 0 then
						TriggerClientEvent("updateRoupas",source,result[outname])
						TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> aplicado com sucesso.",10000)
					else
						TriggerClientEvent("Notify",source,"negado","Nome escolhido não encontrado na lista de <b>Outfits</b>.",10000)
					end
				else
					for k,v in pairs(result) do
						TriggerClientEvent("Notify",source,"importante","<b>Outfit:</b> "..k,20000)
						Citizen.Wait(10)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK OPENED CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkOpen(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not opened[homeName] then
			opened[homeName] = true
			return false
		else
			return true
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SET OPENED CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.setClose(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		opened[homeName] = false		
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESBUGAR BAÚ EM USO (PLAYER CAIU)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('resethomes',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		opened = {}
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.openChest(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local hsinventory = {}
		local myinventory = {}
		local data = vRP.getSData("chest:"..tostring(homeName))
		local result = json.decode(data) or {}
		if result then
			for k,v in pairs(result) do
				table.insert(hsinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end

			local inv = vRP.getInventory(parseInt(user_id))
			for k,v in pairs(inv) do
				table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end
		end
		return hsinventory,myinventory,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(result),parseInt(homes[tostring(homeName)][3])
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.storeItem(homeName,itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id then
			if string.match(itemName,"dolar") or string.match(itemName,"mochila") then
				TriggerClientEvent("Notify",source,"negado",'Negado',"Não pode guardar este item.")
				return
			end

			local data = vRP.getSData("chest:"..tostring(homeName))
			local items = json.decode(data) or {}
			if items then
				if parseInt(amount) > 0 then
					local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(amount)
					if new_weight <= parseInt(homes[tostring(homeName)][3]) then
						if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
							if vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(amount)) then
								actived[parseInt(user_id)] = 4
								SendWebhookMessage(webhookbaucasas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..(tostring(homeName)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								if items[itemName] ~= nil then
									items[itemName].amount = parseInt(items[itemName].amount) + parseInt(amount)
								else
									items[itemName] = { amount = parseInt(amount) }
								end
								vRP.setSData("chest:"..tostring(homeName),json.encode(items))
								TriggerClientEvent('KSRP:UpdateVault',source,'updateVault')
							end
						end
					else
						TriggerClientEvent("Notify",source,"negado","<b>Vault</b> cheio.",8000)
					end
				else
					local inv = vRP.getInventory(parseInt(user_id))
					for k,v in pairs(inv) do
						if itemName == k then
							local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(v.amount)
							if new_weight <= parseInt(homes[tostring(homeName)][3]) then
								if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
									if vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(v.amount)) then
										actived[parseInt(user_id)] = 4
										if items[itemName] ~= nil then
											items[itemName].amount = parseInt(items[itemName].amount) + parseInt(v.amount)
										else
											items[itemName] = { amount = parseInt(v.amount) }
										end
										SendWebhookMessage(webhookbaucasas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(v.amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..(tostring(homeName)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
										vRP.setSData("chest:"..tostring(homeName),json.encode(items))
										TriggerClientEvent('KSRP:UpdateVault',source,'updateVault')
									end
								end
							else
								TriggerClientEvent("Notify",source,"negado","<b>Vault</b> cheio.",8000)
							end
						end
					end
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.takeItem(homeName,itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id then
			local data = vRP.getSData("chest:"..tostring(homeName))
			local items = json.decode(data) or {}
			if items then
				if parseInt(amount) > 0 then
					if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
						if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
							if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then
								actived[parseInt(user_id)] = 4
								SendWebhookMessage(webhookbaucasas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..(tostring(homeName)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(amount))
								items[itemName].amount = parseInt(items[itemName].amount) - parseInt(amount)
								if parseInt(items[itemName].amount) <= 0 then
									items[itemName] = nil
								end
								TriggerClientEvent('KSRP:UpdateVault',source,'updateVault')
								vRP.setSData("chest:"..tostring(homeName),json.encode(items))
							else
								TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
							end
						end
						
					end
				else
					if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
						if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
							if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(items[itemName].amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then
								actived[parseInt(user_id)] = 4
								SendWebhookMessage(webhookbaucasas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(items[itemName].amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..(tostring(homeName)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(items[itemName].amount))
								items[itemName] = nil
								TriggerClientEvent('KSRP:UpdateVault',source,'updateVault')
								vRP.setSData("chest:"..tostring(homeName),json.encode(items))
							else
								TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
							end
						end
					end
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			return true
		end
		return false
	end
end