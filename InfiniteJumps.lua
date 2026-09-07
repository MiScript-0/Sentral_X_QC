local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local toggle = player:FindFirstChild("SentralX_InfiniteJump")
if not toggle then
    toggle = Instance.new("BoolValue")
    toggle.Name = "SentralX_InfiniteJump"
    toggle.Value = true
    toggle.Parent = player

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = "Infinite Jump Enabled",
        Duration = 4
    })
else
    toggle.Value = not toggle.Value

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = toggle.Value and "Infinite Jump Enabled" or "Infinite Jump Disabled",
        Duration = 4
    })
end

local jumpHeight = 50

if not _G.SentralX_InfiniteJump_Listener then
    _G.SentralX_InfiniteJump_Listener = true

    UIS.JumpRequest:Connect(function()
        if toggle.Value then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.new(0, jumpHeight, 0)
            end
        end
    end)
end
