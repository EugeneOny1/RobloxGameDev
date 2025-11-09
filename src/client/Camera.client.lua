-- This script runs on the client and forces a LOCKED angled, 2D side-scrolling camera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Tunable Values: Change these to get the perfect angle!
local Z_DISTANCE = 40    -- How far back the camera is
local HEIGHT_OFFSET = 20 -- How high up the camera is

-- == NEW CODE ==
-- 1. Calculate the true, diagonal distance from the player to the camera
local TRUE_DISTANCE = (Vector3.new(0, HEIGHT_OFFSET, Z_DISTANCE)).Magnitude

-- 2. Set the min/max zoom to this exact distance to prevent scrolling
player.CameraMinZoomDistance = TRUE_DISTANCE
player.CameraMaxZoomDistance = TRUE_DISTANCE
-- ==============

local function force_camera()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        local charCFrame = rootPart.CFrame
        
        local cameraOffset = Vector3.new(0, HEIGHT_OFFSET, Z_DISTANCE)
        local cameraPosition = charCFrame.Position + cameraOffset
        local lookAtPosition = charCFrame.Position
        
        camera.CFrame = CFrame.lookAt(cameraPosition, lookAtPosition)
    end
end

-- Set up the camera
camera.CameraType = Enum.CameraType.Scriptable
RunService:BindToRenderStep("Force2DCamera", Enum.RenderPriority.Camera.Value, force_camera)