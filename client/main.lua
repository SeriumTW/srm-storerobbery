ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- Configurazione iniziale
local isInRobberyArea = false
local currentRobberyLocation = nil
local isRobbing = false
local robberyLocations = Config.RobberyLocations
local hideNUI = false



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.50, 0.50)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 299, 255, 255, 215, 68)
end

-- Verifica la presenza del giocatore nelle aree di rapina
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local isInAnyArea = false
        local currentArea = nil

        for location, coords in ipairs(robberyLocations) do
          
            local distance = #(pedCoords - vector3(coords.x, coords.y, coords.z))
            
            if distance < 30 then
                isInAnyArea = true
                currentArea = location
                break
            end
        end

        if isInAnyArea then
            isInRobberyArea = true
            currentRobberyLocation = currentArea
        else
            isInRobberyArea = false
            currentRobberyLocation = nil
        end

         -- Controlla se chi sta rapinando esce dalla zona
        if isRobbing and currentRobberyLocation and #(pedCoords - vector3(robberyLocations[currentRobberyLocation].x, robberyLocations[currentRobberyLocation].y, robberyLocations[currentRobberyLocation].z)) > Config.MaxRobberyDistance then
            isRobbing = false
            hideNUI = true
            Wait(1000)
            hideUI()
            TriggerServerEvent('srm-storerobbery:server:CancelRobbery',currentRobberyLocation)
            hideNUI = false
        end

        Citizen.Wait(500)
    end
end)

-- Interazione con i punti di rapina
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isInRobberyArea and not IsPedInAnyVehicle(PlayerPedId()) then
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local coordsDrawText = vector3(robberyLocations[currentRobberyLocation].x, robberyLocations[currentRobberyLocation].y, robberyLocations[currentRobberyLocation].z)
            local distance = #(pedCoords - coordsDrawText)
            if distance < 3 then
                if not isRobbing then
                    DrawText3Ds(robberyLocations[currentRobberyLocation].x, robberyLocations[currentRobberyLocation].y, robberyLocations[currentRobberyLocation].z, "~g~[E]~w~ Inizia rapina")
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('srm-storerobbery:server:TryToStartRobbery', currentRobberyLocation)
                    end
                end
            end
        end
    end
end)

-- Funzione per inviare una chiamata alla polizia
function sendPoliceAlert(location)
    exports['ps-dispatch']:StoreRobbery()
end

-- verifica police
RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Avvia la rapina
RegisterNetEvent('srm-storerobbery:client:StartRobbery', function(location)
    local robberyTime = Config.RobberyDuration -- Durata della rapina in secondi

    -- Invia l'allarme alla polizia
    sendPoliceAlert(location)

    isRobbing = true

    Citizen.CreateThread(function()
        while robberyTime > 0 and isRobbing  do
            Citizen.Wait(1000)
            robberyTime = robberyTime - 1
            -- Aggiunge il testo con la durata della rapina
            if not hideNUI then
                updateUI(robberyTime)
            else
                updateUI(0)
            end
            
        end
        if isRobbing then
            isRobbing = false
            TriggerServerEvent('srm-storerobbery:server:EndRobbery', location, CurrentCops)
        end
    end)
end)


-- Risposta del server sull'avvio della rapina
RegisterNetEvent('srm-storerobbery:client:TryToStartRobberyResult', function(success, message)
    if success then
        ESX.ShowNotification('Robbery started', 'success')
    else
        ESX.ShowNotification(message, 'error')
    end
end)

function updateUI(value)
    count = value
    SendNUIMessage({
      action = "ui",
      count = count
    })
end

function hideUI()

    SendNUIMessage({
        action = "cancel",
    })
end