local LocalPlayer = game:GetService("Players").LocalPlayer
local CG = game:GetService("CoreGui")
local TS = game:GetService("TweenService")

-- Initialisation --
for i, v in ipairs(CG:GetChildren()) do
    if v.Name == "VuongPro" then
        v:Destroy()
    end
end

local SG = Instance.new("ScreenGui")
SG.Name = "VuongPro"
SG.Parent = CG
SG.Enabled = false

local Pages = {}
local Buttons = {}

-- Home --
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.3, 0, 0.3, 0)  -- Adjusted size
MainFrame.Position = UDim2.new(0.35, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundTransparency = 0
MainFrame.ClipsDescendants = false
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.BackgroundTransparency = 1

local MainFrameConstraint = Instance.new("UIAspectRatioConstraint", MainFrame)
MainFrameConstraint.AspectRatio = 2 / 3

local MainBackground = Instance.new("ImageLabel", MainFrame)
MainBackground.Image = "http://www.roblox.com/asset/?id=91450257680054"
MainBackground.Size = UDim2.new(1, 0, 1, 0)
MainBackground.BackgroundTransparency = 1
MainBackground.Name = "MainBackground"

local MainToggle = Instance.new("ImageLabel", MainFrame)
MainToggle.Image = "http://www.roblox.com/asset/?id=103244936096633"
MainToggle.Size = UDim2.new(0.81, 0, 0.17, 0)
MainToggle.Position = UDim2.new(0.5, 0, 0.85, 0)
MainToggle.AnchorPoint = Vector2.new(0.5, 0.5)
MainToggle.BackgroundTransparency = 1
MainToggle.Name = "MainToggle"

local Blank = Instance.new("ImageButton", MainFrame)
Blank.BackgroundTransparency = 1
Blank.Size = UDim2.new(1, 0, 1, 0)
Blank.ZIndex = 1

local MainToggleCover = Instance.new("ImageLabel", MainFrame)
MainToggleCover.Image = "http://www.roblox.com/asset/?id=103244936096633"
MainToggleCover.Size = UDim2.new(0.81, 0, 0.17, 0)
MainToggleCover.Position = UDim2.new(0.5, 0, 0.85, 0)
MainToggleCover.AnchorPoint = Vector2.new(0.5, 0.5)
MainToggleCover.BackgroundTransparency = 1
MainToggleCover.ImageTransparency = 1
MainToggleCover.Name = "MainToggleCover"

local ToggleCircle = Instance.new("Frame", MainToggle)
ToggleCircle.Size = UDim2.new(0.7, 0, 0.8, 0)
ToggleCircle.Position = UDim2.new(0.15, 0, 0.5, 0)
ToggleCircle.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleCircle.BackgroundTransparency = 0
ToggleCircle.ZIndex = 2
ToggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleCircle.Name = "ToggleCircle"

local ToggleCircleConstraint = Instance.new("UIAspectRatioConstraint", ToggleCircle)
ToggleCircleConstraint.AspectRatio = 1

local ToggleCircleCorners = Instance.new("UICorner", ToggleCircle)
ToggleCircleCorners.CornerRadius = UDim.new(1, 0)

local ToggleButton = Instance.new("TextButton", MainToggle)
ToggleButton.Size = UDim2.new(1, 0, 1, 0)
ToggleButton.Transparency = 1
ToggleButton.Name = "ToggleButton"
ToggleButton.ZIndex = 5

-- Construct Shadow --
local Shadow = Instance.new("ImageLabel", MainFrame)
Shadow.Image = "http://www.roblox.com/asset/?id=91450257680054"
Shadow.Size = UDim2.new(1.2, 0, 1.2, 0)
Shadow.BackgroundTransparency = 1
Shadow.ImageTransparency = 1
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.ZIndex = -5
Shadow.Name = "Shadow"

local ShadowConstraint = Instance.new("UIAspectRatioConstraint", Shadow)
ShadowConstraint.AspectRatio = 130 / 177

-- Add Page --
local PageCounter = 0
local function NewPage(ButtonImage, PageTitle)
    PageCounter = PageCounter + 1
    local Page = Instance.new("ImageLabel", MainFrame)
    Page.Image = "http://www.roblox.com/asset/?id=91450257680054"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.ZIndex = -3
    Page.Name = PageTitle

    local PageFrame = Instance.new("Frame", Page)
    PageFrame.Size = UDim2.new(1, 0, 0.8, 0)
    PageFrame.AnchorPoint = Vector2.new(0, 1)
    PageFrame.Position = UDim2.new(0, 0, 1, 0)
    PageFrame.ClipsDescendants = true
    PageFrame.BackgroundTransparency = 1
    PageFrame.ZIndex = -2
    PageFrame.Name = PageTitle .. "_CoverFrame"

    local PageCover = Instance.new("ImageLabel", PageFrame)
    PageCover.Image = "http://www.roblox.com/asset/?id=103244936096633"
    PageCover.Size = UDim2.new(0, Page.AbsoluteSize.X, 0, Page.AbsoluteSize.Y)
    PageCover.Position = UDim2.new(0, 0, 1, 0)
    PageCover.AnchorPoint = Vector2.new(0, 1)
    PageCover.BackgroundTransparency = 1
    PageCover.ZIndex = 0
    PageCover.ImageTransparency = 0
    PageCover.Name = PageTitle

    local Title = Instance.new("TextLabel", Page)
    Title.AnchorPoint = Vector2.new(0.5, 0)
    Title.Position = UDim2.new(0.5, 0, 0.01, 0)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.5, 0, 0.5, 0)
    Title.Text = PageTitle
    Title.Font = Enum.Font.SourceSansBold
    Title.TextScaled = true
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.ZIndex = -2
    Title.Name = "Title"

    local Button = Instance.new("ImageButton", MainFrame)
    Button.Image = ButtonImage
    Button.Size = UDim2.new(0.1, 0, 0.1, 0)
    Button.Position = UDim2.new(0.09, 0, 0.1 * (PageCounter - 1) + 0.06, 0)
    Button.BackgroundTransparency = 1
    Button.AnchorPoint = Vector2.new(0.5, 0.5)
    Button.Name = PageTitle .. "_Button"

    local Underline = Instance.new("ImageLabel", Page)
    Underline.AnchorPoint = Vector2.new(0.5, 0)
    Underline.Position = UDim2.new(0.5, 0, 0.16, 0)
    Underline.Size = UDim2.new(0.55, 0, 0.013, 0)
    Underline.BackgroundColor3 = Color3.new(1, 1, 1)
    Underline.ZIndex = -2
    Underline.Name = "Line"

    local UnderlineCorner = Instance.new("UICorner", Underline)
    UnderlineCorner.CornerRadius = UDim.new(1000, 1000)

    local ButtonConstraint = Instance.new("UIAspectRatioConstraint", Button)
    ButtonConstraint.AspectRatio = 1

    local TitleConstraint = Instance.new("UIAspectRatioConstraint", Title)
    TitleConstraint.AspectRatio = 2

    local Container = Instance.new("Folder", Page)
    Container.Name = "Container"

    Button.MouseEnter:Connect(function()
        local Tween = TS:Create(SettingsButton, TweenInfo.new(0.4), { Rotation = 270, ImageColor3 = Color3.new(0.8, 0.8, 0.8) })
        Tween:Play()
    end)

    local function Open()
        for i, v in pairs(Pages) do
            if i ~= PageTitle then
                v"CLOSE"
            end
        end
        local Tween = TS:Create(Page, TweenInfo.new(0.8), { Position = UDim2.new(0.96, 0, 0, 0) })
        Tween:Play()
        Tween.Completed:Connect(function()
            TS:Create(Underline, TweenInfo.new(0.8), { Size = UDim2.new(0.55, 0, 0.013, 0) }):Play()
            TS:Create(Title, TweenInfo.new(0.6), { TextTransparency = 0 }):Play()
            TS:Create(PageCover, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
            for i, v in ipairs(Page.Container:GetChildren()) do
                if v:IsA("ImageButton") then
                    v.Active = true
                end
            end
        end)
    end

    local function Close()
        TS:Create(Title, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
        TS:Create(PageCover, TweenInfo.new(0.2), { ImageTransparency = 0 }):Play()
        local Tween = TS:Create(Underline, TweenInfo.new(0.3), { Size = UDim2.new(0, 0, 0.013, 0) })
        Tween:Play()
        Tween.Completed:Connect(function()
            TS:Create(Page, TweenInfo.new(0.8), { Position = UDim2.new(0, 0, 0, 0) }):Play()
            for i, v in ipairs(Page.Container:GetChildren()) do
                if v:IsA("ImageButton") then
                    v.Active = false
                end
            end
        end)
    end

    Pages[PageTitle] = { ["OPEN"] = Open, ["CLOSE"] = Close }
    Buttons[PageTitle] = Button

    Button.MouseEnter:Connect(function()
        TS:Create(Button, TweenInfo.new(0.3), { Size = UDim2.new(0.12, 0, 0.12, 0) }):Play()
    end)

    Button.MouseLeave:Connect(function()
        TS:Create(Button, TweenInfo.new(0.3), { Size = UDim2.new(0.1, 0, 0.1, 0) }):Play()
    end)

    Button.MouseButton1Down:Connect(function()
        TS:Create(Button, TweenInfo.new(0.1), { Size = UDim2.new(0.11, 0, 0.11, 0), ImageColor3 = Color3.new(0.8, 0.8, 0.8) }):Play()
    end)

    Button.MouseButton1Up:Connect(function()
        TS:Create(Button, TweenInfo.new(0.1), { Size = UDim2.new(0.12, 0, 0.12, 0), ImageColor3 = Color3.new(1, 1, 1) }):Play()
    end)

    local ToggleValue = 0
    Button.MouseButton1Click:Connect(function()
        ToggleValue = ToggleValue + 1
        if ToggleValue % 2 == 1 then
            Open()
        else
            Close()
        end
    end)

    return Page
end

local function NewToggle(Page, Name, Callback)
    local Container = Page.Container
    local Counter = #Container:GetChildren()
    local ToggleCount = 0

    local Button = Instance.new("ImageButton", Container)
    Button.AnchorPoint = Vector2.new(0.5, 0)
    Button.Position = UDim2.new(0.5, 0, 0.22 + 0.15 * (Counter), 0)
    Button.Size = UDim2.new(0.86, 0, 0.115, 0)
    Button.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    Button.BackgroundTransparency = 1
    Button.ImageTransparency = 1
    Button.Image = "http://www.roblox.com/asset/?id=98423085833581"
    Button.Name = "Button"
    Button.ZIndex = -1

    local ButtonCover = Instance.new("ImageLabel", Button)
    ButtonCover.Size = UDim2.new(1, 0, 1, 0)
    ButtonCover.BackgroundColor3 = Color3.new(1, 1, 1)
    ButtonCover.ZIndex = -2
    ButtonCover.BackgroundTransparency = 1
    ButtonCover.Image = "http://www.roblox.com/asset/?id=98257420354487"
    ButtonCover.Name = "ButtonCover"

    local Title = Instance.new("TextLabel", Button)
    Title.AnchorPoint = Vector2.new(0, 0.5)
    Title.Position = UDim2.new(0.05, 0, 0.5, 0)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0.7, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Text = Name
    Title.Font = Enum.Font.SourceSansBold
    Title.TextScaled = true
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.ZIndex = -1
    Title.Name = "Name"

    local ButtonCorners = Instance.new("UICorner", Button)
    ButtonCorners.CornerRadius = UDim.new(0.3, 0)

    local ButtonCoverCorners = Instance.new("UICorner", ButtonCover)
    ButtonCoverCorners.CornerRadius = UDim.new(0.3, 0)

    Button.MouseButton1Click:Connect(function()
        ToggleCount = ToggleCount + 1
        if ToggleCount % 2 == 1 then
            -- True
            local Tween = TS:Create(Button, TweenInfo.new(0.3), { ImageTransparency = 0 })
            Tween:Play()
            Callback(ToggleCount % 2)
        else
            -- False
            local Tween = TS:Create(Button, TweenInfo.new(0.3), { ImageTransparency = 1 })
            Tween:Play()
            Callback(ToggleCount % 2)
        end
    end)
end

-- Parent to Core --
local function InitUI()
    MainFrame.Parent = SG
    return SG
end

local Switch, InTween = 0, false
MainFrame.MouseEnter:Connect(function()
    local Tween = TS:Create(Shadow, TweenInfo.new(0.8), { ImageTransparency = 0 })
    Tween:Play()
end)

MainFrame.MouseLeave:Connect(function()
    local Tween = TS:Create(Shadow, TweenInfo.new(0.8), { ImageTransparency = 1 })
    Tween:Play()
end)

local Main = function() end

local function SetMain(Func)
    Main = Func
end

local function SetState(State)
    if State then
        InTween = true
        local Tween = TS:Create(ToggleCircle, TweenInfo.new(0.1), { Position = UDim2.new(0.85, 0, 0.5, 0) })
        local Tween2 = TS:Create(MainToggleCover, TweenInfo.new(0.5), { ImageTransparency = 0 })
        Tween:Play()
        Tween2:Play()
        Tween.Completed:Connect(function()
            InTween = false
        end)
        Switch = 1
    else
        InTween = true
        local Tween = TS:Create(ToggleCircle, TweenInfo.new(0.1), { Position = UDim2.new(0.15, 0, 0.5, 0) })
        local Tween2 = TS:Create(MainToggleCover, TweenInfo.new(0.5), { ImageTransparency = 1 })
        Tween:Play()
        Tween2:Play()
        Tween.Completed:Connect(function()
            InTween = false
        end)
        Switch = 0
    end
end

local function OnClick()
    if not InTween then
        Switch = Switch + 1
        Main(Switch % 2)
        if Switch % 2 == 0 then
            InTween = true
            local Tween = TS:Create(ToggleCircle, TweenInfo.new(0.1), { Position = UDim2.new(0.15, 0, 0.5, 0) })
            local Tween2 = TS:Create(MainToggleCover, TweenInfo.new(0.5), { ImageTransparency = 1 })
            Tween:Play()
            Tween2:Play()
            Tween.Completed:Connect(function()
                InTween = false
            end)
        else
            InTween = true
            local Tween = TS:Create(ToggleCircle, TweenInfo.new(0.1), { Position = UDim2.new(0.85, 0, 0.5, 0) })
            local Tween2 = TS:Create(MainToggleCover, TweenInfo.new(0.5), { ImageTransparency = 0 })
            Tween:Play()
            Tween2:Play()
            Tween.Completed:Connect(function()
                InTween = false
            end)
        end
    end
end

ToggleButton.MouseButton1Click:Connect(OnClick)

local UserInputService = game:GetService("UserInputService")

-- Function to toggle UI visibility
local function ToggleUIVisibility()
    SG.Enabled = not SG.Enabled
end

-- Detect key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.P then
            ToggleUIVisibility()
        end
    end
end)

return {
    ["NewPage"] = NewPage,
    ["NewToggle"] = NewToggle,
    ["InitUI"] = InitUI,
    ["SetMain"] = SetMain,
    ["SetState"] = SetState
}
