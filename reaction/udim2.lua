---@class UDim2
---@field X {Scale: number, Offset: number}
---@field Y {Scale: number, Offset: number}
local udim2 = {}
udim2.__index = udim2

local function lerp(a, b, t)
	return a + (b - a) * t
end

--- @param xScale number
--- @param xOffset number
--- @param yScale number
--- @param yOffset number
--- @return UDim2
function udim2.new(xScale, xOffset, yScale, yOffset)
	local self = {}
	self.X = {Scale = xScale, Offset = xOffset}
	self.Y = {Scale = yScale, Offset = yOffset}

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

--- @param goal UDim2
--- @param alpha number
--- @return UDim2
function udim2:Lerp(goal, alpha)
	local newXScale = lerp(self.X.Scale, goal.X.Scale, alpha)
	local newXOffset = lerp(self.X.Offset, goal.X.Offset, alpha)
	local newYScale = lerp(self.Y.Scale, goal.Y.Scale, alpha)
	local newYOffset = lerp(self.Y.Offset, goal.Y.Offset, alpha)

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @param a UDim2
--- @param b UDim2
--- @return UDim2
function udim2.__add(a, b)
	local newXScale = a.X.Scale + b.X.Scale
	local newXOffset = a.X.Offset + b.X.Offset
	local newYScale = a.Y.Scale + b.Y.Scale
	local newYOffset = a.Y.Offset + b.Y.Offset

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @param a UDim2
--- @param b UDim2
--- @return UDim2
function udim2.__sub(a, b)
	local newXScale = a.X.Scale - b.X.Scale
	local newXOffset = a.X.Offset - b.X.Offset
	local newYScale = a.Y.Scale - b.Y.Scale
	local newYOffset = a.Y.Offset - b.Y.Offset

	return udim2.new(newXScale, newXOffset, newYScale, newYOffset)
end

--- @param a UDim2
--- @param b UDim2
--- @return boolean
function udim2.__eq(a, b)
	return a.X.Scale == b.X.Scale and a.X.Offset == b.X.Offset and a.Y.Scale == b.Y.Scale and a.Y.Offset == b.Y.Offset
end

return udim2