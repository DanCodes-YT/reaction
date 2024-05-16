local udim2 = require("reaction.udim2")
local vector2 = require("reaction.vector2")
local guiObject = require("reaction.elements.guiObject")

--- @class Frame : GuiObject
local frame = {}
frame.__index = setmetatable(frame, guiObject)

--- @return Frame
function frame.new()
	local self = setmetatable(guiObject.new(), frame)

	return self
end

--- @param framePosition Vector2
--- @param frameSize Vector2
function frame:render(framePosition, frameSize)
	local xPos = framePosition.x + frameSize.x * self.position.x.scale
	local yPos = framePosition.y + frameSize.x * self.position.x.scale
	local xSize = frameSize.x * self.size.x.scale
	local ySize = frameSize.y * self.size.y.scale

	love.graphics.rectangle("fill", xPos, yPos, xSize, ySize)
end