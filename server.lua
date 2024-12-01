--ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterCommand("setPed", 'admin', function(xPlayer, args, showError)
    print(args)
    xPlayer.triggerEvent('esx_peyote:setPed', args[0])
end, false, {help = "Sets Ped"})

ESX.RegisterCommand("resetPeyote", 'admin', function (xPlayer)
    xPlayer.triggerEvent('esx_peyote:reset')
end, false)

ESX.RegisterUsableItem('peyote', function(source)
    print("Peyote has been used")
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('peyote', 1)
    xPlayer.triggerEvent('esx_peyote:usePeyote')
end)

ESX.RegisterServerCallback('esx_peyote:teleport', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local currentCoords = xPlayer.getCoords(false)
    currentCoords.z = currentCoords.z + 2.0
    xPlayer.setCoords(currentCoords)
    cb()
end)

ESX.RegisterCommand("peyotetest", 'admin', function (xPlayer, args, showError)
   xPlayer.triggerEvent('esx_peyote:test') 
end, false)