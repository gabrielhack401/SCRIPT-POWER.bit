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
-- Função para Verificar e Ativar Eventos Especiais
function checkSpecialEvents(player)
    if isFunctionEnabled("SpecialEventsEnabled") then
        -- Exemplo de evento de temporada, como um evento de Natal ou Halloween
        local eventSeason = "Halloween"  -- Esta variável pode ser dinâmica, dependendo do tempo do jogo
        if eventSeason == "Halloween" then
            print(player.Name .. " ativou o evento especial: Halloween!")
            -- O jogador pode ganhar itens especiais ou participar de missões exclusivas
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 50
        elseif eventSeason == "Christmas" then
            print(player.Name .. " ativou o evento especial: Natal!")
            -- Outra recompensa ou evento especial
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100
        end
    end
end

-- Função para Detecção de Fase e Mudança de Objetos e Inimigos
function detectSea(player)
    if player.leaderstats.SEA1Progress.Value > 0 then
        -- O jogador está na SEA1, executa funções específicas dessa fase
        print(player.Name .. " está na fase SEA1.")
        spawnSEA1Enemies(player)
        giveSEA1Rewards(player)
    elseif player.leaderstats.SEA2Progress.Value > 0 then
        -- O jogador está na SEA2, executa funções específicas dessa fase
        print(player.Name .. " está na fase SEA2.")
        spawnSEA2Enemies(player)
        giveSEA2Rewards(player)
    elseif player.leaderstats.SEA3Progress.Value > 0 then
        -- O jogador está na SEA3, executa funções específicas dessa fase
        print(player.Name .. " está na fase SEA3.")
        spawnSEA3Enemies(player)
        giveSEA3Rewards(player)
    else
        -- Fase inicial
        print(player.Name .. " ainda não progrediu para nenhuma fase.")
    end
end

-- Função para Gerar Inimigos na SEA1
function spawnSEA1Enemies(player)
    if isFunctionEnabled("EnemySpawnsEnabled") then
        -- Criar inimigos específicos para SEA1
        local enemy = game.ServerStorage.Enemies.SEA1:Clone()
        enemy.Parent = workspace
        enemy.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(10, 0, 10))
        print("Inimigo da SEA1 apareceu!")
    end
end

-- Função para Gerar Recompensas na SEA1
function giveSEA1Rewards(player)
    if isFunctionEnabled("RewardsEnabled") then
        local reward = math.random(5, 20)
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + reward
        print(player.Name .. " recebeu " .. reward .. " moedas como recompensa por estar na SEA1.")
    end
end

-- Função para Gerar Inimigos na SEA2
function spawnSEA2Enemies(player)
    if isFunctionEnabled("EnemySpawnsEnabled") then
        -- Criar inimigos específicos para SEA2
        local enemy = game.ServerStorage.Enemies.SEA2:Clone()
        enemy.Parent = workspace
        enemy.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(10, 0, 10))
        print("Inimigo da SEA2 apareceu!")
    end
end

-- Função para Gerar Recompensas na SEA2
function giveSEA2Rewards(player)
    if isFunctionEnabled("RewardsEnabled") then
        local reward = math.random(20, 50)
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + reward
        print(player.Name .. " recebeu " .. reward .. " moedas como recompensa por estar na SEA2.")
    end
end

-- Função para Gerar Inimigos na SEA3
function spawnSEA3Enemies(player)
    if isFunctionEnabled("EnemySpawnsEnabled") then
        -- Criar inimigos específicos para SEA3
        local enemy = game.ServerStorage.Enemies.SEA3:Clone()
        enemy.Parent = workspace
        enemy.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(10, 0, 10))
        print("Inimigo da SEA3 apareceu!")
    end
end

-- Função para Gerar Recompensas na SEA3
function giveSEA3Rewards(player)
    if isFunctionEnabled("RewardsEnabled") then
        local reward = math.random(50, 100)
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + reward
        print(player.Name .. " recebeu " .. reward .. " moedas como recompensa por estar na SEA3.")
    end
end

-- Função para Exibir Menu de Configurações
function showMenu(player)
    -- Exibe um menu básico de ativação/desativação de funções
    print("Menu de Configurações para " .. player.Name)
    print("1. Habilitar/Desabilitar Interações com NPCs (NPCInteractionsEnabled)")
    print("2. Habilitar/Desabilitar Combate (CombatEventsEnabled)")
    print("3. Habilitar/Desabilitar Missões (MissionSystemEnabled)")
    print("4. Habilitar/Desabilitar Recompensas (RewardsEnabled)")
    print("Escolha a opção desejada (1-4):")
    
    -- Aqui pode ser adicionado um sistema de menu para o jogador escolher, baseado em UI
    -- Exemplo de lógica para processar a escolha do jogador
    -- Este trecho de código apenas ilustra a estrutura de menu e como ele pode ser chamado
end

-- Função para Habilitar/Desabilitar Funcionalidades
function isFunctionEnabled(functionName)
    -- Função fictícia que verifica se uma funcionalidade está habilitada ou não
    -- Baseado em variáveis globais, variáveis de configuração ou configurações de servidores
    local enabledFunctions = {
        NPCInteractionsEnabled = true,
        CombatEventsEnabled = true,
        MissionSystemEnabled = true,
        RewardsEnabled = true,
        SpecialEventsEnabled = true,
        ObjectInteractionsEnabled = true,
        EnemySpawnsEnabled = true,
        OverallProgressEnabled = true
    }
    
    return enabledFunctions[functionName] or false
end

-- Função para Notificar o Fim do Jogo
function checkEndGame(player)
    -- Função de verificação do fim do jogo
    if player.leaderstats.MissionPoints.Value >= 1000 then
        print(player.Name .. " completou o jogo com sucesso!")
        -- Aqui você pode adicionar a lógica para terminar o jogo e dar recompensas ou realizar outras ações
    end
end
-- Função para Iniciar Missão
function startMission(player, missionType)
    if isFunctionEnabled("MissionSystemEnabled") then
        -- Definindo as missões disponíveis
        local missionReward = 0
        local missionDescription = ""
        if missionType == "DefeatEnemies" then
            missionDescription = "Derrote 10 inimigos!"
            missionReward = 100  -- Recompensa pela missão
        elseif missionType == "CollectItems" then
            missionDescription = "Colete 5 itens especiais!"
            missionReward = 150
        elseif missionType == "RescueNPC" then
            missionDescription = "Resgate o NPC perdido!"
            missionReward = 200
        else
            missionDescription = "Missão não reconhecida."
            missionReward = 0
        end

        -- Registrando a missão no player
        player.leaderstats.MissionType.Value = missionType
        player.leaderstats.MissionDescription.Value = missionDescription
        player.leaderstats.MissionReward.Value = missionReward

        print(player.Name .. " iniciou a missão: " .. missionDescription)
    else
        print("Sistema de missões não habilitado.")
    end
end

-- Função para Completar Missão
function completeMission(player)
    if isFunctionEnabled("MissionSystemEnabled") then
        -- Verifica se a missão foi completada
        local missionType = player.leaderstats.MissionType.Value
        if missionType == "DefeatEnemies" and player.leaderstats.Kills.Value >= 10 then
            print(player.Name .. " completou a missão: Derrote 10 inimigos!")
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + player.leaderstats.MissionReward.Value
        elseif missionType == "CollectItems" and player.leaderstats.ItemsCollected.Value >= 5 then
            print(player.Name .. " completou a missão: Colete 5 itens especiais!")
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + player.leaderstats.MissionReward.Value
        elseif missionType == "RescueNPC" and player.leaderstats.NPCRescued.Value >= 1 then
            print(player.Name .. " completou a missão: Resgate o NPC perdido!")
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + player.leaderstats.MissionReward.Value
        else
            print("Missão ainda não completada.")
        end
    else
        print("Sistema de missões não habilitado.")
    end
end

-- Função para Iniciar Combate
function startCombat(player, enemyType)
    if isFunctionEnabled("CombatEventsEnabled") then
        local enemy = game.ServerStorage.Enemies[enemyType]:Clone()
        enemy.Parent = workspace
        enemy.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(10, 0, 0))

        print(player.Name .. " iniciou combate contra um " .. enemyType)

        -- Lógica de combate
        while enemy.Health > 0 do
            -- Checa se o jogador ainda está vivo
            if player.Character.Humanoid.Health <= 0 then
                print(player.Name .. " morreu durante o combate!")
                break
            end
            -- Simula o combate entre o jogador e o inimigo
            enemy.Health = enemy.Health - 10  -- Exemplo de dano
            wait(1)
        end

        if enemy.Health <= 0 then
            print(player.Name .. " derrotou o " .. enemyType .. "!")
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 50  -- Recompensa pela vitória
        end
    else
        print("Sistema de combate não habilitado.")
    end
end

-- Função para Interagir com NPCs
function interactWithNPC(player, npcName)
    if isFunctionEnabled("NPCInteractionsEnabled") then
        -- Localiza o NPC e exibe uma mensagem de interação
        local npc = game.Workspace.NPCs[npcName]
        if npc then
            print(player.Name .. " está interagindo com o NPC: " .. npcName)
            -- Exemplo de recompensa por interação
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 20
        else
            print("NPC " .. npcName .. " não encontrado.")
        end
    else
        print("Interações com NPCs desabilitadas.")
    end
end

-- Função para Mostrar Estatísticas de Progresso
function showProgress(player)
    -- Mostra o progresso do jogador em várias áreas
    print("Progresso de " .. player.Name .. ":")
    print("Fase Atual: SEA" .. player.leaderstats.CurrentSEA.Value)
    print("Inimigos Derrotados: " .. player.leaderstats.Kills.Value)
    print("Itens Coletados: " .. player.leaderstats.ItemsCollected.Value)
    print("Missão Ativa: " .. player.leaderstats.MissionDescription.Value)
    print("Recompensa de Missão: " .. player.leaderstats.MissionReward.Value .. " Moedas")
end

-- Função para Exibir Mensagem de Boas-Vindas com Personalização
function welcomeMessage(player)
    print("Bem-vindo, " .. player.Name .. "! Prepare-se para a aventura em Blox Fruits!")
    -- Exibe mensagem personalizada
    print("Você está na SEA" .. player.leaderstats.CurrentSEA.Value)
end
-- Função para Evolução de Habilidades
function evolveSkills(player)
    if isFunctionEnabled("SkillEvolutionEnabled") then
        local currentLevel = player.leaderstats.Level.Value
        local skillPoints = player.leaderstats.SkillPoints.Value

        -- Verifica o nível e evolução das habilidades
        if currentLevel >= 10 and skillPoints >= 5 then
            print(player.Name .. " evoluiu suas habilidades!")
            player.leaderstats.SkillPoints.Value = player.leaderstats.SkillPoints.Value - 5
            -- Melhorar as habilidades
            player.leaderstats.Strength.Value = player.leaderstats.Strength.Value + 10
            player.leaderstats.Speed.Value = player.leaderstats.Speed.Value + 5
            print("Habilidades melhoradas! Força +10, Velocidade +5.")
        else
            print(player.Name .. " não tem pontos suficientes para evoluir as habilidades.")
        end
    else
        print("Sistema de evolução de habilidades desabilitado.")
    end
end

-- Função para Avançar para uma Nova SEA
function advanceToNextSEA(player)
    if isFunctionEnabled("SeaProgressionEnabled") then
        local currentSEA = player.leaderstats.CurrentSEA.Value

        -- Avança para a próxima SEA
        if currentSEA < 3 then
            player.leaderstats.CurrentSEA.Value = currentSEA + 1
            print(player.Name .. " avançou para a SEA " .. (currentSEA + 1) .. "!")
        else
            print(player.Name .. " já está no máximo, na SEA 3!")
        end
    else
        print("Sistema de progressão de SEA desabilitado.")
    end
end

-- Função para Iniciar Missões Específicas por SEA
function startSEAProjectMission(player)
    if isFunctionEnabled("SeaMissionSystemEnabled") then
        local currentSEA = player.leaderstats.CurrentSEA.Value
        local missionReward = 0
        local missionDescription = ""

        -- Missões baseadas na SEA atual
        if currentSEA == 1 then
            missionDescription = "Missão para SEA 1: Derrote 15 inimigos da primeira ilha!"
            missionReward = 100
        elseif currentSEA == 2 then
            missionDescription = "Missão para SEA 2: Coleta de 7 frutas especiais!"
            missionReward = 200
        elseif currentSEA == 3 then
            missionDescription = "Missão para SEA 3: Resgate 5 NPCs capturados!"
            missionReward = 300
        else
            missionDescription = "Missão não disponível para a SEA atual."
            missionReward = 0
        end

        -- Atribui a missão ao jogador
        player.leaderstats.MissionType.Value = "SeaProject"
        player.leaderstats.MissionDescription.Value = missionDescription
        player.leaderstats.MissionReward.Value = missionReward
        print(player.Name .. " recebeu a missão: " .. missionDescription)
    else
        print("Sistema de missões para SEA desabilitado.")
    end
end

-- Função para Interação Avançada com NPCs
function advancedNPCInteraction(player, npcName)
    if isFunctionEnabled("AdvancedNPCInteractionsEnabled") then
        -- Procura o NPC
        local npc = game.Workspace.NPCs[npcName]
        if npc then
            local npcDialogue = ""
            -- Definindo o diálogo com base na SEA
            local currentSEA = player.leaderstats.CurrentSEA.Value
            if currentSEA == 1 then
                npcDialogue = "Bem-vindo à primeira ilha! Você precisa se fortalecer para os desafios à frente."
            elseif currentSEA == 2 then
                npcDialogue = "Aqui no mar 2, os inimigos são mais fortes. Prepare-se!"
            elseif currentSEA == 3 then
                npcDialogue = "Você chegou ao mar 3. É hora de salvar os NPCs perdidos."
            else
                npcDialogue = "Você está em uma área desconhecida."
            end

            -- Exibindo o diálogo com o NPC
            print("Diálogo com " .. npcName .. ": " .. npcDialogue)
            -- Recompensa por interação
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 50
            print(player.Name .. " recebeu 50 moedas por interagir com " .. npcName)
        else
            print("NPC " .. npcName .. " não encontrado.")
        end
    else
        print("Interações avançadas com NPCs desabilitadas.")
    end
end

-- Função para Mostrar Progresso e Status de Jogo
function showGameProgress(player)
    -- Exibe detalhes do progresso do jogador em cada área
    print("Status de " .. player.Name .. ":")
    print("Fase Atual: SEA" .. player.leaderstats.CurrentSEA.Value)
    print("Inimigos Derrotados: " .. player.leaderstats.Kills.Value)
    print("Itens Coletados: " .. player.leaderstats.ItemsCollected.Value)
    print("Missão Atual: " .. player.leaderstats.MissionDescription.Value)
    print("Recompensa de Missão: " .. player.leaderstats.MissionReward.Value)
    print("Habilidades: Força: " .. player.leaderstats.Strength.Value .. " | Velocidade: " .. player.leaderstats.Speed.Value)
end

-- Função para Mostrar Detalhes do NPC em um Diálogo
function showNPCDialogue(npcName)
    local npc = game.Workspace.NPCs[npcName]
    if npc then
        -- Exibe um diálogo específico para o NPC
        local dialogue = npc.Dialogue.Value
        print(npcName .. " diz: " .. dialogue)
    else
        print("NPC " .. npcName .. " não encontrado.")
    end
end

-- Função para Realizar Trocas de Itens com NPCs
function tradeWithNPC(player, npcName)
    if isFunctionEnabled("ItemTradeEnabled") then
        local npc = game.Workspace.NPCs[npcName]
        if npc then
            local itemToTrade = npc.ItemToTrade.Value
            local tradeCost = npc.TradeCost.Value

            -- Verifica se o jogador tem itens suficientes para a troca
            if player.leaderstats.ItemsCollected.Value >= tradeCost then
                -- Realiza a troca
                player.leaderstats.ItemsCollected.Value = player.leaderstats.ItemsCollected.Value - tradeCost
                player.leaderstats.Inventory:AddItem(itemToTrade)
                print(player.Name .. " trocou " .. tradeCost .. " itens por " .. itemToTrade)
            else
                print(player.Name .. " não tem itens suficientes para a troca.")
            end
        else
            print("NPC " .. npcName .. " não encontrado.")
        end
    else
        print("Sistema de troca de itens desabilitado.")
    end
end
-- Função para Iniciar uma Batalha contra um Inimigo
function startBattle(player, enemyName)
    if isFunctionEnabled("BattleSystemEnabled") then
        local enemy = game.Workspace.Enemies[enemyName]
        if enemy then
            print(player.Name .. " iniciou uma batalha contra " .. enemy.Name)
            -- Definir os pontos de vida iniciais para a batalha
            local playerHealth = player.leaderstats.Health.Value
            local enemyHealth = enemy.Health.Value
            local battleOver = false
            
            -- Função para calcular dano
            function calculateDamage(attacker)
                local damage = math.random(10, 30)
                if attacker == player then
                    -- Considerar força do jogador
                    damage = damage + player.leaderstats.Strength.Value
                else
                    -- Considerar força do inimigo
                    damage = damage + enemy.Strength.Value
                end
                return damage
            end

            -- Loop de batalha
            while not battleOver do
                -- Player ataca
                local playerDamage = calculateDamage(player)
                enemyHealth = enemyHealth - playerDamage
                print(player.Name .. " causou " .. playerDamage .. " de dano. Vida do inimigo: " .. enemyHealth)

                -- Inimigo ataca
                if enemyHealth > 0 then
                    local enemyDamage = calculateDamage(enemy)
                    playerHealth = playerHealth - enemyDamage
                    print(enemy.Name .. " causou " .. enemyDamage .. " de dano. Vida do jogador: " .. playerHealth)
                end

                -- Verificar se a batalha terminou
                if playerHealth <= 0 then
                    print(player.Name .. " perdeu a batalha.")
                    battleOver = true
                    player.leaderstats.Health.Value = playerHealth -- Reseta a vida
                elseif enemyHealth <= 0 then
                    print(player.Name .. " venceu a batalha!")
                    battleOver = true
                    player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100 -- Recompensa pela vitória
                    enemy:Destroy() -- Remover inimigo derrotado
                end
            end
        else
            print("Inimigo " .. enemyName .. " não encontrado.")
        end
    else
        print("Sistema de batalha desabilitado.")
    end
end

-- Função para Habilidades Especiais durante a Batalha
function useSpecialAbility(player, abilityName)
    if isFunctionEnabled("SpecialAbilitiesEnabled") then
        local ability = player:FindFirstChild(abilityName)
        if ability then
            local abilityCooldown = ability.Cooldown.Value
            if abilityCooldown <= 0 then
                -- Ativa habilidade especial
                if abilityName == "Fireball" then
                    print(player.Name .. " usou Fireball!")
                    -- Dano extra em área
                    local enemies = game.Workspace.Enemies:GetChildren()
                    for _, enemy in pairs(enemies) do
                        local damage = math.random(30, 50)
                        enemy.Health.Value = enemy.Health.Value - damage
                        print("Fireball causou " .. damage .. " de dano em " .. enemy.Name)
                    end
                elseif abilityName == "HealingWave" then
                    print(player.Name .. " usou HealingWave!")
                    -- Recupera vida
                    player.leaderstats.Health.Value = player.leaderstats.Health.Value + 50
                    print(player.Name .. " recuperou 50 de vida!")
                end

                -- Resetando cooldown
                ability.Cooldown.Value = 30 -- Exemplo de cooldown de 30 segundos
            else
                print(abilityName .. " está em cooldown. Tente novamente em " .. abilityCooldown .. " segundos.")
            end
        else
            print(abilityName .. " não encontrada.")
        end
    else
        print("Sistema de habilidades especiais desabilitado.")
    end
end

-- Função para Criar Eventos Aleatórios no Jogo
function randomEvent(player)
    if isFunctionEnabled("RandomEventsEnabled") then
        local eventType = math.random(1, 3) -- 1: Evento de Recompensa, 2: Evento de Combate, 3: Evento de NPC

        if eventType == 1 then
            print("Evento aleatório: Recompensa extra para " .. player.Name)
            local reward = math.random(50, 200)
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + reward
            print(player.Name .. " recebeu " .. reward .. " moedas como recompensa.")
        elseif eventType == 2 then
            local enemy = game.Workspace.Enemies:FindFirstChild("RandomEnemy" .. math.random(1, 5))
            if enemy then
                print("Evento aleatório: Um inimigo apareceu!")
                startBattle(player, enemy.Name)
            else
                print("Evento aleatório de combate não pôde ser realizado. Inimigo não encontrado.")
            end
        elseif eventType == 3 then
            local npc = game.Workspace.NPCs:FindFirstChild("RandomNPC" .. math.random(1, 3))
            if npc then
                print("Evento aleatório: Interação com NPC!")
                advancedNPCInteraction(player, npc.Name)
            else
                print("Evento aleatório de NPC não pôde ser realizado. NPC não encontrado.")
            end
        end
    else
        print("Eventos aleatórios desabilitados.")
    end
end

-- Função para Habilidade de Defesa
function useDefenseAbility(player)
    if isFunctionEnabled("DefenseAbilityEnabled") then
        local defenseAbility = player:FindFirstChild("Shield")
        if defenseAbility then
            local shieldCooldown = defenseAbility.Cooldown.Value
            if shieldCooldown <= 0 then
                -- Ativar escudo de defesa
                print(player.Name .. " usou a habilidade de defesa: Shield!")
                player.leaderstats.Defense.Value = player.leaderstats.Defense.Value + 50 -- Aumenta a defesa
                defenseAbility.Cooldown.Value = 60 -- Definir cooldown
                print(player.Name .. " recebeu 50 de defesa adicional.")
            else
                print("Habilidade de defesa em cooldown. Tente novamente em " .. shieldCooldown .. " segundos.")
            end
        else
            print("Habilidade de defesa não encontrada.")
        end
    else
        print("Sistema de defesa desabilitado.")
    end
end
-- Inicialização do nome do negócio e mensagem de boas-vindas
print("BEM VINDO A POWER.bit SCRIPTS")
print("NOME DO SCRIPT E TÍTULO: POWER.bit")

-- Funções de configuração e sistema de opções do jogo
local function isFunctionEnabled(funcName)
    -- Função para verificar se a funcionalidade está habilitada
    local settings = {
        MapSystemEnabled = true,
        NPCInteractionEnabled = true,
        CombatAbilitiesEnabled = true,
        MissionSystemEnabled = true,
    }
    
    return settings[funcName] == true
end

-- Sistema de Missões
local missions = {
    ["Início"] = {
        description = "Complete seu treinamento inicial",
        objective = "Falar com o Mestre",
        reward = {coins = 100, experience = 50},
        isCompleted = false
    },
    ["Aventura 1"] = {
        description = "Derrote 5 inimigos no Mar 1",
        objective = "Derrotar 5 inimigos",
        reward = {coins = 200, experience = 100},
        isCompleted = false
    },
    ["Aventura 2"] = {
        description = "Vá até o Mar 2 e derrote o Chefão",
        objective = "Derrotar Chefão no Mar 2",
        reward = {coins = 500, experience = 200},
        isCompleted = false
    },
}

-- Função para verificar se uma missão foi completada
function checkMissionStatus(player, missionName)
    local mission = missions[missionName]
    if mission then
        if mission.isCompleted then
            print(player.Name .. " já completou a missão: " .. missionName)
        else
            print(player.Name .. " ainda não completou a missão: " .. missionName)
        end
    else
        print("Missão não encontrada.")
    end
end

-- Função para completar uma missão
function completeMission(player, missionName)
    local mission = missions[missionName]
    if mission and not mission.isCompleted then
        mission.isCompleted = true
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + mission.reward.coins
        player.leaderstats.Experience.Value = player.leaderstats.Experience.Value + mission.reward.experience
        print(player.Name .. " completou a missão: " .. missionName)
        print("Recompensas: " .. mission.reward.coins .. " moedas, " .. mission.reward.experience .. " experiência.")
    else
        print("Missão não encontrada ou já foi completada.")
    end
end

-- Sistema de Progressão de Nível
function checkPlayerLevel(player)
    local experience = player.leaderstats.Experience.Value
    local level = math.floor(experience / 100)  -- Cada 100 pontos de experiência sobem 1 nível
    print(player.Name .. " está no nível " .. level .. " com " .. experience .. " pontos de experiência.")
    return level
end

function levelUp(player)
    local experience = player.leaderstats.Experience.Value
    local currentLevel = math.floor(experience / 100)
    if experience >= (currentLevel + 1) * 100 then
        player.leaderstats.Level.Value = currentLevel + 1
        print(player.Name .. " subiu para o nível " .. player.leaderstats.Level.Value)
    end
end

-- Sistema de Aventuras e Mapas
function changeMap(player, mapName)
    if isFunctionEnabled("MapSystemEnabled") then
        local currentLevel = player.leaderstats.Level.Value
        local map = game.Workspace.Maps:FindFirstChild(mapName)

        if map then
            -- Checar se o jogador pode acessar o mapa
            if map.LevelRequirement <= currentLevel then
                player.Character.HumanoidRootPart.CFrame = map.TeleportLocation.CFrame
                print(player.Name .. " foi teletransportado para o mapa: " .. mapName)
            else
                print(player.Name .. " não tem o nível necessário para acessar o mapa: " .. mapName)
            end
        else
            print("Mapa " .. mapName .. " não encontrado.")
        end
    else
        print("Sistema de mapas desabilitado.")
    end
end

function setMap(mapName, levelRequirement, teleportLocation)
    local map = Instance.new("Model")
    map.Name = mapName
    map.LevelRequirement = levelRequirement
    
    -- Localização de teletransporte
    local teleport = Instance.new("Part")
    teleport.Name = "TeleportLocation"
    teleport.Position = teleportLocation
    teleport.Parent = map
    
    map.Parent = game.Workspace.Maps
    print("Mapa " .. mapName .. " criado com requisito de nível " .. levelRequirement)
end

-- Função para interagir com NPCs
function interactWithNPC(player, npcName)
    if isFunctionEnabled("NPCInteractionEnabled") then
        local npc = game.Workspace.NPCs:FindFirstChild(npcName)
        if npc then
            print(player.Name .. " está interagindo com o NPC: " .. npc.Name)
            -- Oferecer missão ou recompensa
            if npcName == "Mestre" then
                print("Mestre: \"Complete seu treinamento e volte para mim.\"")
                -- Oferecer missão
                giveMission(player, "Início")
            elseif npcName == "Mercador" then
                print("Mercador: \"Compre seus itens!\"")
                -- Oferecer item ou loja
                openShop(player)
            end
        else
            print("NPC " .. npcName .. " não encontrado.")
        end
    else
        print("Interação com NPC desabilitada.")
    end
end

-- Função para abrir a loja de NPC
function openShop(player)
    print("Abrindo loja para " .. player.Name)
    -- Exemplo de itens para compra
    local items = {
        {name = "Espada", price = 200},
        {name = "Escudo", price = 150},
        {name = "Poção de Cura", price = 50}
    }
    for _, item in pairs(items) do
        print("Item: " .. item.name .. " - Preço: " .. item.price .. " moedas")
    end
end

-- Função para usar habilidades de combate avançadas
function useCombatAbility(player, abilityName)
    if isFunctionEnabled("CombatAbilitiesEnabled") then
        if abilityName == "QuickStrike" then
            print(player.Name .. " usou QuickStrike!")
            -- Ataque rápido
            local damage = math.random(30, 50)
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + damage
            print(player.Name .. " causou " .. damage .. " de dano com QuickStrike!")
        elseif abilityName == "ComboAttack" then
            print(player.Name .. " usou ComboAttack!")
            -- Combinação de ataques
            local damage = math.random(50, 100)
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + damage
            print(player.Name .. " causou " .. damage .. " de dano com ComboAttack!")
        else
            print("Habilidade " .. abilityName .. " não encontrada.")
        end
    else
        print("Sistema de habilidades de combate desabilitado.")
    end
end

-- Função para criar e gerenciar menus de habilitação/desabilitação
function createMenu()
    print("Criando Menu de Opções...")
    -- Menu fictício com exemplos de funções
    local menu = {
        {name = "Ativar Sistema de Missões", funcName = "MissionSystemEnabled", enabled = true},
        {name = "Ativar Sistema de Mapas", funcName = "MapSystemEnabled", enabled = true},
        {name = "Ativar Interação com NPC", funcName = "NPCInteractionEnabled", enabled = true},
        {name = "Ativar Habilidades de Combate", funcName = "CombatAbilitiesEnabled", enabled = true},
    }

    for _, option in pairs(menu) do
        print(option.name .. ": " .. (option.enabled and "Ativado" or "Desativado"))
    end
end 
-- Função para habilitar ou desabilitar funcionalidades do script
function toggleFunctionality(funcName, enable)
    local settings = {
        MapSystemEnabled = true,
        NPCInteractionEnabled = true,
        CombatAbilitiesEnabled = true,
        MissionSystemEnabled = true,
    }
    
    if settings[funcName] ~= nil then
        settings[funcName] = enable
        print(funcName .. " foi " .. (enable and "habilitado" or "desabilitado"))
    else
        print("Função não encontrada: " .. funcName)
    end
end

-- Função para verificar se o jogador completou todas as missões
function checkAllMissionsCompleted(player)
    local allCompleted = true
    for missionName, mission in pairs(missions) do
        if not mission.isCompleted then
            allCompleted = false
            break
        end
    end
    
    if allCompleted then
        print(player.Name .. " completou todas as missões!")
    else
        print(player.Name .. " ainda não completou todas as missões.")
    end
end

-- Sistema de Troca de Itens com NPC
function tradeItems(player, npcName, itemName, amount)
    local npc = game.Workspace.NPCs:FindFirstChild(npcName)
    if npc then
        local itemPrice = getItemPrice(itemName)
        if itemPrice and player.leaderstats.Coins.Value >= itemPrice * amount then
            player.leaderstats.Coins.Value = player.leaderstats.Coins.Value - (itemPrice * amount)
            print(player.Name .. " comprou " .. amount .. "x " .. itemName)
        else
            print(player.Name .. " não tem moedas suficientes para comprar " .. itemName)
        end
    else
        print("NPC " .. npcName .. " não encontrado para negociação.")
    end
end

-- Função para obter o preço de um item
function getItemPrice(itemName)
    local itemPrices = {
        ["Espada"] = 200,
        ["Escudo"] = 150,
        ["Poção de Cura"] = 50,
    }
    
    return itemPrices[itemName]
end

-- Função para exibir um menu de opções no jogo
function showMainMenu()
    print("Escolha uma opção:")
    print("1. Ativar Sistema de Missões")
    print("2. Ativar Sistema de Mapas")
    print("3. Ativar Interação com NPC")
    print("4. Ativar Habilidades de Combate")
    print("5. Verificar Progresso das Missões")
    print("6. Trocar Itens com NPC")
    print("7. Fechar Menu")
end

-- Função para realizar a escolha no menu principal
function processMenuChoice(player, choice)
    if choice == 1 then
        toggleFunctionality("MissionSystemEnabled", true)
    elseif choice == 2 then
        toggleFunctionality("MapSystemEnabled", true)
    elseif choice == 3 then
        toggleFunctionality("NPCInteractionEnabled", true)
    elseif choice == 4 then
        toggleFunctionality("CombatAbilitiesEnabled", true)
    elseif choice == 5 then
        checkAllMissionsCompleted(player)
    elseif choice == 6 then
        print("Escolha o NPC e o item para troca.")
        -- Interação com NPC para troca de itens pode ser realizada aqui
    elseif choice == 7 then
        print("Menu fechado.")
    else
        print("Opção inválida.")
    end
end

-- Sistema de Alerta e Notificação
function showAlert(message)
    -- Esta função pode ser usada para exibir mensagens de alerta no jogo
    print("[ALERTA] " .. message)
end

-- Função para gerenciar a barra de saúde do jogador
function updateHealthBar(player, damage)
    player.leaderstats.Health.Value = player.leaderstats.Health.Value - damage
    if player.leaderstats.Health.Value <= 0 then
        print(player.Name .. " foi derrotado!")
        -- Reaparecer o jogador ou reiniciar o mapa
    else
        print(player.Name .. " perdeu " .. damage .. " de saúde.")
    end
end

-- Função para gerenciar a barra de energia do jogador
function updateEnergyBar(player, energySpent)
    player.leaderstats.Energy.Value = player.leaderstats.Energy.Value - energySpent
    if player.leaderstats.Energy.Value <= 0 then
        print(player.Name .. " ficou sem energia!")
        -- O jogador precisa recarregar ou descansar
    else
        print(player.Name .. " usou " .. energySpent .. " de energia.")
    end
end

-- Função para gerenciar o inventário do jogador
function manageInventory(player, action, itemName)
    if action == "add" then
        -- Adicionar item ao inventário do jogador
        print(player.Name .. " recebeu o item: " .. itemName)
    elseif action == "remove" then
        -- Remover item do inventário do jogador
        print(player.Name .. " perdeu o item: " .. itemName)
    else
        print("Ação de inventário inválida.")
    end
end

-- Função para aplicar buffs ou debuffs ao jogador
function applyBuffDebuff(player, buffType)
    if buffType == "strength" then
        player.leaderstats.Strength.Value = player.leaderstats.Strength.Value + 10
        print(player.Name .. " recebeu um aumento de força!")
    elseif buffType == "speed" then
        player.leaderstats.Speed.Value = player.leaderstats.Speed.Value + 5
        print(player.Name .. " ficou mais rápido!")
    elseif buffType == "damage" then
        player.leaderstats.Damage.Value = player.leaderstats.Damage.Value + 20
        print(player.Name .. " recebeu um aumento de dano!")
    else
        print("Buff ou debuff inválido.")
    end
end

-- Função para adicionar pontos de habilidade ao jogador
function addSkillPoints(player, points)
    player.leaderstats.SkillPoints.Value = player.leaderstats.SkillPoints.Value + points
    print(player.Name .. " recebeu " .. points .. " pontos de habilidade!")
end

-- Função para verificar a classificação do jogador
function checkPlayerRank(player)
    local rank = player.leaderstats.Rank.Value
    print(player.Name .. " está no rank " .. rank)
end

-- Função para redefinir o progresso do jogador (em caso de reset)
function resetPlayerProgress(player)
    player.leaderstats.Level.Value = 1
    player.leaderstats.Experience.Value = 0
    player.leaderstats.Coins.Value = 0
    player.leaderstats.Health.Value = 100
    player.leaderstats.Energy.Value = 100
    player.leaderstats.Strength.Value = 10
    player.leaderstats.Speed.Value = 5
    player.leaderstats.Damage.Value = 20
    player.leaderstats.SkillPoints.Value = 0
    player.leaderstats.Rank.Value = 1
    print(player.Name .. " teve seu progresso resetado.")
end

-- Função para gerenciar eventos de jogador
function onPlayerJoin(player)
    print(player.Name .. " entrou no jogo!")
    -- Configuração inicial do jogador
    player.leaderstats = Instance.new("Folder")
    player.leaderstats.Name = "leaderstats"
    player.leaderstats.Parent = player

    -- Criação de variáveis
    createLeaderstats(player)
end

-- Função para criar as variáveis de progresso para o jogador
function createLeaderstats(player)
    local stats = {
        Level = 1,
        Experience = 0,
        Coins = 0,
        Health = 100,
        Energy = 100,
        Strength = 10,
        Speed = 5,
        Damage = 20,
        SkillPoints = 0,
        Rank = 1,
    }

    for stat, defaultValue in pairs(stats) do
        local statObj = Instance.new("IntValue")
        statObj.Name = stat
        statObj.Value = defaultValue
        statObj.Parent = player.leaderstats
    end

    print(player.Name .. " foi configurado com valores iniciais.")
end

-- Função para detectar se o jogador está em um mar específico (Mar 1, Mar 2, Mar 3)
function detectSea(player, sea)
    if sea == 1 then
        print(player.Name .. " está no Mar 1.")
    elseif sea == 2 then
        print(player.Name .. " está no Mar 2.")
    elseif sea == 3 then
        print(player.Name .. " está no Mar 3.")
    else
        print("Mar desconhecido.")
    end
end

-- Iniciar o sistema e executar as funções
print("Inicializando o sistema de scripts...")
showMainMenu()
-- Função para gerenciar eventos e progresso do jogador
function onPlayerDefeat(player, enemy)
    -- Quando o jogador derrota um inimigo, ele ganha moedas e experiência
    local xpReward = enemy.Level * 10
    local coinReward = enemy.Level * 5
    player.leaderstats.Experience.Value = player.leaderstats.Experience.Value + xpReward
    player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + coinReward
    print(player.Name .. " derrotou " .. enemy.Name .. " e ganhou " .. xpReward .. " XP e " .. coinReward .. " moedas.")
    
    -- Verificar se o jogador subiu de nível
    if player.leaderstats.Experience.Value >= player.leaderstats.Level.Value * 100 then
        player.leaderstats.Level.Value = player.leaderstats.Level.Value + 1
        print(player.Name .. " subiu para o nível " .. player.leaderstats.Level.Value)
    end
end

-- Função para executar ataques com base nas habilidades do jogador
function playerAttack(player, enemy)
    local damage = player.leaderstats.Damage.Value
    enemy.leaderstats.Health.Value = enemy.leaderstats.Health.Value - damage
    print(player.Name .. " atacou " .. enemy.Name .. " causando " .. damage .. " de dano.")
    
    -- Se a saúde do inimigo cair abaixo de 0, o inimigo é derrotado
    if enemy.leaderstats.Health.Value <= 0 then
        onPlayerDefeat(player, enemy)
    end
end

-- Função para gerar eventos dinâmicos, como inimigos ou recompensas
function generateEvent(player)
    local eventType = math.random(1, 3)
    if eventType == 1 then
        spawnEnemy(player)
    elseif eventType == 2 then
        spawnTreasure(player)
    elseif eventType == 3 then
        spawnBuff(player)
    end
end

-- Função para spawn de inimigos
function spawnEnemy(player)
    local enemy = Instance.new("Model")
    enemy.Name = "Enemy"
    local enemyHealth = Instance.new("IntValue")
    enemyHealth.Name = "Health"
    enemyHealth.Value = 100
    enemyHealth.Parent = enemy
    enemy.Parent = game.Workspace
    enemy:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame + Vector3.new(10, 0, 0))
    
    -- Informar ao jogador sobre o inimigo
    print(player.Name .. " encontrou um inimigo!")
    enemy.Humanoid.Died:Connect(function()
        onPlayerDefeat(player, enemy)
    end)
end

-- Função para spawn de tesouros
function spawnTreasure(player)
    local treasure = Instance.new("Part")
    treasure.Name = "Treasure"
    treasure.Size = Vector3.new(4, 1, 4)
    treasure.Color = Color3.fromRGB(255, 223, 0)
    treasure.Position = player.Character.HumanoidRootPart.Position + Vector3.new(5, 0, 5)
    treasure.Anchored = true
    treasure.Parent = game.Workspace
    
    -- Recompensa ao pegar o tesouro
    treasure.Touched:Connect(function()
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 50
        print(player.Name .. " encontrou um tesouro e ganhou 50 moedas!")
        treasure:Destroy()
    end)
end

-- Função para spawn de buffs temporários
function spawnBuff(player)
    local buff = Instance.new("Part")
    buff.Name = "Buff"
    buff.Size = Vector3.new(2, 1, 2)
    buff.Color = Color3.fromRGB(0, 255, 0)
    buff.Position = player.Character.HumanoidRootPart.Position + Vector3.new(10, 0, 10)
    buff.Anchored = true
    buff.Parent = game.Workspace
    
    -- Aplicar buff quando o jogador tocar o objeto
    buff.Touched:Connect(function()
        applyBuffDebuff(player, "strength")
        print(player.Name .. " pegou um buff de força!")
        buff:Destroy()
    end)
end

-- Função para gerenciar o combate contra outros jogadores
function playerPvPCombat(player, targetPlayer)
    local damage = player.leaderstats.Damage.Value
    targetPlayer.leaderstats.Health.Value = targetPlayer.leaderstats.Health.Value - damage
    print(player.Name .. " atacou " .. targetPlayer.Name .. " causando " .. damage .. " de dano.")
    
    -- Se a saúde do alvo chegar a 0, ele é derrotado
    if targetPlayer.leaderstats.Health.Value <= 0 then
        print(targetPlayer.Name .. " foi derrotado por " .. player.Name)
        targetPlayer.leaderstats.Health.Value = 100  -- Resetando saúde após derrota
    end
end

-- Sistema de missões dinâmicas, atribuindo novas missões aos jogadores
function assignDynamicMission(player)
    local missionIndex = math.random(1, 5)
    local missionName = ""
    if missionIndex == 1 then
        missionName = "Derrote 5 inimigos"
    elseif missionIndex == 2 then
        missionName = "Colete 3 tesouros"
    elseif missionIndex == 3 then
        missionName = "Conquiste 200 moedas"
    elseif missionIndex == 4 then
        missionName = "Sobreviva por 10 minutos"
    elseif missionIndex == 5 then
        missionName = "Encontre o item perdido"
    end
    
    -- Atribuindo a missão ao jogador
    print(player.Name .. " recebeu a missão: " .. missionName)
    table.insert(missions, {name = missionName, isCompleted = false})
end

-- Função para verificar se o jogador concluiu a missão
function checkMissionCompletion(player, missionIndex)
    if missionIndex > 0 and missionIndex <= #missions then
        local mission = missions[missionIndex]
        if mission.isCompleted then
            print(player.Name .. " já completou a missão: " .. mission.name)
        else
            print(player.Name .. " não completou a missão: " .. mission.name)
        end
    else
        print("Índice de missão inválido.")
    end
end

-- Função para completar uma missão específica
function completeMission(player, missionIndex)
    if missionIndex > 0 and missionIndex <= #missions then
        local mission = missions[missionIndex]
        mission.isCompleted = true
        print(player.Name .. " completou a missão: " .. mission.name)
    else
        print("Índice de missão inválido.")
    end
end

-- Função para registrar missões
missions = {}

-- Função para exibir o status de missões do jogador
function showPlayerMissionStatus(player)
    print(player.Name .. " tem as seguintes missões:")
    for i, mission in ipairs(missions) do
        local status = mission.isCompleted and "Completada" or "Não Completada"
        print("Missão " .. i .. ": " .. mission.name .. " - Status: " .. status)
    end
end

-- Sistema de trocas com outros jogadores
function playerTrade(player, targetPlayer, item, amount)
    local itemPrice = getItemPrice(item)
    local totalCost = itemPrice * amount
    if player.leaderstats.Coins.Value >= totalCost then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value - totalCost
        targetPlayer.leaderstats.Coins.Value = targetPlayer.leaderstats.Coins.Value + totalCost
        print(player.Name .. " trocou " .. totalCost .. " moedas com " .. targetPlayer.Name)
    else
        print(player.Name .. " não tem moedas suficientes para a troca.")
    end
end

-- Atualização do status do jogador
function updatePlayerStatus(player)
    print("Status atual de " .. player.Name)
    print("Nível: " .. player.leaderstats.Level.Value)
    print("Experiência: " .. player.leaderstats.Experience.Value)
    print("Moedas: " .. player.leaderstats.Coins.Value)
    print("Saúde: " .. player.leaderstats.Health.Value)
    print("Energia: " .. player.leaderstats.Energy.Value)
    print("Força: " .. player.leaderstats.Strength.Value)
    print("Velocidade: " .. player.leaderstats.Speed.Value)
    print("Dano: " .. player.leaderstats.Damage.Value)
    print("Pontos de Habilidade: " .. player.leaderstats.SkillPoints.Value)
    print("Rank: " .. player.leaderstats.Rank.Value)
end

-- Função para iniciar o progresso e criar os objetos do jogador
function onPlayerJoin(player)
    print(player.Name .. " entrou no jogo!")
    player.leaderstats = Instance.new("Folder")
    player.leaderstats.Name = "leaderstats"
    player.leaderstats.Parent = player

    -- Criação das variáveis do jogador
    createLeaderstats(player)
end

-- Iniciar o script
game.Players.PlayerAdded:Connect(onPlayerJoin)
print("Sistema de scripts POWER.bit iniciado com sucesso!")
-- Função para aplicar buffs ou debuffs ao jogador
function applyBuffDebuff(player, type)
    if type == "strength" then
        player.leaderstats.Strength.Value = player.leaderstats.Strength.Value + 10
        print(player.Name .. " recebeu um buff de força!")
    elseif type == "speed" then
        player.leaderstats.Speed.Value = player.leaderstats.Speed.Value + 10
        print(player.Name .. " recebeu um buff de velocidade!")
    elseif type == "damage" then
        player.leaderstats.Damage.Value = player.leaderstats.Damage.Value + 10
        print(player.Name .. " recebeu um buff de dano!")
    elseif type == "health" then
        player.leaderstats.Health.Value = player.leaderstats.Health.Value + 50
        print(player.Name .. " recebeu um buff de saúde!")
    elseif type == "debuff" then
        player.leaderstats.Health.Value = player.leaderstats.Health.Value - 20
        print(player.Name .. " recebeu um debuff de saúde!")
    end
end

-- Função para restaurar a saúde do jogador ao longo do tempo
function regenerateHealth(player)
    while player.leaderstats.Health.Value < 100 do
        player.leaderstats.Health.Value = player.leaderstats.Health.Value + 1
        wait(1)  -- Espera 1 segundo entre os aumentos de saúde
    end
    print(player.Name .. " teve sua saúde restaurada!")
end

-- Função para verificar a quantidade de moedas necessárias para realizar uma ação
function getItemPrice(item)
    local price = 0
    if item == "Sword" then
        price = 100
    elseif item == "Shield" then
        price = 150
    elseif item == "Potion" then
        price = 50
    elseif item == "MagicItem" then
        price = 500
    end
    return price
end

-- Função para permitir que o jogador compre um item da loja
function buyItem(player, item, amount)
    local itemPrice = getItemPrice(item)
    local totalCost = itemPrice * amount
    if player.leaderstats.Coins.Value >= totalCost then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value - totalCost
        print(player.Name .. " comprou " .. amount .. " " .. item .. "(s) por " .. totalCost .. " moedas!")
    else
        print(player.Name .. " não tem moedas suficientes para comprar " .. item .. ".")
    end
end

-- Função para gerar uma recompensa aleatória
function generateRandomReward(player)
    local rewardType = math.random(1, 3)
    if rewardType == 1 then
        local coinsReward = math.random(10, 100)
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + coinsReward
        print(player.Name .. " ganhou " .. coinsReward .. " moedas como recompensa!")
    elseif rewardType == 2 then
        local buffType = math.random(1, 4)
        if buffType == 1 then
            applyBuffDebuff(player, "strength")
        elseif buffType == 2 then
            applyBuffDebuff(player, "speed")
        elseif buffType == 3 then
            applyBuffDebuff(player, "damage")
        else
            applyBuffDebuff(player, "health")
        end
    elseif rewardType == 3 then
        local itemType = math.random(1, 2)
        if itemType == 1 then
            buyItem(player, "Sword", 1)
        else
            buyItem(player, "Potion", 1)
        end
    end
end

-- Função para o jogador fazer um trade com o vendedor NPC
function npcTrade(player, npc)
    print(player.Name .. " iniciou um comércio com " .. npc.Name)
    local availableItems = {"Sword", "Potion", "Shield", "MagicItem"}
    local selectedItem = availableItems[math.random(1, #availableItems)]
    print(npc.Name .. " está oferecendo " .. selectedItem .. " para " .. player.Name)
    local itemPrice = getItemPrice(selectedItem)
    print("Preço: " .. itemPrice .. " moedas")
    
    -- O jogador pode escolher comprar o item
    buyItem(player, selectedItem, 1)
end

-- Função para teleportar o jogador para diferentes zonas do jogo
function teleportPlayer(player, destination)
    local teleportPositions = {
        ["Sea1"] = Vector3.new(100, 10, 100),
        ["Sea2"] = Vector3.new(200, 10, 200),
        ["Sea3"] = Vector3.new(300, 10, 300)
    }
    
    local destinationPos = teleportPositions[destination]
    if destinationPos then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(destinationPos)
        print(player.Name .. " foi teleportado para " .. destination)
    else
        print("Destino inválido!")
    end
end

-- Função para criar um sistema de níveis de batalha
function battleLevelSystem(player)
    local level = player.leaderstats.Level.Value
    if level >= 1 and level <= 10 then
        print(player.Name .. " está no nível inicial de batalha.")
    elseif level > 10 and level <= 20 then
        print(player.Name .. " avançou para o nível intermediário de batalha.")
    elseif level > 20 and level <= 30 then
        print(player.Name .. " está no nível avançado de batalha.")
    else
        print(player.Name .. " alcançou o nível máximo de batalha!")
    end
end

-- Sistema de progressão de missão
function updateMissionProgress(player, missionIndex)
    if missionIndex > 0 and missionIndex <= #missions then
        local mission = missions[missionIndex]
        if not mission.isCompleted then
            mission.isCompleted = true
            print(player.Name .. " completou a missão: " .. mission.name)
            rewardPlayerForMission(player, mission)
        end
    end
end

-- Recompensas para concluir missões
function rewardPlayerForMission(player, mission)
    if mission.name == "Derrote 5 inimigos" then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 50
    elseif mission.name == "Colete 3 tesouros" then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100
    elseif mission.name == "Conquiste 200 moedas" then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 150
    elseif mission.name == "Sobreviva por 10 minutos" then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 200
    elseif mission.name == "Encontre o item perdido" then
        player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 250
    end
end

-- Função para interagir com NPCs no jogo
function npcInteraction(player, npc)
    local npcDialogue = {
        "Olá, viajante! Precisa de ajuda?",
        "Você tem interesse em um comércio?",
        "Cuidado com os monstros na região!",
        "Se precisar de alguma coisa, é só pedir."
    }
    
    local randomDialogue = npcDialogue[math.random(1, #npcDialogue)]
    print(npc.Name .. ": " .. randomDialogue)
end

-- Função para aplicar dano de área em jogadores ao encontrar inimigos
function applyAreaDamage(player, areaSize)
    local enemiesInRange = {}  -- Lista de inimigos próximos
    local damageArea = player.Character.HumanoidRootPart.Position
    
    -- Encontrar inimigos próximos
    for _, enemy in ipairs(game.Workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Health") then
            local enemyPosition = enemy.HumanoidRootPart.Position
            if (damageArea - enemyPosition).magnitude <= areaSize then
                table.insert(enemiesInRange, enemy)
            end
        end
    end
    
    -- Aplicar dano aos inimigos próximos
    for _, enemy in ipairs(enemiesInRange) do
        local damage = player.leaderstats.Damage.Value
        enemy.leaderstats.Health.Value = enemy.leaderstats.Health.Value - damage
        print(player.Name .. " aplicou " .. damage .. " de dano em " .. enemy.Name .. " na área de dano.")
    end
end

-- Sistema de respawn de inimigos
function respawnEnemy(enemy)
    local respawnTime = 10  -- Tempo de respawn em segundos
    wait(respawnTime)
    
    -- Respawn do inimigo
    local newEnemy = enemy:Clone()
    newEnemy.Parent = game.Workspace
    newEnemy:SetPrimaryPartCFrame(CFrame.new(math.random(-50, 50), 10, math.random(-50, 50)))
    print("Inimigo " .. newEnemy.Name .. " foi respawnado!")
end

-- Função para o progresso da batalha
function battleProgress(player)
    local battleLevel = player.leaderstats.Level.Value
    print(player.Name .. " está no progresso da batalha do nível " .. battleLevel)
end
-- Função para o menu de opções do script
function displayMenu()
    print("--------------------------------------------------")
    print("BEM VINDO A POWER.bit SCRIPTS")
    print("NOME DO SCRIPT E TÍTULO: POWER.bit")
    print("Escolha uma das opções abaixo:")
    print("1. Iniciar Aventura")
    print("2. Visualizar Missões")
    print("3. Compre Itens")
    print("4. Ver Status")
    print("5. Teleportar")
    print("6. Sair")
    print("--------------------------------------------------")
end

-- Função para iniciar a aventura no jogo
function startAdventure(player)
    print(player.Name .. " iniciou a aventura!")
    -- Aqui poderia ser implementado o código para avançar na aventura, como batalhas, coleta de itens, etc.
    -- No momento, apenas iniciamos uma mensagem de boas-vindas.
end

-- Função para visualizar as missões do jogador
function viewMissions(player)
    print("Missões disponíveis para " .. player.Name .. ":")
    for i, mission in ipairs(missions) do
        print(i .. ". " .. mission.name .. " - Status: " .. (mission.isCompleted and "Concluída" or "Pendente"))
    end
end

-- Função para mostrar o status do jogador
function showStatus(player)
    print("Status de " .. player.Name .. ":")
    print("Força: " .. player.leaderstats.Strength.Value)
    print("Velocidade: " .. player.leaderstats.Speed.Value)
    print("Dano: " .. player.leaderstats.Damage.Value)
    print("Saúde: " .. player.leaderstats.Health.Value)
    print("Moedas: " .. player.leaderstats.Coins.Value)
    print("Nível: " .. player.leaderstats.Level.Value)
end

-- Função para lidar com a escolha do menu
function handleMenuChoice(player, choice)
    if choice == 1 then
        startAdventure(player)
    elseif choice == 2 then
        viewMissions(player)
    elseif choice == 3 then
        -- Adicionando um menu simples de compra de itens
        print("Escolha um item para comprar:")
        print("1. Sword - 100 moedas")
        print("2. Shield - 150 moedas")
        print("3. Potion - 50 moedas")
        print("Digite o número do item que deseja comprar.")
        local itemChoice = tonumber(io.read())
        if itemChoice == 1 then
            buyItem(player, "Sword", 1)
        elseif itemChoice == 2 then
            buyItem(player, "Shield", 1)
        elseif itemChoice == 3 then
            buyItem(player, "Potion", 1)
        end
    elseif choice == 4 then
        showStatus(player)
    elseif choice == 5 then
        print("Escolha para onde deseja teleportar:")
        print("1. Sea1")
        print("2. Sea2")
        print("3. Sea3")
        local teleportChoice = tonumber(io.read())
        if teleportChoice == 1 then
            teleportPlayer(player, "Sea1")
        elseif teleportChoice == 2 then
            teleportPlayer(player, "Sea2")
        elseif teleportChoice == 3 then
            teleportPlayer(player, "Sea3")
        end
    elseif choice == 6 then
        print("Saindo do jogo...")
        -- Finaliza a execução ou encerra a sessão
    else
        print("Escolha inválida. Tente novamente.")
    end
end

-- Função principal para rodar o jogo
function runGame()
    -- Simula o jogador entrando no jogo
    local player = game.Players.LocalPlayer
    -- Inicializando os dados do jogador
    player.leaderstats = Instance.new("Folder")
    player.leaderstats.Name = "leaderstats"
    player.leaderstats.Parent = player

    -- Criando variáveis de estatísticas do jogador
    player.leaderstats.Strength = Instance.new("IntValue")
    player.leaderstats.Strength.Name = "Strength"
    player.leaderstats.Strength.Value = 10
    player.leaderstats.Strength.Parent = player.leaderstats

    player.leaderstats.Speed = Instance.new("IntValue")
    player.leaderstats.Speed.Name = "Speed"
    player.leaderstats.Speed.Value = 10
    player.leaderstats.Speed.Parent = player.leaderstats

    player.leaderstats.Damage = Instance.new("IntValue")
    player.leaderstats.Damage.Name = "Damage"
    player.leaderstats.Damage.Value = 5
    player.leaderstats.Damage.Parent = player.leaderstats

    player.leaderstats.Health = Instance.new("IntValue")
    player.leaderstats.Health.Name = "Health"
    player.leaderstats.Health.Value = 100
    player.leaderstats.Health.Parent = player.leaderstats

    player.leaderstats.Coins = Instance.new("IntValue")
    player.leaderstats.Coins.Name = "Coins"
    player.leaderstats.Coins.Value = 0
    player.leaderstats.Coins.Parent = player.leaderstats

    player.leaderstats.Level = Instance.new("IntValue")
    player.leaderstats.Level.Name = "Level"
    player.leaderstats.Level.Value = 1
    player.leaderstats.Level.Parent = player.leaderstats

    -- Loop principal do jogo para interação com o menu
    while true do
        displayMenu()
        print("Escolha uma opção:")
        local choice = tonumber(io.read())
        handleMenuChoice(player, choice)
    end
end

-- Inicializa o jogo
runGame()