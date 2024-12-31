local Utils = require("utils")

local Player = {}

-- this basically keeps track of the last player id that was created
local id_counter = 0

function Player:new(start_x, start_y, name, speed, level, max_health, health, max_stamina, stamina)
  local o = {}

  -- handle initial positions and size
  o.start_x = start_x
  o.stary_y = start_y
  o.w = 50
  o.h = 50

  -- set the id of the player
  o.id = id_counter
  id_counter = id_counter + 1

  -- have a player name or a default one if a falsy value is passed
  o.name = type(name) == "string" and name or string.format("Player %d", o.id)

  -- validate the player's walk speed
  assert(speed or (type(speed) == "number" and speed > 0), string.format("Expected a valid number for the speed, not %s.", speed))
  o.speed = speed

  -- validate the level input
  assert(type(level) == "nil" or type(level) == "number" and level >= 0, string.format("The level is expected to be a number over 0, not %s.", tostring(level)))
  o.level = level or 0

  -- validate health input
  assert(max_health > 0, string.format("Maximum health is expected to be above 0, not %d.", max_health))
  o.max_health = type(max_health) == "number" and max_health or 100
  o.health = (health and o.max_health >= health and health > 0) and health or o.max_health

  -- validate stamina input
  assert(max_stamina > 0, string.format("Maximum stamina is expected to be above 0, not %d.", max_stamina))
  o.max_stamina = type(max_stamina) == "number" and max_stamina or 100
  o.stamina = (stamina and o.max_stamina >= stamina and stamina > 0) and stamina or o.max_stamina

  -- handle physics
  o.body = love.physics.newBody(World, o.start_x, o.stary_y, "dynamic")
  o.shape = love.physics.newRectangleShape(o.w, o.h)
  o.fixture = love.physics.newFixture(o.body, o.shape, 1)

  setmetatable(o, self)
  self.__index = self
  return o
end

function Player:draw()
  love.graphics.push()

  love.graphics.setColor({255, 255, 255})
  love.graphics.rectangle("fill", self.body:getX(), self.body:getY(), 50, 50)

  love.graphics.pop()
end

function Player:listen_movement(dt)
  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    self.body:applyForce(-self.speed, 1)
    print("Moving left.")
  end

  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    self.body:applyForce(self.speed, 1)
    print("Moving right.")
  end
end

return Player
