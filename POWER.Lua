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
    Title = "POWER.bit SCRIPTS",  -- Título alterado
    Text = "BEM VINDO A POWER.bit SCRIPTS!",
    Icon = "rbxassetid://123456789",  -- Insira o ID da imagem do ícone, se desejado
    Duration = 5  -- Duração da notificação em segundos
})

-- Criando o menu do script com nome "POWER.bit"
local menu = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("ScreenGui"):WaitForChild("Frame")
menu.Name = "POWER.bit"

-- Biblioteca de GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("POWER.bit SCRIPTS", "DarkTheme")  -- Título alterado

-- Seções do Menu
local PrisonTab = Window:NewTab("Prison")
local PrisonSection = PrisonTab:NewSection("Prison Escape Options")

local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Upgrade")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

local EventsTab = Window:NewTab("Events")
local EventsSection = EventsTab:NewSection("Prison Events")

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
-- Exemplo de função de Auto Escape (Escapar da prisão)
getgenv().Auto_Escape = false
local function autoEscape()
    spawn(function()
        while getgenv().Auto_Escape do
            print("Escapando da prisão...")
            wait(2)
        end
    end)
end

PrisonSection:NewToggle("Auto Escape", "Escapar automaticamente da prisão", function(state)
    getgenv().Auto_Escape = state
    if state then autoEscape() end
end)

-- Funções de Teleporte
local locations = {
    {name = "Prison Entrance", position = Vector3.new(0, 0, 0)},
    {name = "Criminal Base", position = Vector3.new(2000, 0, 2000)},
}

local function teleportToLocation(locationName)
    for _, location in ipairs(locations) do
        if location.name == locationName then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location.position)
            print("Teletransportando para:", locationName)
            return
        end
    end
    print("Localização não encontrada:", locationName)
end

TeleportSection:NewButton("Teleporte para Prison Entrance", "Teleportar para a entrada da prisão", function()
    teleportToLocation("Prison Entrance")
end)

TeleportSection:NewButton("Teleporte para Criminal Base", "Teleportar para a base dos criminosos", function()
    teleportToLocation("Criminal Base")
end)

-- Funções de Auto Haki (ou habilidade especial no Jailbreak)
local function autoHaki()
    spawn(function()
        while getgenv().Auto_Haki do
            -- Código para ativar habilidade especial automaticamente
            print("Habilidade especial ativada!")
            wait(2)
        end
    end)
end

-- Função de Auto Instinto
local function autoInstinct()
    spawn(function()
        while getgenv().Auto_Instinct do
            -- Código para ativar Instinto automaticamente
            print("Instinto ativado automaticamente!")
            wait(2)
        end
    end)
end

-- Função de Auto Skills (habilidades)
local function autoSkills()
    spawn(function()
        while getgenv().Auto_Skills do
            -- Código para usar habilidades automaticamente
            print("Usando habilidades automaticamente...")
            wait(2)
        end
    end)
end

-- Função de Auto Quests (Missões)
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            -- Código para aceitar e completar missões automaticamente
            print("Aceitando e completando missões automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto Boss Farm (Farming de Chefes)
local function autoBossFarm()
    spawn(function()
        while getgenv().Auto_Boss_Farm do
            -- Código para farmar chefes automaticamente
            print("Farmando Chefes automaticamente...")
            wait(5)
        end
    end)
end

-- Função de Auto PVP (Combate contra jogadores)
local function autoPVP()
    spawn(function()
        while getgenv().Auto_PVP do
            -- Código para ativar o combate automático contra jogadores
            print("Ativando Auto PVP!")
            wait(3)
        end
    end)
end

-- Função de Auto Chat (Envio de mensagens)
local function autoChat()
    spawn(function()
        while getgenv().Auto_Chat do
            -- Código para enviar mensagens automáticas no chat
            print("Enviando mensagem no chat automaticamente...")
            wait(10)  -- Intervalo para enviar mensagens
        end
    end)
end

-- Função de Auto Pickup Itens (Coletando itens)
local function autoPickupItems()
    spawn(function()
        while getgenv().Auto_Pickup_Items do
            -- Código para pegar itens automaticamente
            print("Pegando itens automaticamente...")
            wait(1)
        end
    end)
end

-- Menu de Escape
PrisonSection:NewToggle("Auto Escape", "Escapar automaticamente da prisão", function(state)
    getgenv().Auto_Escape = state
    if state then autoEscape() end
end)

PrisonSection:NewToggle("Auto Haki", "Ativar habilidade especial automaticamente", function(state)
    getgenv().Auto_Haki = state
    if state then autoHaki() end
end)

PrisonSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    getgenv().Auto_Instinct = state
    if state then autoInstinct() end
end)

PrisonSection:NewToggle("Auto Skills", "Usar habilidades automaticamente", function(state)
    getgenv().Auto_Skills = state
    if state then autoSkills() end
end)

PrisonSection:NewToggle("Auto Quests", "Aceitar e completar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

PrisonSection:NewToggle("Auto Boss Farm", "Farmar Chefes automaticamente", function(state)
    getgenv().Auto_Boss_Farm = state
    if state then autoBossFarm() end
end)

PrisonSection:NewToggle("Auto PVP", "Ativar combate automático com jogadores", function(state)
    getgenv().Auto_PVP = state
    if state then autoPVP() end
end)

PrisonSection:NewToggle("Auto Chat", "Enviar mensagens automaticamente no chat", function(state)
    getgenv().Auto_Chat = state
    if state then autoChat() end
end)

PrisonSection:NewToggle("Auto Pickup Itens", "Pegar itens automaticamente", function(state)
    getgenv().Auto_Pickup_Items = state
    if state then autoPickupItems() end
end)
