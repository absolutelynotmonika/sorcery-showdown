local Utils = require("utils")

fmt = string.format

local SceneManager = {
  current_scene = nil,

  -- this variable represents the state of the current scene,
  -- which can be either "active", "paused", "loading" or "transitioning"
  current_scene_state = nil
}

function SceneManager:change_scene(scene)
  assert(scene, "A scene was expected.")
  self.current_scene = scene
end

function SceneManager:change_state(state)
  assert(Utils.table_contains({"active", "paused", "loading", "transitioning"}, state), fmt("Invalid scene state \"%s\"."))
end

function SceneManager:update(dt)
  self.current_scene:update(dt)
end

function SceneManager:draw()
  self.current_scene:draw("line")
end

return SceneManager
