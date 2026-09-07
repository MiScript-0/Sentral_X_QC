_G.InfiniteJumpEnabled = false
_G.JumpHeight = 50


local function notify(msg)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Sentral X",
        Text = msg,
        Duration = 4
    })
end


function InfiniteJump(state)
    _G.InfiniteJumpEnabled = state

    if state then
        notify("Infinite Jump Enabled")
    else
        notify("Infinite Jump Disabled")
    end
end


local Player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if not _G.InfiniteJumpEnabled then return end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        local char = Player.Character or Player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")

        if hum then
            local state = hum:GetState()
            if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Velocity = Vector3.new(0, _G.JumpHeight, 0)
                end
            end
        end
    end
end)
