-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Hub", "DarkTheme")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local RaidTab = Window:NewTab("Raids")
local RaidSection = RaidTab:NewSection("Raid Features")

local BerryTab = Window:NewTab("Berrys")
local BerrySection = BerryTab:NewSection("Auto Collect")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

-- Configurações Gerais
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Farm_Berrys = false
getgenv().Raid_Law = false
getgenv().Auto_Upgrade_Stats = false
getgenv().Auto_Click = true

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Função para Auto Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            local playerLevel = game.Players.LocalPlayer.Data.Level.Value
            local enemies = game.Workspace.Enemies:GetChildren()
            for _, enemy in pairs(enemies) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)
                    wait(0.2)
                end
            end
            wait(2)
        end
    end)
end

-- Função para Auto Quest
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            local questGiver = game.Workspace:FindFirstChild("QuestGiver")
            if questGiver then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questGiver.HumanoidRootPart.CFrame
                wait(1)
                questGiver:FireServer("AcceptQuest")
            end
            wait(5)
        end
    end)
end

-- Função para Auto Collect Berrys
local function autoCollectBerrys()
    spawn(function()
        while getgenv().Farm_Berrys do
            for _, berry in pairs(game.Workspace.Berrys:GetChildren()) do
                if berry:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = berry.CFrame
                    wait(0.5)
                end
            end
        end
    end)
end

-- Função para Auto Raid Law (Second Sea)
local function autoRaidLaw()
    spawn(function()
        while getgenv().Raid_Law do
            local lawPortal = game.Workspace:FindFirstChild("LawPortal")
            if lawPortal then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lawPortal.CFrame
                wait(1)
                game:GetService("ReplicatedStorage").Events.Raid:FireServer("Start", "Law")
            end
            wait(10)
        end
    end)
end

-- Função para Auto Click
local function autoClick()
    spawn(function()
        while getgenv().Auto_Click do
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
            wait(0.1)
        end
    end)
end

-- Integração com o Menu
FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
    if state then autoFarm() end
end)

FarmSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

BerrySection:NewToggle("Farm Berrys", "Coletar Berrys automaticamente", function(state)
    getgenv().Farm_Berrys = state
    if state then autoCollectBerrys() end
end)

RaidSection:NewToggle("Raid Law", "Automatizar Law Raid (Second Sea)", function(state)
    getgenv().Raid_Law = state
    if state then autoRaidLaw() end
end)

StatsSection:NewToggle("Auto Upgrade Stats", "Melhorar atributos automaticamente", function(state)
    getgenv().Auto_Upgrade_Stats = state
    -- Função de auto upgrade seria adicionada aqui
end)

SettingsSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    getgenv().Auto_Click = state
    if state then autoClick() end
end)

debugMessage("Script completo inicializado com sucesso!")