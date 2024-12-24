-- Criando a interface GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar um botão
local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton")
    button.Parent = screenGui
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24

    button.MouseButton1Click:Connect(callback)

    return button
end

-- Função para criar uma label
local function createLabel(text, position, size)
    local label = Instance.new("TextLabel")
    label.Parent = screenGui
    label.Text = text
    label.Position = position
    label.Size = size
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 30
    return label
end

-- Função para exibir o menu principal
local function showMenu()
    -- Título do menu
    createLabel("Blox Fruits Script", UDim2.new(0.5, -100, 0.1, 0), UDim2.new(0, 200, 0, 50))

    -- Botões do menu principal
    createButton("Coletar Frutas", UDim2.new(0.5, -100, 0.3, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoFruitCollect = true  -- Deixa sempre no TRUE
        collectFruits()  -- Inicia a coleta de frutas
    end)

    createButton("Coletar Frutas de Haki", UDim2.new(0.5, -100, 0.4, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoHakiFruitCollect = true  -- Deixa sempre no TRUE
        collectHakiFruits()  -- Inicia a coleta de frutas de Haki
    end)

    createButton("Auto Farm NPCs", UDim2.new(0.5, -100, 0.5, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoFarm = true
        farmNPCs()  -- Inicia o farming de NPCs
    end)

    createButton("Auto Quest", UDim2.new(0.5, -100, 0.6, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoQuest = true
        autoQuest()  -- Aceita as missões automaticamente
    end)

    createButton("Auto Dojo", UDim2.new(0.5, -100, 0.7, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoDojo = true
        autoDojo()  -- Executa o Auto Dojo
    end)

    createButton("Sair", UDim2.new(0.5, -100, 0.8, 0), UDim2.new(0, 200, 0, 50), function()
        screenGui:Destroy()  -- Fecha o menu
    end)
end

-- Funções Globais e Configurações do Menu
globalOptions = {
    AutoFarm = false,
    AutoQuest = false,
    AutoDojo = false,
    AutoMar = false,
    AutoCDK = false,
    AutoTTK = false,
    AutoFruitCollect = true,  -- Deixa sempre no TRUE
    AutoHakiFruitCollect = true, -- Deixa sempre no TRUE
    AutoBuso = false,
    AutoObservation = false,
    AutoClick = false
}

-- Funções de coleta de frutas
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

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

local function collectHakiFruits()
    spawn(function()
        while globalOptions.AutoHakiFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
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

-- Funções de Farming e Missões
local function farmNPCs()
    spawn(function()
        while globalOptions.AutoFarm do
            print("Farming NPCs...")
            wait(1)
        end
    end)
end

local function autoQuest()
    spawn(function()
        while globalOptions.AutoQuest do
            print("Aceitando missões automaticamente...")
            wait(1)
        end
    end)
end

local function autoDojo()
    spawn(function()
        while globalOptions.AutoDojo do
            print("Executando Auto Dojo...")
            wait(5)
        end
    end)
end

-- Funções de Eventos e CDK
local function autoMar()
    spawn(function()
        while globalOptions.AutoMar do
            print("Participando de eventos marítimos...")
            wait(5)
        end
    end)
end

local function autoCDK()
    spawn(function()
        while globalOptions.AutoCDK do
            print("Obtendo CDK automaticamente...")
            wait(5)
        end
    end)
end

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

-- Exibe o menu na tela
showMenu()

-- Finalização
print("Script carregado com sucesso!")
