-- repeat task.wait() until game:IsLoaded()

-- if not getgenv().StingrayLoaded then
--     getgenv().StingrayLoaded = true

--     -- Init --
--     local StartTime = tick()
--     local LocalPlayer = game:GetService("Players").LocalPlayer

--     -- Load Configs --

--     -- Luck Boosts
--     getgenv().LuckBoosts = {"Withered Beckoning Cat", "White Lotus", "Luck Vial", "Fortune Gourd"}
--     -- UI --
    
--     local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/vuong200514/VuongHub/refs/heads/main/ui.lua"))()
--     local MainUI = UI.InitUI()
--     local Toggle = "ON"
--     pcall(function()
--         if isfile("JJI_State.txt") then
--             Toggle = readfile("JJI_State.txt")
--         else
--             writefile("JJI_State.txt", "ON")
--         end
--     end)
--     print("QUEUE TOGGLE: "..Toggle)
--     if Toggle == "ON" then
--         UI.SetState(true)
--     else
--         UI.SetState(false)
--     end
--     UI.SetMain(function(State)
--         if State == 1 then
--             Toggle = "ON"
--         else
--             Toggle = "OFF"
--         end
--         writefile("JJI_State.txt", Toggle)
--         print(readfile("JJI_State.txt"))
--     end)

--     -- Constants
--     local Cats = {"Withered Beckoning Cat", "Wooden Beckoning Cat", "Polished Beckoning Cat"}
--     local Loti = {"White Lotus", "Sapphire Lotus", "Jade Lotus", "Iridescent Lotus"}
--     local Highlight = {
--         "Maximum Scroll", "Domain Shard", "Demon Finger", "Energy Nature Scroll", "Purified Curse Hand"
--     }

--     if Toggle == "ON" then
--         local s, e = pcall(function()
--             queue_on_teleport(getgenv().Script)()
--         end)
--     end

--     -- Black screen check & Players in lobby check --
--     task.spawn(function()
--         task.wait(90)
--         while true do
--             game:GetService("TeleportService"):Teleport(10450270085)
--             task.wait(10)
--         end
--     end)

--     if game.PlaceId == 10450270085 then
--         game:GetService("TeleportService"):Teleport(119359147980471)
--     elseif game.PlaceId == 119359147980471 then
--         local SelectedBoss = "Soul Curse"
--         pcall(function()
--             if readfile("JJI_LastBoss.txt") then
--                 SelectedBoss = readfile("JJI_LastBoss.txt")
--             end
--         end)
--         task.wait(3)
--         while task.wait(1) do
--             game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("QuickStart"):InvokeServer("Boss", SelectedBoss, "Nightmare")
--         end
--     end

--     repeat task.wait() until LocalPlayer.Character
--     local Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
--     if not s then print("Better put this in auto execute, your thing doesn't support queue on tp:", e) end

--     local Objects = workspace:WaitForChild("Objects")
--     local Mobs = Objects:WaitForChild("Mobs")
--     local Spawns = Objects:WaitForChild("Spawns")
--     local Drops = Objects:WaitForChild("Drops")
--     local Effects = Objects:WaitForChild("Effects")
--     local Destructibles = Objects:WaitForChild("Destructibles")
--     local LootUI = LocalPlayer.PlayerGui:WaitForChild("Loot")
--     local Flip = LootUI:WaitForChild("Frame"):WaitForChild("Flip")
--     local Replay = LocalPlayer.PlayerGui:WaitForChild("ReadyScreen"):WaitForChild("Frame"):WaitForChild("Replay")

--     -- Destroy fx --
--     Effects.ChildAdded:Connect(function(Child)
--         if Child.Name ~= "DomainSphere" then
--             game:GetService("Debris"):AddItem(Child, 0)
--         end
--     end)
--     game:GetService("Lighting").ChildAdded:Connect(function(Child)
--         game:GetService("Debris"):AddItem(Child, 0)
--     end)
--     Destructibles.ChildAdded:Connect(function(Child)
--         game:GetService("Debris"):AddItem(Child, 0)
--     end)

--     -- Uh, ignore this spaghetti way of determining screen center --
--     local MouseTarget = Instance.new("Frame", LocalPlayer.PlayerGui:FindFirstChildWhichIsA("ScreenGui"))
--     MouseTarget.Size = UDim2.new(0, 0, 0, 0)
--     MouseTarget.Position = UDim2.new(0.5, 0, 0.5, 0)
--     MouseTarget.AnchorPoint = Vector2.new(0.5, 0.5)
--     local X, Y = MouseTarget.AbsolutePosition.X, MouseTarget.AbsolutePosition.Y

--     -- Funcs --
--     local function Skill(Name)
--         game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat")
--             :WaitForChild("Skill"):FireServer(Name)
--     end

--     local function OpenChest()
--         for i, v in ipairs(Drops:GetChildren()) do
--             if v:FindFirstChild("Collect") then
--                 fireproximityprompt(v.Collect)
--             end
--         end
--     end

--     local function Click(Button)
--         Button.AnchorPoint = Vector2.new(0.5, 0.5)
--         Button.Size = UDim2.new(50, 0, 50, 0)
--         Button.Position = UDim2.new(0.5, 0, 0.5, 0)
--         Button.ZIndex = 20
--         Button.ImageTransparency = 1
--         for i, v in ipairs(Button:GetChildren()) do
--             if v:IsA("TextLabel") then
--                 v:Destroy()
--             end
--         end
--         local VIM = game:GetService("VirtualInputManager")
--         VIM:SendMouseButtonEvent(X, Y, 0, true, game, 0)
--         task.wait()
--         VIM:SendMouseButtonEvent(X, Y, 0, false, game, 0)
--         task.wait()
--     end

--     local function InitTP()
--         --Root.CFrame = Spawns.BossSpawn.CFrame + Vector3.new(0, 10, 0)
--         local InitialTween = game:GetService("TweenService"):Create(Root, TweenInfo.new(1), {CFrame = Spawns.BossSpawn.CFrame + Vector3.new(0, 10, 0)})
--         InitialTween:Play()
--         InitialTween.Completed:Wait()
--         task.wait()
--     end

--     local function Domain(Name)
--         Skill("Domain Expansion: " .. Name)
--         task.wait()
--     end

--     -- Farm start --
--     repeat InitTP() until Mobs:FindFirstChildWhichIsA("Model")
--     local Boss = Mobs:FindFirstChildWhichIsA("Model").Name
--     game:GetService("ReplicatedStorage").Remotes.Client.GetClosestTarget.OnClientInvoke = function()
--         return Mobs[Boss].Humanoid
--     end

--     Skill("Infinity: Mugen")

--     -- Use boosts --
--     local LotusActive = LocalPlayer.ReplicatedData.chestOverride
--     local CatActive = LocalPlayer.ReplicatedData.luckBoost
--     for _, Item in pairs(getgenv().LuckBoosts) do
--         task.wait()
--         if table.find(Loti, Item) and LotusActive.Value == 0 then
--             print(Item.." used:", game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("EquipItem"):InvokeServer(Item))
--         end
--         task.wait(0.5)
--         if LotusActive.Value == 0 then
--             if (not table.find(Cats, Item)) or LocalPlayer.ReplicatedData.luckBoost.duration.Value == 0 then
--                 print(Item.." used:", game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("EquipItem"):InvokeServer(Item))
--             end
--         end
--     end

--     -- Skill spam --
--     if InstantKill ~= "ON" then
--         repeat
--             Skill("Incomplete Domain")
--             task.wait(2)
--         until Effects:FindFirstChild("DomainSphere")
--         task.spawn(function()
--             while Mobs:FindFirstChild(Boss) do
--                 if Mobs[Boss].Humanoid.Health ~= Mobs[Boss].Humanoid.MaxHealth then
--                     Mobs[Boss].Humanoid.Health = 0
--                 end
--                 Skill("Volcano: Ember Insects")
--                 task.wait()
--             end
--         end)
--     end

--     repeat task.wait() until Drops:FindFirstChild("Chest")
--     local Items = "| "
--     game:GetService("ReplicatedStorage").Remotes.Client.Notify.OnClientEvent:Connect(function(Message)
--         local Item = string.match(Message, '">(.-)<')
--         if table.find(Highlight, Item) then
--             Item = "**"..Item.."**"
--         end
--         Items = Items .. Item .. " | "
--     end)

--     -- Overwrite chest collection function --
--     local s, e = pcall(function()
--         game:GetService("ReplicatedStorage").Remotes.Client.CollectChest.OnClientInvoke = function()
--             print("Chest Collected")
--             return {}
--         end
--     end)
--     task.spawn(function()
--         while Drops:FindFirstChild("Chest") or LootUI.Enabled do
--             if not LootUI.Enabled then
--                 OpenChest()
--             else
--                 repeat Click(Flip) until not LootUI.Enabled
--             end
--             task.wait()
--         end
--     end)

--     repeat task.wait() until not (Drops:FindFirstChild("Chest") or LootUI.Enabled)

--     -- Send webhook message --
--     pcall(function()
--         if getgenv().Webhook then
--             local embed = {
--                 ["title"] = LocalPlayer.Name .. " has defeated " .. Boss .. " in " .. tostring(math.floor((tick() - StartTime) * 10) / 10) .. " seconds",
--                 ['description'] = "Collected Items: " .. Items,
--                 ["color"] = tonumber(0x51e2f5)
--             }
--             local a = request({
--                 -- Sửa URL webhook thành URL mới
--                 Url = "https://discord.com/api/webhooks/899205719616811038/Eb9b3dGd_g8VweEAHPNogy1-OGvwcL8e1yutbw5z57VYm-o6bmLAsJueYAk7qcPV9T--",
--                 Headers = { ['Content-Type'] = 'application/json' },
--                 Body = game:GetService("HttpService"):JSONEncode({ ['embeds'] = {embed}, ['avatar_url'] = "https://cdn.discordapp.com/attachments/1089257712900120576/1105570269055160422/archivector200300015.png" }),
--                 Method = "POST"
--             })
--         end
--     end)

--     -- Click replay --
--     task.wait()
--     pcall(function()
--         writefile("JJI_LastBoss.txt", Boss)
--     end)
--     for i = 1, 10, 1 do
--         Click(Replay)
--         task.wait(1)
--     end
-- end
