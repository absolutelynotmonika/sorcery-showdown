love = require("love")
local inspect = require("lib.inspect")
local Player = require("player")

function love.load()
  -- initialise game physics
  love.physics.setMeter(64)
  World = love.physics.newWorld(0, 9.81 * 64, true)

  -- initialise the player
  MainPlayer = Player:new(
    love.graphics.getWidth() / 2 - 50,
    love.graphics.getHeight() / 2 - 50,
    nil,
    900,
    nil,
    100,
    nil,
    100,
    nil
  )
end

function love.update(dt)
  World:update(dt)
  MainPlayer:listen_movement(dt)
end

function love.draw()
  MainPlayer:draw()

  love.graphics.setColor({0, 255, 0})
  love.graphics.print(tostring(love.timer.getFPS()), 10, 10)
end
