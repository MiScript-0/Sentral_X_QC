local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local vim = game:GetService("VirtualInputManager")

local toggle = LocalPlayer:FindFirstChild("SentralX_FPSUnlocker")
if not toggle then
    toggle = Instance.new("BoolValue")
    toggle.Name = "SentralX_FPSUnlocker"
    toggle.Value = true
    toggle.Parent = LocalPlayer

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = "FPS Unlocker Enabled",
        Duration = 4
    })
else
    toggle.Value = not toggle.Value

    StarterGui:SetCore("SendNotification", {
        Title = "Sentral X",
        Text = toggle.Value and "FPS Unlocker Enabled" or "FPS Unlocker Disabled",
        Duration = 4
    })
end

if not _G.SentralX_FPSUnlocker_Listener then
    _G.SentralX_FPSUnlocker_Listener = true

    setfpscap(5000)

    game.DescendantAdded:Connect(function(d)
        if toggle.Value and d.Name == "MainView" and d.Parent.Name == "DevConsoleUI" then
            task.wait()
            local screen = d.Parent.Parent.Parent
            screen.Enabled = false
        end
    end)

    vim:SendKeyEvent(true, "F9", 0, game)
    task.wait()
    vim:SendKeyEvent(false, "F9", 0, game)

    task.spawn(function()
        while true do
            task.wait()
            if not toggle.Value then
                continue
            end

            if not game:GetService("CoreGui"):FindFirstChild("DevConsoleUI", true):FindFirstChild("MainView") then
                vim:SendKeyEvent(true, "F9", 0, game)
                task.wait()
                vim:SendKeyEvent(false, "F9", 0, game)
            end
        end
    end)
end
