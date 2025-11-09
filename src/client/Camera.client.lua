-- This script runs on the client and forces a 2D side-scrolling camera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Set the distance. 50 is a good start.
local CAMERA_DISTANCE = 50

local function force_camera()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        
        -- Get the CFrame (position and rotation) of the character
        local charCFrame = rootPart.CFrame
        
        -- Set the camera's CFrame to be 50 studs away on the Z-axis (side view)
        -- and look directly at the character
        local cameraPosition = charCFrame.Position + Vector3.new(0, 0, CAMERA_DISTANCE)
        local lookAtPosition = charCFrame.Position
        
        camera.CFrame = CFrame.lookAt(cameraPosition, lookAtPosition)
    end
end

-- Set up the camera
camera.CameraType = Enum.CameraType.Scriptable
RunService:BindToRenderStep("Force2DCamera", Enum.RenderPriority.Camera.Value, force_camera)