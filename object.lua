local Utils = require("utils")

local Object = {}

function Object:new(world, start_x, start_y, width, height, physics_body_type)
  local o = {}

  o.x = start_x
  o.y = start_y
  o.width = width
  o.height = height

  o.__body = love.physics.newBody(world, start_x, start_y, physics_body_type)
  o.__shape = love.physics.newRectangleShape(width, height)
  o.__fixture = love.physics.newFixture(o.__body, o.__shape, 1)

  setmetatable(o, self)
  self.__index = self
  return o
end

function Object:update(dt)
  self.x = self.__body:getX()
  self.y = self.__body:getY()
end

function Object:draw(mode)
  assert(Utils.table_contains({"line", "fill"}, mode), "Invalid draw mode for object.")
  love.graphics.push()

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(mode, self.x, self.y, self.width, self.height)

  love.graphics.pop()
end

function Object:collides_with(object2)
  return self.x < object2.x + object2.width
     and self.x + self.width > object2.x
     and self.y < object2.y + object2.height
     and self.y + self.height > object2.y
end

return Object
