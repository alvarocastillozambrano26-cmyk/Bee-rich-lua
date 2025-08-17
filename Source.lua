
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local coins = 0
local holding = false
local function giveCoins()
	while holding do
		coins += 1
		print("💰 Monedas:", coins)
		task.wait(0.2)
	end
end
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		holding = true
		task.spawn(giveCoins)
	end
end)
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		holding = false
	end
end)
