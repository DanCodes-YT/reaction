local vector2 = require("vector2")

--- @class GuiObject
--- @field AnchorPoint Vector2
local guiObject = {}
guiObject.__index = {}

--- @return GuiObject
function guiObject.new()
	local self = {}
	self.AnchorPoint = vector2.new(0, 0)

	return setmetatable(self, guiObject)
end