-- Configurações do Script
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Libraries/Kavo-UI-Library/main/KavoUI.lua"))()
local Window = Library.CreateLib("Blox Fruits Script - Coleta de Frutas", "DarkTheme")

-- Mensagem Inicial
print("============================================")
print("BEM VINDO(A) A POWER.bit SCRIPT!")
print("============================================")

-- Ativar coleta automática de frutas
local AutoFruitCollect = true

-- Verificar se a fruta é do tipo Haki ou normal
local function isHakiOrFruit(fruit)
    local hakiColors = {"Black", "Purple", "Red", "Blue", "White", "Green"} -- Exemplos de cores de Haki
    if fruit.Name:match("Fruit") then
        return true
    end
    for _, color in ipairs(hakiColors) do
        if fruit.Name:match(color) then
            return true
        end
    end
    return false
end

-- Função para coletar frutas automaticamente
local function collectFruits()
    spawn(function()
        while AutoFruitCollect do
            for _, fruit in pairs(game.Workspace:GetChildren()) do
                if fruit:IsA("Model") and isHakiOrFruit(fruit) and fruit:FindFirstChild("Hitbox") then
                    fireclickdetector(fruit.Hitbox)
                    print("Fruta coletada: " .. fruit.Name)
                    -- Enviar notificação
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Fruta Coletada",
                        Text = fruit.Name,
                        Duration = 5,
                    })
                end
            end
            wait(1) -- Verificar novamente após 1 segundo
        end
    end)
end

-- Iniciar coleta automática de frutas
collectFruits()

-- Mensagem Final
print("============================================")
print("O script de coleta de frutas foi iniciado!")
print("============================================")
