local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local flying = false
local speed = 50

local bv = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")
bg.maxTorque = Vector3.new(4e5, 4e5, 4e5)
bv.maxForce = Vector3.new(4e5, 4e5, 4e5)

function fly()
    flying = true
    local char = player.Character
    bg.Parent = char.HumanoidRootPart
    bv.Parent = char.HumanoidRootPart
    char.Humanoid.PlatformStand = true
    
    repeat
        task.wait()
        bv.velocity = (workspace.CurrentCamera.CFrame.LookVector * speed)
        bg.cframe = workspace.CurrentCamera.CFrame
    until not flying
    
    bv.Parent = nil
    bg.Parent = nil
    char.Humanoid.PlatformStand = false
end

mouse.KeyDown:Connect(function(key)
    if key:lower() == "e" then
        if flying then flying = false else fly() end
    end
end)
