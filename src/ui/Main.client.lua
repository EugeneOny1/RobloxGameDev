-- This script manages the UI and the player's "build state"
print("Main.client.lua is running!")

-- Get the ScreenGui
-- We wait for it to exist, just in case
local screenGui = script.Parent

-- Find the buttons you just created
local addJointButton = screenGui:WaitForChild("AddJointButton")
local addBeamButton = screenGui:WaitForChild("AddBeamButton")
local testButton = screenGui:WaitForChild("TestButton")

-- This variable tracks what the player wants to do
-- We will put this in a shared module later, but for now, it's here
local buildMode = "None"

-- === Button Click Events ===

addJointButton.MouseButton1Click:Connect(function()
    buildMode = "Joint"
    print("Build mode set to: Joint")
    
    -- Visual feedback
    addJointButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120) -- Dark grey
    addBeamButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
    testButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
end)

addBeamButton.MouseButton1Click:Connect(function()
    buildMode = "Beam"
    print("Build mode set to: Beam")
    
    -- Visual feedback
    addJointButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
    addBeamButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120) -- Dark grey
    testButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
end)

testButton.MouseButton1Click:Connect(function()
    buildMode = "Test"
    print("Build mode set to: Test")
    
    -- Visual feedback
    addJointButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
    addBeamButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
    testButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
end)