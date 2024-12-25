-- Criando a interface GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar um botão
local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton")
    button.Parent = screenGui
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24

    button.MouseButton1Click:Connect(callback)

    return button
end

-- Função para criar uma label
local function createLabel(text, position, size)
    local label = Instance.new("TextLabel")
    label.Parent = screenGui
    label.Text = text
    label.Position = position
    label.Size = size
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 30
    return label
end

-- Configurações globais
globalOptions = {
    AutoFarm = false,
    AutoQuest = false,
    AutoDojo = false,
    AutoFruitCollect = false,
    AutoHakiFruitCollect = false,
    AutoChestCollect = false,
    AutoKillBoss = false,
    VidaInf = false,
    StaminaInf = false,
    HakiObservacaoInf = false,
}

-- Funções de utilidade
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

-- Funções de combate
local function findAndKillBoss()
    spawn(function()
        while globalOptions.AutoKillBoss do
            for _, boss in pairs(game.Workspace:GetChildren()) do
                if boss:IsA("Model") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()

                    -- Mover-se até o boss
                    character:MoveTo(boss.HumanoidRootPart.Position)

                    -- Simular ataque
                    local tool = character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    else
                        print("Nenhuma ferramenta encontrada para atacar.")
                    end
                    print("Atacando o boss: " .. boss.Name)
                end
            end
            wait(1) -- Intervalo entre ataques
        end
    end)
end

-- Função para coletar frutas
local function collectFruits()
    spawn(function()
        while globalOptions.AutoFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta coletada: " .. fruit.Name)
                end
            end
            wait(1)
        end
    end)
end

-- Função para coletar frutas de Haki
local function collectHakiFruits()
    spawn(function()
        while globalOptions.AutoHakiFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and isHakiFruit(fruit) and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta de Haki coletada: " .. fruit.Name)
                end
            end
            wait(1)
-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")

-- Tabs do Menu
local FarmingTab = Window:NewTab("Farming")
local EventTab = Window:NewTab("Eventos")
local WeaponTab = Window:NewTab("Armas")
local SettingsTab = Window:NewTab("Configurações")

-- Variáveis Globais
globalOptions = {
    AutoFarm = false,
    AutoQuest = false,
    AutoDojo = false,
    AutoMar = false,
    AutoCDK = false,
    AutoTTK = false,
    AutoSoulGuitar = false,
    AutoNewWeapon = false,
    AutoObservation = false,
    AutoBuso = false,
    AutoClick = false,
}

-- Funções Gerais
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Função para mover o jogador até um NPC
local function moveToNPC(npc)
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character and npc then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = npc.CFrame + Vector3.new(0, 10, 0) -- Voa acima do NPC
        end
    end
end

-- Função para atacar NPC
local function attackNPC(npc)
    if globalOptions.AutoClick then
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and npc then
            tool:Activate()
        end
    end
end

-- Função de Farmar NPCs com base no nível do jogador
local function farmNPCs()
    spawn(function()
        while globalOptions.AutoFarm do
            local player = game.Players.LocalPlayer
            local level = player.Data.Level.Value
            local currentIsland = getIslandByLevel(level)

            if currentIsland then
                moveToIsland(currentIsland)
                local npc = findEnemyOnIsland(currentIsland, level)
                if npc then
                    moveToNPC(npc)
                    attackNPC(npc)
                end
            end

            wait(1)
        end
    end)
end

-- Função de Auto Quest
local function autoQuest()
    spawn(function()
        while globalOptions.AutoQuest do
            local player = game.Players.LocalPlayer
            local level = player.Data.Level.Value
            local quest = getQuestByLevel(level)

            if quest then
                acceptQuest(quest)
                completeQuest(quest)
            end

            wait(1)
        end
    end)
-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

-- Configurações Gerais
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Farm_Dragon_Race = false
getgenv().Auto_Upgrade_Stats = false
getgenv().Auto_Buso = false
getgenv().Auto_Instinto = false
getgenv().Auto_Click = true

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Lista de Ilhas e Leveis
local islands = {
    {name = "Starter Island", minLevel = 1, maxLevel = 50},
    {name = "Middle Island", minLevel = 51, maxLevel = 120},
    {name = "Snow Island", minLevel = 121, maxLevel = 200},
    {name = "Sky Island", minLevel = 201, maxLevel = 300},
    {name = "Underwater Island", minLevel = 301, maxLevel = 400},
    {name = "Dragon Tail Island", minLevel = 401, maxLevel = 500},
    {name = "Gas Island", minLevel = 501, maxLevel = 600},
    {name = "Final Sea Island", minLevel = 601, maxLevel = 2600},
}

-- Detectar Ilha Baseada no Nível do Jogador
local function getCurrentIsland()
    local playerLevel = game.Players.LocalPlayer.Data.Level.Value
    for _, island in ipairs(islands) do
        if playerLevel >= island.minLevel and playerLevel <= island.maxLevel then
            return island.name
        end
    end
    return "Unknown"
end

-- Função de Auto Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local currentIsland = getCurrentIsland()
            debugMessage("Farmando em: " .. currentIsland)

            -- Localiza NPCs e ataca automaticamente
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
                    if enemy.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)
                        wait(0.2)
                        debugMessage("Atacando inimigo: " .. enemy.Name)
                    end
                end
            end
            wait(2)
        end
    end)
end

-- Função de Auto Quest
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            local questGiver = game.Workspace:FindFirstChild("QuestGiver")
            if questGiver then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questGiver.HumanoidRootPart.CFrame
                wait(1)
                questGiver:FireServer("AcceptQuest")
                debugMessage("Aceitando Quest...")
            end
            wait(5)
        end
    end)
end

-- Função para Auto Busoshoku Haki
local function autoBuso()
    spawn(function()
        while getgenv().Auto_Buso do
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("Busoshoku") == nil then
                game.ReplicatedStorage.Events.Haki:FireServer("Busoshoku")
                debugMessage("Ativando Busoshoku Haki...")
            end
            wait(3)
        end
    end)
end

-- Função para Auto Instinto
local function autoInstinto()
    spawn(function()
        while getgenv().Auto_Instinto do
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("Instinto") == nil then
                game.ReplicatedStorage.Events.Haki:FireServer("Instinto")
                debugMessage("Ativando Instinto...")
            end
            wait(3)
        end
    end)
end

-- Função de Auto Click
local function autoClick()
    spawn(function()
        while getgenv().Auto_Click do
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
            debugMessage("Auto Click ativo!")
            wait(0.1)
        end
    end)
end

-- Ativando Funções com o Menu
FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
    if state then autoFarm() end
end)

FarmSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

FarmSection:NewToggle("Farm Dragon Race", "Farmar para raça Dragão", function(state)
    getgenv().Farm_Dragon_Race = state
    if state then farmDragonRace() end
end)

StatsSection:NewToggle("Auto Upgrade Stats", "Melhorar atributos automaticamente", function(state)
    getgenv().Auto_Upgrade_Stats = state
    if state then autoUpgradeStats() end
end)

SettingsSection:NewToggle("Auto Buso", "Ativar Busoshoku Haki automaticamente", function(state)
    getgenv().Auto_Buso = state
    if state then autoBuso() end
end)

SettingsSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    getgenv().Auto_Instinto = state
    if state then autoInstinto() end
end)

SettingsSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    getgenv().Auto_Click = state
    if state then autoClick() end
end)

debugMessage("Script e menu inicializados com sucesso!")
