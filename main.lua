love = require("love")
local inspect = require("lib.inspect")
local Player = require("player")
local Object = require("object")
local Scene = require("scene")
local SceneManager = require("scene_manager")

function love.load()
  -- initialise main scene
  SceneManager:change_scene(Scene:new("main", {}, 9.81))

  -- initialise the player
  MainPlayer = Player:new(
    0, 0,
    nil, 900, nil,
    100, nil,
    100, nil
  )

  Block = Object:new(SceneManager.current_scene.world, 0, 200, love.graphics.getWidth(), 20, "static")

  SceneManager.current_scene:add_object(MainPlayer)
  SceneManager.current_scene:add_object(Block)
end

function love.update(dt)
  SceneManager:update(dt)
  MainPlayer:listen_movement(dt)
end

function love.draw()
  SceneManager:draw()

  love.graphics.setColor({0, 255, 0})
  love.graphics.print(tostring(love.timer.getFPS()), 10, 10)
end
