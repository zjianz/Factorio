--- foundation
local make_tile_area = function(area, name)
    local result = {}
    local left_top = area[1]
    local right_bottom = area[2]
    for x = left_top[1], right_bottom[1] do
      for y = left_top[2], right_bottom[2] do
        table.insert(result,
        {
          position = {x, y},
          tile = name
        })
      end
    end
    return result
end

local left_width  = math.floor(settings.startup["space-platform-starter-tile"].value / 2)
local right_width = settings.startup["space-platform-starter-tile"].value - 1 - left_width
data.raw["space-platform-starter-pack"]["space-platform-starter-pack"].tiles = make_tile_area({{-left_width, -left_width}, {right_width, right_width}},"space-platform-foundation")
data.raw["space-platform-starter-pack"]["space-platform-starter-pack"].initial_items = {{type = "item", name = "space-platform-foundation", amount = settings.startup["space-platform-starter-inventory"].value}}

--- recipe
if settings.startup["space-platform-starter-recipe-balance"].value then
    local fundation_amount = settings.startup["space-platform-starter-tile"].value * settings.startup["space-platform-starter-tile"].value + settings.startup["space-platform-starter-inventory"].value - 50
    data.raw["recipe"]["space-platform-starter-pack"].ingredients = {
        {type = "item", name = "space-platform-foundation", amount = fundation_amount},
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "processing-unit", amount = 20}
    }
end