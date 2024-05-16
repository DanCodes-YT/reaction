--- @class Vector2
--- @field x number
--- @field y number
--- @operator unm: Vector2
local vector2 = {}

--- @protected
vector2.__index = vector2

--- @param radians number
--- @return number
local function radToDeg(radians)
	return radians * (180/math.pi)
end

--- @param x number?
--- @param y number?
--- @return Vector2
function vector2.new(x, y)
	local self = {x = x or 0, y = y or 0}

	return setmetatable(self, vector2)
end

--- @protected
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

--- @return Vector2
function vector2:clone()
	return vector2.new(self.x, self.y)
end

function vector2:angle()
	return radToDeg(math.atan2(self.y, self.x))
end

function vector2:length()
	return math.sqrt(self.x * self.x + self.y * self.y)
end

function vector2:normalize()
	local length = self:length()

    if length ~= 0 then
        self.x = self.x / length
        self.y = self.y / length
    end
end

--- @return Vector2
function vector2:normalized()
	local clone = self:clone()
	clone:normalize()

	return clone
end

--- @protected
function vector2:__unm()
    return vector2.new(-self.x, -self.y)
end

vector2.zero = vector2.newImmutable(0, 0)
vector2.one = vector2.newImmutable(1, 1)
vector2.xAxis = vector2.newImmutable(1, 0)
vector2.yAxis = vector2.newImmutable(0, 1)

return vector2