package.path = package.path .. ";../?.lua"

local Player = require("player")

local p0 = Player:new(nil, 102, nil, 104, nil)
print("Expected Player 0:\n\th = 102\n\tm. h = 102\n\ts = 104\n\tm. s = 104")
print(string.format(
  "%s:\n\th = %d\n\tm. h = %d\n\ts = %d\n\tm. s = %d",
  p0.name,
  p0.health,
  p0.max_health,
  p0.stamina,
  p0.max_stamina
))
