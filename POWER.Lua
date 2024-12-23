-- Configurações Iniciais
getgenv().Team = "Marines" -- Escolha inicial: "Marines" ou "Pirates"
getgenv().Hide_Menu = true
getgenv().Anti_Ban = true
getgenv().Infinite_Health = true
getgenv().Infinite_Stamina = true
getgenv().Auto_Farm = true
getgenv().Auto_Quest = true
getgenv().Fast_Attack = true
getgenv().Auto_Haki = true
getgenv().Devil_Fruit_Notifier = true
getgenv().Auto_Chest = true
getgenv().Auto_Boss = true
getgenv().Auto_AFK = true
getgenv().Collect_Items = true -- Nova função de coletar itens
getgenv().Buy_Items = true -- Nova função de comprar itens
getgenv().Raid = true -- Nova função de Raid
getgenv().Buy_Fruits = true -- Compra de frutas automáticas
getgenv().Buy_Guns_Swords = true -- Compra de Armas e Espadas
getgenv().Combat_Style_Automatic = true -- Estilos de luta automáticos
getgenv().Haki_Observation_V2 = true -- Haki da Observação V2 Automático
getgenv().TTK = true -- Função de TTK (Time to Kill)

-- Função de Depuração
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Funções Utilitárias

-- Coletar itens automaticamente
local function collectItems()
    spawn(function()
        while getgenv().Collect_Items do
            debugMessage("Coletando itens...")  -- Debug
            for _, item in pairs(game.Workspace:GetChildren()) do
                if item:IsA("Model") and item:FindFirstChild("HumanoidRootPart") then
                    if item.Name == "Fruit" or item.Name == "Katakuri" or item.Name == "Sword" then
                        debugMessage("Item encontrado: " .. item.Name)  -- Debug
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
            debugMessage("Verificando se pode comprar itens...")  -- Debug
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                if money >= 1000 then
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "Sword")
                    debugMessage("Item comprado: Sword")  -- Debug
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
            debugMessage("Iniciando Raid...")  -- Debug
            local raid = game.Workspace:FindFirstChild("Raid")
            if raid then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = raid.CFrame
                game.ReplicatedStorage.Raid:FireServer("Start")
                debugMessage("Raid iniciada.")  -- Debug
            end
            wait(5)
        end
    end)
end

-- Função de compra de Frutas do Diabo
local function buyDevilFruits()
    spawn(function()
        while getgenv().Buy_Fruits do
            debugMessage("Verificando se pode comprar frutas...")  -- Debug
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                if money >= 5000 then
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "DevilFruit")
                    debugMessage("Fruta comprada!")  -- Debug
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
            debugMessage("Verificando se pode comprar armas...")  -- Debug
            if game.Players.LocalPlayer:FindFirstChild("Money") then
                local money = game.Players.LocalPlayer.Money.Value
                if money >= 2000 then
                    game.ReplicatedStorage:WaitForChild("Shop"):FireServer("BuyItem", "Gun")
                    debugMessage("Arma comprada!")  -- Debug
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
            debugMessage("Ativando estilo de luta automático...")  -- Debug
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                game.ReplicatedStorage:WaitForChild("CombatStyle"):FireServer("Activate", "SwordStyle")
                debugMessage("Estilo de luta ativado.")  -- Debug
            end
            wait(2)
        end
    end)
end

-- Função de Haki da Observação V2 Automático
local function autoHakiObservationV2()
    spawn(function()
        while getgenv().Haki_Observation_V2 do
            debugMessage("Ativando Haki da Observação V2...")  -- Debug
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                game.ReplicatedStorage:WaitForChild("Haki"):FireServer("Activate", "ObservationV2")
                debugMessage("Haki da Observação V2 ativado.")  -- Debug
            end
            wait(5)
        end
    end)
end

-- Função TTK (Time to Kill)
local function TTK()
    spawn(function()
        while getgenv().TTK do
            debugMessage("Ativando TTK...")  -- Debug
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 100
                debugMessage("TTK ativado!")  -- Debug
            end
            wait(1)
        end
    end)
end

-- Função de Anti-AFK
local function antiAFK()
    spawn(function()
        while getgenv().Auto_AFK do
            debugMessage("Anti-AFK ativado...")  -- Debug
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end)
            wait(10)
        end
    end)
end

-- Função para carregar o script
local function loadScript()
    debugMessage("Iniciando script...")  -- Debug
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gabrielhack401/SCRIPT-POWER.bit/main/POWER.Lua"))()
    end)

    if not success then
        warn("[POWER.bit]: Erro ao carregar o script principal. Tentando fallback...")
        warn(err)
        
        local fallback_success, fallback_err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gabrielhack401/SCRIPT-POWER.bit/main/POWER.Lua"))()
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
