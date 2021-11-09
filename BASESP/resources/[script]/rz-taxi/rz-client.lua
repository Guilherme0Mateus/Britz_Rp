local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

rzT = Tunnel.getInterface("rz-taxi")

rzS = {}
Tunnel.bindInterface("rz-taxi",rzS)

local normal = 786603
local apressado = 2883621

-- // -------------------------------------------------------
-- // Configuração
-- // -------------------------------------------------------

local carroTaxi = "taxi"         -- Carro usado pelo taxista.   Escolha em: https://wiki.rage.mp/index.php?title=Vehicles
local pedTaxi = "ig_andreas"     -- Ped motorista do taxi.      Escolha em: https://wiki.rage.mp/index.php?title=Peds
local drivingStyle = apressado   -- Modo de dirigir. Escolha entre normal e apressado


-- // -------------------------------------------------------
-- // Configuração
-- // -------------------------------------------------------

local blip = true
local stopCarro = 1
local stopCarroB = 1

local cooldown = 0

function nilVariables()
    blip = true
    stopCarro = 1
    stopCarroB = 1
    cooldown = 0
    taxi = nil
    taxista = nil
    blipb = nil
    tax = false
    ground = nil
    x = nil
    y = nil
    z = nil
    groundFound = false
    ped = nil
    cdsx = nil
    cdsy = nil
    cdsz = nil
    vehicle = nil
    distancia = nil
end


RegisterNetEvent("iniciarTaxi")
AddEventHandler("iniciarTaxi", function()
    if cooldown == 0 then
        TriggerEvent("Notify", "importante", "Taxista a caminho. Espera no local.")
        cooldown = 1
        local ped = PlayerPedId()
        local pedx, pedy, pedz = table.unpack(GetEntityCoords(ped))

        criarTaxi(pedx, pedy, pedz)
    elseif cooldown == 1 then
        TriggerEvent("Notify", "importante", "Taxistas ocupados, aguarde alguns segundos e tente novamente!")
    end

end)



function criarTaxi(pedx, pedy, pedz)

    while not HasModelLoaded(carroTaxi) do
        RequestModel(carroTaxi)
        Citizen.Wait(0)
    end

    while not HasModelLoaded(pedTaxi) do
        RequestModel(pedTaxi)
        Citizen.Wait(0)
    end

    local retval, p5, p6, p7, p8, p9 = GetClosestRoad(pedx + 250, pedy + 250, pedz, 1.0, 1, false)
    local ruax, ruay, ruaz = table.unpack(p6)

    taxi = CreateVehicle(GetHashKey(carroTaxi), ruax, ruay, ruaz + 0.5, 0.0, true, true)
    SetEntityAsMissionEntity(taxi, true, true)

    SetVehicleIsStolen(taxi,false)
    SetVehicleNeedsToBeHotwired(taxi,false)
    SetVehicleOnGroundProperly(taxi)
    SetVehRadioStation(taxi,"OFF")

    taxista = CreatePedInsideVehicle(taxi, 4, GetHashKey(pedTaxi), -1, true, true)
    SetEntityAsMissionEntity(taxista, true, true)


    local cdsx, cdsy, cdsz = table.unpack(GetEntityCoords(PlayerPedId()))
    dirigirCoords(cdsx, cdsy, cdsz, 'a')

end




function dirigirCoords(cdsx, cdsy, cdsz, status)
    ClearPedTasks(taxista)
    SetPedIntoVehicle(taxista, taxi, -1)
    FreezeEntityPosition(taxi, false)
    FreezeEntityPosition(taxista, false)
    TaskVehicleDriveToCoord(taxista, taxi, cdsx, cdsy, cdsz, 17.0, 0, GetHashKey(carroTaxi), drivingStyle, 1, true)
    if status == 'a' then
        stopCar(cdsx, cdsy, cdsz)
    elseif status == 'b' then
        stopCarB(cdsx, cdsy, cdsz)
    end
end

function dirigirCoordsB(cdsx, cdsy, cdsz)

    TaskVehicleDriveToCoord(taxista, taxi, cdsx, cdsy, cdsz, 17.0, 0, GetHashKey(carroTaxi), drivingStyle, 1, true)
    stopCarB(cdsx, cdsy, cdsz)

end

-- // -------------------------------------------------------
-- // Blip
-- // -------------------------------------------------------




function stopCar(cdsx, cdsy, cdsz)
    blipb = AddBlipForCoord(tx,ty,tz)
    SetBlipSprite(blipb,56)
    SetBlipColour(blipb,60)
    SetBlipScale(blipb,0.75)
    SetBlipAsShortRange(blipb,false)
    SetBlipRoute(blipb,false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Taxista à caminho")
    EndTextCommandSetBlipName(blipb)

    while stopCarro == 1 do
        local tx, ty, tz = GetEntityCoords(taxi)
        local distance = GetDistanceBetweenCoords(cdsx, cdsy, cdsz, tx, ty, tz, true)
        SetBlipCoords(blipb,tx,ty,tz)
        if distance <= 10 then
            ClearPedTasks(taxista)
            SetPedIntoVehicle(taxista, -1)
            FreezeEntityPosition(taxi, true)
            SetVehicleDoorsLocked(taxi, false)
            stopCarro = 0
            blipWaypoint()
            RemoveBlip(blipb)
        end
        Citizen.Wait(0)
    end

end



function blipWaypoint()
    
    local ped = PlayerPedId()

    while blip do  
        local waypointBlip = GetFirstBlipInfoId(8)
        x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))
    
        local ground
        local groundFound = false
        local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }
    
        for i,height in ipairs(groundCheckHeights) do

            RequestCollisionAtCoord(x,y,z)
            while not HasCollisionLoadedAroundEntity(ped) do
                RequestCollisionAtCoord(x,y,z)
                Citizen.Wait(1)
            end
            Citizen.Wait(20)
    
            ground,z = GetGroundZFor_3dCoord(x,y,height)
            if ground then
                z = z + 1.0
                groundFound = true
                break;
            end
        end
    
        if not groundFound then
            z = 1200
            GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
        end
    
        RequestCollisionAtCoord(x,y,z)
        while not HasCollisionLoadedAroundEntity(ped) do
            RequestCollisionAtCoord(x,y,z)
            Citizen.Wait(1)
        end

        if x == 0 and y == 0 then
            blip = true
            TriggerEvent("Notify","importante", "Marque no GPS o destino.")
            Citizen.Wait(5000)
        else 
            blip = false
            distancia = GetDistanceBetweenCoords(x, y, z, GetEntityCoords(PlayerPedId()), true)
            TriggerServerEvent("pgto", distancia)
            --[[local pg = rzT.distancia(distancia)
            if pg == 'entrarVeiculo' then
                TriggerEvent('entrarVeiculo')
            elseif pg == 'semDinheiro' then
                TriggerEvent('Notify', 'importante', 'Dinheiro insuficiente! O taxi irá embora.')
                TriggerEvent('andarRandom')
            elseif pg == 'andarRandom' then
                TriggerEvent('Notify', 'importante', 'O taxi irá embora e não será cobrado nenhum valor.')
                TriggerEvent('andarRandom')
            end]]
        end
        Citizen.Wait(0)
    end
end


function stopCarB(x, y, z)
    while stopCarroB == 1 do
        local tx, ty, tz = GetEntityCoords(taxi)
        local distance = GetDistanceBetweenCoords(x, y, z, tx, ty, tz, true)
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local vehped = IsPedInAnyVehicle(PlayerPedId())
        if distance <= 10 then
            if vehicle == taxi then
                FreezeEntityPosition(taxi, true)
                TaskLeaveVehicle(PlayerPedId(), taxi, 0)
                TriggerEvent("andarRandom")
            end
            stopCarroB = 0
        end
        Citizen.Wait(0)
    end

end

-- // -------------------------------------------------------
-- // Eventos
-- // -------------------------------------------------------

local tax = false

RegisterNetEvent("entrarVeiculo")
AddEventHandler("entrarVeiculo", function()
    print('salve')
    local ped = PlayerPedId()
    TaskEnterVehicle(ped,taxi,-1,2,1.0,1,0)
    --setVehicle(ped)
    print('true')
    repeat
        print('começou o loop')
        SetVehicleDoorsLocked(taxi, false)
        print('portas fechadas')
        if IsPedInAnyVehicle(ped) then
            print('ped ta no veiculo')
            local vehicle = GetVehiclePedIsIn(ped)
            print('peguei o carro')
            if vehicle == taxi then
                print('o veiculo é o taxi')
                FreezeEntityPosition(taxi, false)
                local cdsx = x
                local cdsy = y
                local cdsz = z
                ClearPedTasks(taxista)
                SetPedIntoVehicle(taxista, -1)
                dirigirCoords(cdsx,cdsy,cdsz,'b')
                tax = true
            end
        end
        Citizen.Wait(0)
    until(tax == true)


end)

AddEventHandler("entrarVeiculo", function()
    Citizen.Wait(10000)
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    SetPedIntoVehicle(ped, taxi,2)
    print('bla')
end)

RegisterNetEvent("andarRandom")
AddEventHandler("andarRandom", function()
    cooldown = 1
    Citizen.Wait(2000)
    ClearPedTasks(taxista)
    SetPedIntoVehicle(taxista, -1)
    FreezeEntityPosition(taxi, false)
    TaskVehicleDriveWander(taxista, taxi, GetVehicleEstimatedMaxSpeed(taxi), 786603)
    Citizen.Wait(20000)
    ClearPedTasks(taxista)
    ClearPedTasks(PlayerPedId())
    DeletePed(taxista)
    DeleteVehicle(taxi)
    nilVariables()
    cooldown = 0
end)

function rzS.checkCooldown()
    return cooldown
end
