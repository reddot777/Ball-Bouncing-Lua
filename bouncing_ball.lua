local tweenService = game.TweenService

local blockA = game.Workspace.A
local blockB = game.Workspace.B
local blockPart = game.Workspace.Part

blockA.Anchored = true
blockA.Transparency = 0
blockB.Anchored = true
blockB.Transparency = 0

blockPart.Position = blockA.Position

local info = TweenInfo.new(6, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
local propertyTable = {
	["Position"] = blockB.Position;
	["Transparency"] = 0.5;
}

local tweenToB = tweenService:Create(blockPart, info, propertyTable)

local propertyTableBack = {
	["Position"] = blockA.Position;
	["Transparency"] = 0.5;
}

local tweenToA = tweenService:Create(blockPart, info, propertyTableBack)

local function playTweenCycle()
	while true do
		wait(2)
		blockPart.Position = blockA.Position
		blockA.BrickColor = BrickColor.Random()
		tweenToB:Play()
		tweenToB.Completed:Wait()  

		blockPart.Position = blockB.Position
		blockB.BrickColor = BrickColor.Random()
		tweenToA:Play()
		tweenToA.Completed:Wait()  
	end
end


playTweenCycle()
