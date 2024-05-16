--- @class UDim2
--- @field x {scale: number, offset: number}
--- @field y {scale: number, offset: number}
--- @operator add(UDim2): UDim2
--- @operator sub(UDim2): UDim2
local udim2 = {}

--- @protected
udim2.__index = udim2

local function lerp(a, b, t)
	return a + (b - a) * t
end

--- @param xScale number?
--- @param xOffset number?
--- @param yScale number?
--- @param yOffset number?
--- @return UDim2
function udim2.new(xScale, xOffset, yScale, yOffset)
	local self = {}
	self.x = {scale = xScale or 0, offset = xOffset or 0}
	self.y = {scale = yScale or 0, offset = yOffset or 0}

	return setmetatable(self, udim2)
end

--- @param xScale number
--- @param yScale number
--- @return UDim2
function udim2.fromScale(xScale, yScale)
	return udim2.new(xScale, 0, yScale, 0)
end

--- @param xOffset number
--- @param yOffset number
--- @return UDim2
function udim2.fromOffset(xOffset, yOffset)
	return udim2.new(0, xOffset, 0, yOffset)
end

--- @protected
--- @param goal UDim2
--- @param alpha number
--- @return UDim2
function udim2:lerp(goal, alpha)
	local newXScale = lerp(self.x.scale, goal.x.scale, alpha)
	local newXOffset = lerp(self.x.offset, goal.x.offset, alpha)
	local newYScale = lerp(self.y.scale, goal.y.scale, alpha)
	local newYOffset = lerp(self.y.offset, goal.y.offset, alpha)

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @protected
--- @param a UDim2
--- @param b UDim2
--- @return UDim2
function udim2.__add(a, b)
	local newXScale = a.x.scale + b.x.scale
	local newXOffset = a.x.offset + b.x.offset
	local newYScale = a.y.scale + b.y.scale
	local newYOffset = a.y.offset + b.y.offset

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @protected
function udim2.__sub(a, b)
	local newXScale = a.x.scale - b.x.scale
	local newXOffset = a.x.offset - b.x.offset
	local newYScale = a.y.scale - b.y.scale
	local newYOffset = a.y.offset - b.y.offset

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @protected
function udim2.__eq(a, b)
	return a.x.scale == b.x.scale and a.x.offset == b.x.offset and a.y.scale == b.y.scale and a.y.offset == b.y.offset
end

return udim2