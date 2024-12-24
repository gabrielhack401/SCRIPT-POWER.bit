-- Carregar a biblioteca de GUI para criar o menu
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/axstin/rbxui/master/source.lua"))()
local Window = Library.new("POWER.bit - Ultimate Script")

-- Exibir mensagem de boas-vindas no console
print("Bem-vindo(a) POWER.bit Script!")

-- Variáveis de controle
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Immortality = false
getgenv().Infinite_Stamina = false
getgenv().Auto_Buso = false
getgenv().Auto_Instinto = false
getgenv().Auto_Fruit_Collect = false
getgenv().Auto_Events = false
getgenv().Auto_Combo = false

-- Função para Auto Farm
local function autoFarm()
    while getgenv().Auto_Farm do
        -- Adicionar a lógica do auto farm aqui
        print("Realizando Auto Farm...")
        wait(1)
    end
end

-- Função para Imortalidade
local function immortality()
    while getgenv().Immortality do
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
        wait(0.1)
    end
end

-- Função para Stamina Infinita
local function infiniteStamina()
    while getgenv().Infinite_Stamina do
        -- Lógica de Stamina Infinita
        if game.Players.LocalPlayer.Character:FindFirstChild("Stamina") then
            game.Players.LocalPlayer.Character.Stamina.Value = game.Players.LocalPlayer.Character.Stamina.MaxValue
        end
        wait(0.1)
    end
end

-- Função para Coletar Frutas
local function collectFruits()
    while getgenv().Auto_Fruit_Collect do
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Model") and fruit.Name:match("Fruit") then
                if fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)  -- Simula o clique na fruta
                end
            end
        end
        wait(3)
    end
end

-- Função de Teleporte para Ilha
local function teleportToIsland(islandName)
    -- Adicionar lógica de teleporte para a ilha aqui
    print("Teleportando para: " .. islandName)
end

-- Criar as Seções no Menu
local FarmSection = Window:Section("Auto Farm")
local StatsSection = Window:Section("Stats & Haki")
local SettingsSection = Window:Section("Settings")
local TeleportSection = Window:Section("Teleport")
local FruitsSection = Window:Section("Fruit Collection")
local EventsSection = Window:Section("Maritime Events")

-- Funções no Menu
FarmSection:Button("Iniciar Auto Farm", function()
    getgenv().Auto_Farm = true
    autoFarm()
end)

FarmSection:Button("Iniciar Auto Quest", function()
    getgenv().Auto_Quest = true
    -- Lógica de Auto Quest
    print("Aceitando missões automaticamente...")
end)

StatsSection:Button("Ativar Imortalidade", function()
    getgenv().Immortality = true
    immortality()
end)

StatsSection:Button("Ativar Stamina Infinita", function()
    getgenv().Infinite_Stamina = true
    infiniteStamina()
end)

StatsSection:Button("Ativar Auto Buso", function()
    getgenv().Auto_Buso = true
    -- Lógica de Auto Buso
    print("Ativando Busoshoku Haki...")
end)

StatsSection:Button("Ativar Auto Instinto", function()
    getgenv().Auto_Instinto = true
    -- Lógica de Auto Instinto
    print("Ativando Instinto...")
end)

TeleportSection:Button("Teleporte para Starter Island", function()
    teleportToIsland("Starter Island")
end)

TeleportSection:Button("Teleporte para Snow Island", function()
    teleportToIsland("Snow Island")
end)

FruitsSection:Button("Coletar Frutas", function()
    getgenv().Auto_Fruit_Collect = true
    collectFruits()
end)

EventsSection:Button("Iniciar Evento Marítimo 1", function()
    -- Lógica de Evento Marítimo 1
    print("Iniciando Evento Marítimo 1...")
end)

EventsSection:Button("Iniciar Evento Marítimo 2", function()
    -- Lógica de Evento Marítimo 2
    print("Iniciando Evento Marítimo 2...")
end)

-- Renderizar o menu
Window:Render()

-- Função para mensagem de debug
function debugMessage(msg)
    print("[DEBUG] " .. msg)
end
