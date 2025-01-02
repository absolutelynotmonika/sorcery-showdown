local Utils = {}

function Utils.printf(fmt, ...)
  print(string.format(fmt, ...))
end

function Utils.table_contains(t, value)
  for _, v in ipairs(t) do
    if v == value then
      return true
    else
      goto continue
    end

    ::continue::
  end
end

return Utils
