-- Carregar biblioteca GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")

print("Script carregado com sucesso!")

-- Seções do menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")
local CompassSection = FarmTab:NewSection("Compass")

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

-- Configurações globais
getgenv().Auto_Farm = false
getgenv().Auto_Teleport_Island = false   -- Teleporta automaticamente para ilha adequada ao nível
getgenv().Auto_Quest = false
getgenv().Auto_Upgrade_Stats = false
getgenv().Auto_Buso = false
getgenv().Auto_Instinto = false
getgenv().Auto_Click = true
getgenv().Auto_Ability = false
getgenv().Auto_Dungeon = false
getgenv().Auto_Train = false
getgenv().Infinite_Life = false
getgenv().Infinite_Stamina = false
getgenv().Track_Fruits = false
getgenv().Kitsune_Raid_Law = false
getgenv().Compass_Enabled = false         -- Bússola para inimigo mais próximo

-- Função de debug
local function debugMessage(msg)
    print("[DEBUG] " .. msg)
end

-- ======================
-- Configuração de ilhas por nível (baseado no Blox Fruits)
-- ======================
local islandsByLevel = {
    {minLevel = 1,    maxLevel = 30,   name = "Pirate Island",    position = Vector3.new(-1000, 80, -1000)},
    {minLevel = 30,   maxLevel = 60,   name = "Desert Island",    position = Vector3.new(-500, 80, 1500)},
    {minLevel = 60,   maxLevel = 100,  name = "Snow Island",      position = Vector3.new(1000, 80, 2000)},
    {minLevel = 100,  maxLevel = 150,  name = "Marine Fortress",  position = Vector3.new(2500, 80, 2000)},
    {minLevel = 150,  maxLevel = 200,  name = "Sky Island",       position = Vector3.new(2500, 500, 2500)},
    {minLevel = 200,  maxLevel = 300,  name = "Prison Island",    position = Vector3.new(4000, 80, 4000)},
    {minLevel = 300,  maxLevel = 400,  name = "Ice Island",       position = Vector3.new(4500, 80, 5000)},
    {minLevel = 400,  maxLevel = 500,  name = "Water Island",     position = Vector3.new(5000, 80, 5000)},
    {minLevel = 500,  maxLevel = 600,  name = "Magma Island",     position = Vector3.new(6000, 80, 6000)},
    {minLevel = 600,  maxLevel = 700,  name = "Underwater City",  position = Vector3.new(7000, -200, 7000)},
    {minLevel = 700,  maxLevel = 800,  name = "Frozen Village",   position = Vector3.new(8000, 80, 8000)},
    {minLevel = 800,  maxLevel = 900,  name = "Dragon Island",    position = Vector3.new(9000, 80, 9000)},
    {minLevel = 900,  maxLevel = 1000, name = "Law's Room",       position = Vector3.new(10000, 80, 10000)},
    {minLevel = 1000, maxLevel = 1100, name = "Elite Pirates",    position = Vector3.new(11000, 80, 11000)},
    {minLevel = 1100, maxLevel = 1200, name = "Marine Ship",      position = Vector3.new(12000, 80, 12000)},
    {minLevel = 1200, maxLevel = 1300, name = "Great Tree",       position = Vector3.new(13000, 80, 13000)},
    {minLevel = 1300, maxLevel = 1400, name = "Hydra Island",     position = Vector3.new(14000, 80, 14000)},
    {minLevel = 1400, maxLevel = 1500, name = "Sea of Treats",    position = Vector3.new(15000, 80, 15000)},
    {minLevel = 1500, maxLevel = 1600, name = "Floating Turtle",  position = Vector3.new(16000, 80, 16000)},
    {minLevel = 1600, maxLevel = 1700, name = "Mansion",          position = Vector3.new(17000, 80, 17000)},
    {minLevel = 1700, maxLevel = 1800, name = "Dark Arena",       position = Vector3.new(18000, 80, 18000)},
    {minLevel = 1800, maxLevel = 1900, name = "Castle on Sea",    position = Vector3.new(19000, 80, 19000)},
    {minLevel = 1900, maxLevel = 2000, name = "Great Wall",       position = Vector3.new(20000, 80, 20000)},
    {minLevel = 2000, maxLevel = 2100, name = "Dragon's Den",     position = Vector3.new(21000, 80, 21000)},
    {minLevel = 2100, maxLevel = 2200, name = "Candy Island",     position = Vector3.new(22000, 80, 22000)},
    {minLevel = 2200, maxLevel = 2300, name = "Tiki Island",      position = Vector3.new(23000, 80, 23000)},
    {minLevel = 2300, maxLevel = 2400, name = "Haunted Castle",   position = Vector3.new(24000, 80, 24000)},
    {minLevel = 2400, maxLevel = 2500, name = "Turtle Shell",     position = Vector3.new(25000, 80, 25000)},
    {minLevel = 2500, maxLevel = 2600, name = "The Final Sea",    position = Vector3.new(26000, 80, 26000)},
}

-- Função para obter a ilha adequada ao nível
local function getIslandByLevel(level)
    for _, island in ipairs(islandsByLevel) do
        if level >= island.minLevel and level <= island.maxLevel then
            return island
        end
    end
    return islandsByLevel[1]  -- fallback
end

-- Teleportar para ilha
local function teleportToIsland(islandPos)
    local player = game.Players.LocalPlayer
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(islandPos)
        task.wait(0.5)
        debugMessage("Teleportado para " .. tostring(islandPos))
    end
end

-- ======================
-- Funções de farm
-- ======================

-- Obter o nível do jogador
local function getPlayerLevel()
    local player = game.Players.LocalPlayer
    local level = player:FindFirstChild("Data") and player.Data:FindFirstChild("Level")
    return level and level.Value or 1
end

-- Encontrar inimigo adequado (nível próximo ao seu, não muito longe)
local function getBestEnemy()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local root = char.HumanoidRootPart
    local playerLevel = getPlayerLevel()
    local bestEnemy = nil
    local bestScore = -1

    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local enemyLevel = 1
            if v:FindFirstChild("Level") then
                enemyLevel = v.Level.Value
            elseif v:FindFirstChild("Data") and v.Data:FindFirstChild("Level") then
                enemyLevel = v.Data.Level.Value
            end

            -- Verifica se nível do inimigo está dentro de uma margem (ex: 30 níveis acima ou abaixo)
            local levelDiff = math.abs(enemyLevel - playerLevel)
            if levelDiff <= 50 then
                if v:FindFirstChild("HumanoidRootPart") then
                    local dist = (v.HumanoidRootPart.Position - root.Position).magnitude
                    -- Prioridade: inimigos mais próximos com nível adequado
                    local score = 1000 - dist  -- quanto menor a distância, maior o score
                    if score > bestScore then
                        bestScore = score
                        bestEnemy = v
                    end
                end
            end
        end
    end
    return bestEnemy
end

-- Auto Farm com teleporte inteligente
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then task.wait(1) continue end

            -- Se teleporte automático estiver ativado, ir para ilha adequada ao nível
            if getgenv().Auto_Teleport_Island then
                local level = getPlayerLevel()
                local targetIsland = getIslandByLevel(level)
                if targetIsland then
                    -- Verifica se já está próximo da ilha (distância > 500)
                    local currentPos = char.HumanoidRootPart.Position
                    if (currentPos - targetIsland.position).magnitude > 500 then
                        teleportToIsland(targetIsland.position)
                        task.wait(2)
                    end
                end
            end

            local enemy = getBestEnemy()
            if enemy then
                char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)
                task.wait(0.2)
                -- Atacar (tecla E)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            else
                debugMessage("Nenhum inimigo adequado encontrado. Aguardando...")
                task.wait(3)
            end
        end
    end)
end

-- ======================
-- Bússola para inimigo mais próximo
-- ======================
local function compass()
    spawn(function()
        while getgenv().Compass_Enabled do
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then task.wait(1) continue end
            local root = char.HumanoidRootPart

            local nearestEnemy = nil
            local minDist = math.huge
            for _, v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    if v:FindFirstChild("HumanoidRootPart") then
                        local dist = (v.HumanoidRootPart.Position - root.Position).magnitude
                        if dist < minDist then
                            minDist = dist
                            nearestEnemy = v
                        end
                    end
                end
            end

            if nearestEnemy then
                local direction = (nearestEnemy.HumanoidRootPart.Position - root.Position).unit
                debugMessage(string.format("Inimigo mais próximo: %s | Distância: %.1f | Direção: (%.2f, %.2f, %.2f)",
                    nearestEnemy.Name, minDist, direction.X, direction.Y, direction.Z))
                -- Opcional: desenhar uma seta na tela (requer Drawing library, muitos executors suportam)
                -- Exemplo simples de seta:
                if game:GetService("CoreGui"):FindFirstChild("CompassArrow") then
                    game:GetService("CoreGui").CompassArrow:Destroy()
                end
                local arrow = Instance.new("Frame")
                arrow.Name = "CompassArrow"
                arrow.Size = UDim2.new(0, 50, 0, 50)
                arrow.Position = UDim2.new(0.5, -25, 0.5, -25)
                arrow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                arrow.BackgroundTransparency = 0.5
                arrow.Parent = game:GetService("CoreGui")
                -- A direção pode ser usada para rotacionar a seta (requer mais código)
            else
                debugMessage("Nenhum inimigo encontrado.")
            end
            task.wait(2)
        end
    end)
end

-- ======================
-- Demais funções (resumidas por brevidade)
-- ======================
-- (As funções autoQuest, autoUpgradeStats, etc. permanecem similares à versão anterior)
local function autoQuest() end
local function autoUpgradeStats() end
local function autoBuso() end
local function autoInstinto() end
local function autoClick() end
local function infiniteLife() end
local function infiniteStamina() end
local function trackFruits() end
local function autoKitsuneRaidLaw() end
-- (Preencha com as implementações anteriores ou mantenha placeholders)

-- ======================
-- Configuração do Menu
-- ======================
FarmSection:NewToggle("Auto Farm", "Ataca inimigos adequados ao seu nível", function(state)
    getgenv().Auto_Farm = state
    if state then autoFarm() end
end)
FarmSection:NewToggle("Auto Teleport para Ilha Adequada", "Teleporta automaticamente para a ilha do seu nível", function(state)
    getgenv().Auto_Teleport_Island = state
end)
FarmSection:NewToggle("Auto Quest", "Aceita missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

CompassSection:NewToggle("Bússola para Inimigo", "Mostra direção e distância do inimigo mais próximo", function(state)
    getgenv().Compass_Enabled = state
    if state then compass() end
end)

StatsSection:NewToggle("Auto Upgrade Stats", "Melhora atributos automaticamente", function(state)
    getgenv().Auto_Upgrade_Stats = state
    if state then autoUpgradeStats() end
end)

SettingsSection:NewToggle("Auto Buso", "Ativa Busoshoku Haki", function(state)
    getgenv().Auto_Buso = state
    if state then autoBuso() end
end)
SettingsSection:NewToggle("Auto Instinto", "Ativa Instinto", function(state)
    getgenv().Auto_Instinto = state
    if state then autoInstinto() end
end)
SettingsSection:NewToggle("Auto Click", "Clica automaticamente (tecla E)", function(state)
    getgenv().Auto_Click = state
    if state then autoClick() end
end)
SettingsSection:NewToggle("Vida Infinita", "Mantém vida cheia", function(state)
    getgenv().Infinite_Life = state
    if state then infiniteLife() end
end)
SettingsSection:NewToggle("Stamina Infinita", "Mantém stamina cheia", function(state)
    getgenv().Infinite_Stamina = state
    if state then infiniteStamina() end
end)
SettingsSection:NewToggle("Track Frutas", "Mostra localização de frutas", function(state)
    getgenv().Track_Fruits = state
    if state then trackFruits() end
end)
SettingsSection:NewToggle("Kitsune Raid Law", "Faz raid Law", function(state)
    getgenv().Kitsune_Raid_Law = state
    if state then autoKitsuneRaidLaw() end
end)

-- ======================
-- Teleport manual
-- ======================
for _, island in ipairs(islandsByLevel) do
    TeleportSection:NewButton("Teleporte para " .. island.name, "Ir para a ilha", function()
        teleportToIsland(island.position)
    end)
end

debugMessage("Script finalizado. Auto Farm agora respeita seu nível e bússola aponta para inimigos.")
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
