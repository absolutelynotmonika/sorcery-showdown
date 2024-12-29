local Utils = require("utils")

local Player = {}

local id_counter = 0

function Player:new(name, max_health, health, max_stamina, stamina)
  local o = {}
  o.id = id_counter
  id_counter = id_counter + 1
  o.name = type(name) == "string" and name or string.format("Player %d", o.id)

  -- make sure the input for the player data is following the game rules
  -- and round some data like the current health if possibile without raising
  -- runtime errors.
  assert(max_health > 0, string.format("Maximum health is expected to be above 0, not %d.", max_health))
  o.max_health = type(max_health) == "number" and max_health or 100
  o.health = (health and max_health >= health and health > 0) and health or max_health

  assert(max_stamina > 0, string.format("Maximum stamina is expected to be above 0, not %d.", max_health))
  o.max_stamina = type(max_stamina) == "number" and max_stamina or 100
  o.stamina = (stamina and max_stamina >= stamina and stamina > 0) and stamina or max_stamina

  setmetatable(o, self)
  self.__index = self
  return o
end

return Player
