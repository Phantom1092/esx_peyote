# esx_peyote

Soft Dependency:
  ox_inventory

Add
['peyote'] = {
		label = 'Peyote',
		weight = 20,
		client = {
			anim = { dict = 'random@peyote@eat', clip = 'eat_peyote'},
			prop = { model = 'prop_peyote_highland_01', pos = vec3(-0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, 0.5)},
			disable = { move = true, car = true, combat = true },
			usetime = 2500
		}
	},

 into ox_inventory/data/items.lua and
Item('peyote', function(data, slot)
	ox_inventory:useItem(data, function (data)
		TriggerEvent('esx_peyote:usePeyote')
	end)	
end)
into ox_inventory/modules/items/client.lua
 
