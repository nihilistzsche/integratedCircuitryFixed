require "prototypes.unselectable-lamp-panel"

-- Item
local item = table.deepcopy(data.raw["item"]["small-lamp"])
overwriteContent(item, {
	name = "monochrom-display-row",
	order = "z[small-lamp]1",
	place_result = "monochrom-display-row",
	icon = "__integratedCircuitryFixed__/graphics/icons/display-row.png",
	icon_size = 64,
})
data:extend({	item })

-- Recipe & Technology
data:extend({
	{
		type = "recipe",
		name = "monochrom-display-row",
		enabled = false,
		ingredients = {
			{ name = "small-lamp", amount = 5, type = "item" },
			{ name = "steel-plate", amount = 2, type = "item" },
			{ name = "electronic-circuit", amount = 5, type = "item" }
		},
		results = {
			{ name = "monochrom-display-row", amount = 1, type = "item" } 
		}
	}
})
addTechnologyUnlocksRecipe("lamp","monochrom-display-row")


-- Monochrom display
REMOVE_KEY = "-remove-"
local entity = table.deepcopy(data.raw["lamp"]["small-lamp"])
overwriteContent(entity, {
	type = "lamp",
	name = "monochrom-display-row",
	icon = "__integratedCircuitryFixed__/graphics/icons/display-row.png",
	icon_size = 64,
	selection_box = {{-0.5, -0.5}, {0.5, 4.5}},
	collision_box = {{-0.4,-0.4},{0.4,4.4}},
	collision_mask = { layers = { water_tile = true, item = true, is_object = true } },
	order="a",
	circuit_wire_max_distance = 7,
	energy_source = {
		type = "void",
	},
	picture_off = {
		filename = "__integratedCircuitryFixed__/graphics/entity/monochrom-display-row.png",
		priority = "extra-high",
		width = 32,
		height = 160,
		shift = {0, 2}
	},
	picture_on = {
		filename = "__integratedCircuitryFixed__/graphics/entity/monochrom-display-row.png",
		priority = "extra-high",
		width = 32,
		height = 160,
		shift = {0, 2}
	},
	circuit_connector_sprites = REMOVE_KEY,
	fast_replaceable_group = REMOVE_KEY,
	circuit_wire_connection_point = {
		wire = { red = {0.47, 4.47}, green = {0.47, 4.47} },
		shadow = { red = {0.47, 4.47}, green = {0.47, 4.47} }
	},
	minable = {
		result = item.name,
		mining_time = 0.5
	}
}, REMOVE_KEY)

data:extend({	entity })
