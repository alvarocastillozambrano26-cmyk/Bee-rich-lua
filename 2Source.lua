-- AutoFarm básico con mantener presionado en Roblox Studio
-- Este script da "monedas" mientras el jugador mantiene el clic izquierdo

-- Variables
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local coins = 0
local holding = false

-- Función para sumar monedas
local function giveCoins()
	while holding do
		coins += 1
		print("💰 Monedas:", coins)
		task.wait(0.2) -- velocidad del farmeo (0.2 seg = 5 veces por segundo)
	end
end

-- Detectar cuando se presiona el mouse
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		holding = true
		task.spawn(giveCoins)
	end
end)

-- Detectar cuando se suelta el mouse
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		holding = false
	end
end)
