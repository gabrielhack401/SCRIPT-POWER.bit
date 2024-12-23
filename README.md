# SCRIPT-POWER.bit
-- Configurações Iniciais
getgenv().Team = "Marines" -- Escolha inicial: "Marines" ou "Pirates"
getgenv().Hide_Menu = false
getgenv().Anti_Ban = true
getgenv().Infinite_Health = true
getgenv().Infinite_Stamina = true
getgenv().Auto_Farm = false
getgenv().Auto_Quest = false
getgenv().Fast_Attack = false
getgenv().Auto_Haki = false
getgenv().Devil_Fruit_Notifier = false
getgenv().Auto_Chest = false
getgenv().Auto_Boss = false
getgenv().Auto_AFK = true
getgenv().Collect_Items = true -- Nova função de coletar itens
getgenv().Buy_Items = true -- Nova função de comprar itens
getgenv().Raid = false -- Nova função de Raid
getgenv().Buy_Fruits = true -- Compra de frutas automáticas
getgenv().Buy_Guns_Swords = true -- Compra de Armas e Espadas
getgenv().Combat_Style_Automatic = true -- Estilos de luta automáticos
getgenv().Haki_Observation_V2 = true -- Haki da Observação V2 Automático
getgenv().TTK = true -- Função de TTK (Time to Kill)

-- Funções Utilitárias

-- Coletar itens automaticamente
local function collectItems()
    spawn(function()
        while getgenv().Collect_Items do
            for _, item in pairs(game.Workspace:GetChildren()) do
                if item:IsA("Model") and item:FindFirstChild("HumanoidRootPart") then
                    -- Identificar e coletar itens específicos (exemplo: frutas, armas, etc.)
                    if item.Name == "Fruit" or item.Name == "Katakuri" or item.Name == "Sword" then
                        -- Coletar o item
                        item:Destroy()
                    end
                end
            end
            wait(1)
        end
    end)
end

-- Comprar itens automaticamente
local function buyItems()
    spawn(function()
        while getgenv().Buy_Items do
            -- Exemplo de como comprar itens (a lógica de compra dependeria do jogo)
            -- Aqui você deve adaptar com a lógica do seu jogo
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                -- Exemplo para comprar uma espada ou arma
                if money >= 1000 then
                    -- Comprar espada (adapte para o item que deseja)
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "Sword")
                end
            end
            wait(2)
        end
    end)
end

-- Função de Raid Automática
local function autoRaid()
    spawn(function()
        while getgenv().Raid do
            -- Logica para entrar e completar Raids automaticamente
            -- Este é um exemplo genérico que você deve adaptar conforme a estrutura do seu jogo
            local raid = game.Workspace:FindFirstChild("Raid")
            if raid then
                -- Entrar na raid automaticamente
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = raid.CFrame
                -- Iniciar a raid
                game.ReplicatedStorage.Raid:FireServer("Start")
            end
            wait(5)
        end
    end)
end

-- Função de comprar Frutas do Diabo
local function buyDevilFruits()
    spawn(function()
        while getgenv().Buy_Fruits do
            -- Lógica para comprar frutas (adapte conforme a mecânica do jogo)
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                if money >= 5000 then
                    -- Comprar fruta automaticamente (substitua com as frutas do jogo)
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "DevilFruit")
                end
            end
            wait(5)
        end
    end)
end

-- Comprar Armas e Espadas
local function buyGunsAndSwords()
    spawn(function()
        while getgenv().Buy_Guns_Swords do
            -- Lógica para comprar armas e espadas
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                if money >= 2000 then
                    -- Comprar Espada ou Arma
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "Gun")
                end
            end
            wait(5)
        end
    end)
end

-- Função para Estilos de Luta Automáticos
local function autoCombatStyle()
    spawn(function()
        while getgenv().Combat_Style_Automatic do
            -- Exemplo para usar um estilo de luta específico automaticamente
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                -- Usar Estilo de Luta
                game.ReplicatedStorage:WaitForChild("CombatStyle"):FireServer("Activate", "SwordStyle")
            end
            wait(2)
        end
    end)
end

-- Função de Haki da Observação V2 Automático
local function autoHakiObservationV2()
    spawn(function()
        while getgenv().Haki_Observation_V2 do
            -- Ativar Haki da Observação V2
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                -- Lógica para ativar o Haki da Observação V2
                game.ReplicatedStorage:WaitForChild("Haki"):FireServer("Activate", "ObservationV2")
            end
            wait(5)
        end
    end)
end

-- Função TTK (Time to Kill)
local function TTK()
    spawn(function()
        while getgenv().TTK do
            -- Lógica para otimizar o tempo de eliminação (ex: aumentando a velocidade de ataque ou dano)
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                -- Exemplo de ataque mais rápido
                player.Character.Humanoid.WalkSpeed = 100
            end
            wait(1)
        end
    end)
end

-- Carregar o script principal com fallback
local function loadScript()
    local success, err = pcall(function()
        -- Link principal
        loadstring(game:HttpGet("https://apixerohub.x10.mx/main.lua"))()
    end)

    if not success then
        warn("[POWER.bit]: Erro ao carregar o script principal. Tentando fallback...")
        warn(err)
        
        -- Link de fallback
        local fallback_success, fallback_err = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/fallbackScriptLink"))()
        end)

        if not fallback_success then
            warn("[POWER.bit]: Falha ao carregar o script de fallback. Verifique sua conexão.")
            warn(fallback_err)
        else
            print("[POWER.bit]: Script de fallback carregado com sucesso!")
        end
    else
        print("[POWER.bit]: Script principal carregado com sucesso!")
    end
end

-- Função de Anti-AFK
local function antiAFK()
    spawn(function()
        while getgenv().Auto_AFK do
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end)
            wait(10)
        end
    end)
end

-- Função de coleta de itens
local function collectItems()
    spawn(function()
        while getgenv().Collect_Items do
            for _, item in pairs(game.Workspace:GetChildren()) do
                if item:IsA("Model") and item:FindFirstChild("HumanoidRootPart") then
                    -- Identificar e coletar itens específicos (exemplo: frutas, armas, etc.)
                    if item.Name == "Fruit" or item.Name == "Katakuri" or item.Name == "Sword" then
                        -- Coletar o item
                        item:Destroy()
                    end
                end
            end
            wait(1)
        end
    end)
end

-- Função de compra de itens
local function buyItems()
    spawn(function()
        while getgenv().Buy_Items do
            -- Exemplo de como comprar itens (a lógica de compra dependeria do jogo)
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                -- Exemplo para comprar uma espada ou arma
                if money >= 1000 then
                    -- Comprar espada (adapte para o item que deseja)
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "Sword")
                end
            end
            wait(2)
        end
    end)
end

-- Função de raid automática
local function autoRaid()
    spawn(function()
        while getgenv().Raid do
            -- Lógica para entrar e completar Raids automaticamente
            local raid = game.Workspace:FindFirstChild("Raid")
            if raid then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = raid.CFrame
                game.ReplicatedStorage.Raid:FireServer("Start")
            end
            wait(5)
        end
    end)
end

-- Inicializar todas as funções automáticas
collectItems()
buyItems()
autoRaid()
buyDevilFruits()
buyGunsAndSwords()
autoCombatStyle()
autoHakiObservationV2()
TTK()
antiAFK()
loadScript()

print("[POWER.bit]: Script carregado com sucesso e funcionalidades automáticas ativadas!")
