-- Variáveis de Controle de Funções
local menuStatus = {
    SEA1Enabled = true,
    SEA2Enabled = true,
    SEA3Enabled = true,
    SpecialAbilitiesEnabled = true,
    NPCInteractionsEnabled = true,
    CombatEventsEnabled = true,
    GroupSkillsEnabled = true,
    OverallProgressEnabled = true,
    CheckEndGameEnabled = true,
    SpecialEventsEnabled = true,
    ObjectInteractionsEnabled = true
}

-- Função de Verificação de Ativação de Funções
function isFunctionEnabled(functionName)
    return menuStatus[functionName] or false
end

-- Função para Ativar ou Desativar Funções
function toggleFunction(functionName, isEnabled)
    menuStatus[functionName] = isEnabled
    print(functionName .. " agora está " .. (isEnabled and "ativado" or "desativado"))
end

-- Função para Exibir o Menu de Configuração
function showMenu(player)
    print("Menu de Funções de Blox Fruits: ")

    -- Exibição de Funções
    print("1. Ativar/Desativar SEA1 - " .. (isFunctionEnabled("SEA1Enabled") and "Ativado" or "Desativado"))
    print("2. Ativar/Desativar SEA2 - " .. (isFunctionEnabled("SEA2Enabled") and "Ativado" or "Desativado"))
    print("3. Ativar/Desativar SEA3 - " .. (isFunctionEnabled("SEA3Enabled") and "Ativado" or "Desativado"))
    print("4. Ativar/Desativar Habilidades Especiais - " .. (isFunctionEnabled("SpecialAbilitiesEnabled") and "Ativado" or "Desativado"))
    print("5. Ativar/Desativar Interações com NPCs - " .. (isFunctionEnabled("NPCInteractionsEnabled") and "Ativado" or "Desativado"))
    print("6. Ativar/Desativar Eventos de Combate - " .. (isFunctionEnabled("CombatEventsEnabled") and "Ativado" or "Desativado"))
    print("7. Ativar/Desativar Habilidades de Grupo - " .. (isFunctionEnabled("GroupSkillsEnabled") and "Ativado" or "Desativado"))
    print("8. Ativar/Desativar Progresso Geral - " .. (isFunctionEnabled("OverallProgressEnabled") and "Ativado" or "Desativado"))
    print("9. Ativar/Desativar Fim de Jogo - " .. (isFunctionEnabled("CheckEndGameEnabled") and "Ativado" or "Desativado"))
    print("10. Ativar/Desativar Eventos Especiais - " .. (isFunctionEnabled("SpecialEventsEnabled") and "Ativado" or "Desativado"))
    print("11. Ativar/Desativar Interações com Objetos - " .. (isFunctionEnabled("ObjectInteractionsEnabled") and "Ativado" or "Desativado"))
end

-- Função para Detectar a Fase (SEA1, SEA2, SEA3) e Executar Ações
function detectSea(player)
    local position = player.Character.HumanoidRootPart.Position
    local SEA1_area = {Vector3.new(-5000, 0, -5000), Vector3.new(5000, 0, 5000)}
    local SEA2_area = {Vector3.new(5001, 0, 5001), Vector3.new(10000, 0, 10000)}
    local SEA3_area = {Vector3.new(10001, 0, 10001), Vector3.new(15000, 0, 15000)}

    -- Detecção das Áreas SEA
    if position.X >= SEA1_area[1].X and position.X <= SEA1_area[2].X and position.Z >= SEA1_area[1].Z and position.Z <= SEA1_area[2].Z then
        if isFunctionEnabled("SEA1Enabled") then
            onEnterSEA1(player)
        end
    elseif position.X >= SEA2_area[1].X and position.X <= SEA2_area[2].X and position.Z >= SEA2_area[1].Z and position.Z <= SEA2_area[2].Z then
        if isFunctionEnabled("SEA2Enabled") then
            onEnterSEA2(player)
        end
    elseif position.X >= SEA3_area[1].X and position.X <= SEA3_area[2].X and position.Z >= SEA3_area[1].Z and position.Z <= SEA3_area[2].Z then
        if isFunctionEnabled("SEA3Enabled") then
            onEnterSEA3(player)
        end
    end
end

-- Função ao Entrar no SEA1
function onEnterSEA1(player)
    print(player.Name .. " entrou no First Sea!")
    player.Character.Humanoid.WalkSpeed = 16
    if isFunctionEnabled("NPCInteractionsEnabled") then
        setNPCInteractions(player, "SEA1")
    end
end

-- Função ao Entrar no SEA2
function onEnterSEA2(player)
    print(player.Name .. " entrou no Second Sea!")
    player.Character.Humanoid.WalkSpeed = 20
    if isFunctionEnabled("NPCInteractionsEnabled") then
        setNPCInteractions(player, "SEA2")
    end
end

-- Função ao Entrar no SEA3
function onEnterSEA3(player)
    print(player.Name .. " entrou no Third Sea!")
    player.Character.Humanoid.WalkSpeed = 25
    if isFunctionEnabled("NPCInteractionsEnabled") then
        setNPCInteractions(player, "SEA3")
    end
end

-- Função para Interagir com NPCs dependendo da Fase
function setNPCInteractions(player, sea)
    if sea == "SEA1" then
        print(player.Name .. " está interagindo com NPCs do SEA1")
    elseif sea == "SEA2" then
        print(player.Name .. " está interagindo com NPCs do SEA2")
    elseif sea == "SEA3" then
        print(player.Name .. " está interagindo com NPCs do SEA3")
    end
end

-- Função de Habilidade Especial do Jogador
function useSpecialAbility(player)
    if isFunctionEnabled("SpecialAbilitiesEnabled") then
        if player.Character.Humanoid.Health > 50 then
            print(player.Name .. " usou a habilidade especial!")
        else
            print(player.Name .. " precisa de mais saúde para usar a habilidade especial.")
        end
    end
end

-- Função de Eventos de Combate
function combatEvent(player)
    if isFunctionEnabled("CombatEventsEnabled") then
        local isCombatActive = math.random(1, 100) <= 50
        if isCombatActive then
            print(player.Name .. " está em combate!")
        end
    end
end

-- Função de Habilidade de Grupo
function groupSkill(player, group)
    if isFunctionEnabled("GroupSkillsEnabled") then
        print(player.Name .. " usou uma habilidade de grupo com " .. group)
    end
end

-- Função para Verificar Progresso Geral do Jogador
function overallProgress(player)
    if isFunctionEnabled("OverallProgressEnabled") then
        local sea1Progress = player.leaderstats.SEA1Progress.Value
        local sea2Progress = player.leaderstats.SEA2Progress.Value
        local sea3Progress = player.leaderstats.SEA3Progress.Value
        print(player.Name .. "'s progresso: SEA1 - " .. sea1Progress .. ", SEA2 - " .. sea2Progress .. ", SEA3 - " .. sea3Progress)
    end
end

-- Função para Verificar Se o Jogador Completou o Jogo
function checkEndGame(player)
    if isFunctionEnabled("CheckEndGameEnabled") then
        local allSeasComplete = player.leaderstats.SEA1Progress.Value >= 100 and
                                player.leaderstats.SEA2Progress.Value >= 100 and
                                player.leaderstats.SEA3Progress.Value >= 100
        if allSeasComplete then
            print(player.Name .. " completou todos os mares e venceu o jogo!")
        else
            print(player.Name .. " ainda precisa completar mais fases.")
        end
    end
end

-- Função de Eventos Especiais
function checkSpecialEvents(player)
    if isFunctionEnabled("SpecialEventsEnabled") then
        local currentTime = os.date("*t")
        if currentTime.month == 12 then
            print(player.Name .. " está participando de evento especial de Natal!")
        end
    end
end

-- Função de Interação com Objetos
function objectInteraction(player, object)
    if isFunctionEnabled("ObjectInteractionsEnabled") then
        if object == "treasure" then
-- Função de Interação com Objetos (continuação)
function objectInteraction(player, object)
    if isFunctionEnabled("ObjectInteractionsEnabled") then
        if object == "treasure" then
            print(player.Name .. " encontrou um tesouro!")
            -- Exemplo de ações ao interagir com tesouro, como ganhar itens
            player.leaderstats.TreasureCount.Value = player.leaderstats.TreasureCount.Value + 1
        elseif object == "chest" then
            print(player.Name .. " abriu um baú!")
            -- Exemplo de ações ao abrir um baú, pode ser randomizado
            local randomReward = math.random(1, 100)
            if randomReward <= 50 then
                print(player.Name .. " recebeu uma recompensa rara!")
            else
                print(player.Name .. " recebeu uma recompensa comum.")
            end
        elseif object == "questGiver" then
            print(player.Name .. " iniciou uma missão!")
            -- Ações quando o jogador interage com um NPC de missão
            startQuest(player)
        else
            print(player.Name .. " interagiu com um objeto desconhecido!")
        end
    end
end

-- Função para Iniciar Missão
function startQuest(player)
    if isFunctionEnabled("NPCInteractionsEnabled") then
        -- Lógica para iniciar uma missão
        local questName = "Busca pelo Tesouro"
        player.leaderstats.QuestStatus.Value = "Em progresso"
        print(player.Name .. " iniciou a missão: " .. questName)
        -- O status de progresso da missão pode ser atualizado dependendo das ações do jogador
    end
end

-- Função para Concluir Missão
function completeQuest(player)
    if isFunctionEnabled("NPCInteractionsEnabled") then
        -- Lógica para completar a missão
        local questName = "Busca pelo Tesouro"
        player.leaderstats.QuestStatus.Value = "Concluída"
        print(player.Name .. " concluiu a missão: " .. questName)
        -- Recompensa ou novos objetivos podem ser dados após a conclusão
        player.leaderstats.MissionPoints.Value = player.leaderstats.MissionPoints.Value + 10
    end
end

-- Função para Evento de Recompensa por Combate
function combatReward(player, enemy)
    if isFunctionEnabled("CombatEventsEnabled") then
        -- Verificando se o jogador derrotou o inimigo
        if enemy.Health <= 0 then
            print(player.Name .. " derrotou o inimigo!")
            -- Recompensa após a vitória
            player.leaderstats.BattleWins.Value = player.leaderstats.BattleWins.Value + 1
            -- Premiação por combate
            local combatReward = math.random(10, 50)
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + combatReward
            print(player.Name .. " recebeu " .. combatReward .. " moedas por vencer o combate.")
        end
    end
end

-- Função para Atualizar Progresso em MISSÕES
function updateMissionProgress(player, missionName, progress)
    if isFunctionEnabled("OverallProgressEnabled") then
        if missionName == "Busca pelo Tesouro" then
            player.leaderstats.MissionProgress.Value = progress
            print(player.Name .. " atualizou o progresso da missão: " .. missionName .. " para " .. progress .. "%")
        end
    end
end

-- Função para Verificação de Todos os Objetos Interativos
function checkInteractiveObjects(player)
    if isFunctionEnabled("ObjectInteractionsEnabled") then
        -- Exemplo de como checar objetos interativos na área do jogador
        local nearbyObjects = {"treasure", "chest", "questGiver"}
        for _, object in ipairs(nearbyObjects) do
            objectInteraction(player, object)
        end
    end
end

-- Função Principal de Execução Contínua
function mainLoop(player)
    -- Verifica o menu e as ações que podem ser feitas
    showMenu(player)

    -- Detecta a fase atual e executa ações específicas
    detectSea(player)

    -- Realiza ações de combate
    combatEvent(player)

    -- Atualiza o progresso geral do jogador
    overallProgress(player)

    -- Verifica eventos especiais, como eventos de temporada
    checkSpecialEvents(player)

    -- Interage com objetos próximos ao jogador
    checkInteractiveObjects(player)

    -- A cada ciclo, o jogo verifica as missões e recompensa os jogadores
    if player.leaderstats.QuestStatus.Value == "Em progresso" then
        updateMissionProgress(player, "Busca pelo Tesouro", player.leaderstats.MissionProgress.Value + 1)
    end

    -- Verifica o fim do jogo
    checkEndGame(player)

    -- Aguarda um pequeno intervalo antes de rodar o loop novamente
    wait(1)
end

-- Inicialização do Jogo e Definição de "Player" (Jogador)
game.Players.PlayerAdded:Connect(function(player)
    -- Adicionando leaderstats (estatísticas principais) para o jogador
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Estatísticas de Progresso e Missões
    local SEA1Progress = Instance.new("IntValue")
    SEA1Progress.Name = "SEA1Progress"
    SEA1Progress.Value = 0
    SEA1Progress.Parent = leaderstats

    local SEA2Progress = Instance.new("IntValue")
    SEA2Progress.Name = "SEA2Progress"
    SEA2Progress.Value = 0
    SEA2Progress.Parent = leaderstats

    local SEA3Progress = Instance.new("IntValue")
    SEA3Progress.Name = "SEA3Progress"
    SEA3Progress.Value = 0
    SEA3Progress.Parent = leaderstats

    local QuestStatus = Instance.new("StringValue")
    QuestStatus.Name = "QuestStatus"
    QuestStatus.Value = "Nenhuma"
    QuestStatus.Parent = leaderstats

    local MissionPoints = Instance.new("IntValue")
    MissionPoints.Name = "MissionPoints"
    MissionPoints.Value = 0
    MissionPoints.Parent = leaderstats

    local BattleWins = Instance.new("IntValue")
    BattleWins.Name = "BattleWins"
    BattleWins.Value = 0
    BattleWins.Parent = leaderstats

    local Coins = Instance.new("IntValue")
    Coins.Name = "Coins"
    Coins.Value = 0
    Coins.Parent = leaderstats

    local TreasureCount = Instance.new("IntValue")
    TreasureCount.Name = "TreasureCount"
    TreasureCount.Value = 0
    TreasureCount.Parent = leaderstats

    -- Loop contínuo de execução
    while true do
        mainLoop(player)
    end
end)