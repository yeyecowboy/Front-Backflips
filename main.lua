wait(5)

--[[ Info ]]--

local ver = "2.00"
local scriptname = "feFlip"


--[[ Keybinds ]]--

local FrontflipKey = Enum.KeyCode.Z
local BackflipKey = Enum.KeyCode.X
local AirjumpKey = Enum.KeyCode.C


--[[ Dependencies ]]--

local ca = game:GetService("ContextActionService")
local player = game:GetService("Players").LocalPlayer
local h = 0.0174533
local antigrav


--[[ Functions ]]--

function playerFrontflip(act,inp,obj)
	if inp == Enum.UserInputState.Begin then
		player.Character.Humanoid:ChangeState("Jumping")
		wait()
		player.Character.Humanoid.Sit = true
		for i = 1,360 do 
			delay(i/720,function()
			player.Character.Humanoid.Sit = true
				player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(-h,0,0)
			end)
		end
		wait(0.55)
		player.Character.Humanoid.Sit = false
	end
end

function playerBackflip(act,inp,obj)
	if inp == Enum.UserInputState.Begin then
		player.Character.Humanoid:ChangeState("Jumping")
		wait()
		player.Character.Humanoid.Sit = true
		for i = 1,360 do
			delay(i/720,function()
			player.Character.Humanoid.Sit = true
				player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(h,0,0)
			end)
		end
		wait(0.55)
		player.Character.Humanoid.Sit = false
	end
end

function playerAirjump(act,inp,obj)
	if inp == Enum.UserInputState.Begin then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Seated")
		wait()
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")	
	end
end


--[[ Binds ]]--

ca:BindAction("playerFrontflip",playerFrontflip,false,FrontflipKey)
ca:BindAction("playerBackflip",playerBackflip,false,BackflipKey)
ca:BindAction("playerAirjump",playerAirjump,false,AirjumpKey)

--[[ Load Message ]]--

print(scriptname .. " " .. ver .. " loaded successfully")

local notifSound = Instance.new("Sound",workspace)
notifSound.PlaybackSpeed = 1.5
notifSound.Volume = 0.15
notifSound.SoundId = "rbxassetid://170765130"
notifSound.PlayOnRemove = true
notifSound:Destroy()
game.StarterGui:SetCore("SendNotification", {Title = "feFlip", Text = "feFlip loaded successfully!", Icon = "rbxassetid://505845268", Duration = 5, Button1 = "Okay"})
