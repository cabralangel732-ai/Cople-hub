--========================================================
-- ☣️ TOXIC CYBER HUB VIP V3 | FULL MOBILE EDITION
--========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
if not player then return end
local playerGui = player:WaitForChild("PlayerGui")

-- Destruir ejecuciones previas
local old = playerGui:FindFirstChild("ToxicCyberHubVIP") or CoreGui:FindFirstChild("ToxicCyberHubVIP")
if old then old:Destroy() end

-- Tabla de Juegos Registrados por ID Numérico (PlaceId)
local GameIDs = {
    ["Saltar por semillas"] = 96995491488865,
    ["Alimentar a un mosquito"] = 0,
    ["Romper y robar un huevo"] = 0,
    ["Pozo de Pelea de Espadas"] = 0
}

print("📌 Juego actual detectado con PlaceId:", game.PlaceId)

-- Colores Neón
local GREEN = Color3.fromRGB(0, 255, 100)
local DARK_BG = Color3.fromRGB(4, 10, 7)
local PANEL_BG = Color3.fromRGB(8, 20, 14)
local CARD_BG = Color3.fromRGB(6, 16, 10)
local WHITE = Color3.fromRGB(240, 240, 240)
local OFF_TOGGLE = Color3.fromRGB(30, 45, 35)

-- Variables de Hacks Activos
local Features = {
    WalkSpeed = 16, WalkSpeedToggle = false,
    JumpPower = 50, JumpPowerToggle = false,
    Noclip = false, InfiniteJump = false,
    KillAura = false, KillAuraRange = 25,
    ESPPlayers = false
}

-- ScreenGui Principal
local gui = Instance.new("ScreenGui")
gui.Name = "ToxicCyberHubVIP"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999

pcall(function() gui.Parent = CoreGui end)
if not gui.Parent then gui.Parent = playerGui end

-- ==========================================
-- BOTÓN FLOTANTE PARA ABRIR / CERRAR
-- ==========================================
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "OpenCloseBtn"
toggleBtn.Size = UDim2.new(0, 48, 0, 48)
toggleBtn.Position = UDim2.new(0, 20, 0.4, 0)
toggleBtn.BackgroundColor3 = DARK_BG
toggleBtn.Text = "☣"
toggleBtn.TextColor3 = GREEN
toggleBtn.TextSize = 28
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Parent = gui

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(1, 0)
btnCorner.Parent = toggleBtn

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = GREEN
btnStroke.Thickness = 2
btnStroke.Parent = toggleBtn

-- Ventana Principal
local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Size = UDim2.new(0, 680, 0, 420)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.BackgroundColor3 = DARK_BG
main.BorderSizePixel = 0
main.Active = true
main.Visible = true
main.Parent = gui

-- Eventos táctiles para abrir/cerrar
toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
toggleBtn.TouchTap:Connect(function()
    main.Visible = not main.Visible
end)

local limit = Instance.new("UISizeConstraint")
limit.MinSize = Vector2.new(520, 350)
limit.MaxSize = Vector2.new(850, 520)
limit.Parent = main

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainOutline = Instance.new("UIStroke")
mainOutline.Color = GREEN
mainOutline.Thickness = 2
mainOutline.Parent = main

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundTransparency = 1
header.Parent = main

local bioIcon = Instance.new("TextLabel")
bioIcon.Size = UDim2.new(0, 40, 0, 40)
bioIcon.Position = UDim2.new(0, 10, 0, 6)
bioIcon.BackgroundTransparency = 1
bioIcon.Text = "☣"
bioIcon.TextColor3 = GREEN
bioIcon.TextSize = 38
bioIcon.Font = Enum.Font.GothamBold
bioIcon.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 320, 0, 24)
title.Position = UDim2.new(0, 52, 0, 8)
title.BackgroundTransparency = 1
title.Text = "TOXIC CYBER HUB VIP V3"
title.TextColor3 = GREEN
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextScaled = true
title.Font = Enum.Font.FredokaOne
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 340, 0, 14)
subtitle.Position = UDim2.new(0, 52, 0, 32)
subtitle.BackgroundTransparency = 1
subtitle.Text = "NEON EDITION | PLACE ID: " .. tostring(game.PlaceId)
subtitle.TextColor3 = WHITE
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextSize = 10
subtitle.Font = Enum.Font.GothamBold
subtitle.Parent = header

local authorTag = Instance.new("TextLabel")
authorTag.Size = UDim2.new(0, 140, 0, 20)
authorTag.Position = UDim2.new(1, -180, 0, 16)
authorTag.BackgroundTransparency = 1
authorTag.Text = "👑 By ToxicCyber"
authorTag.TextColor3 = GREEN
authorTag.TextSize = 12
authorTag.Font = Enum.Font.GothamMedium
authorTag.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -34, 0, 12)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = GREEN
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)
closeBtn.TouchTap:Connect(function()
    main.Visible = false
end)

-- Sidebar
local sidebar = Instance.new("ScrollingFrame")
sidebar.Position = UDim2.new(0, 10, 0, 58)
sidebar.Size = UDim2.new(0, 125, 1, -82)
sidebar.BackgroundColor3 = PANEL_BG
sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 2
sidebar.ScrollBarImageColor3 = GREEN
sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebar.Parent = main

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 8)
sideCorner.Parent = sidebar

local sideStroke = Instance.new("UIStroke")
sideStroke.Color = GREEN
sideStroke.Thickness = 1
sideStroke.Parent = sidebar

local sideList = Instance.new("UIListLayout")
sideList.Padding = UDim.new(0, 4)
sideList.SortOrder = Enum.SortOrder.LayoutOrder
sideList.Parent = sidebar

local sidePad = Instance.new("UIPadding")
sidePad.PaddingTop = UDim.new(0, 5)
sidePad.PaddingLeft = UDim.new(0, 5)
sidePad.PaddingRight = UDim.new(0, 5)
sidePad.Parent = sidebar

-- Contenedor de Páginas
local pageContainer = Instance.new("ScrollingFrame")
pageContainer.Position = UDim2.new(0, 142, 0, 58)
pageContainer.Size = UDim2.new(1, -152, 1, -82)
pageContainer.BackgroundTransparency = 1
pageContainer.BorderSizePixel = 0
pageContainer.ScrollBarThickness = 3
pageContainer.ScrollBarImageColor3 = GREEN
pageContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
pageContainer.Parent = main

-- Footer
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 18)
footer.Position = UDim2.new(0, 0, 1, -20)
footer.BackgroundTransparency = 1
footer.Text = "Toxic Cyber Hub V3   |   Made for the community   |   Enjoy!"
footer.TextColor3 = GREEN
footer.TextSize = 10
footer.Font = Enum.Font.Gotham
footer.Parent = main

-- Creador de Tarjetas
local function createCard(parent, titleText, iconText)
    local card = Instance.new("Frame")
    card.BackgroundColor3 = CARD_BG
    card.BorderSizePixel = 0
    card.Parent = parent

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 8)
    cardCorner.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = GREEN
    cardStroke.Thickness = 1
    cardStroke.Parent = card

    local cardTitle = Instance.new("TextLabel")
    cardTitle.Size = UDim2.new(1, -10, 0, 26)
    cardTitle.Position = UDim2.new(0, 8, 0, 4)
    cardTitle.BackgroundTransparency = 1
    cardTitle.Text = iconText .. "  " .. titleText
    cardTitle.TextColor3 = GREEN
    cardTitle.TextXAlignment = Enum.TextXAlignment.Left
    cardTitle.TextSize = 13
    cardTitle.Font = Enum.Font.GothamBold
    cardTitle.Parent = card

    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 6)
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Parent = card

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 32)
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.PaddingBottom = UDim.new(0, 8)
    pad.Parent = card

    return card
end

-- Creador de Toggles
local function addToggle(card, text, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 24)
    row.BackgroundTransparency = 1
    row.Parent = card

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -42, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = WHITE
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.Parent = row

    local tog = Instance.new("TextButton")
    tog.Size = UDim2.new(0, 34, 0, 16)
    tog.Position = UDim2.new(1, -36, 0.5, -8)
    tog.Text = ""
    tog.BackgroundColor3 = default and GREEN or OFF_TOGGLE
    tog.Parent = row

    local togCorner = Instance.new("UICorner")
    togCorner.CornerRadius = UDim.new(1, 0)
    togCorner.Parent = tog

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = default and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    knob.BackgroundColor3 = WHITE
    knob.Parent = tog

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    local state = default
    local function trigger()
        state = not state
        tog.BackgroundColor3 = state and GREEN or OFF_TOGGLE
        knob.Position = state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        if callback then callback(state) end
    end

    tog.MouseButton1Click:Connect(trigger)
    tog.TouchTap:Connect(trigger)
end

-- Creador de Inputs (WalkSpeed / JumpPower)
local function addInputToggle(card, text, valText, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 24)
    row.BackgroundTransparency = 1
    row.Parent = card

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -85, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = WHITE
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.Parent = row

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 38, 0, 18)
    box.Position = UDim2.new(1, -78, 0.5, -9)
    box.BackgroundColor3 = PANEL_BG
    box.Text = valText
    box.TextColor3 = GREEN
    box.TextSize = 10
    box.Font = Enum.Font.GothamBold
    box.Parent = row

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = box

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = GREEN
    boxStroke.Thickness = 1
    boxStroke.Parent = box

    local tog = Instance.new("TextButton")
    tog.Size = UDim2.new(0, 34, 0, 16)
    tog.Position = UDim2.new(1, -36, 0.5, -8)
    tog.Text = ""
    tog.BackgroundColor3 = default and GREEN or OFF_TOGGLE
    tog.Parent = row

    local togCorner = Instance.new("UICorner")
    togCorner.CornerRadius = UDim.new(1, 0)
    togCorner.Parent = tog

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = default and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    knob.BackgroundColor3 = WHITE
    knob.Parent = tog

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    local state = default
    local function trigger()
        state = not state
        tog.BackgroundColor3 = state and GREEN or OFF_TOGGLE
        knob.Position = state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        if callback then callback(state, tonumber(box.Text) or valText) end
    end

    tog.MouseButton1Click:Connect(trigger)
    tog.TouchTap:Connect(trigger)

    box.FocusLost:Connect(function()
        if callback and state then
            callback(true, tonumber(box.Text) or valText)
        end
    end)
end

-- Botón de Teleport
local function addGameButton(card, gameName, placeId)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.BackgroundColor3 = PANEL_BG
    btn.Text = "🎮 " .. gameName
    btn.TextColor3 = WHITE
    btn.TextSize = 11
    btn.Font = Enum.Font.Gotham
    btn.Parent = card

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = GREEN
    btnStroke.Thickness = 1
    btnStroke.Parent = btn

    local function tp()
        if placeId and placeId ~= 0 then
            pcall(function() TeleportService:Teleport(placeId, player) end)
        else
            warn("Pon el PlaceId real de " .. gameName)
        end
    end

    btn.MouseButton1Click:Connect(tp)
    btn.TouchTap:Connect(tp)
end

-- Lista de Pestañas
local tabs = {
    {name = "Home", icon = "🏠"},
    {name = "Farming", icon = "⚔️"},
    {name = "Combat", icon = "🎯"},
    {name = "Player", icon = "👤"},
    {name = "Teleport", icon = "📍"},
    {name = "Auto Farm", icon = "🐾"},
    {name = "Misc", icon = "💎"},
    {name = "Visuals", icon = "🖌️"}
}

local pages = {}

local function createPage(pageName)
    local p = Instance.new("Frame")
    p.Name = pageName
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.Parent = pageContainer

    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0.485, 0, 0, 160)
    grid.CellPadding = UDim2.new(0.03, 0, 0, 8)
    grid.SortOrder = Enum.SortOrder.LayoutOrder
    grid.Parent = p

    pages[pageName] = p
    return p
end

for _, t in ipairs(tabs) do createPage(t.name) end

-- PÁGINA HOME
local homePage = pages["Home"]

local afCard = createCard(homePage, "Auto Farm", "🎯")
addToggle(afCard, "Auto Farm Level", false, function(s) print("Auto Farm Level:", s) end)
addToggle(afCard, "Auto Farm Fruits", false, function(s) print("Auto Farm Fruits:", s) end)
addToggle(afCard, "Auto Farm Bosses", false, function(s) print("Auto Farm Bosses:", s) end)

local plCard = createCard(homePage, "Player", "👤")
addInputToggle(plCard, "WalkSpeed", "16", false, function(s, val)
    Features.WalkSpeedToggle = s
    Features.WalkSpeed = val or 16
end)
addInputToggle(plCard, "JumpPower", "50", false, function(s, val)
    Features.JumpPowerToggle = s
    Features.JumpPower = val or 50
end)
addToggle(plCard, "No Clip", false, function(s) Features.Noclip = s end)
addToggle(plCard, "Infinite Jump", false, function(s) Features.InfiniteJump = s end)

local cmCard = createCard(homePage, "Combat", "🎯")
addToggle(cmCard, "ESP Players", false, function(s) Features.ESPPlayers = s end)
addToggle(cmCard, "Aimbot", false, function(s) print("Aimbot:", s) end)
addInputToggle(cmCard, "Kill Aura Range", "25", false, function(s, val)
    Features.KillAura = s
    Features.KillAuraRange = val or 25
end)

-- PÁGINA TELEPORT
local tpPage = pages["Teleport"]
local gamesCard = createCard(tpPage, "Multijuego / Teleport", "🎮")
for name, id in pairs(GameIDs) do
    addGameButton(gamesCard, name, id)
end

-- Navegación Lateral
for _, t in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = PANEL_BG
    btn.BackgroundTransparency = 1
    btn.Text = "  " .. t.icon .. "   " .. t.name
    btn.TextColor3 = WHITE
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local function selectTab()
        for pageName, pageFrame in pairs(pages) do
            pageFrame.Visible = (pageName == t.name)
        end
        for _, b in ipairs(sidebar:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundTransparency = 1
                b.TextColor3 = WHITE
            end
        end
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(12, 35, 22)
        btn.TextColor3 = GREEN
    end

    btn.MouseButton1Click:Connect(selectTab)
    btn.TouchTap:Connect(selectTab)

    if t.name == "Home" then
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(12, 35, 22)
        btn.TextColor3 = GREEN
        pages["Home"].Visible = true
    end
end

-- BUCLE PRINCIPAL DE FUNCIONES
RunService.Stepped:Connect(function()
    pcall(function()
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            local humanoid = char.Humanoid
            if Features.WalkSpeedToggle then
                humanoid.WalkSpeed = Features.WalkSpeed
            end
            if Features.JumpPowerToggle then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = Features.JumpPower
            end
            if Features.Noclip then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end)
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Features.InfiniteJump then
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Arrastrar la ventana principal
local dragging, dragStart, startPos
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("TOXIC CYBER HUB VIP V3 CARGADO EXITOSAMENTE")
