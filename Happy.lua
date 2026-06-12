local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game.StarterGui:SetCore("SendNotification",{Title="LUCKY BLOCKS Battlegrounds",Text="Made by Happy",Duration=5})
wait(1)
game.StarterGui:SetCore("SendNotification",{Title="Anti-AFK",Text="Enabled!",Duration=5})

local g = Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild("PlayerGui"))
g.ResetOnSpawn = false

local f = Instance.new("ImageLabel",g)
f.Size = UDim2.new(0,525,0,300)
f.Position = UDim2.new(0.3,0,0.32,0)
f.BackgroundTransparency = 1
f.Image = "rbxassetid://3570695787"
f.ImageColor3 = Color3.fromRGB(0,0,0)
f.ScaleType = Enum.ScaleType.Slice
f.SliceCenter = Rect.new(100,100,100,100)
f.SliceScale = 0.12
f.Active = true
f.Draggable = true

local t = Instance.new("TextLabel",f)
t.Size = UDim2.new(0,439,0,51)
t.BackgroundTransparency = 1
t.Text = "Happy"
t.TextColor3 = Color3.fromRGB(255,255,255)
t.TextSize = 28
t.Font = Enum.Font.SourceSans

local close = Instance.new("ImageButton",f)
close.Size = UDim2.new(0,45,0,45)
close.Position = UDim2.new(0.9,0,0,0)
close.BackgroundTransparency = 1
close.Image = "rbxassetid://3926305904"
close.ImageRectOffset = Vector2.new(284,4)
close.ImageRectSize = Vector2.new(24,24)

local ob = Instance.new("TextBox",f)
ob.Size = UDim2.new(0,56,0,35)
ob.Position = UDim2.new(0.75,0,0.31,0)
ob.Text = "1"
ob.BackgroundColor3 = Color3.fromRGB(40,40,40)
ob.TextColor3 = Color3.fromRGB(255,255,255)
ob.TextSize = 28

local tb = Instance.new("TextLabel",f)
tb.Size = UDim2.new(0,194,0,50)
tb.Position = UDim2.new(0.53,0,0.28,0)
tb.BackgroundTransparency = 1
tb.Text = "0 to "
tb.TextColor3 = Color3.fromRGB(255,255,255)
tb.TextSize = 28

local btns = {"LuckyBlock","SuperBlock","DiamondBlock","RainbowBlock","GalaxyBlock"}
local posY = {0.22,0.38,0.53,0.68,0.82}

for i,v in ipairs(btns) do
	local b = Instance.new("TextButton",f)
	b.Size = UDim2.new(0,150,0,35)
	b.Position = UDim2.new(0.055,0,posY[i],0)
	b.BackgroundColor3 = Color3.fromRGB(70,70,70)
	b.Text = v
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.TextSize = 28
	b.Font = Enum.Font.SourceSans
	
	b.MouseButton1Click:Connect(function()
		for i=1, tonumber(ob.Text) or 1 do
			local rs = game.ReplicatedStorage
			if rs:FindFirstChild("Spawn"..v) then
				rs["Spawn"..v]:FireServer()
			end
		end
	end)
end

close.MouseButton1Click:Connect(function() f.Visible = false end)
