-- Função para coletar a Raça Dragão Faixa 1
local function collectDragonRaceFaixa1()
    -- Verifica se a coleta para Faixa 1 está ativada
    if getgenv().Collect_Dragon_Race_Faixa1 then
        -- Lógica para interagir com o NPC da Faixa 1 e coletar
        debugMessage("Coletando Faixa 1 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 1")  -- Função fictícia que encontra o NPC da Faixa 1
        if npc then
            npc.interact()  -- Interage com o NPC
            debugMessage("Faixa 1 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 1 não encontrado!")
        end
    end
end

-- Função para coletar a Raça Dragão Faixa 2
local function collectDragonRaceFaixa2()
    if getgenv().Collect_Dragon_Race_Faixa2 then
        debugMessage("Coletando Faixa 2 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 2")  -- Função fictícia que encontra o NPC da Faixa 2
        if npc then
            npc.interact()  -- Interage com o NPC
            debugMessage("Faixa 2 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 2 não encontrado!")
        end
    end
end

-- Função para coletar a Raça Dragão Faixa 3
local function collectDragonRaceFaixa3()
    if getgenv().Collect_Dragon_Race_Faixa3 then
        debugMessage("Coletando Faixa 3 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 3")
        if npc then
            npc.interact()
            debugMessage("Faixa 3 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 3 não encontrado!")
        end
    end
end

-- Função para coletar a Raça Dragão Faixa 4
local function collectDragonRaceFaixa4()
    if getgenv().Collect_Dragon_Race_Faixa4 then
        debugMessage("Coletando Faixa 4 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 4")
        if npc then
            npc.interact()
            debugMessage("Faixa 4 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 4 não encontrado!")
        end
    end
end

-- Função para coletar a Raça Dragão Faixa 5
local function collectDragonRaceFaixa5()
    if getgenv().Collect_Dragon_Race_Faixa5 then
        debugMessage("Coletando Faixa 5 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 5")
        if npc then
            npc.interact()
            debugMessage("Faixa 5 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 5 não encontrado!")
        end
    end
end

-- Função para coletar a Raça Dragão Faixa 6
local function collectDragonRaceFaixa6()
    if getgenv().Collect_Dragon_Race_Faixa6 then
        debugMessage("Coletando Faixa 6 da Raça Dragão...")
        local npc = findNPC("Dragão Faixa 6")
        if npc then
            npc.interact()
            debugMessage("Faixa 6 coletada com sucesso!")
        else
            debugMessage("NPC da Faixa 6 não encontrado!")
        end
    end
end

-- Função para iniciar a coleta de todas as faixas da Raça Dragão
local function startDragonRaceCollecting()
    getgenv().Collect_Dragon_Race_Faixa1 = true
    getgenv().Collect_Dragon_Race_Faixa2 = true
    getgenv().Collect_Dragon_Race_Faixa3 = true
    getgenv().Collect_Dragon_Race_Faixa4 = true
    getgenv().Collect_Dragon_Race_Faixa5 = true
    getgenv().Collect_Dragon_Race_Faixa6 = true

    -- Inicia a coleta de todas as faixas da Raça Dragão
    collectDragonRaceFaixa1()
    collectDragonRaceFaixa2()
    collectDragonRaceFaixa3()
    collectDragonRaceFaixa4()
    collectDragonRaceFaixa5()
    collectDragonRaceFaixa6()

    debugMessage("Coleta de todas as faixas da Raça Dragão iniciada!")
end

-- Função para parar a coleta de todas as faixas da Raça Dragão
local function stopDragonRaceCollecting()
    getgenv().Collect_Dragon_Race_Faixa1 = false
    getgenv().Collect_Dragon_Race_Faixa2 = false
    getgenv().Collect_Dragon_Race_Faixa3 = false
    getgenv().Collect_Dragon_Race_Faixa4 = false
    getgenv().Collect_Dragon_Race_Faixa5 = false
    getgenv().Collect_Dragon_Race_Faixa6 = false

    debugMessage("Coleta de todas as faixas da Raça Dragão parada!")
end

-- Função para exibir mensagens de debug
local function debugMessage(message)
    print("[DEBUG] " .. message)  -- Imprime a mensagem de debug no console
end

-- Função principal que começa a coleta de todas as faixas ou para dependendo da condição
local function main()
    -- Aqui você pode alternar entre começar ou parar a coleta conforme necessário
    startDragonRaceCollecting()
    wait(60)  -- Aguarda 1 minuto antes de parar a coleta
    stopDragonRaceCollecting()
end

-- Chama a função principal
main()