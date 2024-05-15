--- @class Vector2
--- @field X number
--- @field Y number
--- @field Unit Vector2
local vector2 = {}
vector2.__index = vector2

--- @param radians number
--- @return number
local function radToDeg(radians)
	return radians * (180/math.pi)
end

--- @param vector Vector2
local function calculateValues(vector)
	vector.Unit
	vector.Magnitude = math.sqrt(vector.X * vector.X + vector.Y * vector.Y)
	vector.Angle = radToDeg(math.atan2(vector.Y, vector.X))
end

--- @param x number
--- @param y number
--- @return Vector2
function vector2.new(x, y)
	local self = {X = x, Y = y}
	self.__newindex = function(tbl, index, value)
		if index ~= "X" and index ~= "Y" then return end
		rawset(tbl, index, value)
		calculateValues(tbl)
	end

	calculateValues(self)

	return setmetatable(self, vector2)
end

--- @param x number
--- @param y number
--- @return Vector2
function vector2.newImmutable(x, y)
	---@class Vector2Immutable : Vector2
	local self = vector2.new(x, y)
	self.__newindex = function()
		error("This Vector2 is immutable")
	end

	return self
end

function vector2:Angle()
	return radToDeg(math.atan2(self.Y, self.X))
end

function vector2:Magnitude()
	return math.sqrt(self.X * self.X + self.Y * self.Y)
end

vector2.zero = vector2.newImmutable(0, 0)
vector2.one = vector2.newImmutable(1, 1)
vector2.xAxis = vector2.newImmutable(1, 0)
vector2.yAxis = vector2.newImmutable(0, 1)

return vector2