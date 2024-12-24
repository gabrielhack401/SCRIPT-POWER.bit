-- Função de notificação
local function sendNotification(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 3
    })
end

-- Tabela para armazenar frutas já coletadas
local collectedFruits = {}

-- Função para verificar se a fruta é do tipo correto (normal ou Haki)
local function isCollectibleFruit(fruit)
    if fruit.Name:match("Fruit") or fruit.Name:match("Haki") then
        return true
    end
    return false
end

-- Função principal de coleta automática
local function collectFruitsAutomatically()
    while true do
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Model") and isCollectibleFruit(fruit) then
                if not collectedFruits[fruit] then
                    -- Marcar a fruta como coletada
                    collectedFruits[fruit] = true

                    -- Tenta coletar a fruta (simula um clique na Hitbox)
                    if fruit:FindFirstChild("Hitbox") then
                        fireclickdetector(fruit.Hitbox)

                        -- Envia notificação de coleta
                        sendNotification("Fruta Coletada!", "Você coletou: " .. fruit.Name)

                        -- Exibe no console
                        print("Fruta coletada: " .. fruit.Name)
                    end
                end
            end
        end
        wait(1)  -- Aguarda 1 segundo antes de checar novamente
    end
end

-- Função para detectar novas frutas no jogo
game.Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and isCollectibleFruit(child) then
        -- Envia uma notificação para a nova fruta que apareceu
        sendNotification("Nova Fruta Encontrada!", "Uma nova fruta apareceu: " .. child.Name)
        print("Nova fruta encontrada: " .. child.Name)
    end
end)

-- Inicia o processo de coleta de frutas
collectFruitsAutomatically()
