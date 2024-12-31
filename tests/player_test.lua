package.path = package.path .. ";../?.lua"

local Player = require("player")
local inspect = require("lib.inspect")

-- initialise the player test instances
local p_normal = Player:new(nil, 100, 100, 50, 50)
local p_nil_max = Player:new(nil, 4, 102, nil, 104, nil)

print("Running player test with nil max values.")
local expected = [[{
  health = 102,
  id = 0,
  level = 4,
  max_health = 102,
  max_stamina = 104,
  name = "Player 0",
  stamina = 104,
  <metatable> = <1>{
    __index = <table 1>,
    new = <function 1>
  }
}]]

local actual = inspect(p_nil_max)

assert(expected == actual, "Player test failed.")
print("Player test was successful.")
