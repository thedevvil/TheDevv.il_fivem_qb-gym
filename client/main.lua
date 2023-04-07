QBCore = exports['qb-core']:GetCoreObject()

local PlayerData = {}
local training = false
local resting = false
local membership = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    FetchSkills()
    if Config.DeleteStats == true then
		while true do
			local seconds = Config.UpdateFrequency * 1000
			Wait(seconds)

			for skill, value in pairs(Config.Skills) do
				UpdateSkill(skill, value["RemoveAmount"])
			end

			TriggerServerEvent("qb-skills:update", json.encode(Config.Skills))
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

local function round(num) 
    return math.floor(num+.5) 
end

local function GetCurrentSkill(skill)
    return Config.Skills[skill]
end

function RefreshSkills()
    for type, value in pairs(Config.Skills) do
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Current"]), true)
        end
    end
end

-- function FetchSkills()
--     QBCore.Functions.TriggerCallback("qb-skills:fetchStatus", function(data)
-- 		if data then
--             for status, value in pairs(data) do
--                 if Config.Skills[status] then
--                     Config.Skills[status]["Current"] = value["Current"]
--                 else
--                    -- print("Removing: " .. status) 
--                 end
--             end
-- 		end
--         RefreshSkills()
--     end)
-- end


-- function UpdateSkill(skill, amount)
-- 	--print(Config.Skills[skill])
--     if not Config.Skills[skill] then
--         print("Skill " .. skill .. " doesn't exist")
--         return
--     end
--     local SkillAmount = Config.Skills[skill]["Current"]
--     if SkillAmount + tonumber(amount) < 0 then
--         Config.Skills[skill]["Current"] = 0
--     elseif SkillAmount + tonumber(amount) > 100 then
--         Config.Skills[skill]["Current"] = 100
--     else
--         Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
--     end
--     RefreshSkills()
--     if tonumber(amount) > 0 then
--         QBCore.Functions.Notify('+' .. amount .. '% ' .. skill)
--     end
-- 	TriggerServerEvent("qb-skills:update", json.encode(Config.Skills))
-- end

local function CheckTraining()
	if resting == true then
        QBCore.Functions.Notify('Dinleniyorsun', 'primary')
		resting = false
		Wait(30000)
		training = false
	end
	if resting == false then
        QBCore.Functions.Notify('Tekrar egzersize devam edebilirsin.', 'success')
	end
end




RegisterNetEvent("qb-gym:skill", function()
local skillMenu = {
	{
		header = '< Kapat',
		params = {
			event = ''
		}
	}
}
RefreshSkills()
for type, value in pairs(Config.Skills) do
	skillMenu[#skillMenu + 1] = {
		header = type.. " %" ..value["Current"],
		params = {
			event = '#',
		}
	}
end
exports['qb-menu']:openMenu(skillMenu)
end)




local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
		while true do
			Wait(60000)
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
            
		if IsPedRunning(ped) then
			UpdateSkill("Stamina", 0.2)
		elseif IsPedInMeleeCombat(ped) then
			UpdateSkill("Guc", 0.5)
		elseif IsPedSwimmingUnderWater(ped) then
			UpdateSkill("Yuzme", 0.5)
		elseif IsPedShooting(ped) then
			UpdateSkill("Atis", 0.5)
		elseif DoesEntityExist(vehicle) then
			local speed = GetEntitySpeed(vehicle) * 3.6
			if speed >= 140 then
				UpdateSkill("Surus", 0.2)
			end
		end
	end
end)

	
CreateThread(function()
	blip = AddBlipForCoord(-1201.2257, -1568.8670, 4.6101)
	SetBlipSprite(blip, 311)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 3)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('GYM')
	EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('qb-gym:trueMembership', function()
	membership = true
end)

RegisterNetEvent('qb-gym:falseMembership', function()
	membership = false
end)


local lock = false
CreateThread(function()
	local alreadyEnteredZone = false
    local text = nil
    while true do
        local sleep = 1000
		local inZone = false
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for k, v in pairs(Config.Locations) do
                local dist = #(pos - vector3(Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z))
                if dist < 4.5 then
                    if dist < Config.Locations[k].viewDistance and not lock then
                        sleep = 5
						inZone  = true
						text = Config.Locations[k].Text3D
						DrawMarker(2, Config.Locations[k].coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 27, 163, 156, 255, 0, 0, 0, 1, 0, 0, 0)

                        --DrawText3D(Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z, Config.Locations[k].Text3D)
                        if IsControlJustReleased(0, 38) then
                            if training == false then
                                TriggerServerEvent('qb-gym:checkChip')
                                --QBCore.Functions.Notify('Preparing exercise', 'success')
                                Wait(500)					
                                if membership == true then
									lock = true
                                    SetEntityHeading(ped, Config.Locations[k].heading)
                                    SetEntityCoords(ped, Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z - 1)
                                    TaskStartScenarioInPlace(ped, Config.Locations[k].animation, 0, true)
									QBCore.Functions.Progressbar("eat_something", Config.Locations[k].Text3D, 30000, false, true, {
										disableMovement = false,
										disableCarMovement = false,
										disableMouse = false,
										disableCombat = true,
									}, {}, {}, {}, function() -- Done
									ClearPedTasks(ped)
                                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                                    UpdateSkill(Config.Locations[k].skill, Config.Locations[k].SkillAddQuantity)
                                    QBCore.Functions.Notify('Egzersize devam etmek için 30 saniye dinlenmen gerek', 'error')
                                    training = true
                                    resting = true
                                    CheckTraining()
									lock = false
									end)
                            
                                elseif membership == false then
                                    QBCore.Functions.Notify('Bu egzersizi yapmak için üye olmalısınız', 'error')
                                end
                            elseif training == true then
                                resting = true
                                CheckTraining()
                            end
                        end
                    end  
                end
            end
			  
			if inZone and not alreadyEnteredZone then
				alreadyEnteredZone = true
				TriggerEvent('text:show', "<b style='color:#44e467;'>[E] </b>"..text, "")
			end
	
			if not inZone and alreadyEnteredZone then
				alreadyEnteredZone = false
				TriggerEvent('text:hide')
			end

		Wait(sleep)
    end
end)
