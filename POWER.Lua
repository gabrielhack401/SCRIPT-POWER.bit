-- Configurações Gerais
getgenv().Auto_Farm = true
getgenv().Auto_Quest = true
getgenv().Auto_Dojo = true
getgenv().Farm_Dragon_Race = true
getgenv().Auto_Upgrade_Stats = true
getgenv().Dragon_Fruit_Quest = true
getgenv().Gas_Fruit_Quest = true

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

-- Detectar Ilha Baseada no Nível
local function getCurrentIsland()
    local playerLevel = game.Players.LocalPlayer.Data.Level.Value
    for _, island in ipairs(islands) do
        if playerLevel >= island.minLevel and playerLevel <= island.maxLevel then
            return island.name
        end
    end
    return "Unknown"
end

-- Auto Farm por Ilha
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local currentIsland = getCurrentIsland()
            debugMessage("Farmando em: " .. currentIsland)
            
            -- Localizar inimigos baseados no nível
            for _, enemy in pairs(game.Workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and 
                   enemy:FindFirstChild("Level") and 
                   enemy.Level.Value <= game.Players.LocalPlayer.Data.Level.Value then
                    debugMessage("Atacando inimigo: " .. enemy.Name)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                end
            end
            wait(2)
        end
    end)
end

-- Auto Quest para Missoes de Faixas
local function autoDojoQuest()
    spawn(function()
        while getgenv().Auto_Dojo do
            debugMessage("Completando missões do Dojo...")
            local dojoMaster = game.Workspace:FindFirstChild("DojoMaster")
            if dojoMaster then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dojoMaster.HumanoidRootPart.CFrame
                dojoMaster:FireServer("CompleteMission")
            end
            wait(5)
        end
    end)
end

-- Farmar Raça Dragão
local function farmDragonRace()
    spawn(function()
        while getgenv().Farm_Dragon_Race do
            debugMessage("Farmando Raça Dragão...")
            local dragonTrainer = game.Workspace:FindFirstChild("DragonTrainer")
            if dragonTrainer then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dragonTrainer.HumanoidRootPart.CFrame
                dragonTrainer:FireServer("Train")
            end
            wait(10)
        end
    end)
end

-- Auto Upgrade de Atributos
local function autoUpgradeStats()
    spawn(function()
        while getgenv().Auto_Upgrade_Stats do
            debugMessage("Aumentando atributos automaticamente...")
            local stats = {"Strength", "Defense", "Sword", "Gun"}
            for _, stat in ipairs(stats) do
                game.ReplicatedStorage.UpgradeStat:FireServer(stat, 10)
            end
            wait(3)
        end
    end)
end

-- Missoes de Frutas Dragon e Gas
local function dragonFruitQuest()
    spawn(function()
        while getgenv().Dragon_Fruit_Quest do
            debugMessage("Completar missões da Dragon Fruit...")
            local dragonQuestGiver = game.Workspace:FindFirstChild("DragonQuestGiver")
            if dragonQuestGiver then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dragonQuestGiver.HumanoidRootPart.CFrame
                dragonQuestGiver:FireServer("Complete")
            end
            wait(7)
        end
    end)
end

local function gasFruitQuest()
    spawn(function()
        while getgenv().Gas_Fruit_Quest do
            debugMessage("Completar missões da Gas Fruit...")
            local gasQuestGiver = game.Workspace:FindFirstChild("GasQuestGiver")
            if gasQuestGiver then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gasQuestGiver.HumanoidRootPart.CFrame
                gasQuestGiver:FireServer("Complete")
            end
            wait(7)
        end
    end)
end

-- Inicialização do Script
local function initializeScript()
    debugMessage("Inicializando script com as funções atualizadas...")
    autoFarm()
    autoDojoQuest()
    farmDragonRace()
    autoUpgradeStats()
    dragonFruitQuest()
    gasFruitQuest()
    debugMessage("Script ativado com sucesso!")
end

initializeScript()
