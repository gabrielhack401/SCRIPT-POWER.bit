-- Configurações Gerais
getgenv().Auto_Farm = true
getgenv().Auto_Quest = true
getgenv().Farm_Dragon_Race = true
getgenv().Auto_Upgrade_Stats = true

-- Função para imprimir mensagens de depuração
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

            -- Encontrar e atacar inimigos na ilha atual
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
                    if enemy.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                        wait(0.5)
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

-- Farmar Raça Dragão
local function farmDragonRace()
    spawn(function()
        while getgenv().Farm_Dragon_Race do
            local dragonTrainer = game.Workspace:FindFirstChild("DragonTrainer")
            if dragonTrainer then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dragonTrainer.HumanoidRootPart.CFrame
                dragonTrainer:FireServer("Train")
                debugMessage("Treinando Raça Dragão...")
            end
            wait(10)
        end
    end)
end

-- Auto Upgrade de Atributos
local function autoUpgradeStats()
    spawn(function()
        while getgenv().Auto_Upgrade_Stats do
            local stats = {"Melee", "Defense", "Sword", "Gun"}
            for _, stat in ipairs(stats) do
                game.ReplicatedStorage.UpgradeStat:FireServer(stat, 5)
                debugMessage("Aumentando: " .. stat)
            end
            wait(3)
        end
    end)
end

-- Inicializar Script
local function initializeScript()
    debugMessage("Inicializando script com funções principais...")
    autoFarm()
    autoQuest()
    farmDragonRace()
    autoUpgradeStats()
    debugMessage("Script ativo!")
end

initializeScript()
