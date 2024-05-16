local udim2 = require("reaction.udim2")
local vector2 = require("reaction.vector2")

--- @class GuiObject
--- @field anchorPoint Vector2
--- @field position UDim2
--- @field size UDim2
--- @field rotation number
local guiObject = {}
guiObject.__index = guiObject

--- @return GuiObject
function guiObject.new()
	local self = {}
	self.anchorPoint = vector2.new()
	self.position = udim2.new()
	self.size = udim2.new(100, 100)
	self.rotation = 0

	return setmetatable(self, guiObject)
end