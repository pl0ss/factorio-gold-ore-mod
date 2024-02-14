-- ToDo: spawnt nur im startbereich
    -- Regler machen anscheinend keinen unterschied
-- ToDo: beim übers Erz hovern wird kein Rahmen angezeigt
-- ToDo: kein icon und kein name bei map generation 
-- ToDo: kein name beim drüber hover (nicht in der map)
-- ToDo: Texturdichte ist zu hoch


-- * items

local goldOre = table.deepcopy(data.raw["item"]["copper-ore"])
goldOre.name = "gold-ore"
goldOre.icon = "__gold-ore__/graphics/item/gold-ore.png"
goldOre.icon_size = 64
goldOre.map_color = {r = 1, g = 0.843, b = 0}
data:extend{goldOre}

local goldPlate = table.deepcopy(data.raw["item"]["copper-plate"])
goldPlate.name = "gold-plate"
goldPlate.icon = "__gold-ore__/graphics/item/gold-plate.png"
goldPlate.icon_size = 64
data:extend{goldPlate}

local goldPlate_recipe = {
    type = "recipe",
    category = "smelting",
    name = "gold-plate",
    energy_required = 3.2000000000000002,
    ingredients = { {"gold-ore", 1} },
    result = "gold-plate"
}
data:extend{goldPlate_recipe}


local goldCable = table.deepcopy(data.raw["item"]["copper-cable"])
goldCable.name = "gold-cable"
goldCable.icon = "__gold-ore__/graphics/item/gold-cable.png"
goldCable.icon_size = 64
data:extend{goldCable}

local goldCable_recipe = {
    type = "recipe",
    name = "gold-cable",
    enabled = true, -- true = no technology needs to be unlocked
    energy_required = 0.5, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"gold-plate", 1}},
    result = "gold-cable",
    result_count = 2
}
data:extend{goldCable_recipe}


-- * changed recipes
-- ? Diese beide zeile funktionieren nicht, wäre es 'recipe["iron-plate"]' würde es gehen
-- data.raw.recipe["electronic-circuit"].ingredients = {{"iron-plate", 1}, {"copper-cable", 2}, {"gold-cable", 3}}
-- data.raw.recipe["advanced-circuit"].ingredients = {{"copper-cable", 4}, {"gold-cable", 3}, {"electronic-circuit", 2}, {"plastic-bar", 2}}

local electronic_circuit_recipe = {
    type = "recipe",
    name = "electronic-circuit",
    enabled = true,
    energy_required = 0.5,
    ingredients = {{"iron-plate", 1}, {"copper-cable", 2}, {"gold-cable", 3}},
    result = "electronic-circuit",
    result_count = 1
}
data:extend{electronic_circuit_recipe}

local advanced_circuit_recipe = {
    type = "recipe",
    name = "advanced-circuit",
    enabled = false,
    energy_required = 6,
    ingredients = {{"copper-cable", 4}, {"gold-cable", 3}, {"electronic-circuit", 2}, {"plastic-bar", 2}},
    result = "advanced-circuit",
    result_count = 1
}
data:extend{advanced_circuit_recipe}


-- * resources

-- Kopiere die Eigenschaften von Kupfererz und ändere sie für Gold Erz
local goldOre = table.deepcopy(data.raw["resource"]["copper-ore"])
goldOre.name = "gold-ore"
goldOre.icon = "__gold-ore__/graphics/item/gold-ore.png"
goldOre.icon_size = 64
goldOre.map_color = {r = 1, g = 0.843, b = 0}
goldOre.minable.result = "gold-ore" -- Das Ergebnis beim Abbau ist "gold-ore"

goldOre.stages.sheet.filename = "__gold-ore__/graphics/item/gold-ore.png"
goldOre.stages.sheet.hr_version.filename = "__gold-ore__/graphics/item/gold-ore.png"

-- Die neue Ressource registrieren
data:extend{goldOre}


data:extend{
    {
        type = "autoplace-control",
        category = "resource",
        name = "gold-ore",
        richness = true,
        order = "b-f",
    },
    {
        type = "noise-layer",
        name = "gold-ore"
    },
    {
        type = "resource",
        name = "gold-ore",
        icon = "__gold-ore__/graphics/item/gold-ore.png",
        icon_size = 32,
        map_color = {r = 1, g = 0.843, b = 0},
        flags = {"placeable-neutral"},
        category = "basic-solid",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 500,
        normal = 10000,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable = {
            mining_time = 1,
            results = {
                {
                    type = "item",
                    name = "gold-ore",
                    amount_min = 1,
                    amount_max = 1,
                    probability = 1
                }
            }
        },
        selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = {
            control = "gold-ore",
            sharpness = 1,
            richness_multiplier = 1500,
            richness_base = 500,
            size_control_multiplier = 0.06,
            peaks = {
                {
                    influence = 0.4,
                    noise_layer = "gold-ore",
                    noise_octaves_difference = -1.5,
                    noise_persistence = 0.7,
                    starting_area_weight_optimal = 1,
                    starting_area_weight_range = 0,
                    starting_area_weight_max_range = 2,
                }
            },
        },
        
        stage_counts = {0},
        stages = {
            sheet = {
                filename = "__gold-ore__/graphics/entity/gold-ore.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                frame_count = 1,
                variation_count = 1,
                hr_version = {
                    filename = "__gold-ore__/graphics/entity/gold-ore.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    frame_count = 1,
                    variation_count = 1,
                    scale = 1,
                }
            }
        }
    }
}
