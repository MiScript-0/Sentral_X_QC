local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")


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


local JumpHeight = 50


if not _G.SentralX_InfiniteJump_Listener then
    _G.SentralX_InfiniteJump_Listener = true

    UIS.InputBegan:Connect(function(input, gp)
        if gp then return end
        if not toggle.Value then return end

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
            local char = player.Character or player.CharacterAdded:Wait()
            local hum = char:FindFirstChildOfClass("Humanoid")

            if hum then
                local state = hum:GetState()
                if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Velocity = Vector3.new(0, JumpHeight, 0)
                    end
                end
            end
        end
    end)
end
