-- =============================================
-- BLOX FRUITS SCRIPT - DELTA EXECUTOR (MOBILE)
-- MENU AJUSTÁVEL - FUNÇÕES OTIMIZADAS
-- =============================================

print("🔥 CARREGANDO PARA DELTA...")

-- Verificar se já existe menu
if _G.DeltaMenu and _G.DeltaMenu.Enabled then
    _G.DeltaMenu:Destroy()
end

-- =============================================
-- CARREGAR BIBLIOTECA KAVO UI
-- =============================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🔥 BLOX FRUITS POWER 🔥", "DarkTheme")

_G.DeltaMenu = Window

print("✅ Menu Delta carregado!")

-- =============================================
-- CONFIGURAÇÕES
-- =============================================
getgenv().Config = {
    AutoFarm = false,
    AutoTeleport = false,
    AutoQuest = false,
    AutoUpgrade = false,
    AutoBuso = false,
    AutoInstinto = false,
    InfiniteLife = false,
    InfiniteStamina = false,
    AutoCollect = false,
    AutoKillAura = false,
    AutoDungeon = false,
}

-- =============================================
-- FUNÇÕES AUXILIARES (OTIMIZADAS PARA DELTA)
-- =============================================
local function getCharacter()
    local player = game.Players.LocalPlayer
    if not player then return nil end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    return char
end

local function getPlayerLevel()
    local player = game.Players.LocalPlayer
    if not player then return 1 end
    local level = player:FindFirstChild("Data") and player.Data:FindFirstChild("Level")
    return level and level.Value or 1
end

local function teleportTo(targetPos)
    local char = getCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(targetPos)
    end
end

local function findNearestEnemy()
    local char = getCharacter()
    if not char then return nil end
    local root = char.HumanoidRootPart
    local playerLevel = getPlayerLevel()
    
    local best = nil
    local bestDist = math.huge
    
    for _, obj in pairs(game.Workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
            if obj:FindFirstChild("HumanoidRootPart") then
                local dist = (obj.HumanoidRootPart.Position - root.Position).magnitude
                if dist < bestDist and dist < 300 then
                    bestDist = dist
                    best = obj
                end
            end
        end
    end
    return best
end

-- =============================================
-- MÉTODO DE ATAQUE PARA DELTA (SEM VirtualInputManager)
-- =============================================
local function attackDelta()
    pcall(function()
        -- Método 1: Tentar com o remoto de combate
        local combatRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
        if combatRemote then
            local attackRemote = combatRemote:FindFirstChild("Attack")
            if attackRemote then
                attackRemote:FireServer()
                return
            end
        end
        
        -- Método 2: Tentar com o remoto de dano
        local damageRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Damage")
        if damageRemote then
            damageRemote:FireServer()
            return
        end
        
        -- Método 3: Tentar com o remoto de combate genérico
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Combat")
        if remote then
            remote:FireServer()
            return
        end
        
        -- Método 4: Simular clique com mouse (funciona em alguns celulares)
        pcall(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            if mouse then
                mouse.Button1Down:Fire()
                task.wait(0.05)
                mouse.Button1Up:Fire()
            end
        end)
    end)
end

-- =============================================
-- FUNÇÕES PRINCIPAIS (OTIMIZADAS)
-- =============================================

-- 1. AUTO FARM (SEM VirtualInputManager)
local function autoFarmLoop()
    spawn(function()
        while getgenv().Config.AutoFarm do
            local char = getCharacter()
            if not char then task.wait(1) continue end
            
            local enemy = findNearestEnemy()
            if enemy then
                char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)
                task.wait(0.3)
                attackDelta()
                task.wait(0.5)
            else
                task.wait(1)
            end
        end
    end)
end

-- 2. AUTO TELEPORT
local function autoTeleportLoop()
    spawn(function()
        while getgenv().Config.AutoTeleport do
            local level = getPlayerLevel()
            local islandPos = Vector3.new(0, 80, 0)
            
            if level <= 30 then
                islandPos = Vector3.new(-1000, 80, -1000)
            elseif level <= 60 then
                islandPos = Vector3.new(-500, 80, 1500)
            elseif level <= 100 then
                islandPos = Vector3.new(1000, 80, 2000)
            elseif level <= 150 then
                islandPos = Vector3.new(2500, 80, 2000)
            elseif level <= 200 then
                islandPos = Vector3.new(2500, 500, 2500)
            elseif level <= 300 then
                islandPos = Vector3.new(4000, 80, 4000)
            elseif level <= 400 then
                islandPos = Vector3.new(4500, 80, 5000)
            elseif level <= 500 then
                islandPos = Vector3.new(5000, 80, 5000)
            else
                islandPos = Vector3.new(6000, 80, 6000)
            end
            
            teleportTo(islandPos)
            task.wait(5)
        end
    end)
end

-- 3. AUTO QUEST
local function autoQuestLoop()
    spawn(function()
        while getgenv().Config.AutoQuest do
            local char = getCharacter()
            if not char then task.wait(1) continue end
            
            for _, obj in pairs(game.Workspace:GetChildren()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj.Name:match("Quest") then
                    if obj:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = obj.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                        task.wait(1)
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", obj.Name)
                        end)
                        break
                    end
                end
            end
            task.wait(5)
        end
    end)
end

-- 4. AUTO UPGRADE STATS
local function autoUpgradeLoop()
    spawn(function()
        while getgenv().Config.AutoUpgrade do
            pcall(function()
                local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
                if remote then
                    remote:InvokeServer("AddPoint", "Melee", 1)
                    remote:InvokeServer("AddPoint", "Defense", 1)
                    remote:InvokeServer("AddPoint", "Sword", 1)
                    remote:InvokeServer("AddPoint", "Gun", 1)
                end
            end)
            task.wait(3)
        end
    end)
end

-- 5. AUTO BUSA
local function autoBusoLoop()
    spawn(function()
        while getgenv().Config.AutoBuso do
            local char = getCharacter()
            if char and not char:FindFirstChild("Busoshoku") then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end)
            end
            task.wait(3)
        end
    end)
end

-- 6. AUTO INSTINTO
local function autoInstintoLoop()
    spawn(function()
        while getgenv().Config.AutoInstinto do
            local char = getCharacter()
            if char and not char:FindFirstChild("Ken") then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenHaki")
                end)
            end
            task.wait(3)
        end
    end)
end

-- 7. VIDA INFINITA (FUNCIONANDO)
local function infiniteLifeLoop()
    spawn(function()
        while getgenv().Config.InfiniteLife do
            local char = getCharacter()
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = char.Humanoid.MaxHealth
            end
            task.wait(0.5)
        end
    end)
end

-- 8. STAMINA INFINITA
local function infiniteStaminaLoop()
    spawn(function()
        while getgenv().Config.InfiniteStamina do
            local char = getCharacter()
            if char then
                local stamina = char:FindFirstChild("Stamina")
                if stamina then stamina.Value = stamina.MaxValue end
                local energy = char:FindFirstChild("Energy")
                if energy then energy.Value = energy.MaxValue end
            end
            task.wait(0.5)
        end
    end)
end

-- 9. AUTO COLLECT
local function autoCollectLoop()
    spawn(function()
        while getgenv().Config.AutoCollect do
            local char = getCharacter()
            if not char then task.wait(1) continue end
            
            for _, obj in pairs(game.Workspace:GetChildren()) do
                if obj:IsA("Model") and obj.Name:match("Fruit") and obj:FindFirstChild("Handle") then
                    char.HumanoidRootPart.CFrame = obj.Handle.CFrame
                    task.wait(0.5)
                end
            end
            task.wait(3)
        end
    end)
end

-- 10. AUTO KILL AURA
local function autoKillAuraLoop()
    spawn(function()
        while getgenv().Config.AutoKillAura do
            local char = getCharacter()
            if not char then task.wait(1) continue end
            
            local root = char.HumanoidRootPart
            for _, obj in pairs(game.Workspace:GetChildren()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                    if obj:FindFirstChild("HumanoidRootPart") then
                        local dist = (obj.HumanoidRootPart.Position - root.Position).magnitude
                        if dist < 40 then
                            obj.Humanoid.Health = 0
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

-- 11. AUTO DUNGEON
local function autoDungeonLoop()
    spawn(function()
        while getgenv().Config.AutoDungeon do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Dungeon", "Start")
            end)
            task.wait(10)
        end
    end)
end

-- =============================================
-- MENU PRINCIPAL (OTIMIZADO PARA DELTA)
-- =============================================

-- Aba FARM
local FarmTab = Window:NewTab("⚔️ FARM")
local FarmSection = FarmTab:NewSection("Farm")

FarmSection:NewToggle("Auto Farm", "Ataca inimigos próximos", function(state)
    getgenv().Config.AutoFarm = state
    if state then autoFarmLoop() end
end)

FarmSection:NewToggle("Auto Teleport", "Teleporta para ilha do nível", function(state)
    getgenv().Config.AutoTeleport = state
    if state then autoTeleportLoop() end
end)

FarmSection:NewToggle("Auto Quest", "Aceita missões", function(state)
    getgenv().Config.AutoQuest = state
    if state then autoQuestLoop() end
end)

FarmSection:NewToggle("Auto Collect", "Coleta frutas", function(state)
    getgenv().Config.AutoCollect = state
    if state then autoCollectLoop() end
end)

FarmSection:NewToggle("Auto Kill Aura", "Mata inimigos próximos", function(state)
    getgenv().Config.AutoKillAura = state
    if state then autoKillAuraLoop() end
end)

FarmSection:NewToggle("Auto Dungeon", "Entra em dungeons", function(state)
    getgenv().Config.AutoDungeon = state
    if state then autoDungeonLoop() end
end)

-- Aba HAKI
local HakiTab = Window:NewTab("🌀 HAKI")
local HakiSection = HakiTab:NewSection("Haki")

HakiSection:NewToggle("Auto Buso", "Ativa Busoshoku Haki", function(state)
    getgenv().Config.AutoBuso = state
    if state then autoBusoLoop() end
end)

HakiSection:NewToggle("Auto Instinto", "Ativa Ken Haki", function(state)
    getgenv().Config.AutoInstinto = state
    if state then autoInstintoLoop() end
end)

-- Aba RECURSOS
local ResourcesTab = Window:NewTab("💎 RECURSOS")
local ResourcesSection = ResourcesTab:NewSection("Recursos")

ResourcesSection:NewToggle("Vida Infinita", "Mantém a vida cheia", function(state)
    getgenv().Config.InfiniteLife = state
    if state then infiniteLifeLoop() end
end)

ResourcesSection:NewToggle("Stamina Infinita", "Mantém stamina cheia", function(state)
    getgenv().Config.InfiniteStamina = state
    if state then infiniteStaminaLoop() end
end)

-- Aba UPGRADE
local UpgradeTab = Window:NewTab("📊 UPGRADE")
local UpgradeSection = UpgradeTab:NewSection("Upgrade")

UpgradeSection:NewToggle("Auto Upgrade Stats", "Melhora atributos", function(state)
    getgenv().Config.AutoUpgrade = state
    if state then autoUpgradeLoop() end
end)

print("✅ Script Delta carregado com sucesso!")
print("💡 Vida Infinita está funcionando!")
print("💡 As outras funções foram otimizadas para Delta")