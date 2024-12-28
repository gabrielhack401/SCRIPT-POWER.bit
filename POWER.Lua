-- POWER.bit Script

-- Mensagem de entrada
debugMessage("BEM-VINDO A POWER.bit SCRIPTS!")

-- Função detalhada para coletar todos os Grifts
local function collectGrifts()
    spawn(function()
        while getgenv().Collect_Grifts do
            -- Lógica para coletar Grifts
            for _, grift in ipairs(game.Workspace.Grifts:GetChildren()) do
                if grift:IsA("Model") then
                    -- Lógica para verificar se o grift está disponível para coleta
                    if grift:FindFirstChild("Collect") then
                        -- Coletando o grift
                        fireclickdetector(grift.Collect)
                        debugMessage("Grift coletado com sucesso!")
                    end
                end
            end
            wait(3)  -- Intervalo de 3 segundos entre cada coleta
        end
    end)
end

-- Função para Coletar Cards
local function collectCards()
    spawn(function()
        while getgenv().Collect_Cards do
            -- Lógica para coletar todos os cards disponíveis no jogo
            for _, card in ipairs(game.Workspace.Cards:GetChildren()) do
                if card:IsA("Model") then
                    -- Verifica se o card pode ser coletado
                    if card:FindFirstChild("Collect") then
                        -- Coleta o card
                        fireclickdetector(card.Collect)
                        debugMessage("Card coletado com sucesso!")
                    end
                end
            end
            wait(4)  -- Intervalo de 4 segundos entre as coletas de cards
        end
    end)
end

-- Função para Coletar a Nova Espada
local function collectNewSword()
    spawn(function()
        while getgenv().Collect_New_Sword do
            -- Lógica para coletar a nova espada
            local sword = game.Workspace:FindFirstChild("NewSword")
            if sword then
                -- Verifica se a espada está disponível para coleta
                if sword:FindFirstChild("Collect") then
                    -- Coleta a espada
                    fireclickdetector(sword.Collect)
                    debugMessage("Nova espada coletada com sucesso!")
                end
            end
            wait(5)  -- Intervalo de 5 segundos para a coleta
        end
    end)
end

-- Função para Coletar História da Arma Nova
local function collectNewWeaponHistory()
    spawn(function()
        while getgenv().Collect_New_Weapon_History do
            -- Lógica para coletar a história da nova arma
            local weaponHistory = game.Workspace:FindFirstChild("NewWeaponHistory")
            if weaponHistory then
                -- Coleta a história da arma
                fireclickdetector(weaponHistory.Collect)
                debugMessage("História da nova arma coletada com sucesso!")
            end
            wait(6)  -- Intervalo de 6 segundos para a coleta
        end
    end)
end

-- Função para Pegar Raça Dragão em todas as faixas de nível
local function collectDragonRace()
    spawn(function()
        while getgenv().Collect_Dragon_Race do
            -- Lógica para pegar a raça dragão conforme o nível do jogador
            local playerLevel = game.Players.LocalPlayer.Data.Level.Value
            if playerLevel >= 50 and playerLevel <= 100 then
                -- Lógica para pegar raça dragão entre nível 50 e 100
                debugMessage("Coletando Raça Dragão para o nível " .. playerLevel)
                -- Código para coleta da raça dragão
            elseif playerLevel >= 100 and playerLevel <= 200 then
                -- Lógica para pegar raça dragão entre nível 100 e 200
                debugMessage("Coletando Raça Dragão para o nível " .. playerLevel)
                -- Código para coleta da raça dragão
            end
            wait(10)  -- Intervalo de 10 segundos entre as tentativas de coleta
        end
    end)
end

-- Função para Farmar Chamas Vermelhas
local function farmRedFlames()
    spawn(function()
        while getgenv().Farm_Red_Flames do
            -- Lógica para farmar chamas vermelhas
            for _, flame in ipairs(game.Workspace.RedFlames:GetChildren()) do
                if flame:IsA("Model") then
                    -- Verifica se a chama vermelha pode ser coletada
                    if flame:FindFirstChild("Collect") then
                        -- Coleta a chama vermelha
                        fireclickdetector(flame.Collect)
                        debugMessage("Chama vermelha coletada com sucesso!")
                    end
                end
            end
            wait(5)  -- Intervalo de 5 segundos entre as coletas
        end
    end)
end

-- Função para Ativar Auto Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            -- Lógica para farmar inimigos ou coletar itens
            debugMessage("Iniciando auto farm...")
            -- Aqui entra a lógica do farm, seja para matar inimigos ou coletar recursos
            wait(2)
        end
    end)
end

-- Função para Ativar Auto Quest
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            -- Lógica para aceitar missões automaticamente
            debugMessage("Aceitando missões automaticamente...")
            -- Aqui entra a lógica para aceitar e completar missões
            wait(5)
        end
    end)
end

-- Ativar funções com toggles no GUI
FarmSection:NewToggle("Auto Farm", "Farmar inimigos automaticamente", function(state)
    getgenv().Auto_Farm = state
    if state then autoFarm() end
end)

FarmSection:NewToggle("Auto Quest", "Aceitar missões automaticamente", function(state)
    getgenv().Auto_Quest = state
    if state then autoQuest() end
end)

FarmSection:NewToggle("Coletar Grifts", "Coletar todos os Grifts", function(state)
    getgenv().Collect_Grifts = state
    if state then collectGrifts() end
end)

FarmSection:NewToggle("Coletar Cards", "Coletar todos os Cards", function(state)
    getgenv().Collect_Cards = state
    if state then collectCards() end
end)

FarmSection:NewToggle("Coletar Nova Espada", "Coletar a nova espada", function(state)
    getgenv().Collect_New_Sword = state
    if state then collectNewSword() end
end)

FarmSection:NewToggle("Coletar História da Arma Nova", "Coletar história da nova arma", function(state)
    getgenv().Collect_New_Weapon_History = state
    if state then collectNewWeaponHistory() end
end)

FarmSection:NewToggle("Coletar Raça Dragão", "Coletar Raça Dragão", function(state)
    getgenv().Collect_Dragon_Race = state
    if state then collectDragonRace() end
end)

FarmSection:NewToggle("Farmar Chamas Vermelhas", "Farmar chamas vermelhas", function(state)
    getgenv().Farm_Red_Flames = state
    if state then farmRedFlames() end
end)

debugMessage("Funções de coleta e farm configuradas com sucesso!")