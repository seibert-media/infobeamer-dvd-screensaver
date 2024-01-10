--[[
    Written by Franziska Kunsmann, 2024

    Licensed under CC BY-SA 4.0
    <https://creativecommons.org/licenses/by-sa/4.0/deed.en>
]]--

util.init_hosted()
gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local logo

local x
local y
local dir_x = 1
local dir_y = 1

if math.random(2) % 2 < 1 then
    dir_x = -1
end
if math.random(2) % 2 < 1 then
    dir_y = -1
end

util.json_watch("config.json", function(config)
    logo = resource.load_image(config.logo.asset_name)
end)

function node.render()
    gl.clear(0,0,0,1)

    if not x or not y then
        x = math.random(NATIVE_WIDTH)
        y = math.random(NATIVE_HEIGHT)
    end

    local logo_w, logo_h = logo:size()

    logo:draw(x, y, x+logo_w, y+logo_h)

    if x + logo_w >= NATIVE_WIDTH or x <= 0 then
        dir_x = dir_x * -1
    end
    if y + logo_h >= NATIVE_HEIGHT or y <= 0 then
        dir_y = dir_y * -1
    end

    x = x + dir_x
    y = y + dir_y
end
