local Object = require("object")
local SceneManager = require("scene_manager")

local id_counter = 0

local Player = setmetatable({}, {__index = Object})

function Player:new(start_x, start_y, name, speed, level, max_health, health, max_stamina, stamina)
  local o = Object.new(self, SceneManager.current_scene.world, start_x, start_y, 50, 50, "dynamic")

  -- Set Player-specific properties
  o.id = id_counter
  id_counter = id_counter + 1
  o.name = type(name) == "string" and name or string.format("Player %d", o.id)
  o.speed = speed or 500
  o.level = level or 0

  -- Health and Stamina validation
  assert(max_health > 0, "Maximum health must be above 0.")
  o.max_health = max_health or 100
  o.health = math.min(health or o.max_health, o.max_health)

  assert(max_stamina > 0, "Maximum stamina must be above 0.")
  o.max_stamina = max_stamina or 100
  o.stamina = math.min(stamina or o.max_stamina, o.max_stamina)

  setmetatable(o, self)
  self.__index = self
  return o
end

function Player:listen_movement(dt)
  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    self.__body:applyForce(-self.speed, 0)
    print(self.name .. " is moving left.")
  end
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    self.__body:applyForce(self.speed, 0)
    print(self.name .. " is moving right.")
  end
end

return Player
