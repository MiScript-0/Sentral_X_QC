local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local toggle = LocalPlayer:FindFirstChild("SentralX_AirWalk")
if not toggle then
    toggle = Instance.new("BoolValue")
    toggle.Name = "SentralX_AirWalk"
    toggle.Value = true
    toggle.Parent = LocalPlayer

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = "AirWalk Enabled",
        Duration = 4
    })
else
    toggle.Value = not toggle.Value

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = toggle.Value and "AirWalk Enabled" or "AirWalk Disabled",
        Duration = 4
    })
end

local hipHeight = 6

if not _G.SentralX_AirWalk_Listener then
    _G.SentralX_AirWalk_Listener = true

    task.spawn(function()
        while true do
            task.wait(0.1)
            if not toggle.Value then
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char:FindFirstChildOfClass("Humanoid").HipHeight = 0
                end
                continue
            end

            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").HipHeight = hipHeight
            end
        end
    end)
end
