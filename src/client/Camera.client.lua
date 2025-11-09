-- This script runs on the client and forces an angled, 2D side-scrolling camera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Tunable Values: Change these to get the perfect angle!
local Z_DISTANCE = 40    -- How far back the camera is (like the 50 before)
local HEIGHT_OFFSET = 20 -- New! How high up the camera is. (This is your "football view")

local function force_camera()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        
        -- Get the CFrame (position and rotation) of the character
        local charCFrame = rootPart.CFrame
        
        -- New! We create the offset as a single Vector3
        -- 0 on X: Stays centered with the player
        -- HEIGHT_OFFSET on Y: Lifts the camera up
        -- Z_DISTANCE on Z: Puts the camera back
        local cameraOffset = Vector3.new(0, HEIGHT_OFFSET, Z_DISTANCE)

        -- Set the camera's CFrame to be up and back
        local cameraPosition = charCFrame.Position + cameraOffset
        local lookAtPosition = charCFrame.Position
        
        camera.CFrame = CFrame.lookAt(cameraPosition, lookAtPosition)
    end
end

-- Set up the camera
camera.CameraType = Enum.CameraType.Scriptable
RunService:BindToRenderStep("Force2DCamera", Enum.RenderPriority.Camera.Value, force_camera)