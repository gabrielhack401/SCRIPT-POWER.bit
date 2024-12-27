-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Ultimate", "DarkTheme")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local RaidTab = Window:NewTab("Raids")
local RaidSection = RaidTab:NewSection("Raid Features")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

-- Configurações Gerais
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Life_Infinite = false
getgenv().Stamina_Infinite = false
getgenv().Collect_Belts = false
getgenv().Dragon_Race = false

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Função para Vida Infinita
local function infiniteLife()
    spawn(function()
        while getgenv().Life_Infinite do
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
                debugMessage("Vida restaurada!")
            end
            wait(0.5)
        end
    end)
end

-- Função para Stamina Infinita
local function infiniteStamina()
    spawn(function()
        while getgenv().Stamina_Infinite do
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Energy") then
                player.Character.Energy.Value = player.Character.Energy.MaxValue
                debugMessage("Stamina restaurada!")
            end
            wait(0.5)
        end
    end)
end

-- Função para Coletar Faixas
local function collectBelts()
    spawn(function()
        while getgenv().Collect_Belts do
            for _, belt in pairs(game.Workspace.Belts:GetChildren()) do
                if belt:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = belt.CFrame
                    wait(0.5)
                    debugMessage("Faixa coletada!")
                end
            end

            -- Após coletar todas as faixas, ativar Raça Dragão
            if not game.Workspace.Belts:FindFirstChildOfClass("Part") then
                debugMessage("Todas as faixas coletadas! Ativando Raça Dragão...")
                getgenv().Dragon_Race = true
            end
            wait(1)
        end
    end)
end

-- Função para Ativar Raça Dragão
local function activateDragonRace()
    spawn(function()
        while getgenv().Dragon_Race do
            -- Lógica para ativar Raça Dragão (adaptar conforme o jogo)
            local dragonRace = game.ReplicatedStorage:FindFirstChild("DragonRace")
            if dragonRace then
                dragonRace:FireServer("Activate")
                debugMessage("Raça Dragão ativada!")
                getgenv().Dragon_Race = false
            end
            wait(5)
        end
    end)
end

-- Integração com o Menu
FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
end)

FarmSection:NewToggle("Vida Infinita", "Restaura sua vida automaticamente", function(state)
    getgenv().Life_Infinite = state
    if state then infiniteLife() end
end)

FarmSection:NewToggle("Stamina Infinita", "Restaura sua stamina automaticamente", function(state)
    getgenv().Stamina_Infinite = state
    if state then infiniteStamina() end
end)

RaidSection:NewToggle("Coletar Faixas", "Coleta todas as faixas automaticamente", function(state)
    getgenv().Collect_Belts = state
    if state then collectBelts() end
end)

RaidSection:NewToggle("Raça Dragão", "Ativa a Raça Dragão", function(state)
    getgenv().Dragon_Race = state
    if state then activateDragonRace() end
end)

SettingsSection:NewToggle("Debug Ativo", "Mostra mensagens no console", function(state)
    getgenv().DebugMode = state
end)

debugMessage("Script completo inicializado com sucesso!")