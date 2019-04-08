ESX = nil local PlayerData = {} Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end end)

RegisterNetEvent('esx:playerLoaded') AddEventHandler('esx:playerLoaded', function(xPlayer) PlayerData = xPlayer end) RegisterNetEvent('esx:setJob') AddEventHandler('esx:setJob', function(job) PlayerData.job = job end)

local policeblips = { {title="Get medical cannabis here", colour=25, blip=140, x = 1525.29, y=1710.02, z=109.00},, }

local ambulanceblips = { {title="Get medical cannabis here", colour=25, blip=140, x = 1525.29, y=1710.02, z=109.00}, }


Citizen.CreateThread(function() if PlayerData.job.name == 'police' then for _, info in pairs(policeblips) do info.blip = AddBlipForCoord(info.x, info.y, info.z) SetBlipSprite(info.blip, info.id) SetBlipDisplay(info.blip, 4) SetBlipScale(info.blip, 0.9) SetBlipColour(info.blip, info.colour) SetBlipAsShortRange(info.blip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentString(info.title) EndTextCommandSetBlipName(info.blip) end end 

if PlayerData.job.name == 'ambulance' then for _, info in pairs(ambulanceblips) do info.blip = AddBlipForCoord(info.x, info.y, info.z) SetBlipSprite(info.blip, info.id) SetBlipDisplay(info.blip, 4) SetBlipScale(info.blip, 0.9) SetBlipColour(info.blip, info.colour) SetBlipAsShortRange(info.blip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentString(info.title) EndTextCommandSetBlipName(info.blip) end end end)