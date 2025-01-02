local Utils = require("utils")
local inspect = require("lib.inspect")

local Scene = {}

function Scene:new(name, objects, gravity)
  local o = {}

  o.name = name
  o.objects = objects or {}
  o.world = love.physics.newWorld(0, gravity * 64, true)

  setmetatable(o, self)
  self.__index = self
  return o
end

function Scene:add_object(object)
  object.world = self.world
  table.insert(self.objects, object)
end

function Scene:update(dt)
  love.physics.setMeter(64)
  self.world:update(dt)

  for _, object in ipairs(self.objects) do
    object:update(dt)
  end
end

function Scene:draw(mode)
  assert(Utils.table_contains({"line", "fill"}, mode), fmt("Invalid draw mode for object \"%s\".", mode))

  for _, object in ipairs(self.objects) do
    object:draw(mode)
  end
end

return Scene
