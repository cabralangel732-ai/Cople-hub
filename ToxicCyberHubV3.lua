--====================================================
-- TOXIC CYBER HUB VIP V5
-- PURPLE GOD EDITION | MOBILE UI
--====================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("ToxicPurpleV5")
if old then old:Destroy() end

-- THEME
local PURPLE = Color3.fromRGB(175, 65, 255)
local PURPLE2 = Color3.fromRGB(105, 35, 190)
local BG = Color3.fromRGB(7, 8, 17)
local PANEL = Color3.fromRGB(14, 15, 29)
local CARD = Color3.fromRGB(21, 22, 40)
local WHITE = Color3.fromRGB(245, 242, 255)
local GRAY = Color3.fromRGB(145, 143, 170)

local function make(class, props, parent)
    local obj = Instance.new(class)
    for k,v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function round(obj, radius)
    make("UICorner", {
        CornerRadius = UDim.new(0, radius)
    }, obj)
end

local function border(obj, color, thickness)
    return make("UIStroke", {
        Color = color or PURPLE,
        Thickness = thickness or 1
    }, obj)
end

local function tween(obj, props, duration)
    local t = TweenService:Create(
        obj,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        props
    )
    t:Play()
    return t
end

-- SCREEN GUI
local gui = make("ScreenGui", {
    Name = "ToxicPurpleV5",
    ResetOnSpawn = false,
    DisplayOrder = 999,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, pg)

-- FLOATING BUTTON
local floating = make("TextButton", {
    Name = "FloatingButton",
    Size = UDim2.fromOffset(52, 52),
    Position = UDim2.new(0, 14, 0.4, 0),
    BackgroundColor3 = PANEL,
    Text = "✦",
    TextColor3 = PURPLE,
    TextSize = 30,
    Font = Enum.Font.GothamBlack,
    AutoButtonColor = false,
    Active = true
}, gui)

round(floating, 26)
border(floating, PURPLE, 2)

-- MAIN WINDOW
local main = make("Frame", {
    Name = "Main",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(0.94, 0, 0.76, 0),
    BackgroundColor3 = BG,
    BorderSizePixel = 0,
    ClipsDescendants = true
}, gui)

make("UISizeConstraint", {
    MinSize = Vector2.new(310, 320),
    MaxSize = Vector2.new(720, 520)
}, main)

round(main, 14)
local mainStroke = border(main, PURPLE, 2)

-- HEADER
local header = make("Frame", {
    Size = UDim2.new(1, 0, 0, 60),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0
}, main)

local logo = make("TextLabel", {
    Position = UDim2.fromOffset(10, 8),
    Size = UDim2.fromOffset(43, 43),
    BackgroundColor3 = CARD,
    Text = "✦",
    TextColor3 = PURPLE,
    TextSize = 30,
    Font = Enum.Font.GothamBlack
}, header)

round(logo, 11)
border(logo, PURPLE, 1)

make("TextLabel", {
    Position = UDim2.fromOffset(62, 7),
    Size = UDim2.new(1, -125, 0, 28),
    BackgroundTransparency = 1,
    Text = "TOXIC CYBER HUB",
    TextColor3 = WHITE,
    TextSize = 17,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left
}, header)

make("TextLabel", {
    Position = UDim2.fromOffset(63, 33),
    Size = UDim2.new(1, -130, 0, 17),
    BackgroundTransparency = 1,
    Text = "VIP V5  •  PURPLE GOD EDITION",
    TextColor3 = PURPLE,
    TextSize = 9,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, header)

local close = make("TextButton", {
    Position = UDim2.new(1, -40, 0, 14),
    Size = UDim2.fromOffset(28, 28),
    BackgroundColor3 = CARD,
    Text = "×",
    TextColor3 = WHITE,
    TextSize = 22,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false
}, header)

round(close, 8)

-- SIDEBAR
local sidebar = make("ScrollingFrame", {
    Position = UDim2.fromOffset(9, 69),
    Size = UDim2.new(0, 112, 1, -78),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    ScrollBarThickness = 2,
    ScrollBarImageColor3 = PURPLE,
    CanvasSize = UDim2.new()
}, main)

round(sidebar, 10)

make("UIPadding", {
    PaddingTop = UDim.new(0, 7),
    PaddingLeft = UDim.new(0, 6),
    PaddingRight = UDim.new(0, 6),
    PaddingBottom = UDim.new(0, 7)
}, sidebar)

local sideLayout = make("UIListLayout", {
    Padding = UDim.new(0, 6),
    SortOrder = Enum.SortOrder.LayoutOrder
}, sidebar)

-- CONTENT AREA
local content = make("Frame", {
    Position = UDim2.new(0, 129, 0, 70),
    Size = UDim2.new(1, -138, 1, -79),
    BackgroundTransparency = 1
}, main)

local title = make("TextLabel", {
    Size = UDim2.new(1, 0, 0, 29),
    BackgroundTransparency = 1,
    Text = "DASHBOARD",
    TextColor3 = WHITE,
    TextSize = 19,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left
}, content)

local subtitle = make("TextLabel", {
    Position = UDim2.fromOffset(0, 28),
    Size = UDim2.new(1, 0, 0, 20),
    BackgroundTransparency = 1,
    Text = "Welcome to your control center",
    TextColor3 = GRAY,
    TextSize = 10,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, content)

local divider = make("Frame", {
    Position = UDim2.fromOffset(0, 52),
    Size = UDim2.new(1, 0, 0, 1),
    BackgroundColor3 = PURPLE,
    BackgroundTransparency = 0.45,
    BorderSizePixel = 0
}, content)

-- CARD LIST
local cards = make("ScrollingFrame", {
    Position = UDim2.fromOffset(0, 61),
    Size = UDim2.new(1, 0, 1, -61),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = PURPLE,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new()
}, content)

make("UIListLayout", {
    Padding = UDim.new(0, 8),
    SortOrder = Enum.SortOrder.LayoutOrder
}, cards)

local function clearCards()
    for _, v in ipairs(cards:GetChildren()) do
        if v:IsA("Frame") then v:Destroy() end
    end
end

local function addCard(name, desc, symbol)
    local c = make("Frame", {
        Size = UDim2.new(1, -5, 0, 72),
        BackgroundColor3 = CARD,
        BorderSizePixel = 0
    }, cards)
    round(c, 10)
    border(c, PURPLE2, 1)

    make("TextLabel", {
        Position = UDim2.fromOffset(10, 8),
        Size = UDim2.fromOffset(35, 45),
        BackgroundTransparency = 1,
        Text = symbol or "✦",
        TextColor3 = PURPLE,
        TextSize = 24,
        Font = Enum.Font.GothamBold
    }, c)

    make("TextLabel", {
        Position = UDim2.fromOffset(50, 10),
        Size = UDim2.new(1, -60, 0, 22),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = WHITE,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, c)

    make("TextLabel", {
        Position = UDim2.fromOffset(50, 32),
        Size = UDim2.new(1, -60, 0, 30),
        BackgroundTransparency = 1,
        Text = desc,
        TextColor3 = GRAY,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left
    }, c)
end

local pageData = {
    Home = {
        {"SYSTEM V5 ONLINE", "Purple God UI loaded successfully", "✦"},
        {"PURPLE GOD THEME", "High performance dark-purple aesthetic", "👑"},
        {"MOBILE ENGINE", "Optimized touch events for Delta executor", "⚡"}
    },
    Player = {
        {"CHARACTER CONTROL", "Movement & physical attributes", "♟"},
        {"WALKSPEED & JUMP", "Customizable values per session", "⚡"}
    },
    Farming = {
        {"FARMING SUITE", "Game specific automation center", "⚒"}
    },
    Combat = {
        {"COMBAT ENGINE", "Player detection & ESP modules", "✧"}
    },
    ["Auto Farm"] = {
        {"AUTOMATION HUB", "Task loop manager", "⟳"}
    },
    Teleport = {
        {"WORLD TELEPORT", "Instant navigation options", "⌖"}
    },
    Misc = {
        {"UTILITIES", "System diagnostics and logs", "✦"}
    },
    Visuals = {
        {"THEME CONTROLLER", "Active purple ambient rendering", "◉"}
    }
}

local tabs = {
    {"Home", "⌂"},
    {"Player", "♟"},
    {"Farming", "⚒"},
    {"Combat", "✧"},
    {"Auto Farm", "⟳"},
    {"Teleport", "⌖"},
    {"Misc", "✦"},
    {"Visuals", "◉"}
}

local function showPage(name)
    title.Text = string.upper(name)
    subtitle.Text = "TOXIC CYBER HUB  •  VIP V5"
    clearCards()

    for _, item in ipairs(pageData[name] or {}) do
        addCard(item[1], item[2], item[3])
    end

    for _, b in ipairs(sidebar:GetChildren()) do
        if b:IsA("TextButton") then
            local selected = b.Name == name
            tween(b, {
                BackgroundColor3 = selected and PURPLE2 or CARD,
                TextColor3 = selected and WHITE or GRAY
            }, 0.2)
        end
    end
end

for i, tab in ipairs(tabs) do
    local b = make("TextButton", {
        Name = tab[1],
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundColor3 = CARD,
        Text = tab[2] .. "  " .. tab[1],
        TextColor3 = GRAY,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
        LayoutOrder = i
    }, sidebar)
    round(b, 8)

    b.Activated:Connect(function()
        showPage(tab[1])
    end)
end

sideLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    sidebar.CanvasSize = UDim2.new(0, 0, 0, sideLayout.AbsoluteContentSize.Y + 14)
end)

-- TOGGLE WINDOW
local opened = true
local function toggleUI()
    opened = not opened
    main.Visible = opened
end

floating.Activated:Connect(toggleUI)
close.Activated:Connect(toggleUI)

-- DRAG SYSTEM
local dragging = false
local dragStart, startPos

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- NEON ANIMATION LOOP
task.spawn(function()
    while gui.Parent and main.Parent do
        local success, _ = pcall(function()
            local t1 = TweenService:Create(mainStroke, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = PURPLE2})
            t1:Play()
            t1.Completed:Wait()

            local t2 = TweenService:Create(mainStroke, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = PURPLE})
            t2:Play()
            t2.Completed:Wait()
        end)
        if not success then break end
    end
end)
