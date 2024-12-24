-- Lista de frutas já coletadas para evitar duplicação
local collectedFruits = {}

-- Função para verificar se é uma fruta de Haki ou normal
local function isFruit(fruit)
    -- Frutas de Haki (personalize conforme necessário)
    if fruit.Name:match("Haki") then
        return true
    end
    -- Frutas normais (personalize conforme necessário)
    if fruit.Name:match("Fruit") then
        return true
    end
    return false
end

-- Função para coletar frutas automaticamente
local function collectFruits()
    while true do
        -- Itera por todas as frutas no jogo
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            -- Verifica se a fruta é uma fruta de Haki ou normal
            if fruit:IsA("Model") and isFruit(fruit) then
                -- Verifica se a fruta já foi coletada
                if not collectedFruits[fruit] then
                    -- Marca a fruta como coletada
                    collectedFruits[fruit] = true
                    -- Simula o clique na Hitbox da fruta para coletá-la
                    if fruit:FindFirstChild("Hitbox") then
                        fireclickdetector(fruit.Hitbox)
                        -- Exibe notificação de que a fruta foi coletada
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Fruta Coletada!",
                            Text = "Você coletou: " .. fruit.Name,
                            Duration = 2
                        })
                        print("Fruta coletada: " .. fruit.Name)
                    end
                end
            end
        end
        wait(1)  -- Aguarda 1 segundo antes de verificar novamente
    end
end

-- Função para detectar novas frutas no jogo e notificar
game.Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and isFruit(child) then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Nova Fruta Encontrada!",
            Text = "Uma nova fruta apareceu: " .. child.Name,
            Duration = 3
        })
        print("Nova fruta encontrada: " .. child.Name)
    end
end)

-- Inicia o processo de coleta de frutas
collectFruits()
