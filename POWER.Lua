-- Configuração de link para o script no GitHub
local scriptUrl = "https://raw.githubusercontent.com/gabrielhack401/SCRIPT-POWER.bit/main/POWER.Lua"

-- Função para carregar o script do GitHub
local function loadScript()
    -- Usando HttpGet para buscar o conteúdo do script
    local scriptContent = game:HttpGet(scriptUrl)
    
    -- Executando o script
    loadstring(scriptContent)()
end

-- Executando a função de carregar o script
loadScript()

-- Mensagem de boas-vindas
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blox Fruits",
    Text = "BEM VINDO A POWER.bit SCRIPTS!",
    Icon = "rbxassetid://123456789",  -- Insira o ID da imagem do ícone, se desejado
    Duration = 5  -- Duração da notificação em segundos
})

-- Criando o menu do script com nome "POWER.bit"
local menu = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("ScreenGui"):WaitForChild("Frame")
menu.Name = "POWER.bit"

-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Ultimate Script", "DarkTheme")

-- Seções do Menu
local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Farm Options")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

local EventsTab = Window:NewTab("Events")
local EventsSection = EventsTab:NewSection("Maritime Events")

-- Configurações de Tema
getgenv().SettingTheme = {
    Tab = {
        Left_Color = Color3.fromRGB(203, 156, 255),
        Right_Color = Color3.fromRGB(140, 166, 252)
    },
    Button = {
        Left_Color = Color3.fromRGB(203, 156, 255),
        Right_Color = Color3.fromRGB(140, 166, 252)
    },
}

-- Funções e opções do menu
-- Exemplo de função de Auto Farm
getgenv().Auto_Farm = false
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            print("Farmando...")
            wait(2)
        end
    end)
end

FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
    if state then autoFarm() end
end)

-- Funções de Teleporte
local islands = {
    {name = "Starter Island", position = Vector3.new(0, 0, 0)},
    {name = "Snow Island", position = Vector3.new(2000, 0, 2000)},
}

local function teleportToIsland(islandName)
    for _, island in ipairs(islands) do
        if island.name == islandName then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(island.position)
            print("Teletransportando para a ilha:", islandName)
            return
        end
    end
    print("Ilha não encontrada:", islandName)
end

TeleportSection:NewButton("Teleporte para Starter Island", "Teleportar para a Ilha Starter", function()
    teleportToIsland("Starter Island")
end)

TeleportSection:NewButton("Teleporte para Snow Island", "Teleportar para a Ilha Snow", function()
    teleportToIsland("Snow Island")
end)

-- Funções de Auto Haki
local function autoHaki()
    spawn(function()
        while getgenv().Auto_Haki do
            -- Código para ativar Haki automaticamente
            print("Haki ativado automaticamente!")
            wait(2)
        end
    end)
end

-- Função de Auto Instinto
local function autoInstinct()
    spawn(function()
        while getgenv().Auto_Instinct do
            -- Código para ativar o Instinto automaticamente
            print("Instinto ativado automaticamente!")
            wait(2)
        end
    end)
end

-- Função de Auto Skills
local function autoSkills()
    spawn(function()
        while getgenv().Auto_Skills do
            -- Código para usar habilidades automaticamente
            print("Usando habilidades automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Devil Fruit
local function autoDevilFruit()
    spawn(function()
        while getgenv().Auto_Devil_Fruit do
            -- Código para consumir a Devil Fruit automaticamente
            print("Consumindo Devil Fruit automaticamente!")
            wait(2)
        end
    end)
end

-- Função de Auto Quests
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            -- Código para aceitar e completar missões automaticamente
            print("Aceitando e completando missões automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto Boss Farm
local function autoBossFarm()
    spawn(function()
        while getgenv().Auto_Boss_Farm do
            -- Código para farmar bosses automaticamente
            print("Farmando Bosses automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto PVP
local function autoPVP()
    spawn(function()
        while getgenv().Auto_PVP do
            -- Código para ativar o combate automático contra jogadores
            print("Ativando Auto PVP!")
            wait(3)
        end
    end)
end

-- Função de Auto Chat
local function autoChat()
    spawn(function()
        while getgenv().Auto_Chat do
            -- Código para enviar mensagens automáticas no chat
            print("Enviando mensagem no chat automaticamente...")
            wait(10)  -- Intervalo para enviar mensagens
        end
    end)
end

-- Função de Auto Pickup Itens
local function autoPickupItems()
    spawn(function()
        while getgenv().Auto_Pickup_Items do
            -- Código para pegar itens automaticamente
            print("Pegando itens automaticamente...")
            wait(1)
        end
    end)
end

-- Função de Auto Click para Devil Fruit
local function autoDevilFruitClick()
    spawn(function()
        while getgenv().Auto_Devil_Fruit_Click do
            -- Código para clicar em itens como frutas ou outras coisas no jogo
            print("Clicando para pegar Devil Fruit automaticamente!")
            wait(0.1)
        end
    end)
end

-- Menu de Farm
FarmSection:NewToggle("Farm Dragon Race", "Farmar para raça Dragão", function(state)
    getgenv().Farm_Dragon_Race = state
    if state then autoFarm() end
end)

FarmSection:NewToggle("Auto Haki", "Ativar Haki automaticamente", function(state)
    getgenv().Auto_Haki = state
    if state then autoHaki() end
end)

FarmSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    getgenv().Auto_Instinct = state
    if state then autoInstinct() end
end)

FarmSection:NewToggle("Auto Skills", "Usar habilidades automaticamente", function(state)
    getgenv().Auto_Skills = state
    if state then autoSkills() end
end)

FarmSection:NewToggle("Auto Devil Fruit", "Consumir Devil Fruit automaticamente", function(state)
    getgenv().Auto_Devil_Fruit = state
    if state then autoDevilFruit() end
end)

FarmSection:NewToggle("Auto Quests", "Aceitar e completar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

FarmSection:NewToggle("Auto Boss Farm", "Farmar Bosses automaticamente", function(state)
    getgenv().Auto_Boss_Farm = state
    if state then autoBossFarm() end
end)

FarmSection:NewToggle("Auto PVP", "Ativar combate automático com jogadores", function(state)
    getgenv().Auto_PVP = state
    if state then autoPVP() end
end)

FarmSection:NewToggle("Auto Chat", "Enviar mensagens automaticamente no chat", function(state)
    getgenv().Auto_Chat = state
    if state then autoChat() end
end)

FarmSection:NewToggle("Auto Pickup Itens", "Pegar itens automaticamente", function(state)
    getgenv().Auto_Pickup_Items = state
    if state then autoPickupItems() end
end)

FarmSection:NewToggle("Auto Devil Fruit Click", "Clique automático para pegar Devil Fruit", function(state)
    getgenv().Auto_Devil_Fruit_Click = state
    if state then autoDevilFruitClick() end
end)