-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 1. Setup Remote Event (If it doesn't exist, create it)
local buildEvent = ReplicatedStorage:FindFirstChild("BuildEvent")
if not buildEvent then
	buildEvent = Instance.new("RemoteEvent")
	buildEvent.Name = "BuildEvent"
	buildEvent.Parent = ReplicatedStorage
end

-- 2. Create a folder in Workspace to keep things organized
local bridgeFolder = workspace:FindFirstChild("BridgeParts")
if not bridgeFolder then
	bridgeFolder = Instance.new("Folder")
	bridgeFolder.Name = "BridgeParts"
	bridgeFolder.Parent = workspace
end

-- 3. Listener for Client Messages
buildEvent.OnServerEvent:Connect(function(player, action, position)
	print("Server received action: " .. tostring(action))
	
	if action == "CreateJoint" then
		-- Find the Joint template we created in ReplicatedStorage
		local template = ReplicatedStorage:FindFirstChild("Joint")
		
		if template then
			local newJoint = template:Clone()
			newJoint.Position = position
			newJoint.Anchored = true  -- IMPORTANT: Keep it still while building
			newJoint.Parent = bridgeFolder
			print("✅ Joint created at: " .. tostring(position))
		else
			warn("❌ Error: 'Joint' template not found in ReplicatedStorage!")
		end
		
	elseif action == "TestBridge" then
		print("🧪 Physics test starting...")
		-- Loop through everything we built and unanchor it
		for _, part in ipairs(bridgeFolder:GetChildren()) do
			if part:IsA("BasePart") then
				part.Anchored = false
			end
		end
	end
end)