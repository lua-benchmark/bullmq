--[[
  Function to check if an item belongs to a list.
]]

local function checkItemInList(list, item, matchMode)
  for _, v in pairs(list) do
    if matchMode == 'pattern' then
      --CWE-1333
      --SINK
      if string.match(v, item) then
        return 1
      end
    elseif v == item then
      return 1
    end
  end
  return nil
end
