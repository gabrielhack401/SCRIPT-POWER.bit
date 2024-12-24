-- Funções Gerais e Configurações do Menu
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Libraries/Kavo-UI-Library/main/KavoUI.lua"))()
local Window = Library.CreateLib("Blox Fruits Script", "DarkTheme")
local MainTab = Window:NewTab("Menu Principal")
local MainSection = MainTab:NewSection("Funções Gerais")

-- Mensagem Inicial
print("============================================")
print("BEM VINDO(A) A POWER.bit SCRIPT!")
print("============================================")

-- Funções globais
globalOptions = {
    AutoFarm = false,
    AutoQuest = false,
    AutoDojo = false,
    AutoMar = false,
    AutoCDK = false,
    AutoTTK = false,
    AutoFruitCollect = true,  -- Deixa sempre no TRUE
    AutoHakiFruitCollect = true, -- Deixa sempre no TRUE para frutas de Haki
    AutoBuso = false,
    AutoObservation = false,
    AutoClick = false
}

-- Verificar se a fruta é do tipo Haki ou normal
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

-- Coletar frutas, incluindo as de Haki
local function collectFruits()
    spawn(function()
        while globalOptions.AutoFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and isHakiFruit(fruit) and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta coletada: " .. fruit.Name)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Fruta Coletada",
                        Text = fruit.Name,
                        Duration = 5,
                    })
                end
            end
            wait(1)  -- Verifica a cada 1 segundo
        end
    end)
end

-- Função para coletar frutas de Haki
local function collectHakiFruits()
    spawn(function()
        while globalOptions.AutoHakiFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                -- Verificar se é uma fruta de Haki pela cor
                if fruit:IsA("Model") and fruit:FindFirstChild("Hitbox") and fruit.BrickColor == BrickColor.new("Bright yellow") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta de Haki coletada: " .. fruit.Name)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Fruta de Haki Coletada",
                        Text = fruit.Name,
                        Duration = 5,
                    })
                end
            end
            wait(1)  -- Verifica a cada 1 segundo
        end
    end)
end

-- Funções de Farming e Coleta de Frutas
local function farmNPCs()
    spawn(function()
        while globalOptions.AutoFarm do
            print("Farming NPCs...")
            wait(1)
        end
    end)
end

-- Aceitar missões automaticamente
local function autoQuest()
    spawn(function()
        while globalOptions.AutoQuest do
            print("Aceitando missões automaticamente...")
            wait(1)
        end
    end)
end

-- Auto Dojo
local function autoDojo()
    spawn(function()
        while globalOptions.AutoDojo do
            print("Executando Auto Dojo...")
            wait(5)
        end
    end)
end

-- Auto Mar
local function autoMar()
    spawn(function()
        while globalOptions.AutoMar do
            print("Participando de eventos marítimos...")
            wait(5)
        end
    end)
end

-- Auto CDK
local function autoCDK()
    spawn(function()
        while globalOptions.AutoCDK do
            print("Obtendo CDK automaticamente...")
            wait(5)
        end
    end)
end

-- Auto TTK
local function autoTTK()
    spawn(function()
        while globalOptions.AutoTTK do
            print("Obtendo TTK automaticamente...")
            wait(5)
        end
    end)
end

-- Configurações de Buso e Instinto
local function autoBuso()
    print("Ativando Buso automaticamente...")
end

local function autoObservation()
    print("Ativando Instinto automaticamente...")
end

local function autoClick()
    print("Auto Click ativado!")
end

-- Adicionando todas as opções ao Menu
MainSection:NewToggle("Auto Farm NPCs", "Farmar NPCs automaticamente", function(state)
    globalOptions.AutoFarm = state
    if state then farmNPCs() end
end)

MainSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    globalOptions.AutoQuest = state
    if state then autoQuest() end
end)

MainSection:NewToggle("Auto Dojo", "Completar missões de dojo automaticamente", function(state)
    globalOptions.AutoDojo = state
    if state then autoDojo() end
end)

MainSection:NewToggle("Coletar Frutas", "Coletar frutas automaticamente", function(state)
    globalOptions.AutoFruitCollect = true  -- Deixa sempre true
    collectFruits()  -- Coleta frutas sempre
end)

MainSection:NewToggle("Coletar Frutas de Haki", "Coletar frutas de Haki automaticamente", function(state)
    globalOptions.AutoHakiFruitCollect = true  -- Deixa sempre true
    collectHakiFruits()  -- Coleta frutas de Haki sempre
end)

MainSection:NewToggle("Auto Mar", "Participar de eventos marítimos automaticamente", function(state)
    globalOptions.AutoMar = state
    if state then autoMar() end
end)

MainSection:NewToggle("Auto CDK", "Obter CDK automaticamente", function(state)
    globalOptions.AutoCDK = state
    if state then autoCDK() end
end)

MainSection:NewToggle("Auto TTK", "Obter TTK automaticamente", function(state)
    globalOptions.AutoTTK = state
    if state then autoTTK() end
end)

MainSection:NewToggle("Auto Buso", "Ativar Buso automaticamente", function(state)
    globalOptions.AutoBuso = state
    if state then autoBuso() end
end)

MainSection:NewToggle("Auto Instinto", "Ativar Instinto automaticamente", function(state)
    globalOptions.AutoObservation = state
    if state then autoObservation() end
end)

MainSection:NewToggle("Auto Click", "Ativar Auto Click", function(state)
    globalOptions.AutoClick = state
    if state then autoClick() end
end)

-- Finalização
print("Script carregado com sucesso!")
