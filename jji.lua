repeat task.wait() until game:IsLoaded()

if not getgenv().StingrayLoaded then
    getgenv().StingrayLoaded = true
    
    -- Init --
    local StartTime = tick()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    
    -- Load Configs --
    -- Webhook
    getgenv().Webhook = "https://discord.com/api/webhooks/899205719616811038/Eb9b3dGd_g8VweEAHPNogy1-OGvwcL8e1yutbw5z57VYm-o6bmLAsJueYAk7qcPV9T--"
    
    -- Luck Boosts
    getgenv().LuckBoosts = {"Withered Beckoning Cat", "White Lotus", "Luck Vial", "Fortune Gourd"}
    
    -- UI --
    local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/vuong200514/VuongHub/refs/heads/main/ui.lua"))()
    local MainUI = UI.InitUI()
    local Toggle = "ON"
    pcall(function()
        if isfile("Stingray/JJI_State.txt") then
            Toggle = readfile("Stingray/JJI_State.txt")
        else
            writefile("Stingray/JJI_State.txt", "ON")
        end
    end)
    print("QUEUE TOGGLE: "..Toggle)
    if Toggle == "ON" then
        UI.SetState(true)
    else
        UI.SetState(false)
    end
    UI.SetMain(function(State)
        if State == 1 then
            Toggle = "ON"
        else
            Toggle = "OFF"
        end
        writefile("Stingray/JJI_State.txt", Toggle)
        print(readfile("Stingray/JJI_State.txt"))
    end)
    
    -- Constants
    local Cats = {"Withered Beckoning Cat", "Wooden Beckoning Cat", "Polished Beckoning Cat"}
    local Loti = {"White Lotus", "Sapphire Lotus", "Jade Lotus", "Iridescent Lotus"} -- Did you know the plural of Lotus is Loti
    local Highlight = {"5 Demon Fingers", "Maximum Scroll", "Domain Shard", "Polished Beckoning Cat", "Demon Finger", "Energy Nature Scroll", "Purified Curse Hand"}
    local Runners = {"Soul Curse"} -- Damn monkeys go AEEHOIIII, add to this table if you feel like a boss is running too much
    
    local QueueSuccess = "False"
    if Toggle == "ON" then
        local Queued, QueueFail = pcall(function()
            queue_on_teleport('loadstring(game:HttpGet("https://github.com/vuong200514/VuongHub/blob/main/jji.lua"))()')()
        end)
        if not Queued then
            QueueSuccess = QueueFail
        else
            QueueSuccess = "True"
        end
    end
    
    -- Black screen check & Fail safe --
    task.spawn(function()
        task.wait(90)
        while true do
            game:GetService("TeleportService"):Teleport(10450270085)
            task.wait(10)
        end
    end)
    
    if game.PlaceId == 10450270085 then
        game:GetService("TeleportService"):Teleport(119359147980471)
    elseif game.PlaceId == 119359147980471 then
        local SelectedBoss = "Soul Curse"
        pcall(function()
            if readfile("Stingray/JJI_LastBoss.txt") then
                SelectedBoss = readfile("Stingray/JJI_LastBoss.txt")
            end
        end)
        task.wait(3)
        while task.wait(1) do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("QuickStart"):InvokeServer("Boss", SelectedBoss, "Nightmare")
        end
    end
    
    repeat task.wait() until LocalPlayer.Character
    local Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local Objects = workspace:WaitForChild("Objects")
    local Mobs = Objects:WaitForChild("Mobs")
    local Spawns = Objects:WaitForChild("Spawns")
    local Drops = Objects:WaitForChild("Drops")
    local Effects = Objects:WaitForChild("Effects")
    local Destructibles = Objects:WaitForChild("Destructibles")
    local LootUI = LocalPlayer.PlayerGui:WaitForChild("Loot")
    local Flip = LootUI:WaitForChild("Frame"):WaitForChild("Flip")
    local Replay = LocalPlayer.PlayerGui:WaitForChild("ReadyScreen"):WaitForChild("Frame"):WaitForChild("Replay")
    
    -- Destroy fx --
    Effects.ChildAdded:Connect(function(Child)
        if Child.Name ~= "DomainSphere" then
            game:GetService("Debris"):AddItem(Child, 0)
        end
    end)
    game:GetService("Lighting").ChildAdded:Connect(function(Child)
        game:GetService("Debris"):AddItem(Child, 0)
    end)
    Destructibles.ChildAdded:Connect(function(Child)
        game:GetService("Debris"):AddItem(Child, 0)
    end)
    
    -- Uh, ignore this spaghetti way of determining screen center --
    local MouseTarget = Instance.new("Frame", LocalPlayer.PlayerGui:FindFirstChildWhichIsA("ScreenGui"))
    MouseTarget.Size = UDim2.new(0, 0, 0, 0)
    MouseTarget.Position = UDim2.new(0.5, 0, 0.5, 0)
    MouseTarget.AnchorPoint = Vector2.new(0.5, 0.5)
    local X, Y = MouseTarget.AbsolutePosition.X, MouseTarget.AbsolutePosition.Y
    
    -- Funcs --
    
    local function Encode(data) -- Pass data through url, safety encoding
        local SafeStr = game:GetService("HttpService"):UrlEncode(data)
        SafeStr = string.gsub(SafeStr, "+", "-")
        SafeStr = string.gsub(SafeStr, "/", "_")
        SafeStr = string.gsub(SafeStr, "=", "")
        return SafeStr
    end
    
    local function Skill(Name)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Skill"):FireServer(Name)
    end
    
    local function OpenChest()
        for i, v in ipairs(Drops:GetChildren()) do
            if v:FindFirstChild("Collect") then
                fireproximityprompt(v.Collect)
            end
        end
    end
    
    local function Hit()
        game:GetService("ReplicatedStorage").Remotes.Server.Combat:FindFirstChild("ApplyBlackFlashToNextHitbox"):FireServer()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M2"):FireServer(2)
    end
    
    local function Click(Button)
        Button.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.Size = UDim2.new(50, 0, 50, 0)
        Button.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button.ZIndex = 20
        Button.ImageTransparency = 1
        for i, v in ipairs(Button:GetChildren()) do
            if v:IsA("TextLabel") then
                v:Destroy()
            end
        end
        local VIM = game:GetService("VirtualInputManager")
        VIM:SendMouseButtonEvent(X, Y, 0, true, game, 0)
        task.wait()
        VIM:SendMouseButtonEvent(X, Y, 0, false, game, 0)
        task.wait()
    end
    
    -- Farm start --
    local ScriptLoading = tostring(math.floor((tick() - StartTime) * 10) / 10)
    local InitialTween = game:GetService("TweenService"):Create(Root, TweenInfo.new(1), {CFrame = Spawns.BossSpawn.CFrame + Vector3.new(0, 10, 0)})
    InitialTween:Play()
    InitialTween.Completed:Wait()
    repeat task.wait() until Mobs:FindFirstChildWhichIsA("Model")
    local Boss = Mobs:FindFirstChildWhichIsA("Model").Name
    local Config
    game:GetService("ReplicatedStorage").Remotes.Client.GetClosestTarget.OnClientInvoke = function()
        return Mobs[Boss].Humanoid
    end
    task.spawn(function()
        local s, e = pcall(function()
            writefile("Stingray/JJI_LastBoss.txt", Boss)
        end)
    end)
    print("Aim hooked to "..Boss)
    
    -- Use boosts --
    local LotusActive = LocalPlayer.ReplicatedData.chestOverride
    local CatActive = LocalPlayer.ReplicatedData.luckBoost
    local LotusValue, CatValue = 0, 0
    task.spawn(function()
        for _, Item in pairs(getgenv().LuckBoosts) do
            task.wait()
            if table.find(Loti, Item) and LotusActive.Value == 0 then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("EquipItem"):InvokeServer(Item)
                print(Item.." used")
            end
            task.wait(0.5)
            if LotusActive.Value == 0 then
                if (not table.find(Cats, Item)) or CatActive.duration.Value == 0 then
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("EquipItem"):InvokeServer(Item)
                    print(Item.." used")
                end
            end
        end
        LotusValue = LotusActive.Value
        CatValue = CatActive.amount.Value
    end)
    
    -- Skill spam --
    task.wait(1)
    local Limiter = 0
    local IsRunner = table.find(Runners, Boss)
    if getgenv().InstantKill ~= "ON" then
        repeat
            if IsRunner then
                Skill("Domain Expansion: Unlimited Void")
            else
                Skill("Incomplete Domain")
            end
            task.wait(3)
        until Effects:FindFirstChild("DomainSphere")
        task.spawn(function()
            while Mobs:FindFirstChild(Boss) do
                if Mobs[Boss].Humanoid.Health ~= Mobs[Boss].Humanoid.MaxHealth then
                    Mobs[Boss].Humanoid.Health = 0
                end
                if identifyexecutor() ~= "Solara" then
                    Skill("Volcano: Ember Insects")
                else
                    Hit(Mobs:FindFirstChild(Boss).Humanoid)
                end
                Limiter = Limiter + 1
                if Limiter % 240 == 0 then
                    task.wait(1) -- Spam of ember insects can cause high pings, may cause disconnections and crashes
                end
                task.wait()
            end
        end)
    end
    
    repeat task.wait() until Drops:FindFirstChild("Chest") -- Could have used WaitForChild here, but I felt it feels cursed not assigning WaitForChild to a variable, then I don't want an unused variable...
    local Items = "| "
    game:GetService("ReplicatedStorage").Remotes.Client.Notify.OnClientEvent:Connect(function(Message)
        local Item = string.match(Message, '">(.-)')
        if not (string.find(Item, "Stat Point") or string.find(Item, "Level")) then
            if table.find(Highlight, Item) then
                Item = "**"..Item.."**"
            end
            Items = Items .. Item .. " | "
        end
    end)
    
    -- Overwrite chest collection function --
    local ChestsCollected = 0
    local s, e = pcall(function()
        game:GetService("ReplicatedStorage").Remotes.Client.CollectChest.OnClientInvoke = function(Chest)
            if Chest then
                ChestsCollected = ChestsCollected + 1
            end
            return {}
        end
    end)
    task.spawn(function()
        while Drops:FindFirstChild("Chest") or LootUI.Enabled do
            if not LootUI.Enabled then
                OpenChest()
            else
                repeat Click(Flip) until not LootUI.Enabled
            end
            task.wait()
        end
    end)
    
    repeat task.wait() until not (Drops:FindFirstChild("Chest") or LootUI.Enabled)
    
    -- Send webhook message --
    pcall(function()
        if getgenv().Webhook then
            task.wait(1)
            local embed = {
                ["title"] = LocalPlayer.Name .. " has defeated " .. Boss .. " in " .. tostring(math.floor((tick() - StartTime) * 10) / 10) .. " seconds",
                ['description'] = "Collected Items: " .. Items,
                ["color"] = tonumber(000000)
            }
            local a = request({
                Url = "https://discord.com/api/webhooks/899205719616811038/Eb9b3dGd_g8VweEAHPNogy1-OGvwcL8e1yutbw5z57VYm-o6bmLAsJueYAk7qcPV9T--",
                Headers = { ['Content-Type'] = 'application/json' },
                Body = game:GetService("HttpService"):JSONEncode({ ['embeds'] = {embed}, ['avatar_url'] = "https://cdn.discordapp.com/attachments/1089257712900120576/1105570269055160422/archivector200300015.png" }),
                Method = "POST"
            })
        end
    end)
    
    -- Click replay --
    task.wait()
    for i = 1, 10, 1 do
        Click(Replay)
        task.wait(1)
    end
end
