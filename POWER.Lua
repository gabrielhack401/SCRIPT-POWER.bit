-- Funções Gerais e Configurações do Menu
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Libraries/Kavo-UI-Library/main/KavoUI.lua"))()
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
end

-- Funções para Auto Dojo
local function autoDojo()
    spawn(function()
        while globalOptions.AutoDojo do
            completeDojoQuests()
            wait(5)
        end
    end)
end

-- Funções para Auto Mar
local function autoMar()
    spawn(function()
        while globalOptions.AutoMar do
            participateInSeaEvents()
            wait(5)
        end
    end)
end

-- Funções para Auto CDK/TTK/Soul Guitar/Armas Novas
local function autoCDK()
    spawn(function()
        while globalOptions.AutoCDK do
            collectCDKParts()
            assembleCDK()
            wait(5)
        end
    end)
end

local function autoTTK()
    spawn(function()
        while globalOptions.AutoTTK do
            completeTTKQuests()
            wait(5)
        end
    end)
end

local function autoSoulGuitar()
    spawn(function()
        while globalOptions.AutoSoulGuitar do
            farmSoulEssence()
            craftSoulGuitar()
            wait(5)
        end
    end)
end

local function autoNewWeapon()
    spawn(function()
        while globalOptions.AutoNewWeapon do
            obtainNewWeapon()
            wait(5)
        end
    end)
end

-- Adicionando Opções ao Menu
local FarmingSection = FarmingTab:NewSection("Farming")
FarmingSection:NewToggle("Auto Farm", "Farmar NPCs automaticamente", function(state)
    globalOptions.AutoFarm = state
    if state then farmNPCs() end
end)

FarmingSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    globalOptions.AutoQuest = state
    if state then autoQuest() end
end)

FarmingSection:NewToggle("Auto Dojo", "Completar missões de dojo automaticamente", function(state)
    globalOptions.AutoDojo = state
    if state then autoDojo() end
end)

local EventSection = EventTab:NewSection("Eventos")
EventSection:NewToggle("Auto Mar", "Participar de eventos marítimos automaticamente", function(state)
    globalOptions.AutoMar = state
    if state then autoMar() end
end)

local WeaponSection = WeaponTab:NewSection("Armas e Itens")
WeaponSection:NewToggle("Auto CDK", "Obter CDK automaticamente", function(state)
    globalOptions.AutoCDK = state
    if state then autoCDK() end
end)

WeaponSection:NewToggle("Auto TTK", "Obter TTK automaticamente", function(state)
    globalOptions.AutoTTK = state
    if state then autoTTK() end
end)

WeaponSection:NewToggle("Auto Soul Guitar", "Obter Soul Guitar automaticamente", function(state)
    globalOptions.AutoSoulGuitar = state
    if state then autoSoulGuitar() end
end)

WeaponSection:NewToggle("Auto Nova Arma", "Obter nova arma automaticamente", function(state)
    globalOptions.AutoNewWeapon = state
    if state then autoNewWeapon() end
end)

local SettingsSection = SettingsTab:NewSection("Configurações")
SettingsSection:NewToggle("Auto Buso", "Ativar Buso automaticamente", function(state)
    globalOptions.AutoBuso = state
end)

SettingsSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    globalOptions.AutoObservation = state
end)

SettingsSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    globalOptions.AutoClick = state
end)

-- Função para permitir que o menu seja movível e minimizável
Library.MakeDraggable(Window)

-- Finalização
debugMessage("Script carregado com sucesso!")
