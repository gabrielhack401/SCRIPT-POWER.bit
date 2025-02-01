-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")

print("BEM VINDO A POWER.bit SCRIPTS!")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

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
getgenv().Auto_Ability = false
getgenv().Auto_Dungeon = false
getgenv().Auto_Train = false
getgenv().Infinite_Life = false
getgenv().Infinite_Stamina = false
getgenv().Track_Berrys = false
getgenv().Kitsune_Raid_Law = false
getgenv().Auto_XeroHub = false
getgenv().Auto_RedzHub = false

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Lista de Ilhas (exemplo simplificado; adicione as demais conforme necessário)
local islands = {
    {name = "Starter Island", position = Vector3.new(0, 0, 0)},
    {name = "Snow Island", position = Vector3.new(2000, 0, 2000)},
    {name = "Middle Island", position = Vector3.new(1000, 0, 1000)},
    {name = "Sky Island", position = Vector3.new(3000, 0, 3000)},
    {name = "Underwater Island", position = Vector3.new(4000, 0, 4000)},
    {name = "Dragon Tail Island", position = Vector3.new(5000, 0, 5000)},
    {name = "Gas Island", position = Vector3.new(6000, 0, 6000)},
    {name = "Final Sea Island", position = Vector3.new(7000, 0, 7000)},
}

local function getCurrentIsland()
    local playerLevel = game.Players.LocalPlayer.Data.Level.Value
    -- Aqui você pode adicionar lógica para determinar a ilha com base no nível
    for _, island in ipairs(islands) do
        if playerLevel >= 1 and playerLevel <= 2600 then
            return island.name
        end
    end
    return "Unknown"
end

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

-- Funções de Auto Farm e Auto Quest (exemplos simplificados)
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local currentIsland = getCurrentIsland()
            debugMessage("Farmando em: " .. currentIsland)
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0,15,0)
                    wait(0.2)
                    debugMessage("Atacando inimigo: " .. enemy.Name)
                end
            end
            wait(2)
        end
    end)
end

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

local function farmDragonRace()
    spawn(function()
        while getgenv().Farm_Dragon_Race do
            debugMessage("Farmando para raça Dragão...")
            wait(2)
        end
    end)
end

local function autoUpgradeStats()
    spawn(function()
        while getgenv().Auto_Upgrade_Stats do
            debugMessage("Upgradando stats automaticamente...")
            game.ReplicatedStorage.UpgradeStat:FireServer("Strength", 5)
            game.ReplicatedStorage.UpgradeStat:FireServer("Defense", 5)
            game.ReplicatedStorage.UpgradeStat:FireServer("Sword", 5)
            game.ReplicatedStorage.UpgradeStat:FireServer("Gun", 5)
            wait(3)
        end
    end)
end

local function autoBuso()
    spawn(function()
        while getgenv().Auto_Buso do
            local character = game.Players.LocalPlayer.Character
            if character and not character:FindFirstChild("Busoshoku") then
                game.ReplicatedStorage.Events.Haki:FireServer("Busoshoku")
                debugMessage("Ativando Busoshoku Haki...")
            end
            wait(3)
        end
    end)
end

local function autoInstinto()
    spawn(function()
        while getgenv().Auto_Instinto do
            local character = game.Players.LocalPlayer.Character
            if character and not character:FindFirstChild("Instinto") then
                game.ReplicatedStorage.Events.Haki:FireServer("Instinto")
                debugMessage("Ativando Instinto...")
            end
            wait(3)
        end
    end)
end

local function autoClick()
    spawn(function()
        while getgenv().Auto_Click do
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game,1)
            debugMessage("Auto Click ativo!")
            wait(0.1)
        end
    end)
end

local function autoAbility()
    spawn(function()
        while getgenv().Auto_Ability do
            debugMessage("Usando habilidade automaticamente...")
            game.ReplicatedStorage.UseAbility:FireServer()
            wait(2)
        end
    end)
end

local function autoDungeon()
    spawn(function()
        while getgenv().Auto_Dungeon do
            debugMessage("Entrando no Dungeon automaticamente...")
            game.ReplicatedStorage.EnterDungeon:FireServer()
            wait(10)
        end
    end)
end

local function autoTrain()
    spawn(function()
        while getgenv().Auto_Train do
            debugMessage("Treinando automaticamente...")
            game.ReplicatedStorage.Train:FireServer()
            wait(5)
        end
    end)
end

local function enableInfiniteLife()
    spawn(function()
        while getgenv().Infinite_Life do
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = math.huge
                debugMessage("Vida infinita ativada.")
            end
            wait(1)
        end
    end)
end

local function enableInfiniteStamina()
    spawn(function()
        while getgenv().Infinite_Stamina do
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Energy") then
                player.Character.Energy.Value = math.huge
                debugMessage("Stamina infinita ativada.")
            end
            wait(1)
        end
    end)
end

local function trackBerrys()
    spawn(function()
        while getgenv().Track_Berrys do
            for _, berry in pairs(workspace:GetChildren()) do
                if berry:IsA("Part") and berry.Name == "Berry" then
                    debugMessage("Berry encontrada em: " .. tostring(berry.Position))
                end
            end
            wait(5)
        end
    end)
end

local function updateCompass()
    spawn(function()
        while true do
            local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local nearestBerry = nil
            local minDist = math.huge
            for _, berry in pairs(workspace:GetChildren()) do
                if berry:IsA("Part") and berry.Name == "Berry" then
                    local dist = (berry.Position - playerPos).magnitude
                    if dist < minDist then
                        minDist = dist
                        nearestBerry = berry
                    end
                end
            end
            if nearestBerry then
                local direction = (nearestBerry.Position - playerPos).unit
                debugMessage("Bússola: Direção para o Berry: " .. tostring(direction))
            end
            wait(2)
        end
    end)
end

local function autoKitsuneRaidLaw()
    spawn(function()
        while getgenv().Kitsune_Raid_Law do
            local lawPortal = workspace:FindFirstChild("LawPortal")
            if lawPortal then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lawPortal.CFrame
                debugMessage("Iniciando Kitsune Raid Law...")
                game.ReplicatedStorage.Events.Raid:FireServer("Start", "Law")
            end
            wait(10)
        end
    end)
end

local function autoXeroHub()
    spawn(function()
        while getgenv().Auto_XeroHub do
            debugMessage("Executando funções do Xero Hub...")
            wait(5)
        end
    end)
end

local function autoRedzHub()
    spawn(function()
        while getgenv().Auto_RedzHub do
            debugMessage("Executando funções do Redz Hub...")
            wait(5)
        end
    end)
end

-- Integração com o Menu
FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
    if state then spawn(autoFarm) end
end)

FarmSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then spawn(autoQuest) end
end)

FarmSection:NewToggle("Farm Dragon Race", "Farmar para raça Dragão", function(state)
    getgenv().Farm_Dragon_Race = state
    if state then spawn(farmDragonRace) end
end)

StatsSection:NewToggle("Auto Upgrade Stats", "Melhorar atributos automaticamente", function(state)
    getgenv().Auto_Upgrade_Stats = state
    if state then spawn(autoUpgradeStats) end
end)

SettingsSection:NewToggle("Auto Buso", "Ativar Busoshoku Haki automaticamente", function(state)
    getgenv().Auto_Buso = state
    if state then spawn(autoBuso) end
end)

SettingsSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    getgenv().Auto_Instinto = state
    if state then spawn(autoInstinto) end
end)

SettingsSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    getgenv().Auto_Click = state
    if state then spawn(autoClick) end
end)

SettingsSection:NewToggle("Auto Ability", "Usar habilidades automaticamente", function(state)
    getgenv().Auto_Ability = state
    if state then spawn(autoAbility) end
end)

SettingsSection:NewToggle("Auto Dungeon", "Entrar no Dungeon automaticamente", function(state)
    getgenv().Auto_Dungeon = state
    if state then spawn(autoDungeon) end
end)

SettingsSection:NewToggle("Auto Train", "Treinar automaticamente", function(state)
    getgenv().Auto_Train = state
    if state then spawn(autoTrain) end
end)

SettingsSection:NewToggle("Vida Infinita", "Ativar vida infinita", function(state)
    getgenv().Infinite_Life = state
    if state then spawn(enableInfiniteLife) end
end)

SettingsSection:NewToggle("Stamina Infinita", "Ativar stamina infinita", function(state)
    getgenv().Infinite_Stamina = state
    if state then spawn(enableInfiniteStamina) end
end)

SettingsSection:NewToggle("Track Berrys", "Mostrar localização das Berrys em tempo real", function(state)
    getgenv().Track_Berrys = state
    if state then spawn(trackBerrys) spawn(updateCompass) end
end)

SettingsSection:NewToggle("Kitsune Raid Law", "Ativar Kitsune Raid Law (Second Sea)", function(state)
    getgenv().Kitsune_Raid_Law = state
    if state then spawn(autoKitsuneRaidLaw) end
end)

SettingsSection:NewToggle("Auto Xero Hub", "Executar funções do Xero Hub", function(state)
    getgenv().Auto_XeroHub = state
    if state then spawn(autoXeroHub) end
end)

SettingsSection:NewToggle("Auto Redz Hub", "Executar funções do Redz Hub", function(state)
    getgenv().Auto_RedzHub = state
    if state then spawn(autoRedzHub) end
end)

-- Adicionando Teleporte no Menu
TeleportSection:NewButton("Teleporte para Starter Island", "Teleportar para a Ilha Starter", function()
    teleportToIsland("Starter Island")
end)

TeleportSection:NewButton("Teleporte para Snow Island", "Teleportar para a Ilha Snow", function()
    teleportToIsland("Snow Island")
end)

-- Adicionando mais ilhas ao menu de teleporte
TeleportSection:NewButton("Teleporte para Middle Island", "Teleportar para a Ilha Middle", function()
    teleportToIsland("Middle Island")
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

debugMessage("Script e menu inicializados com sucesso!")
