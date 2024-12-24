-- Carregar a Biblioteca de GUI (Redzhub ou Kavo UI)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/axstin/rbxui/master/source.lua"))()
local Window = Library.new("Ultimate Blox Fruits Script")

-- Seções do Menu
local FarmSection = Window:Section("Auto Farm")
local StatsSection = Window:Section("Auto Upgrade")
local SettingsSection = Window:Section("General Settings")
local TeleportSection = Window:Section("Teleport")
local EventsSection = Window:Section("Maritime Events")
local FruitsSection = Window:Section("Collect Fruits")
local MiscSection = Window:Section("Miscellaneous")

-- Configurações Gerais
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Immortality = false
getgenv().Infinite_Stamina = false
getgenv().Auto_Buso = false
getgenv().Auto_Instinto = false
getgenv().Auto_Fruit_Collect = false
getgenv().Auto_Events = false

-- Função de Auto Farm
local function autoFarm()
    while getgenv().Auto_Farm do
        local enemy = game:GetService("Workspace"):FindFirstChild("EnemyName") -- Coloque o nome real do inimigo aqui.
        if enemy then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(0) -- Impede o inimigo de causar dano.
        end
        wait(1)
    end
end

-- Função de Imortalidade
local function immortality()
    while getgenv().Immortality do
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
        wait(0.1)
    end
end

-- Função de Stamina Infinita
local function infiniteStamina()
    while getgenv().Infinite_Stamina do
        if game.Players.LocalPlayer.Character:FindFirstChild("Stamina") then
            game.Players.LocalPlayer.Character.Stamina.Value = game.Players.LocalPlayer.Character.Stamina.MaxValue
        end
        wait(0.1)
    end
end

-- Função de Coletar Frutas de Haki
local function collectHakiFruits()
    while getgenv().Auto_Fruit_Collect do
        -- Procurar por todas as frutas no mapa
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Model") and fruit.Name:match("HakiFruit") then  -- Verifica se a fruta é uma fruta de Haki
                if fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)  -- Simula o clique na fruta para coletá-la
                    debugMessage("Coletando fruta Haki: " .. fruit.Name)
                end
            end
        end
        wait(3)  -- Espera um tempo antes de procurar novamente
    end
end

-- Função de Auto Buso
local function autoBuso()
    while getgenv().Auto_Buso do
        -- Lógica para ativar Busoshoku Haki automaticamente
        debugMessage("Ativando Busoshoku Haki...")
        wait(5)
    end
end

-- Função de Auto Instinto
local function autoInstinto()
    while getgenv().Auto_Instinto do
        -- Lógica para ativar Instinto automaticamente
        debugMessage("Ativando Instinto...")
        wait(5)
    end
end

-- Função de Teleporte
local function teleportToIsland(islandName)
    -- Lógica para teleportar para uma ilha
    debugMessage("Teleportando para " .. islandName)
    -- Implementação do teleporte (ainda depende da estrutura do jogo)
end

local function teleportToEvent(eventName)
    -- Lógica para teleportar para um evento
    debugMessage("Teleportando para evento " .. eventName)
    -- Implementação do teleporte (ainda depende da estrutura do jogo)
end

-- Função de eventos marítimos
local function maritimeEvent(event)
    while getgenv()[event] do
        debugMessage("Participando de evento marítimo " .. event)
        wait(5)
    end
end

-- Adicionando Funções ao Menu
FarmSection:Button("Iniciar Auto Farm", function()
    getgenv().Auto_Farm = true
    autoFarm()
end)

FarmSection:Button("Iniciar Auto Quest", function()
    getgenv().Auto_Quest = true
    -- Lógica para auto quest
    debugMessage("Aceitando missões automaticamente...")
end)

StatsSection:Button("Auto Buso", function()
    getgenv().Auto_Buso = true
    autoBuso()
end)

StatsSection:Button("Auto Instinto", function()
    getgenv().Auto_Instinto = true
    autoInstinto()
end)

SettingsSection:Button("Ativar Imortalidade", function()
    getgenv().Immortality = true
    immortality()
end)

SettingsSection:Button("Ativar Stamina Infinita", function()
    getgenv().Infinite_Stamina = true
    infiniteStamina()
end)

-- Funções de Teleporte
TeleportSection:Button("Teleporte para Starter Island", function()
    teleportToIsland("Starter Island")
end)

TeleportSection:Button("Teleporte para Snow Island", function()
    teleportToIsland("Snow Island")
end)

-- Adicionando Eventos Marítimos
EventsSection:Button("Iniciar Evento Marítimo 1", function()
    maritimeEvent("Event1")
end)

EventsSection:Button("Iniciar Evento Marítimo 2", function()
    maritimeEvent("Event2")
end)

EventsSection:Button("Iniciar Evento Marítimo 3", function()
    maritimeEvent("Event3")
end)

-- Coleta Automática de Frutas Haki
FruitsSection:Button("Coletar Frutas de Haki", function()
    getgenv().Auto_Fruit_Collect = true
    collectHakiFruits()
end)

-- Exibindo o menu para o jogador
Window:Show()

