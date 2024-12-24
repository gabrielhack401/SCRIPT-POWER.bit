-- Script para coletar todas as frutas automaticamente e armazená-las

-- Função para verificar se a fruta é do tipo Haki ou normal
local function isHakiFruit(fruit)
    -- Verifique o nome da fruta ou se é uma fruta Haki
    return fruit.Name:match("Haki") or fruit.Name:match("Fruit")
end

-- Função para coletar as frutas
local function collectFruits()
    while true do
        -- Iterar sobre todas as frutas no jogo
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            -- Verificar se é uma fruta Haki ou normal
            if fruit:IsA("Model") and isHakiFruit(fruit) then
                if fruit:FindFirstChild("Hitbox") then
                    -- Coletar a fruta (simulando o clique)
                    fireclickdetector(fruit.Hitbox)
                    print("Coletou a fruta: " .. fruit.Name)
                end
            end
        end
        wait(1) -- Espera de 1 segundo antes de verificar novamente
    end
end

-- Iniciar o processo de coleta de frutas
collectFruits()
