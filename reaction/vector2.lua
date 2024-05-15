--- @class Vector2
--- @field X number
--- @field Y number
local vector2 = {}
vector2.__index = vector2

vector2.zero = vector2.newImmutable(0, 0)
vector2.one = vector2.newImmutable(1, 1)
vector2.xAxis = vector2.newImmutable(1, 0)
vector2.yAxis = vector2.newImmutable(0, 1)

--- @param x number
--- @param y number
--- @return Vector2
function vector2.new(x, y)
	local self = {X = x, Y = y}

	return setmetatable(self, vector2)
end

--- @param x number
--- @param y number
--- @return Vector2
function vector2.newImmutable(x, y)
	--- @class Vector2Immutable : Vector2
	local self = vector2.new(x, y)
	self.__newindex = function()
		error("This Vector2 is immutable")
	end

	return self
end

return vector2