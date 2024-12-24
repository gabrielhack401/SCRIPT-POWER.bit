-- Funções Gerais e Configurações do Menu
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Libraries/Kavo-UI-Library/main/KavoUI.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")

-- Mensagem Inicial
print("============================================")
print("BEM VINDO(A) A POWER.bit SCRIPT!")
print("============================================")

-- Função de Carregar o Redz Hub (Adaptado para Blox Fruits)
local RedzHub = {
    isActive = true, -- Redz Hub ativo por padrão
    version = "v1.0", -- Versão do script
    hubName = "Redz Hub - Blox Fruits",
}

-- Função para exibir informações do Redz Hub
local function displayRedzHubInfo()
    print("============================================")
    print("Bem-vindo ao " .. RedzHub.hubName)
    print("Versão: " .. RedzHub.version)
    print("Ativado: " .. tostring(RedzHub.isActive))
    print("============================================")
end

-- Função para verificar se a fruta é do tipo Haki ou normal
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

-- Função para coletar as frutas
local function collectFruits()
    spawn(function()
        while globalOptions.AutoFruitCollect do
            -- Iterar sobre todas as frutas no jogo
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                -- Verificar se é uma fruta Haki ou normal
                if fruit:IsA("Model") and isHakiFruit(fruit) then
                    if fruit:FindFirstChild("Hitbox") then
                        -- Coletar a fruta (simulando o clique)
                        fireclickdetector(fruit.Hitbox)
                        print("Fruta coletada: " .. fruit.Name)
                        -- Enviar notificação
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Fruta Coletada",
                            Text = fruit.Name,
                            Duration = 5,
                        })
                    end
                end
            end
            wait(1) -- Espera de 1 segundo antes de verificar novamente
        end
    end)
end

-- Função para coletar informações sobre eventos, armas e outras ações
local function displayEventInfo()
    print("============================================")
    print("Eventos e Armas no " .. RedzHub.hubName)
    print("============================================")
    -- Colocar aqui as funções de eventos ou armas adicionais
end

-- Funções de Farming e outras opções
local function farmNPCs()
    spawn(function()
        while globalOptions.AutoFarm do
            -- Colocar aqui as funções para farmar NPCs
            wait(1)
        end
    end)
end

local function autoQuest()
    spawn(function()
        while globalOptions.AutoQuest do
            -- Colocar aqui as funções para auto quest
            wait(1)
        end
    end)
end

-- Funções para Auto Dojo, Mar, CDK, TTK, etc.
local function autoDojo()
    spawn(function()
        while globalOptions.AutoDojo do
            -- Colocar aqui as funções para auto dojo
            wait(5)
        end
    end)
end

local function autoMar()
    spawn(function()
        while globalOptions.AutoMar do
            -- Colocar aqui as funções para auto mar
            wait(5)
        end
    end)
end

local function autoCDK()
    spawn(function()
        while globalOptions.AutoCDK do
            -- Colocar aqui as funções para auto CDK
            wait(5)
        end
    end)
end

local function autoTTK()
    spawn(function()
        while globalOptions.AutoTTK do
            -- Colocar aqui as funções para auto TTK
            wait(5)
        end
    end)
end

-- Adicionando Opções ao Menu
local FarmingSection = FarmingTab:NewSection("Farming")
FarmingSection:NewToggle("Auto Farm", "Farmar NPCs automaticamente", function(state)
    globalOptions.AutoFarm = state
    if state then farmNPCs() end
end)

FarmingSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    globalOptions.AutoQuest = state
    if state then autoQuest() end
end)

FarmingSection:NewToggle("Auto Dojo", "Completar missões de dojo automaticamente", function(state)
    globalOptions.AutoDojo = state
    if state then autoDojo() end
end)

FarmingSection:NewToggle("Coletar Frutas Automaticamente", "Coletar todas as frutas do tipo Haki e normais", function(state)
    globalOptions.AutoFruitCollect = state
    if state then collectFruits() end
end)

local EventSection = EventTab:NewSection("Eventos")
EventSection:NewToggle("Auto Mar", "Participar de eventos marítimos automaticamente", function(state)
    globalOptions.AutoMar = state
    if state then autoMar() end
end)

local WeaponSection = WeaponTab:NewSection("Armas e Itens")
WeaponSection:NewToggle("Auto CDK", "Obter CDK automaticamente", function(state)
    globalOptions.AutoCDK = state
    if state then autoCDK() end
end)

WeaponSection:NewToggle("Auto TTK", "Obter TTK automaticamente", function(state)
    globalOptions.AutoTTK = state
    if state then autoTTK() end
end)

local SettingsSection = SettingsTab:NewSection("Configurações")
SettingsSection:NewToggle("Auto Buso", "Ativar Buso automaticamente", function(state)
    globalOptions.AutoBuso = state
end)

SettingsSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    globalOptions.AutoObservation = state
end)

SettingsSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    globalOptions.AutoClick = state
end)

-- Função para permitir que o menu seja movível e minimizável
Library.MakeDraggable(Window)

-- Iniciar o processo de coleta de frutas automaticamente
if globalOptions.AutoFruitCollect then
    collectFruits()
end

-- Exibir informações do Redz Hub
displayRedzHubInfo()

-- Finalização
debugMessage("Script carregado com sucesso!")
