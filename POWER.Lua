-- URL do script original
local scriptUrl = "https://raw.githubusercontent.com/realredz/BloxFruits/main/Farm.lua"

-- Função para carregar o script do GitHub
local function loadScript(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        loadstring(result)()  -- Carrega e executa o script
    else
        warn("Erro ao carregar o script: " .. result)
    end
end

-- Chama a função para carregar o script
loadScript(scriptUrl)

-- Função de depuração para verificar se tudo está funcionando
local function debugMessage(message)
    print("[DEBUG] " .. message)
end

-- Configurações Iniciais
getgenv().Auto_Farm = true
getgenv().Auto_Quest = true
getgenv().Anti_Ban = true
getgenv().Auto_AFK = true
getgenv().Infinite_Health = true

-- Função Anti-AFK
local function antiAFK()
    spawn(function()
        while getgenv().Auto_AFK do
            debugMessage("Anti-AFK ativado")  -- Depuração
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end)
            wait(10)  -- Aguarda 10 segundos entre as verificações
        end
    end)
end

-- Função de Auto-Farm
local function autoFarm()
    spawn(function()
        while getgenv().Auto_Farm do
            debugMessage("Iniciando Auto-Farm...")  -- Depuração
            -- Simulando a coleta de recursos, você pode substituir com a lógica de coleta real
            for _, item in pairs(game.Workspace:GetChildren()) do
                if item:IsA("Model") and item:FindFirstChild("HumanoidRootPart") then
                    debugMessage("Item encontrado: " .. item.Name)  -- Depuração
                    -- Coletando o item ou interagindo com ele (adicione sua lógica aqui)
                end
            end
            wait(2)  -- Aguarda 2 segundos antes de tentar novamente
        end
    end)
end

-- Função de Auto-Quest (simula a aceitação e conclusão de missões)
local function autoQuest()
    spawn(function()
        while getgenv().Auto_Quest do
            debugMessage("Iniciando Auto-Quest...")  -- Depuração
            -- Substitua esta lógica para aceitar e completar quests reais no seu jogo
            local quests = game.Workspace:FindFirstChild("Quests")
            if quests then
                debugMessage("Iniciando a primeira quest...")
                -- Aqui você pode adicionar a lógica para aceitar uma quest
                -- E então, completar os objetivos da quest
            end
            wait(5)  -- Aguarda 5 segundos antes de tentar novamente
        end
    end)
end

-- Função de Infinite Health (garante que o jogador tenha saúde infinita)
local function infiniteHealth()
    spawn(function()
        while getgenv().Infinite_Health do
            debugMessage("Ativando Infinite Health...")  -- Depuração
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
            wait(1)  -- Ajusta a saúde a cada segundo
        end
    end)
end

-- Função de Anti-Ban (simples implementação para proteger contra banimentos)
local function antiBan()
    spawn(function()
        while getgenv().Anti_Ban do
            debugMessage("Anti-Ban ativado...")  -- Depuração
            -- Verifique se há alguma proteção contra banimento (você pode personalizar conforme necessário)
            -- Normalmente, você pode bloquear eventos que indicam atividade suspeita
            wait(10)  -- Aguarda 10 segundos entre as verificações
        end
    end)
end

-- Função para carregar o script e as funções adicionais
local function loadAndActivateScript()
    debugMessage("Iniciando script...")  -- Depuração

    -- Chama as funções básicas
    antiAFK()
    autoFarm()
    autoQuest()
    infiniteHealth()
    antiBan()

    debugMessage("Script iniciado e funções básicas ativadas!")  -- Depuração
end

-- Carrega o script e ativa as funções
loadAndActivateScript()
