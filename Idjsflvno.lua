local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")
local credits = Instance.new("TextLabel")

local controlGui = Instance.new("ScreenGui")
local Fly_Pad = Instance.new("ImageLabel")
local UIGradient = Instance.new("UIGradient")
local FlyAButton = Instance.new("TextButton")
local FlyDButton = Instance.new("TextButton")
local FlyWButton = Instance.new("TextButton")
local FlySButton = Instance.new("TextButton")

local function getExecutorName()
   if identifyexecutor then
       return identifyexecutor()
   elseif syn and syn.request then
       return "Synapse X"
   elseif KRNL_LOADED then
       return "Krnl"
   elseif Fluxus then
       return "Fluxus"
   elseif getgenv().isfile then
       return "Script-Ware"
   elseif OXYGEN_LOADED then
       return "Oxygen U"
   elseif Shadow then
       return "Shadow"
   elseif Sentinel then
       return "Sentinel"
   else
       return "Universal"
   end
end

local function safeCall(func)
   local success, result = pcall(func)
   return success and result
end

local function safeWait(time)
   if task and task.wait then
       return task.wait(time or 0)
   else
       return wait(time or 0)
   end
end

local function safeSpawn(func)
   if task and task.spawn then
       return task.spawn(func)
   else
       return spawn(func)
   end
end

safeCall(function()
  if not game:GetService("Players").LocalPlayer then
      return
  end
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

if not Players.LocalPlayer or not Players.LocalPlayer.Character then
  return
end

safeCall(function()
   if setfpscap then
       setfpscap(60)
   elseif fps_cap then
       fps_cap(60)
   elseif set_fps_cap then
       set_fps_cap(60)
   end
end)

main.Name = "FlyGUI_Main_" .. math.random(1000, 9999)
main.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

controlGui.Name = "FlyGUI_Control_" .. math.random(1000, 9999)
controlGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
controlGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
controlGui.ResetOnSpawn = false

Fly_Pad.Name = "Fly_Pad"
Fly_Pad.Parent = controlGui
Fly_Pad.BackgroundTransparency = 1.000
Fly_Pad.Position = UDim2.new(0.8, 0, 0.6, 0) 
Fly_Pad.Size = UDim2.new(0, 100, 0, 100)
Fly_Pad.ZIndex = 2
Fly_Pad.Image = "rbxassetid://6764432293"
Fly_Pad.ImageRectOffset = Vector2.new(713, 315)
Fly_Pad.ImageRectSize = Vector2.new(75, 75)
Fly_Pad.Visible = false

UIGradient.Color = ColorSequence.new{
  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), 
  ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 255))
}
UIGradient.Rotation = 45
UIGradient.Parent = Fly_Pad

FlyAButton.Name = "FlyAButton"
FlyAButton.Parent = Fly_Pad
FlyAButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyAButton.BackgroundTransparency = 1.000
FlyAButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.BorderSizePixel = 0
FlyAButton.Position = UDim2.new(0, 0, 0, 30)
FlyAButton.Size = UDim2.new(0, 30, 0, 40)
FlyAButton.Font = Enum.Font.Oswald
FlyAButton.Text = ""
FlyAButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.TextSize = 25.000
FlyAButton.TextWrapped = true

FlyDButton.Name = "FlyDButton"
FlyDButton.Parent = Fly_Pad
FlyDButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyDButton.BackgroundTransparency = 1.000
FlyDButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.BorderSizePixel = 0
FlyDButton.Position = UDim2.new(0, 70, 0, 30)
FlyDButton.Size = UDim2.new(0, 30, 0, 40)
FlyDButton.Font = Enum.Font.Oswald
FlyDButton.Text = ""
FlyDButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.TextSize = 25.000
FlyDButton.TextWrapped = true

FlyWButton.Name = "FlyWButton"
FlyWButton.Parent = Fly_Pad
FlyWButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyWButton.BackgroundTransparency = 1.000
FlyWButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.BorderSizePixel = 0
FlyWButton.Position = UDim2.new(0, 30, 0, 0)
FlyWButton.Size = UDim2.new(0, 40, 0, 30)
FlyWButton.Font = Enum.Font.Oswald
FlyWButton.Text = ""
FlyWButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.TextSize = 25.000
FlyWButton.TextWrapped = true

FlySButton.Name = "FlySButton"
FlySButton.Parent = Fly_Pad
FlySButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlySButton.BackgroundTransparency = 1.000
FlySButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.BorderSizePixel = 0
FlySButton.Position = UDim2.new(0, 30, 0, 70)
FlySButton.Size = UDim2.new(0, 40, 0, 30)
FlySButton.Font = Enum.Font.Oswald
FlySButton.Text = ""
FlySButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.TextSize = 25.000
FlySButton.TextWrapped = true

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V4"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

credits.Name = "credits"
credits.Parent = main
credits.BackgroundTransparency = 1
credits.Position = UDim2.new(0, 0, 1, -30)
credits.Size = UDim2.new(0, 300, 0, 30)
credits.Font = Enum.Font.SourceSansBold
credits.Text = "UNIVERSAL FLY / 00:00"
credits.TextColor3 = Color3.fromRGB(255, 255, 255)
credits.TextSize = 14
credits.TextXAlignment = Enum.TextXAlignment.Left

local speeds = 1
local speaker = Players.LocalPlayer
local mouse = speaker:GetMouse()
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
local nowe = false
local currentAnimTrack = nil
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local KeyDownFunction = nil
local KeyUpFunction = nil
local startTime = tick()
local flying = false

local function formatTime(seconds)
  local minutes = math.floor(seconds / 60)
  local secs = math.floor(seconds % 60)
  return string.format("%02d:%02d", minutes, secs)
end

local function updateCredits()
  safeSpawn(function()
      while credits and credits.Parent do
          safeWait(1)
          local currentTime = tick()
          local elapsed = currentTime - startTime
          local timeStr = formatTime(elapsed)
          local hour = tonumber(os.date("%H"))
          local r, g, b = 255, 255, 255
          
          if hour >= 6 and hour < 12 then
              r, g, b = 255, 255, 0
          elseif hour >= 12 and hour < 18 then
              r, g, b = 255, 165, 0
          elseif hour >= 18 and hour < 21 then
              r, g, b = 255, 100, 100
          else
              r, g, b = 100, 100, 255
          end
          
          credits.TextColor3 = Color3.fromRGB(r, g, b)
          credits.Text = "UNIVERSAL FLY / " .. timeStr
      end
  end)
end

local function PlayAnim(animId, priority, weight)
  local player = Players.LocalPlayer
  local character = player.Character
  if not character then return end
  
  local humanoid = character:FindFirstChild("Humanoid")
  if not humanoid then return end
  
  safeCall(function()
      if currentAnimTrack then
          currentAnimTrack:Stop()
          currentAnimTrack = nil
      end
      
      local anim = Instance.new("Animation")
      anim.AnimationId = "rbxassetid://" .. animId
      
      currentAnimTrack = humanoid:LoadAnimation(anim)
      currentAnimTrack.Priority = priority or Enum.AnimationPriority.Action
      
      if weight then
          currentAnimTrack:AdjustWeight(weight)
      end
      
      currentAnimTrack:Play()
  end)
end

local function StopAllAnimations()
  safeCall(function()
      if currentAnimTrack then
          currentAnimTrack:Stop()
          currentAnimTrack = nil 
      end
      
      local character = Players.LocalPlayer.Character
      if character then
          local humanoid = character:FindFirstChild("Humanoid")
          if humanoid then
              for i, v in pairs(humanoid:GetPlayingAnimationTracks()) do
                  v:Stop()
              end
          end
      end
  end)
end

local function RestoreNormalAnimations()
  safeCall(function()
      local character = Players.LocalPlayer.Character
      if character then
          character.Animate.Disabled = false
          local humanoid = character:FindFirstChild("Humanoid")
          if humanoid then
              humanoid.PlatformStand = false
          end
      end
  end)
end

local function SetupKeyControls()
  if KeyDownFunction then KeyDownFunction:Disconnect() end
  if KeyUpFunction then KeyUpFunction:Disconnect() end
  
  KeyDownFunction = mouse.KeyDown:connect(function(key)
      if nowe then
          if key:lower() == "w" then
              ctrl.f = 1
              PlayAnim(10714177846, Enum.AnimationPriority.Action, 4.65)
          elseif key:lower() == "s" then
              ctrl.b = -1
              PlayAnim(10147823318, Enum.AnimationPriority.Action, 4.11)
          elseif key:lower() == "a" then
              ctrl.l = -1
              PlayAnim(10147823318, Enum.AnimationPriority.Action, 3.55)
          elseif key:lower() == "d" then
              ctrl.r = 1
              PlayAnim(10147823318, Enum.AnimationPriority.Action, 4.81)
          end
      end
  end)

  KeyUpFunction = mouse.KeyUp:connect(function(key)
      if key:lower() == "w" then
          ctrl.f = 0
          if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
      elseif key:lower() == "s" then
          ctrl.b = 0
          if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
      elseif key:lower() == "a" then
          ctrl.l = 0
          if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
      elseif key:lower() == "d" then
          ctrl.r = 0
          if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
      end
  end)
end

FlyWButton.MouseButton1Down:Connect(function()
  if nowe then
      ctrl.f = 1
      PlayAnim(10714177846, Enum.AnimationPriority.Action, 4.65)
  end
end)

FlyWButton.MouseButton1Up:Connect(function()
  ctrl.f = 0
  if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
end)

FlySButton.MouseButton1Down:Connect(function()
  if nowe then
      ctrl.b = -1
      PlayAnim(10147823318, Enum.AnimationPriority.Action, 4.11)
  end
end)

FlySButton.MouseButton1Up:Connect(function()
  ctrl.b = 0
  if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
end)

FlyAButton.MouseButton1Down:Connect(function()
  if nowe then
      ctrl.l = -1
      PlayAnim(10147823318, Enum.AnimationPriority.Action, 3.55)
  end
end)

FlyAButton.MouseButton1Up:Connect(function()
  ctrl.l = 0
  if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
end)

FlyDButton.MouseButton1Down:Connect(function()
  if nowe then
      ctrl.r = 1
      PlayAnim(10147823318, Enum.AnimationPriority.Action, 4.81)
  end
end)

FlyDButton.MouseButton1Up:Connect(function()
  ctrl.r = 0
  if nowe then PlayAnim(10714347256, Enum.AnimationPriority.Action, 4) end
end)

local function DisconnectKeyControls()
  if KeyDownFunction then
      KeyDownFunction:Disconnect()
      KeyDownFunction = nil
  end
  if KeyUpFunction then
      KeyUpFunction:Disconnect()
      KeyUpFunction = nil
  end
end

safeCall(function()
  game:GetService("StarterGui"):SetCore("SendNotification", {
      Title = "Universal Fly V4 - " .. getExecutorName();
      Text = "Successfully loaded with full compatibility!";
      Duration = 5;
  })
end)

Frame.Active = true
Frame.Draggable = true
Fly_Pad.Active = true
Fly_Pad.Draggable = true

SetupKeyControls()
updateCredits()

onof.MouseButton1Down:connect(function()
  if nowe == true then
      nowe = false
      flying = false
      if UserInputService.TouchEnabled then
          Fly_Pad.Visible = false
      end
      
      StopAllAnimations()
      RestoreNormalAnimations()
      
      safeCall(function()
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
          speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
      end)
      
      ctrl = {f = 0, b = 0, l = 0, r = 0}
      
  else
      nowe = true
      flying = true
      if UserInputService.TouchEnabled then
          Fly_Pad.Visible = true
      end
      
      PlayAnim(10714347256, Enum.AnimationPriority.Action, 4)
      
      for i = 1, speeds do
          safeSpawn(function()
              local hb = RunService.Heartbeat
              tpwalking = true
              local chr = Players.LocalPlayer.Character
              local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
              while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                  if hum.MoveDirection.Magnitude > 0 then
                      chr:TranslateBy(hum.MoveDirection)
                  end
              end
          end)
      end
      
      safeCall(function()
          Players.LocalPlayer.Character.Animate.Disabled = true
          local Char = Players.LocalPlayer.Character
          local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
          
          for i, v in next, Hum:GetPlayingAnimationTracks() do
              v:AdjustSpeed(0)
          end
          
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
          speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
          speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
      end)
  end

  safeCall(function()
      if Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
          local plr = Players.LocalPlayer
          local torso = plr.Character.Torso
          local lastctrl = {f = 0, b = 0, l = 0, r = 0}
          local maxspeed = 50
          local speed = 0

          local bg = Instance.new("BodyGyro", torso)
          bg.P = 9e4
          bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
          bg.cframe = torso.CFrame
          local bv = Instance.new("BodyVelocity", torso)
          bv.velocity = Vector3.new(0, 0.1, 0)
          bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
          
          if nowe == true then
              plr.Character.Humanoid.PlatformStand = true
          end
          
          while nowe == true do
              RunService.RenderStepped:Wait()

              if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                  speed = speed + .5 + (speed / maxspeed)
                  if speed > maxspeed then
                      speed = maxspeed
                  end
              elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                  speed = speed - 1
                  if speed < 0 then
                      speed = 0
                  end
              end
              
              if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                  bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                  lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
              elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                  bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
              else
                  bv.velocity = Vector3.new(0, 0, 0)
              end
              
              bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
          end
          
          ctrl = {f = 0, b = 0, l = 0, r = 0}
          lastctrl = {f = 0, b = 0, l = 0, r = 0}
          speed = 0
          bg:Destroy()
          bv:Destroy()
          plr.Character.Humanoid.PlatformStand = false
          Players.LocalPlayer.Character.Animate.Disabled = false
          tpwalking = false

      else
        local plr = Players.LocalPlayer
          local UpperTorso = plr.Character.UpperTorso
          local lastctrl = {f = 0, b = 0, l = 0, r = 0}
          local maxspeed = 50
          local speed = 0

          local bg = Instance.new("BodyGyro", UpperTorso)
          bg.P = 9e4
          bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
          bg.cframe = UpperTorso.CFrame
          local bv = Instance.new("BodyVelocity", UpperTorso)
          bv.velocity = Vector3.new(0, 0.1, 0)
          bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
          
          if nowe == true then
              plr.Character.Humanoid.PlatformStand = true
          end
          
          while nowe == true do
              safeWait()

              if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                  speed = speed + .5 + (speed / maxspeed)
                  if speed > maxspeed then
                      speed = maxspeed
                  end
              elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                  speed = speed - 1
                  if speed < 0 then
                    speed = 0
                  end
              end
              
              if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                  bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                  lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
              elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                  bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
              else
                  bv.velocity = Vector3.new(0, 0, 0)
              end

              bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
          end
          
          ctrl = {f = 0, b = 0, l = 0, r = 0}
          lastctrl = {f = 0, b = 0, l = 0, r = 0}
          speed = 0
          bg:Destroy()
          bv:Destroy()
          plr.Character.Humanoid.PlatformStand = false
          Players.LocalPlayer.Character.Animate.Disabled = false
          tpwalking = false
      end
  end)
end)

local tis

up.MouseButton1Down:connect(function()
  tis = up.MouseEnter:connect(function()
      while tis do
          safeWait()
          safeCall(function()
              Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
          end)
      end
  end)
end)

up.MouseLeave:connect(function()
  if tis then
      tis:Disconnect()
      tis = nil
  end
end)

local dis

down.MouseButton1Down:connect(function()
  dis = down.MouseEnter:connect(function()
      while dis do
          safeWait()
          safeCall(function()
              Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
          end)
      end
  end)
end)

down.MouseLeave:connect(function()
  if dis then
      dis:Disconnect()
      dis = nil
  end
end)

Players.LocalPlayer.CharacterAdded:Connect(function(char)
  safeWait(0.7)
  safeCall(function()
      Players.LocalPlayer.Character.Humanoid.PlatformStand = false
      Players.LocalPlayer.Character.Animate.Disabled = false
      SetupKeyControls()
      chr = Players.LocalPlayer.Character
      hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
  end)
end)

plus.MouseButton1Down:connect(function()
  speeds = speeds + 1
  speed.Text = speeds
  if nowe == true then
      tpwalking = false
      for i = 1, speeds do
          safeSpawn(function()
              local hb = RunService.Heartbeat
              tpwalking = true
              local chr = Players.LocalPlayer.Character
              local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
              while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                  if hum.MoveDirection.Magnitude > 0 then
                      chr:TranslateBy(hum.MoveDirection)
                  end
              end
          end)
      end
  end
end)

mine.MouseButton1Down:connect(function()
  if speeds == 1 then
      speed.Text = 'min 1'
      safeWait(1)
      speed.Text = speeds
  else
      speeds = speeds - 1
      speed.Text = speeds
      if nowe == true then
          tpwalking = false
          for i = 1, speeds do
              safeSpawn(function()
                  local hb = RunService.Heartbeat
                  tpwalking = true
                  local chr = Players.LocalPlayer.Character
                  local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                  while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                      if hum.MoveDirection.Magnitude > 0 then
                          chr:TranslateBy(hum.MoveDirection)
                      end
                  end
              end)
          end
      end
  end
end)

closebutton.MouseButton1Click:Connect(function()
  safeCall(function()
      DisconnectKeyControls()
      StopAllAnimations()
      RestoreNormalAnimations()
      main:Destroy()
      controlGui:Destroy()
  end)
end)

mini.MouseButton1Click:Connect(function()
  up.Visible = false
  down.Visible = false
  onof.Visible = false
  plus.Visible = false
  speed.Visible = false
  mine.Visible = false
  mini.Visible = false
  mini2.Visible = true
  credits.Visible = false
  main.Frame.BackgroundTransparency = 1
  closebutton.Position = UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
  up.Visible = true
  down.Visible = true
  onof.Visible = true
  plus.Visible = true
  speed.Visible = true
  mine.Visible = true
  mini.Visible = true
  mini2.Visible = false
  credits.Visible = true
  main.Frame.BackgroundTransparency = 0
  closebutton.Position = UDim2.new(0, 0, -1, 27)
end)

print("Universal Fly V4 loaded successfully on " .. getExecutorName())
