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

-- Configurações globais
globalOptions = {
    AutoFarm = false,
    AutoQuest = false,
    AutoDojo = false,
    AutoFruitCollect = false,
    AutoHakiFruitCollect = false,
    AutoChestCollect = false,
    AutoKillBoss = false,
    VidaInf = false,
    StaminaInf = false,
    HakiObservacaoInf = false,
}

-- Funções de utilidade
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

-- Funções de combate
local function findAndKillBoss()
    spawn(function()
        while globalOptions.AutoKillBoss do
            for _, boss in pairs(game.Workspace:GetChildren()) do
                if boss:IsA("Model") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()

                    -- Mover-se até o boss
                    character:MoveTo(boss.HumanoidRootPart.Position)

                    -- Simular ataque
                    local tool = character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    else
                        print("Nenhuma ferramenta encontrada para atacar.")
                    end
                    print("Atacando o boss: " .. boss.Name)
                end
            end
            wait(1) -- Intervalo entre ataques
        end
    end)
end

-- Função para coletar frutas
local function collectFruits()
    spawn(function()
        while globalOptions.AutoFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta coletada: " .. fruit.Name)
                end
            end
            wait(1)
        end
    end)
end

-- Função para coletar frutas de Haki
local function collectHakiFruits()
    spawn(function()
        while globalOptions.AutoHakiFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and isHakiFruit(fruit) and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta de Haki coletada: " .. fruit.Name)
                end
            end
            wait(1)
        end
    end)
end

-- Função de coleta de baús
local function collectChests()
    spawn(function()
        while globalOptions.AutoChestCollect do
            for _, chest in pairs(game.Workspace:GetChildren()) do
                if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                    fireclickdetector(chest.TouchInterest)
                    print("Baú coletado: " .. chest.Name)
                end
            end
            wait(1)
        end
    end)
end

-- Função para ativar vida infinita
local function activateVidaInf()
    spawn(function()
        while globalOptions.VidaInf do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            if character:FindFirstChild("Humanoid") then
                character.Humanoid.Health = character.Humanoid.MaxHealth
            end
            wait(0.1)
        end
    end)
end

-- Função para ativar stamina infinita
local function activateStaminaInf()
    spawn(function()
        while globalOptions.StaminaInf do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            if character:FindFirstChild("Humanoid") then
                -- Ajuste de stamina infinita (simulado aqui)
                -- Adicionar lógica de stamina infinita se possível
            end
            wait(0.1)
        end
    end)
end

-- Função para ativar Haki da Observação infinito
local function activateHakiObservacaoInf()
    spawn(function()
        while globalOptions.HakiObservacaoInf do
            -- Adicionar lógica de Haki da Observação infinito
            -- Pode ser uma habilidade que aumenta o campo de visão ou ativa habilidade especial
            wait(0.1)
        end
    end)
end

-- Função para exibir o menu
local function showMenu()
    createLabel("Blox Fruits Script", UDim2.new(0.5, -100, 0.1, 0), UDim2.new(0, 200, 0, 50))

    createButton("Coletar Frutas", UDim2.new(0.5, -100, 0.3, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoFruitCollect = not globalOptions.AutoFruitCollect
        collectFruits()
    end)

    createButton("Coletar Frutas de Haki", UDim2.new(0.5, -100, 0.4, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoHakiFruitCollect = not globalOptions.AutoHakiFruitCollect
        collectHakiFruits()
    end)

    createButton("Coletar Baús", UDim2.new(0.5, -100, 0.5, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoChestCollect = not globalOptions.AutoChestCollect
        collectChests()
    end)

    createButton("Auto Kill Boss", UDim2.new(0.5, -100, 0.6, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.AutoKillBoss = not globalOptions.AutoKillBoss
        findAndKillBoss()
    end)

    createButton("Vida Inf", UDim2.new(0.5, -100, 0.7, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.VidaInf = not globalOptions.VidaInf
        if globalOptions.VidaInf then
            activateVidaInf()
        end
    end)

    createButton("Stamina Inf", UDim2.new(0.5, -100, 0.8, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.StaminaInf = not globalOptions.StaminaInf
        if globalOptions.StaminaInf then
            activateStaminaInf()
        end
    end)

    createButton("Haki da Observação Inf", UDim2.new(0.5, -100, 0.9, 0), UDim2.new(0, 200, 0, 50), function()
        globalOptions.HakiObservacaoInf = not globalOptions.HakiObservacaoInf
        if globalOptions.HakiObservacaoInf then
            activateHakiObservacaoInf()
        end
    end)

    createButton("Fechar Menu", UDim2.new(0.5, -100, 1.0, 0), UDim2.new(0, 200, 0, 50), function()
        screenGui:Destroy()
    end)
end

-- Exibe o menu
showMenu()

-- Finalização
print("Script carregado com sucesso!")
