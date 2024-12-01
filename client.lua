RegisterNetEvent('esx_peyote:setPed')
AddEventHandler('esx_peyote:setPed', function(model)
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
	end
end)

RegisterNetEvent('esx_peyote:usePeyote')
AddEventHandler('esx_peyote:usePeyote', function ()
	startEffect()
end)

RegisterNetEvent('esx_peyote:reset')
AddEventHandler('esx_peyote:reset', function()
	resetAllEffects()
	revert()
end)

RegisterNetEvent('esx_peyote:test')
AddEventHandler('esx_peyote:test', function ()
	setWalkStyle("MOVE_M@DRUNK@VERYDRUNK", "MOVE_M@DRUNK@VERYDRUNK")
end)

function startEffect()
	print("Start test")
	Citizen.CreateThread(function ()
		ESX.ShowNotification(_U('effect1'), 10, "info")
		Wait(Config.EffectTimes.effect1*60000)
		setWalkStyle("MOVE_M@DRUNK@VERYDRUNK", "MOVE_M@DRUNK@VERYDRUNK")
		playEffect("DMT_flight", Config.EffectTimes.effect2)
		playEffect("PeyoteIn", 10000)
		resetAllEffects()
		becomePed()
		Wait(Config.EffectTimes.animalTime*60000)
		stopEffect()
	end)
end

function playEffect(effect, waitTime)
	AnimpostfxPlay(effect, 0, false)
	Wait(waitTime)
	AnimpostfxStop(effect)
end

function setWalkStyle(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		SetPedMovementClipset(PlayerPedId(), anim, 0)
	end)
end

function resetAllEffects()
	AnimpostfxStopAll()
	ResetPedMovementClipset(PlayerPedId(), 1)
end

function stopEffect()
	playEffect('PeyoteEndIn', 3000)
	revert()
end

function becomePed()
	local model = Config.Peds[math.random(#Config.Peds)]
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
		ESX.TriggerServerCallback('esx_peyote:teleport', function()
			SetPlayerInvincible(PlayerId(), true)
		end)
	end
end

function revert()
	print("resetPed triggered")
	TriggerEvent('skinchanger:getSkin', function(skin)
		print("Testing reset")	
		local model
		if skin.sex == 0 then
			model = GetHashKey("mp_m_freemode_01")
		else
			model = GetHashKey("mp_f_freemode_01")
		end
		RequestModel(model)
		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
  		TriggerEvent('skinchanger:loadSkin', skin)
		SetPlayerInvincible(PlayerId(), false)
	end)
end
