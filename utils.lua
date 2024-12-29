local Utils = {}

function Utils:printf(fmt, ...)
  print(string.format(fmt, ...))
end

return Utils
