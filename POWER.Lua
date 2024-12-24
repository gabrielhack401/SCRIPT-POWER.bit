-- Variáveis de controle
local fruitsCollected = {} -- Armazena as frutas que já foram coletadas

-- Função para verificar se a fruta é do tipo Haki ou normal
local function isHakiFruit(fruit)
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit") -- Identifica a fruta de Haki ou normal
end

-- Função para coletar as frutas
local function collectFruits()
    while true do
        -- Iterar sobre todas as frutas no jogo
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            -- Verifica se a fruta é do tipo Haki ou normal
            if fruit:IsA("Model") and isHakiFruit(fruit) then
                -- Checa se a fruta já foi coletada
                if not fruitsCollected[fruit] and fruit:FindFirstChild("Hitbox") then
                    -- Marca a fruta como coletada
                    fruitsCollected[fruit] = true
                    -- Simula o clique na Hitbox da fruta
                    fireclickdetector(fruit.Hitbox)
                    -- Notificar que a fruta foi coletada
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Fruta Coletada!",
                        Text = "Você coletou a fruta: " .. fruit.Name,
                        Duration = 2
                    })
                    print("Fruta coletada: " .. fruit.Name)
                end
            end
        end
        wait(1) -- Aguarda 1 segundo para checar novas frutas
    end
end

-- Função para exibir notificação quando uma nova fruta aparece
local function notifyFruitAppearance(fruit)
    if fruit:IsA("Model") and isHakiFruit(fruit) then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Nova Fruta Encontrada!",
            Text = "Uma nova fruta apareceu: " .. fruit.Name,
            Duration = 3
        })
        print("Nova fruta apareceu: " .. fruit.Name)
    end
end

-- Conectar a função de notificação ao evento de nova fruta
game.Workspace.ChildAdded:Connect(function(child)
    notifyFruitAppearance(child)
end)

-- Iniciar o processo de coleta de frutas
collectFruits()
