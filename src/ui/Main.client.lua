print("🎮 Main.Client.lua starting...")

-- Wait for the player and their GUI to fully load
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Get the ScreenGui (now from PlayerGui, not script.Parent during runtime)
local screenGui = playerGui:WaitForChild("ScreenGui")
print("✅ ScreenGui found!")

-- Find the buttons with error handling
local addJointButton = screenGui:FindFirstChild("AddJointButton")
local addBeamButton = screenGui:FindFirstChild("AddBeamButton")
local testButton = screenGui:FindFirstChild("TestButton")

-- Verify all buttons exist
if not addJointButton then
    warn("❌ AddJointButton not found! Check your UI hierarchy.")
    return
end
if not addBeamButton then
    warn("❌ AddBeamButton not found! Check your UI hierarchy.")
    return
end
if not testButton then
    warn("❌ TestButton not found! Check your UI hierarchy.")
    return
end

print("✅ All buttons found!")

-- Build mode tracker
local buildMode = "None"

-- Helper function to update button visuals
local function updateButtonColors(activeButton)
    local buttons = {addJointButton, addBeamButton, testButton}
    
    for _, button in ipairs(buttons) do
        if button == activeButton then
            button.BackgroundColor3 = Color3.fromRGB(100, 200, 100) -- Green highlight
            button.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
        else
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
            button.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
        end
    end
end

-- === Button Click Events ===

addJointButton.MouseButton1Click:Connect(function()
    buildMode = "Joint"
    print("🔨 Build mode: Joint")
    updateButtonColors(addJointButton)
end)

addBeamButton.MouseButton1Click:Connect(function()
    buildMode = "Beam"
    print("🔩 Build mode: Beam")
    updateButtonColors(addBeamButton)
end)

testButton.MouseButton1Click:Connect(function()
    buildMode = "Test"
    print("🧪 Build mode: Test")
    updateButtonColors(testButton)
    
    -- In the future, this will trigger the physics simulation
    -- For now, just visual feedback
end)

print("✅ Main.Client.lua fully loaded! Click the buttons to test.")

-- Make buildMode accessible to other scripts (we'll use this later)
_G.CurrentBuildMode = buildMode