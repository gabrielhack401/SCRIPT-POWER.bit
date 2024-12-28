-- BEM VINDO A POWER.bit SCRIPTS!

-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Script - Sea 3", "DarkTheme")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

local NewFeaturesTab = Window:NewTab("New Features")
local NewFeaturesSection = NewFeaturesTab:NewSection("New Update Features")

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
getgenv().Auto_Collect_Grifts = false
getgenv().Auto_Collect_Cards = false
getgenv().Auto_Get_New_Sword = false
getgenv().Auto_Get_Dragon_Race = false
getgenv().Farm_Red_Flames = false
getgenv().Auto_Get_Weapon_History = false

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Função de Coletar Grifts
local function collectGrifts()
    spawn(function()
        while getgenv().Auto_Collect_Grifts do
            -- Lógica para coletar todos os Grifts (fazer a verificação de locais de spawn de Grifts)
            debugMessage("Coletando Grifts...")
            -- Aqui você adiciona a lógica de como pegar os Grifts no Sea 3
            wait(2)
        end
    end)
end

-- Função de Coletar Cards
local function collectCards()
    spawn(function()
        while getgenv().Auto_Collect_Cards do
            -- Lógica para coletar todos os Cards (fazer a verificação de locais de spawn de Cards)
            debugMessage("Coletando Cards...")
            -- Aqui você adiciona a lógica de como pegar os Cards no Sea 3
            wait(2)
        end
    end)
end

-- Função para Obter a História da Nova Arma
local function getWeaponHistory()
    spawn(function()
        while getgenv().Auto_Get_Weapon_History do
            -- Lógica para obter a história da nova arma
            debugMessage("Pegando a história da nova arma...")
            -- Adicionar lógica para obter a história da arma
            wait(3)
        end
    end)
end

-- Função para Obter a Nova Espada
local function getNewSword()
    spawn(function()
        while getgenv().Auto_Get_New_Sword do
            -- Lógica para obter a nova espada
            debugMessage("Pegando a nova espada...")
            -- Adicionar lógica para pegar a nova espada
            wait(3)
        end
    end)
end

-- Função para Obter Raça Dragão em Todas as Faixas
local function getDragonRace()
    spawn(function()
        while getgenv().Auto_Get_Dragon_Race do
            -- Lógica para pegar a raça dragão em todas as faixas
            debugMessage("Pegando a raça Dragão...")
            -- Adicionar lógica para pegar a raça Dragão
            wait(4)
        end
    end)
end

-- Função de Farmar Chamas Vermelhas
local function farmRedFlames()
    spawn(function()
        while getgenv().Farm_Red_Flames do
            -- Lógica para farmar chamas vermelhas
            debugMessage("Farmando chamas vermelhas...")
            -- Aqui você adiciona a lógica de como farmar chamas vermelhas
            wait(5)
        end
    end)
end

-- Função de Auto Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local currentIsland = getCurrentIsland()
            debugMessage("Farmando em: " .. currentIsland)
            -- Lógica de auto farm adaptada para o Sea 3...
            wait(2)
        end
    end)
end

-- Funções de Auto Quest
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            -- Lógica de auto quest para Sea 3...
            debugMessage("Aceitando missão automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto Upgrade de Stats
local function autoUpgradeStats()
    spawn(function()
        while getgenv().Auto_Upgrade_Stats do
            -- Lógica de upgrade automático de stats para Sea 3...
            debugMessage("Upgradando stats automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Busoshoku Haki
local function autoBuso()
    spawn(function()
        while getgenv().Auto_Buso do
            -- Lógica de ativação do Busoshoku Haki no Sea 3...
            debugMessage("Ativando Busoshoku Haki...")
            wait(3)
        end
    end)
end

-- Função de Auto Instinto
local function autoInstinto()
    spawn(function()
        while getgenv().Auto_Instinto do
            -- Lógica de ativação do Instinto no Sea 3...
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
            -- Lógica para usar habilidades automaticamente no Sea 3...
            debugMessage("Usando habilidade automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Dungeon
local function autoDungeon()
    spawn(function()
        while getgenv().Auto_Dungeon do
            -- Lógica de auto dungeon para Sea 3...
            debugMessage("Entrando no Dungeon automaticamente...")
            wait(10)
        end
    end)
end

-- Função de Auto Train
local function autoTrain()
    spawn(function()
        while getgenv().Auto_Train do
            -- Lógica de auto treino para Sea 3...
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

NewFeaturesSection:NewToggle("Coletar Grifts", "Coletar todos os Grifts automaticamente", function(state)
    getgenv().Auto_Collect_Grifts = state
    if state then collectGrifts() end
end)

NewFeaturesSection:NewToggle("Coletar Cards", "Coletar todos os Cards automaticamente", function(state)
    getgenv().Auto_Collect_Cards = state
    if state then collectCards() end
end)

NewFeaturesSection:NewToggle("Pegar História da Nova Arma", "Obter a história da nova arma", function(state)
    getgenv().Auto_Get_Weapon_History = state
    if state then getWeaponHistory() end
end)

NewFeaturesSection:NewToggle("Pegar Nova Espada", "Pegar a nova espada automaticamente", function(state)
    getgenv().Auto_Get_New_Sword = state
    if state then getNewSword() end
end)

NewFeaturesSection:NewToggle("Pegar Raça Dragão", "Pegar a raça Dragão em todas as faixas", function(state)
    getgenv().Auto_Get_Dragon_Race = state
    if state then getDragonRace() end
end)

NewFeaturesSection:NewToggle("Farmar Chamas Vermelhas", "Farmar chamas vermelhas automaticamente", function(state)
    getgenv().Farm_Red_Flames = state
    if state then farmRedFlames() end
end)

-- Menu de Teleporte para Sea 3
TeleportSection:NewButton("Teleporte para Phoenix Island", "Teleportar para Phoenix Island (Sea 3)", function()
    teleportToIsland("Sea 3: Phoenix Island")
end)

TeleportSection:NewButton("Teleporte para Volcano Island", "Teleportar para Volcano Island (Sea 3)", function()
    teleportToIsland("Sea 3: Volcano Island")
end)

TeleportSection:NewButton("Teleporte para Ghost Ship Island", "Teleportar para Ghost Ship Island (Sea 3)", function()
    teleportToIsland("Sea 3: Ghost Ship Island")
end)

TeleportSection:NewButton("Teleporte para Final Sea Island", "Teleportar para Final Sea Island", function()
    teleportToIsland("Final Sea Island")
end)

TeleportSection:NewButton("Teleporte para Gas Island", "Teleportar para Gas Island", function()
    teleportToIsland("Gas Island")
end)

TeleportSection:NewButton("Teleporte para Dragon Tail Island", "Teleportar para Dragon Tail Island", function()
    teleportToIsland("Dragon Tail Island")
end)