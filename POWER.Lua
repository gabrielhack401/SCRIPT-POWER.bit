-- BEM VINDO A POWER.bit SCRIPTS!

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

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

-- Configurações Gerais
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Farm_Dragon_Race = false
getgenv().Auto_Upgrade_Stats = false
getgenv().Auto_Buso = false
getgenv().Auto_Instinto = false
getgenv().Auto_Click = true
getgenv().Auto_Ability = false
getgenv().Auto_Dungeon = false
getgenv().Auto_Train = false

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Lista de Ilhas e Leveis
local islands = {
    {name = "Starter Island", minLevel = 1, maxLevel = 50, position = Vector3.new(0, 0, 0)},
    {name = "Middle Island", minLevel = 51, maxLevel = 120, position = Vector3.new(1000, 0, 1000)},
    {name = "Snow Island", minLevel = 121, maxLevel = 200, position = Vector3.new(2000, 0, 2000)},
    {name = "Sky Island", minLevel = 201, maxLevel = 300, position = Vector3.new(3000, 0, 3000)},
    {name = "Underwater Island", minLevel = 301, maxLevel = 400, position = Vector3.new(4000, 0, 4000)},
    {name = "Dragon Tail Island", minLevel = 401, maxLevel = 500, position = Vector3.new(5000, 0, 5000)},
    {name = "Gas Island", minLevel = 501, maxLevel = 600, position = Vector3.new(6000, 0, 6000)},
    {name = "Final Sea Island", minLevel = 601, maxLevel = 2600, position = Vector3.new(7000, 0, 7000)},
}

-- Função para Teleportar para uma Ilha
local function teleportToIsland(islandName)
    for _, island in ipairs(islands) do
        if island.name == islandName then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(island.position)
            debugMessage("Teletransportando para a ilha: " .. islandName)
            return
        end
    end
    debugMessage("Ilha não encontrada: " .. islandName)
end

-- Funções de Auto Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local currentIsland = getCurrentIsland()
            debugMessage("Farmando em: " .. currentIsland)
            -- Lógica de auto farm...
            wait(2)
        end
    end)
end

-- Funções de Auto Quest
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            -- Lógica de auto quest...
            debugMessage("Aceitando missão automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto Upgrade de Stats
local function autoUpgradeStats()
    spawn(function()
        while getgenv().Auto_Upgrade_Stats do
            -- Lógica de upgrade automático de stats...
            debugMessage("Upgradando stats automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Busoshoku Haki
local function autoBuso()
    spawn(function()
        while getgenv().Auto_Buso do
            -- Lógica de ativação do Busoshoku Haki...
            debugMessage("Ativando Busoshoku Haki...")
            wait(3)
        end
    end)
end

-- Função de Auto Instinto
local function autoInstinto()
    spawn(function()
        while getgenv().Auto_Instinto do
            -- Lógica de ativação do Instinto...
            debugMessage("Ativando Instinto...")
            wait(3)
        end
    end)
end

-- Função de Auto Click
local function autoClick()
    spawn(function()
        while getgenv().Auto_Click do
            -- Lógica de auto click...
            debugMessage("Auto Click ativo!")
            wait(0.1)
        end
    end)
end

-- Função de Auto Ability
local function autoAbility()
    spawn(function()
        while getgenv().Auto_Ability do
            -- Lógica para usar habilidades automaticamente...
            debugMessage("Usando habilidade automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Dungeon
local function autoDungeon()
    spawn(function()
        while getgenv().Auto_Dungeon do
            -- Lógica de auto dungeon...
            debugMessage("Entrando no Dungeon automaticamente...")
            wait(10)
        end
    end)
end

-- Função de Auto Train
local function autoTrain()
    spawn(function()
        while getgenv().Auto_Train do
            -- Lógica de auto treino...
            debugMessage("Treinando automaticamente...")
            wait(5)
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

SettingsSection:NewToggle("Auto Click", "Clique automático", function(state)
    getgenv().Auto_Click = state
    if state then autoClick() end
end)

SettingsSection:NewToggle("Auto Ability", "Usar habilidades automaticamente", function(state)
    getgenv().Auto_Ability = state
    if state then autoAbility() end
end)

SettingsSection:NewToggle("Auto Dungeon", "Entrar no Dungeon automaticamente", function(state)
    getgenv().Auto_Dungeon = state
    if state then autoDungeon() end
end)

SettingsSection:NewToggle("Auto Train", "Treinamento automático", function(state)
    getgenv().Auto_Train = state
    if state then autoTrain() end
end)

-- Menu de Teleporte
TeleportSection:NewButton("Teleporte para Starter Island", "Teleportar para a Ilha Starter", function()
    teleportToIsland("Starter Island")
end)

TeleportSection:NewButton("Teleporte para Snow Island", "Teleportar para a Ilha Snow", function()
    teleportToIsland("Snow Island")
end)

TeleportSection:NewButton("Teleporte para Sky Island", "Teleportar para a Ilha Sky", function()
    teleportToIsland("Sky Island")
end)

TeleportSection:NewButton("Teleporte para Underwater Island", "Teleportar para a Ilha Underwater", function()
    teleportToIsland("Underwater Island")
end)

TeleportSection:NewButton("Teleporte para Dragon Tail Island", "Teleportar para a Ilha Dragon Tail", function()
    teleportToIsland("Dragon Tail Island")
end)

TeleportSection:NewButton("Teleporte para Gas Island", "Teleportar para a Ilha Gas", function()
    teleportToIsland("Gas Island")
end)

TeleportSection:NewButton("Teleporte para Final Sea Island", "Teleportar para a Ilha Final Sea", function()
    teleportToIsland("Final Sea Island")
end)