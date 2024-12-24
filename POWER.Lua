-- Mensagem de boas-vindas
print("Bem-vindo(a) ao script POWER.bit!")

-- Variáveis de controle para funções
local Auto_Farm = false
local Auto_Quest = false
local Immortality = false
local Infinite_Stamina = false
local Auto_Buso = false
local Auto_Instinto = false
local Auto_Fruit_Collect = false
local Auto_Events = false

-- Função para Auto Farm
local function autoFarm()
    while Auto_Farm do
        print("Realizando Auto Farm...")
        wait(1)
    end
end

-- Função de Imortalidade
local function immortality()
    while Immortality do
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
        wait(0.1)
    end
end

-- Função para Stamina Infinita
local function infiniteStamina()
    while Infinite_Stamina do
        if game.Players.LocalPlayer.Character:FindFirstChild("Stamina") then
            game.Players.LocalPlayer.Character.Stamina.Value = game.Players.LocalPlayer.Character.Stamina.MaxValue
        end
        wait(0.1)
    end
end

-- Função para Coletar Frutas
local function collectFruits()
    while Auto_Fruit_Collect do
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
    print("Teleportando para: " .. islandName)
end

-- Funções para Ativar/Desativar as funções
function toggleAutoFarm()
    Auto_Farm = not Auto_Farm
    if Auto_Farm then
        autoFarm()
    else
        print("Auto Farm desativado")
    end
end

function toggleImmortality()
    Immortality = not Immortality
    if Immortality then
        immortality()
    else
        print("Imortalidade desativada")
    end
end

function toggleInfiniteStamina()
    Infinite_Stamina = not Infinite_Stamina
    if Infinite_Stamina then
        infiniteStamina()
    else
        print("Stamina infinita desativada")
    end
end

function toggleAutoFruitCollect()
    Auto_Fruit_Collect = not Auto_Fruit_Collect
    if Auto_Fruit_Collect then
        collectFruits()
    else
        print("Coleta de frutas desativada")
    end
end

function teleportToStartIsland()
    teleportToIsland("Starter Island")
end

function teleportToSnowIsland()
    teleportToIsland("Snow Island")
end

-- Função para criar botões na tela (Mobile)
local function createButton(label, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = label
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
    button.Parent = game.CoreGui

    button.MouseButton1Click:Connect(callback)
end

-- Criar botões para controlar as funções
createButton("Ativar/Desativar Auto Farm", UDim2.new(0, 10, 0, 10), function()
    toggleAutoFarm()
end)

createButton("Ativar/Desativar Imortalidade", UDim2.new(0, 10, 0, 70), function()
    toggleImmortality()
end)

createButton("Ativar/Desativar Stamina Infinita", UDim2.new(0, 10, 0, 130), function()
    toggleInfiniteStamina()
end)

createButton("Ativar/Desativar Coleta de Frutas", UDim2.new(0, 10, 0, 190), function()
    toggleAutoFruitCollect()
end)

createButton("Teleportar para Starter Island", UDim2.new(0, 10, 0, 250), function()
    teleportToStartIsland()
end)

createButton("Teleportar para Snow Island", UDim2.new(0, 10, 0, 310), function()
    teleportToSnowIsland()
end)

-- Mensagem de inicialização
print("Botões criados. Agora você pode interagir com o script diretamente na tela!")
