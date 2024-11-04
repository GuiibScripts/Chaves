local NPC_REFIL_TYPE = 1            -- [1= NPC COMUM (hi-trade)] --  [2= NPC HOUSE(hi-service-goods-runes)] --  [3= NPC CUSTOM(hi-potions)] 
local Delay_Supplies = 2000         -- Delay para compra de supplies
local LimitBuySupplies = true       -- True = [Acima de 1k Itens, compra de 1000 em 1000]  obs: ArcanaOT limita compra 2k
local IGNORE_CAP_TO_REFIL = false   -- Caso o item esteja caindo no Chao, deixe true


--Lista Exclusao (Nao vende nada que estiver na lista abaixo)
local NotSelling = {7439, 7443, 9635, 11452, 11309, 11464, 18994, 10298, 9691, 21202, 9654, 11444, 10311, 22728, 9685, 9633, 9663, 11492, 20200, 22730, 3081, 9302, 16113, 16108, 3057, 23542, 23543, 23544, 16114, 32621, 3048, 3051, 23529, 23531, 23533, 5912, 5910, 5914, 5909, 44604, 44607, 44610, 44613, 7440}


-- START ITEMS LIST
local items = {mage = {{name = "Ultimate Mana", id = 23373, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Mana", id = 238, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Fireball", id = 3191, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Avalanche", id = 3161, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Thunderstorm", id = 3202, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Stone Shower", id = 3175, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Sudden Death", id = 3155, Amount = 0, category = "trade", categoryHouse = "runes"}, }, knight = {{name = "Supreme Health", id = 23375, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Ultimate Health", id = 7643, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Health", id = 239, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Strong Mana", id = 237, Amount = 0, category = "trade", categoryHouse = "potions"}, }, paladin = {{name = "Diamond Arrows", id = 35901, Amount = 0, category = "trade", categoryHouse = "distance"}, {name = "Spectral Bolt", id = 35902, Amount = 0, category = "trade", categoryHouse = "distance"}, {name = "Great Mana", id = 238, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Ultimate Spirit", id = 23374, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Spirit", id = 7642, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Fireball", id = 3191, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Avalanche", id = 3161, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Thunderstorm", id = 3202, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Stone Shower", id = 3175, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Sudden Death", id = 3155, Amount = 0, category = "trade", categoryHouse = "runes"}, }}
-- END ITEMS LIST
-----------------------------
local HUD_MUDAR_X = 0
local HUD_MUDAR_Y = 0
local Diference = 50

local hudsCriados = false  -- Flag para controlar se os HUDs foram criados
local createdHUDs = {}  -- Tabela para armazenar os HUDs criados

local horizontalSpacing = 60
local verticalSpacing = 30
local Multiplicador = {5, 10, 25, 50, 100, 200, 500, 1000}
local currentMultiplicadorIndex = 5

local HUDs = {}

function VerificarVocacaoDoPlayer()
    local playerId = Player:getId()
    if playerId then
        local playerCreature = Creature(playerId)
        if playerCreature then
            return playerCreature:getVocation()
        end
    end
    return nil
end

local function createItemHUDs(startX, startY)
    local playerVocation = VerificarVocacaoDoPlayer()
    if not playerVocation then
        return
    end
    
    local sublist

    if playerVocation == 1 then
        sublist = items.knight
        
        local function SUPPLIESCONFIG(xCoords, y , spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs, hud)
            end
        end
        
        local xCoords2 = {195, 235, 390}
        local xCoords1 = {210, 240, 270, 300, 330, 360, 375}
        local xCoords3 = {195, 390}


        
        SUPPLIESCONFIG(xCoords1, 20, 4598)
        SUPPLIESCONFIG(xCoords1, 45, 9850)
        SUPPLIESCONFIG(xCoords1, 60, 9850)
        SUPPLIESCONFIG(xCoords1, 90, 9850)
        SUPPLIESCONFIG(xCoords1, 120, 9850)
        SUPPLIESCONFIG(xCoords1, 150, 9850)

        SUPPLIESCONFIG(xCoords3, 20, 40470)

        SUPPLIESCONFIG(xCoords1, 5, 40469)
        SUPPLIESCONFIG(xCoords1, 30, 40469)
        SUPPLIESCONFIG(xCoords1, 45, 40469)
        SUPPLIESCONFIG(xCoords1, 75, 40469)
        SUPPLIESCONFIG(xCoords1, 105, 40469)
        SUPPLIESCONFIG(xCoords1, 135, 40469)
        SUPPLIESCONFIG(xCoords1, 165, 40469)

        SUPPLIESCONFIG(xCoords2, 45, 40470)
        SUPPLIESCONFIG(xCoords2, 75, 40470)
        SUPPLIESCONFIG(xCoords2, 105, 40470)
        SUPPLIESCONFIG(xCoords2, 135, 40470)
        SUPPLIESCONFIG(xCoords2, 150, 40470)




        local itemhudz = HUD.new(215 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "item"); itemhudz:setColor(255, 255, 255)
        table.insert(HUDs, itemhudz)



        local AmountHudz = HUD.new(300 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
        table.insert(HUDs, AmountHudz)

        local MultiplicadorHudz = HUD.new(250 + HUD_MUDAR_X, 7 + 40 + HUD_MUDAR_Y, "MULTIPLICADOR:"); MultiplicadorHudz:setColor(255, 255, 255)
        table.insert(HUDs, MultiplicadorHudz)



    elseif playerVocation == 2 then
        sublist = items.paladin

        local function SUPPLIESCONFIG(xCoords, y, spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs, hud)
            end
        end
        
        local xCoords2 = {195, 235, 390}
        local xCoords1 = {210, 240, 270, 300, 330, 360, 375}
        local xCoords3 = {195, 390}
        
        SUPPLIESCONFIG(xCoords1, 20, 4598)
        SUPPLIESCONFIG(xCoords1, 45, 9850)
        SUPPLIESCONFIG(xCoords1, 60, 9850)
        SUPPLIESCONFIG(xCoords1, 90, 9850)
        SUPPLIESCONFIG(xCoords1, 120, 9850)
        SUPPLIESCONFIG(xCoords1, 150, 9850)
        SUPPLIESCONFIG(xCoords1, 180, 9850)
        SUPPLIESCONFIG(xCoords1, 210, 9850)
        SUPPLIESCONFIG(xCoords1, 240, 9850)
        SUPPLIESCONFIG(xCoords1, 270, 9850)
        SUPPLIESCONFIG(xCoords1, 300, 9850)
        SUPPLIESCONFIG(xCoords1, 330, 9850)

        
        SUPPLIESCONFIG(xCoords3, 20, 40470)

        SUPPLIESCONFIG(xCoords1, 5, 40469)
        SUPPLIESCONFIG(xCoords1, 30, 40469)
        SUPPLIESCONFIG(xCoords1, 45, 40469)
        SUPPLIESCONFIG(xCoords1, 75, 40469)
        SUPPLIESCONFIG(xCoords1, 105, 40469)
        SUPPLIESCONFIG(xCoords1, 135, 40469)
        SUPPLIESCONFIG(xCoords1, 165, 40469)
        SUPPLIESCONFIG(xCoords1, 195, 40469)
        SUPPLIESCONFIG(xCoords1, 225, 40469)
        SUPPLIESCONFIG(xCoords1, 255, 40469)
        SUPPLIESCONFIG(xCoords1, 285, 40469)
        SUPPLIESCONFIG(xCoords1, 315, 40469)
        SUPPLIESCONFIG(xCoords1, 345, 40469)

        SUPPLIESCONFIG(xCoords2, 45, 40470)
        SUPPLIESCONFIG(xCoords2, 75, 40470)
        SUPPLIESCONFIG(xCoords2, 105, 40470)
        SUPPLIESCONFIG(xCoords2, 135, 40470)
        SUPPLIESCONFIG(xCoords2, 165, 40470)
        SUPPLIESCONFIG(xCoords2, 195, 40470)
        SUPPLIESCONFIG(xCoords2, 225, 40470)
        SUPPLIESCONFIG(xCoords2, 255, 40470)
        SUPPLIESCONFIG(xCoords2, 285, 40470)
        SUPPLIESCONFIG(xCoords2, 305, 40470)
        SUPPLIESCONFIG(xCoords2, 330, 40470)

        local itemhudz = HUD.new(215 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "item"); itemhudz:setColor(255, 255, 255)
        table.insert(HUDs, itemhudz)


        local AmountHudz = HUD.new(300 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
        table.insert(HUDs, AmountHudz)

        local MultiplicadorHudz = HUD.new(250 + HUD_MUDAR_X, 7 + 40 + HUD_MUDAR_Y, "MULTIPLICADOR:"); MultiplicadorHudz:setColor(255, 255, 255)
        table.insert(HUDs, MultiplicadorHudz)

    elseif playerVocation == 3 or playerVocation == 4 then
        sublist = items.mage

        local function SUPPLIESCONFIG(xCoords, y, spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs, hud)
            end
        end
        
        local xCoords2 = {195, 235, 390}
        local xCoords1 = {210, 240, 270, 300, 330, 360, 375}
        local xCoords3 = {195, 390}
        
        SUPPLIESCONFIG(xCoords1, 20, 4598)
        SUPPLIESCONFIG(xCoords1, 45, 9850)
        SUPPLIESCONFIG(xCoords1, 60, 9850)
        SUPPLIESCONFIG(xCoords1, 90, 9850)
        SUPPLIESCONFIG(xCoords1, 120, 9850)
        SUPPLIESCONFIG(xCoords1, 150, 9850)
        SUPPLIESCONFIG(xCoords1, 180, 9850)
        SUPPLIESCONFIG(xCoords1, 210, 9850)
        SUPPLIESCONFIG(xCoords1, 240, 9850)

        
        SUPPLIESCONFIG(xCoords3, 20, 40470)

        SUPPLIESCONFIG(xCoords1, 5, 40469)
        SUPPLIESCONFIG(xCoords1, 30, 40469)
        SUPPLIESCONFIG(xCoords1, 45, 40469)
        SUPPLIESCONFIG(xCoords1, 75, 40469)
        SUPPLIESCONFIG(xCoords1, 105, 40469)
        SUPPLIESCONFIG(xCoords1, 135, 40469)
        SUPPLIESCONFIG(xCoords1, 165, 40469)
        SUPPLIESCONFIG(xCoords1, 195, 40469)
        SUPPLIESCONFIG(xCoords1, 225, 40469)
        SUPPLIESCONFIG(xCoords1, 255, 40469)

        SUPPLIESCONFIG(xCoords2, 45, 40470)
        SUPPLIESCONFIG(xCoords2, 75, 40470)
        SUPPLIESCONFIG(xCoords2, 105, 40470)
        SUPPLIESCONFIG(xCoords2, 135, 40470)
        SUPPLIESCONFIG(xCoords2, 165, 40470)
        SUPPLIESCONFIG(xCoords2, 195, 40470)
        SUPPLIESCONFIG(xCoords2, 225, 40470)
        SUPPLIESCONFIG(xCoords2, 240, 40470)

        local itemhudz = HUD.new(215 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "item"); itemhudz:setColor(255, 255, 255)
        table.insert(HUDs, itemhudz)



        local AmountHudz = HUD.new(300 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
        table.insert(HUDs, AmountHudz)

        local MultiplicadorHudz = HUD.new(250 + HUD_MUDAR_X, 7 + 40 + HUD_MUDAR_Y, "MULTIPLICADOR:"); MultiplicadorHudz:setColor(255, 255, 255)
        table.insert(HUDs, MultiplicadorHudz)
        
    else
        return
    end




    local MultiplicadorValue = HUD.new(350 + HUD_MUDAR_X, 7 + HUD_MUDAR_Y + 40, tostring(Multiplicador[currentMultiplicadorIndex]))
    MultiplicadorValue:setColor(255, 255, 255)
    table.insert(HUDs, MultiplicadorValue)

    local function incrementMultiplicador()
        currentMultiplicadorIndex = currentMultiplicadorIndex + 1
        if currentMultiplicadorIndex > #Multiplicador then
            currentMultiplicadorIndex = #Multiplicador
        end
        MultiplicadorValue:setText(tostring(Multiplicador[currentMultiplicadorIndex]))
        MultiplicadorValue:setColor(255, 255, 255)
    end

    local function decrementMultiplicador()
        currentMultiplicadorIndex = currentMultiplicadorIndex - 1
        if currentMultiplicadorIndex < 1 then
            currentMultiplicadorIndex = 5
        end
        MultiplicadorValue:setColor(255, 255, 255)
        MultiplicadorValue:setText(tostring(Multiplicador[currentMultiplicadorIndex]))
    end

    local MultiplicadorMAIS = HUD.new(375 + HUD_MUDAR_X, 7 + HUD_MUDAR_Y + 40, "+")
    MultiplicadorMAIS:setColor(255, 255, 255)
    MultiplicadorMAIS:setCallback(incrementMultiplicador)
    table.insert(HUDs, MultiplicadorMAIS)

    local MultiplicadorMENOS = HUD.new(325 + HUD_MUDAR_X, 7 + HUD_MUDAR_Y + 40, "-")
    MultiplicadorMENOS:setColor(255, 255, 255)
    MultiplicadorMENOS:setCallback(decrementMultiplicador)
    table.insert(HUDs, MultiplicadorMENOS)

    for _, item in ipairs(sublist) do
        local ItemIcon = HUD.new(startX + 210 + HUD_MUDAR_X, startY + Diference * 6 + 40 - 280 + 40 + HUD_MUDAR_Y, item.id)
        table.insert(HUDs, ItemIcon)


        local ItemNameHUD = HUD.new(startX + Diference * 2 - 30 + 185, startY + 40 + Diference * 6 + 50 - 280, tostring(item.name), true)
        ItemNameHUD:setColor(255, 255, 255); ItemNameHUD:setFontSize(6)
        table.insert(HUDs, ItemNameHUD)



        local AmountValue = HUD.new(startX + Diference * 3 + 200, startY + 40 + Diference * 6 + 30 - 280, tostring(item.Amount))
        AmountValue:setColor(255, 255, 255)
        table.insert(HUDs, AmountValue)

        local function incrementAmount()
            item.Amount = item.Amount + tostring(Multiplicador[currentMultiplicadorIndex])
            AmountValue:setText(tostring(item.Amount))
        end

        local function decrementAmount()
            item.Amount = math.max(0, item.Amount - tostring(Multiplicador[currentMultiplicadorIndex]))
            AmountValue:setText(tostring(item.Amount))
        end

        local MAIS = HUD.new(startX + Diference * 3 - 5 + horizontalSpacing / 2 + 200, startY + 40 + Diference * 6 + 30 - 280, "+")
        MAIS:setColor(255, 255, 255)
        MAIS:setCallback(incrementAmount)
        table.insert(HUDs, MAIS)

        local MENOS = HUD.new(startX + Diference * 3 + 205 - horizontalSpacing / 2, startY + 40 + Diference * 6 + 30 - 280, "-")
        MENOS:setColor(255, 255, 255)
        MENOS:setCallback(decrementAmount)
        table.insert(HUDs, MENOS)
        
    

        startY = startY + verticalSpacing
    end
end

local function destroyItemHUDs()
    for _, hud in ipairs(HUDs) do
        hud:destroy()
    end
    HUDs = {}
end


local function SUPPLIES(xCoords, y, spriteID)
    local huds = {}
    for _, x in ipairs(xCoords) do
        local hud = HUD.new(x + HUD_MUDAR_X + 205, y + HUD_MUDAR_Y - 275, spriteID)
        table.insert(huds, hud)
        table.insert(createdHUDs, hud)  -- Adiciona o HUD à lista de criados
    end
    return huds
end

local xCoords2 = {-10, 60, 70, 110, 120, 170, 180, 220}
local xCoords1 = {5, 35, 45, 85, 95, 135, 155, 195, 205}
local huds = {}
table.insert(huds, SUPPLIES(xCoords1, Diference * 6, 9850))
table.insert(huds, SUPPLIES(xCoords1, Diference * 6 + 15, 40469))
table.insert(huds, SUPPLIES(xCoords1, Diference * 6 - 15, 40469))
table.insert(huds, SUPPLIES(xCoords2, Diference * 6, 40470))




local HUDToggle = false
local REFIL = HUD.new(HUD_MUDAR_X + 230, HUD_MUDAR_Y + Diference - 35, "SUPPLIES")
REFIL:setColor(255, 255, 255)
REFIL:setCallback(function()
    if HUDToggle then
        destroyItemHUDs()
        REFIL:setColor(255, 255, 255)


    else
        REFIL:setColor(0, 255, 0)
        
        local playerVocation = VerificarVocacaoDoPlayer()
        createItemHUDs(playerVocation, HUD_MUDAR_X, HUD_MUDAR_Y)

    end
    HUDToggle = not HUDToggle
end)    

local BUYHUD = HUD.new(HUD_MUDAR_X + 295, HUD_MUDAR_Y + Diference - 35, "BUY"); 
BUYHUD:setColor(255, 255, 255)


function getItemsByVocacao()
    local vocacao = VerificarVocacaoDoPlayer()

    if not vocacao then
        return nil
    end

    if vocacao == 1 then
        return items.knight
    elseif vocacao == 2 then
        return items.paladin
    elseif vocacao == 3 or vocacao == 4 then
        return items.mage
    else
        return nil
    end
end

function refillSupplies()
    isRefilling = true
    Client.showMessage("Iniciando Refil")

    local itemList = getItemsByVocacao()

    if not itemList then
        isRefilling = false
        return
    end

    for _, item in ipairs(itemList) do
        refillItemsAndOpenTrade(item)

    end

    isRefilling = false
end

function refillItemsAndOpenTrade(item)
    if item.Amount <= 0 then
        print("Items:", itemList)
        return
    end
    

    -- Conversar com NPC com base no tipo de recarga definido
    if NPC_REFIL_TYPE == 1 then
        Game.talk("hi", 12)
        wait(Delay_Supplies)
        Game.talk(item.category, 12)
        wait(Delay_Supplies)
    elseif NPC_REFIL_TYPE == 2 then
        Game.talk("hi", 12)
        wait(Delay_Supplies)
        Game.talk("service", 12)
        wait(Delay_Supplies)
        Game.talk("goods", 12)
        wait(Delay_Supplies)
        Game.talk(item.categoryHouse, 12)
        wait(Delay_Supplies)
    elseif NPC_REFIL_TYPE == 3 then
        Game.talk("hi", 12)
        wait(Delay_Supplies)
        Game.talk(item.categoryHouse, 12)
        wait(Delay_Supplies)
    end

    local currentItemCount = Game.getItemCount(item.id)
    local neededItems = item.Amount - currentItemCount

    if neededItems > 0 then
        print("Item recebido:", item.name, "ID:", item.id, "Amount:", item.Amount)

        -- Se `LimitBuySupplies` estiver ativo e a quantidade necessária for maior que 1000
        if LimitBuySupplies and neededItems > 1000 then
            local remainingItems = neededItems

            -- Compras em lotes de 1000 até atingir a quantidade necessária
            while remainingItems > 0 do
                local batchSize = math.min(1000, remainingItems)

                -- Tentar comprar um lote de 1000 ou menos se faltar menos que 1000
                local success = Npc.buy(item.id, batchSize, IGNORE_CAP_TO_REFIL, false)
                
                -- Aguardar para garantir atualização
                wait(Delay_Supplies)

                -- Atualizar a quantidade de itens após a compra
                local newItemCount = Game.getItemCount(item.id)
                local boughtCount = newItemCount - currentItemCount

                if boughtCount > 0 then
                    currentItemCount = newItemCount  -- Atualiza a contagem atual para o próximo ciclo
                    remainingItems = remainingItems - boughtCount  -- Só subtrai se houver compra
                    Client.showMessage("Comprou: <font color='#f77802'>" .. item.name .. "</font> x" .. boughtCount)
                else
                    Client.showMessage("Nao foi possivel comprar: <font color='#f77802'>" .. item.name .. "</font>")
                    break  -- Interrompe se não conseguir comprar
                end
            end
        else
            -- Compra total se `LimitBuySupplies` for falso ou se a quantidade for menor ou igual a 1000
            local success = Npc.buy(item.id, neededItems, IGNORE_CAP_TO_REFIL, false)
            
            -- Aguardar para garantir atualização
            wait(Delay_Supplies)

            -- Verificar a nova quantidade de itens após a compra
            local newItemCount = Game.getItemCount(item.id)
            local boughtCount = newItemCount - currentItemCount

            if boughtCount > 0 then
                Client.showMessage("Comprou: <font color='#f77802'>" .. item.name .. "</font> x" .. boughtCount)
            else
                Client.showMessage("Nao foi possivel comprar: <font color='#f77802'>" .. item.name .. "</font>")
            end
        end
    else
        Client.showMessage("Nao e necessario comprar: <font color='#f77802'>" .. item.name .. "</font>")
    end
end

BUYHUD:setCallback(refillSupplies)

local SAVE = HUD.new(HUD_MUDAR_X + 350, HUD_MUDAR_Y + Diference - 35, "SAVE")
SAVE:setColor(255, 255, 255)
local nomescript = nil

function registrarNomeScript()
    local info = debug.getinfo(1, "S")
    nomescript = info.source:match("([^/\\]+)$")
end

registrarNomeScript()

local ITEMS_START_MARKER = "-- START ITEMS LIST"
local ITEMS_END_MARKER = "-- END ITEMS LIST"

-- Função para serializar a tabela `items` em formato de string Lua
local function serializeItems(tbl)
    local str = ITEMS_START_MARKER .. "\n" -- Marcador de início
    str = str .. "local items = {" -- Início da lista de itens

    -- Monta a lista de itens em uma única linha
    local itemLines = {}
    for category, itemsList in pairs(tbl) do
        table.insert(itemLines, category .. " = {")
        for _, item in ipairs(itemsList) do
            table.insert(itemLines, "{name = \"" .. item.name .. "\", id = " .. item.id ..
                            ", Amount = " .. item.Amount ..
                            ", category = \"" .. item.category .. "\", categoryHouse = \"" .. item.categoryHouse .. "\"}, ")
        end
        table.insert(itemLines, "}, ")
    end

    -- Remove a vírgula e o espaço extras no final da lista
    str = str .. table.concat(itemLines):gsub(", %s*$", "") .. "}" -- Fecha a lista de itens
    str = str .. "\n" .. ITEMS_END_MARKER -- Marcador de fim

    return str
end

function salvarEAtualizarConfig()
    if not nomescript then
        return
    end

    local scriptsDirectory = Engine.getScriptsDirectory()
    local filename = scriptsDirectory .. "/" .. nomescript

    -- Lê o arquivo existente
    local file = io.open(filename, "r")
    if not file then
        return
    end

    local content = file:read("*all")
    file:close()

    if not content then
        return
    end



    -- Verifica se os marcadores da lista de itens existem no conteúdo
    local startIdx = content:find(ITEMS_START_MARKER)
    local endIdx = content:find(ITEMS_END_MARKER)

    if startIdx and endIdx then
        endIdx = endIdx + #ITEMS_END_MARKER - 1
        content = content:sub(1, startIdx - 1) ..
                  serializeItems(items) ..
                  content:sub(endIdx + 1)
    end


    -- Salva o conteúdo atualizado de volta no arquivo
    file = io.open(filename, "w")
    if not file then
        return
    end

    file:write(content)
    file:close()
    Client.showMessage("<font color='#d3ff87'>Configuracao Salva com sucesso!</font>")
end

SAVE:setCallback(salvarEAtualizarConfig)

-----------------------------------

local itemList = {
    3311, -- clerical mace
    7440, -- mastermind potion
    7443, -- bullseye potion
    7439, -- berserk potion
    7441, -- ice cube
    11445, -- bamboo stick
    9688, -- bundle of cursed straw
    10300, -- carniphila seeds
    3728, -- dark mushroom
    3731, -- fire mushroom
    3674, -- goat grass
    3661, -- grave flower
    3732, -- green mushroom
    9692, -- lump of dirt
    10305, -- lump of earth
    10314, -- nettle blossom
    11476, -- nettle spit
    3726, -- orange mushroom
    3739, -- powder herb
    647, -- seeds
    3740, -- shadow herb
    3738, -- sling herb
    9686, -- swamp grass
    3741, -- troll green
    11515, -- trollroot
    3727, -- wood mushroom
    3214, -- blessed ankh
    35596, -- mouldy powder
    43729, -- werecrocodile tongue
    43730, -- weretiger tooth
    43731, -- werepanther claw
    43732, -- silver moon coin
    43733, -- silver foxmouse coin
    43734, -- golden sun coin
    43735, -- golden tiger coin
    43736, -- moon pin
    43737, -- sun brooch
    43739, -- moon compass
    43846, -- decayed finger bone
    43847, -- rotten vermin ichor
    43848, -- worm sponge
    43849, -- rotten roots
    43850, -- dark obsidian splinter
    43851, -- darklight matter
    43852, -- darklight basalt chunk
    43853, -- darklight core
    43856, -- bloated maggot
    43857, -- blooded worm
    43858, -- basalt crumbs
    43859, -- basalt core
    43888, -- closed pocket sundial
    43961, -- figurine of Vemiath
    43962, -- figurine of Murcion
    43963, -- figurine of Bakragore
    43964, -- Ichgahal's fungal infestation
    43965, -- Murcion's mycelium
    43966, -- Chargoz igneous obsidian
    43967, -- Vemiath's infused basalt
    43968, -- Bakragore's amalgamation
    12805, -- yielocks
    10299, -- badger fur
    953, -- nail
    3098, -- ring of healing
    5944, -- soul orb
    3306, -- golden sickle
    2842, -- book
    10289, -- red lantern
    3060, -- orb
    2903, -- golden mug
    16102, -- mucus plug
    40587, -- rhindeer antlers
    40586, -- carnivostrich feather
    40585, -- harpy feathers
    40584, -- boar man hoof
    40583, -- liodile fang
    40582, -- crab man claws
    40535, -- broken Iks spear
    40534, -- broken Iks sandals
    40533, -- broken Iks cuirass
    40532, -- broken Iks headpiece
    40531, -- broken Iks faulds
    40530, -- broken macuahuitl
    40528, -- ritual tooth
    40527, -- rotten feather
    16160, -- crystalline sword
    25698, -- butterfly ring
    39406, -- coral branch
    39415, -- corrupt naga scales
    39379, -- emerald tortoise shell
    39407, -- flotsam
    39377, -- gore horn
    39392, -- gorerilla mane
    39393, -- gorerilla tail
    39387, -- headpecker beak
    39388, -- headpecker feather
    39410, -- hydrophytes
    39404, -- jungle moa claw
    39405, -- jungle moa egg
    39403, -- jungle moa feather
    39401, -- makara fin
    39402, -- makara tongue
    39386, -- mantosaurus jaw
    39395, -- mercurial wing
    39413, -- naga archer scales
    39411, -- naga armring
    39412, -- naga earring
    39414, -- naga warrior scales
    39381, -- nighthunter wing
    39399, -- one of Timira's many heads
    39418, -- parder fur
    39417, -- parder tooth
    39400, -- piece of Timira's sensors
    39383, -- prehemoth claw
    39382, -- prehemoth horns
    39389, -- ripptor claw
    39391, -- ripptor scales
    39416, -- rogue naga scales
    39378, -- sabretooth fur
    39408, -- small tropical fish
    39543, -- smoldering eye
    39384, -- stalking seeds
    39375, -- sulphider shell
    39376, -- sulphur powder
    3265, -- two handed sword
    39380, -- undertaker fangs
    39040, -- fiery tear
    39038, -- royal almandine
    2958, -- war horn
    6499, -- demonic essence
    5917, -- bandana
    9103, -- batwing hat
    3408, -- bonelord helmet
    3354, -- brass helmet
    20184, -- broken visor
    3352, -- chain helmet
    3407, -- charmer's tiara
    11674, -- cobra crown
    21892, -- crest of the deep seas
    3385, -- crown helmet
    3391, -- crusader helmet
    3384, -- dark helmet
    3387, -- demon helmet
    3356, -- devil helmet
    3406, -- feather headdress
    9013, -- flower wreath
    829, -- glacier mask
    17852, -- helmet of the lost
    5460, -- helmet of the deep
    3405, -- horseman helmet
    3353, -- iron helmet
    10451, -- jade hat
    7461, -- krimhorn helmet
    3355, -- leather helmet
    3374, -- legion helmet
    828, -- lightning headband
    827, -- magma monocle
    3574, -- mystic turban
    7459, -- pair of earmuffs
    6096, -- pirate hat
    25088, -- porcelain mask
    7462, -- ragnir helmet
    3392, -- royal helmet
    21165, -- rubber cap
    22192, -- shamanic mask
    5741, -- skull helmet
    3375, -- soldier helmet
    31438, -- sphinx tiara
    3351, -- steel helmet
    3373, -- strange helmet
    3376, -- studded helmet
    830, -- terra hood
    3403, -- tribal mask
    3367, -- viking helmet
    3369, -- warrior helmet
    9653, -- witch hat
    3575, -- wood cape
    10385, -- Zaoan helmet
    19358, -- albino plate
    8044, -- belted cape
    3567, -- blue robe
    3359, -- brass armor
    17829, -- buckle
    14086, -- calopteryx cape
    3358, -- chain armor
    3381, -- crown armor
    8050, -- crystalline armor
    3383, -- dark armor
    8057, -- divine plate
    8039, -- dragon robe
    3386, -- dragon scale mail
    3397, -- dwarven armor
    11651, -- elite draken mail
    9015, -- flower dress
    8043, -- focus cape
    22085, -- fur armor
    824, -- glacier robe
    21164, -- glooth cape
    3360, -- golden armor
    19372, -- goo shell
    8041, -- greenwood coat
    21167, -- heat core
    8045, -- hibiscus dress
    3370, -- knight armor
    8049, -- lavos armor
    17846, -- leather harness
    3404, -- leopard armor
    825, -- lightning robe
    3366, -- magic plate armor
    826, -- magma coat
    7463, -- mammoth fur cape
    21166, -- mooh'tah plate
    8063, -- paladin armor
    6095, -- pirate shirt
    3357, -- plate armor
    3377, -- scale armor
    3568, -- simple dress
    8061, -- skullcracker armor
    10438, -- spellweaver's robe
    8042, -- spirit cloak
    3378, -- studded armor
    8046, -- summer dress
    8052, -- swamplair armor
    811, -- terra mantle
    8055, -- windborn colossus armor
    10384, -- Zaoan armor
    10439, -- Zaoan robe
    21168, -- alloy legs
    3560, -- bast skirt
    645, -- blue legs
    3372, -- brass legs
    3558, -- chain legs
    3382, -- crown legs
    823, -- glacier kilt
    3364, -- golden legs
    14087, -- grasshopper legs
    3371, -- knight legs
    9014, -- leaf legs
    822, -- lightning legs
    821, -- magma legs
    7464, -- mammoth fur shorts
    5918, -- pirate knee breeches
    3557, -- plate legs
    812, -- terra legs
    22087, -- wereboar loincloth
    10387, -- Zaoan legs
    22086, -- badger boots
    3079, -- boots of haste
    9017, -- coconut shoes
    3556, -- crocodile boots
    4033, -- draken boots
    7457, -- fur boots
    819, -- glacier shoes
    10323, -- guardian boots
    820, -- lightning boots
    818, -- magma boots
    21169, -- metal spats
    21981, -- oriental shoes
    3550, -- patched boots
    5461, -- pirate boots
    3554, -- steel boots
    813, -- terra boots
    10386, -- Zaoan shoes
    10296, -- acorn
    29943, -- Alptramun's toothbrush
    24384, -- ancient belt buckle
    31588, -- ancient liche bone
    32589, -- angel figurine
    10297, -- antlers
    5883, -- ape fur
    33933, -- apron
    903, -- badger fur
    11511, -- banana sash
    17856, -- basalt fetish
    17857, -- basalt figurine
    6491, -- bat decoration
    5894, -- bat wing
    5896, -- bear paw
    25742, -- fig leaf
    32114, -- beer tap
    24381, -- beetle carapace
    5930, -- behemoth claw
    9645, -- black hood
    11448, -- black wool
    16131, -- blazing bone
    11449, -- blood preservation
    18928, -- blood tincture in a vial
    17827, -- bloody dwarven beard
    9633, -- bloody pincers
    32594, -- bloody tears
    29345, -- blue glass plate
    31559, -- blue goanna scale
    5912, -- blue piece of cloth
    9667, -- boggy dreads
    17809, -- bola
    17831, -- bone fetish
    10404, -- bone shoulderplate
    24380, -- bone toothpick
    17830, -- bonecarving knife
    5898, -- bonelord eye
    24942, -- bones of Zorvorax
    10277, -- bony tail
    10320, -- book of necromantic rituals
    9646, -- book of prayers
    28569, -- book page
    20204, -- bowl of terror sweat
    32578, -- Brain Head's giant neuron
    32579, -- Brain Head's left hemisphere
    32580, -- Brain Head's right hemisphere
    30324, -- bright bell
    11702, -- brimstone fangs
    11703, -- brimstone shell
    11451, -- broken crossbow
    11660, -- broken draken mail
    10418, -- broken halberd
    11453, -- broken helmet
    11652, -- broken key ring
    34161, -- broken longbow
    11452, -- broken shamanic staff
    11661, -- broken slicer
    17851, -- broken throwing axe
    34023, -- brooch of embracement
    5913, -- brown piece of cloth
    9689, -- bunch of troll hair
    34138, -- capricious heart
    5810, -- pirate voodoo doll
    12483, -- pharaoh banner
    34145, -- capricious robe
    10275, -- carrion worm fang
    5479, -- cat's paw
    27599, -- cave devourer eyes
    27601, -- cave devourer legs
    27600, -- cave devourer maw
    10301, -- centipede leg
    27603, -- chasm spawn abdomen
    27602, -- chasm spawn head
    27604, -- chasm spawn tail
    17817, -- cheese cutter
    17818, -- cheesy figurine
    5890, -- chicken feather
    27622, -- chitinous mouth
    27626, -- chitinous mouth
    16134, -- cliff strider claw
    12600, -- coal
    31678, -- cobra crest
    9634, -- cobra tongue
    11514, -- colourful feather
    25089, -- colourful feathers
    25695, -- dandelion seeds
    10302, -- compass
    14083, -- compound eye
    23501, -- condensed energy
    10409, -- corrupted flag
    6536, -- Countess Sorrow's frozen tear
    32012, -- cow bell
    10272, -- crab pincers
    24385, -- cracked alabaster vase
    14079, -- crawler head plating
    33982, -- crawler's essence
    33935, -- crown
    33923, -- Cruelty's chest
    33922, -- Cruelty's claw
    23521, -- crystal bone
    16163, -- crystal crossbow
    23507, -- crystallized anger
    9638, -- cultish mask
    9639, -- cultish robe
    11455, -- cultish symbol
    23511, -- curious matter
    32774, -- cursed bone
    10410, -- cursed shoulder spikes
    9657, -- cyclops toe
    28822, -- damaged armor plates
    27620, -- damaged worm head
    17463, -- damselfly eye
    17458, -- damselfly wing
    25694, -- fairy wings
    23515, -- dangerous proto matter
    30325, -- dark bell
    32596, -- dark bell
    10303, -- dark rosary
    20202, -- dead weight
    14011, -- deepling breaktime snack
    14044, -- deepling claw
    14010, -- deepling guard belt buckle
    14041, -- deepling ridge
    14017, -- deepling scales
    14012, -- deepling warts
    14013, -- deeptags
    27594, -- deepworm jaws
    27593, -- deepworm spike roots
    27592, -- deepworm spikes
    5906, -- demon dust
    5954, -- demon horn
    12541, -- demonic finger
    9647, -- demonic skeletal hand
    34025, -- diabolic skull
    27598, -- diremaw legs
    27597, -- diremaw brainpan
    11456, -- dirty turban
    34142, -- distorted heart
    34149, -- distorted robe
    11684, -- downy feather
    19110, -- dowser
    6546, -- Dracola's eye
    9035, -- dracoyle statue
    9034, -- dracoyle statue
    24937, -- dragon blood
    5919, -- dragon claw
    10444, -- dragon priest's wandtip
    24938, -- dragon tongue
    11457, -- dragon's tail
    11658, -- draken sulphur
    11659, -- draken wristbands
    30005, -- dream essence egg
    14225, -- dung ball
    17819, -- earflap
    10276, -- elder bonelord tentacle
    11465, -- elven astral observer
    18994, -- elven hoof
    11464, -- elven scouting glass
    9635, -- elvish talisman
    31331, -- empty honey glass
    5891, -- enchanted chicken wing
    23523, -- energy ball
    23508, -- energy vein
    32698, -- ensouled essence
    10306, -- essence of a bad dream
    12730, -- eye of a deepling
    16132, -- eye of a weeper
    11671, -- eye of corruption
    31443, -- Fafnar symbol
    25693, -- shimmering beetles
    28823, -- falcon crest
    3737, -- fern
    9636, -- fiery heart
    25741, -- sulphur
    34019, -- figurine of Cruelty
    34021, -- figurine of Greed
    34020, -- figurine of Hatred
    34018, -- figurine of Malice
    33953, -- figurine of Megalomania
    33952, -- figurine of Spite
    19111, -- fir cone
    5895, -- fish fin
    11466, -- flask of embalming fluid
    5885, -- flask of warrior's sweat
    27462, -- fox paw
    20199, -- frazzle skin
    20198, -- frazzle tongue
    9658, -- frost giant pelt
    9648, -- frosty ear of a troll
    9661, -- frosty heart
    23519, -- frozen lightning
    34164, -- fur shred
    9649, -- gauze bandage
    11458, -- geomancer's robe
    11463, -- geomancer's staff
    10449, -- ghastly dragon head
    9690, -- ghostly tissue
    11467, -- ghoul snack
    10280, -- giant eye
    27619, -- giant tentacle
    11443, -- girlish hair decoration
    8143, -- gland
    23522, -- glistening bone
    9054, -- glob of acid slime
    9053, -- glob of mercury
    9055, -- glob of tar
    22007, -- gloom wolf fur
    28570, -- glowing rune
    31561, -- goanna claw
    31560, -- goanna meat
    34022, -- goblet of gloom
    11539, -- goblin ear
    25689, -- golden brush
    21974, -- golden lotus brooch
    31324, -- golden mask
    20205, -- goosebump leather
    28824, -- grant of arms
    33924, -- Greed's arm
    25696, -- colourful snail shell
    5877, -- green dragon leather
    5920, -- green dragon scale
    29346, -- green glass plate
    5910, -- green piece of cloth
    32593, -- grimace
    34024, -- gruesome fan
    25744, -- torn shirt
    11446, -- hair of a banshee
    33936, -- hand
    5925, -- hardened bone
    27625, -- harpoon of a giant snail
    18997, -- hatched rorc egg
    9683, -- haunted piece of wood
    34140, -- hazardous heart
    34147, -- hazardous robe
    33937, -- head
    33932, -- head
    3657, -- heaven blossom
    9637, -- hellhound slobber
    10304, -- hellspawn tail
    20206, -- hemp rope
    16140, -- hideous chunk
    10415, -- high guard flag
    10416, -- high guard shoulderplates
    17850, -- holy ash
    5922, -- holy orchid
    5902, -- honeycomb
    24941, -- horn of Kalyassa
    18926, -- horoscope
    27621, -- huge shell
    27627, -- huge spiky snail shell
    16139, -- humongous chunk
    11469, -- hunter's quiver
    10282, -- hydra head
    30058, -- ice flower
    18929, -- incantation notes
    34139, -- infernal heart
    34146, -- infernal robe
    28568, -- inkwell
    23516, -- instable proto matter
    5880, -- iron ore
    33945, -- ivory carving
    32773, -- ivory comb
    29944, -- Izcandar's snow globe
    29945, -- Izcandar's sundial
    32595, -- jagged sickle
    34014, -- jaws
    11470, -- jewelled belt
    34100, -- Katex' blood
    14009, -- key to the Drowned Library
    14077, -- kollos shell
    11471, -- kongra's shoulderpad
    31441, -- lamassu hoof
    31442, -- lamassu horn
    10455, -- lancer beetle shell
    18925, -- lancet
    10417, -- legionnaire flags
    34162, -- lion cloak patch
    34160, -- lion crest
    34163, -- lion seal
    9691, -- lion's mane
    25702, -- little bowl of myrrh
    11680, -- lizard essence
    31340, -- lizard heart
    5876, -- lizard leather
    5881, -- lizard scale
    27624, -- longing eyes
    17826, -- lost basher's spike
    17853, -- lost bracers
    17848, -- lost husher's staff
    32227, -- lost soul
    32711, -- luminescent crystal pickaxe
    11454, -- luminous orb
    17854, -- mad froth
    5904, -- magic sulphur
    33920, -- Malice's horn
    33921, -- Malice's spine
    30088, -- Malofur's lunchbox
    10321, -- mammoth tusk
    11489, -- mantassin tail
    31440, -- manticore ear
    31439, -- manticore tail
    17461, -- marsh stalker beak
    17462, -- marsh stalker feather
    29942, -- Maxxenius Head
    32010, -- meat hammer
    31591, -- medal of valiance
    33928, -- Megalomania's essence
    33925, -- Megalomania's skull
    32011, -- milk churn
    11472, -- minotaur horn
    5878, -- minotaur leather
    11474, -- miraculum
    34165, -- ramp
    34141, -- mould heart
    34148, -- mould robe
    6537, -- Mr. Punish's handcuffs
    9662, -- mutated bat ear
    10308, -- mutated flesh
    9668, -- mutated rat tail
    9660, -- mystical hourglass
    11475, -- necromantic robe
    31595, -- noble amulet
    31593, -- noble cape
    11486, -- noble turban
    5804, -- nose ring
    23510, -- odd organ
    22188, -- ogre ear stud
    22189, -- ogre nose ring
    11479, -- orc leather
    10196, -- orc tooth
    11477, -- orcish gear
    22729, -- pair of hellflayer horns
    32705, -- pair of old bracers
    32598, -- Pale Worm's scalp
    28821, -- patch of fine cloth
    21975, -- peacock feather fan
    11481, -- pelvis bone
    5893, -- perfect behemoth fang
    10420, -- petrified scream
    32704, -- phantasmal hair
    11483, -- piece of archer armor
    10279, -- piece of crocodile leather
    9663, -- piece of dead brain
    6540, -- piece of Massacre's shell
    9641, -- piece of scarab shell
    17823, -- piece of swampling wood
    11482, -- piece of warrior armor
    18930, -- pieces of magic chalk
    9693, -- pig foot
    11484, -- pile of grave earth
    30087, -- Plagueroot offshoot
    23506, -- plasma pearls
    23520, -- plasmatic lightning
    29348, -- poison gland
    11485, -- poison spider shell
    9640, -- poisonous slime
    9650, -- polar bear paw
    20207, -- pool of chitinous glue
    27618, -- pristine worm head
    11444, -- protective charm
    32228, -- purified soul
    11473, -- purple robe
    11491, -- quara bone
    11488, -- quara eye
    11490, -- quara pincers
    11487, -- quara tentacle
    28567, -- quill
    27301, -- rare earth
    32597, -- ravenous circlet
    5948, -- red dragon leather
    5882, -- red dragon scale
    31558, -- red goanna scale
    17855, -- red hair dye
    5911, -- red piece of cloth
    24388, -- rhino hide
    24389, -- rhino horn
    24386, -- rhino horn carving
    33929, -- rod
    33938, -- roots
    11492, -- rope belt
    18996, -- rorc egg
    18993, -- rorc feather
    31589, -- rotten heart
    10291, -- rotten piece of cloth
    10311, -- sabretooth
    11493, -- safety pin
    27874, -- sample of monster blood
    10456, -- sandcrawler shell
    11673, -- scale of corruption
    24939, -- scale of Gelidrazah
    9631, -- scarab pincers
    9651, -- scorpion tail
    11510, -- scroll of heroic deeds
    10312, -- scythe leg
    31323, -- sea horse figurine
    9666, -- sea serpent scale
    10407, -- shaggy tail
    11478, -- shamanic hood
    22184, -- shamanic talisman
    25692, -- fresh fruit
    20183, -- sight of surrender's eye
    31592, -- signet ring
    20200, -- silencer claws
    20201, -- silencer resonating chamber
    28566, -- silken bookmark
    10292, -- silky fur
    32772, -- silver hand mirror
    25701, -- single human eye
    6525, -- skeleton decoration
    11480, -- skull belt
    22191, -- skull fetish
    17849, -- skull shatterer
    10274, -- skunk tail
    27623, -- slimy leg
    23524, -- small energy ball
    11512, -- small flask of eyedrops
    11450, -- small notebook
    2933, -- small oil lamp
    11513, -- small pitchfork
    9694, -- snake skin
    5875, -- sniper gloves
    23517, -- solid rage
    22730, -- some grimeleech wings
    5809, -- soul stone
    23518, -- spark sphere
    23502, -- sparkion claw
    23504, -- sparkion legs
    23505, -- sparkion stings
    23503, -- sparkion tail
    32724, -- spectral gold nugget
    32725, -- spectral silver nugget
    14008, -- spellsinger's seal
    31437, -- sphinx feather
    8031, -- spider fangs
    5879, -- spider silk
    14082, -- spidris mandible
    10408, -- spiked iron ball
    5884, -- spirit container
    33926, -- Spite's spirit
    14078, -- spitter nose
    9642, -- spooky blue eye
    34103, -- Srezz' eye
    3736, -- star herb
    3735, -- stone herb
    10278, -- stone wing
    27606, -- stonerefiner's skull
    10309, -- strand of medusa hair
    24387, -- tarnished rhino figurine
    3058, -- strange symbol
    10293, -- striped fur
    17822, -- swampling moss
    14076, -- swarmer antenna
    11672, -- tail of corruption
    10281, -- tarantula egg
    9684, -- tattered piece of robe
    33934, -- telescope eye
    11666, -- tentacle piece
    10453, -- terramite eggs
    10454, -- terramite legs
    10452, -- terramite shell
    10273, -- terrorbird beak
    6539, -- the Handmaiden's protector
    6534, -- the Imperor's trident
    6535, -- the Plasmother's remains
    10307, -- thick fur
    9643, -- thorn
    31594, -- token of love
    18924, -- tooth file
    24940, -- tooth of Tazhadur
    25743, -- bed of nails
    20203, -- trapped bad dream monster
    27595, -- tunnel tyrant head
    27596, -- tunnel tyrant shell
    5899, -- turtle shell
    3044, -- tusk
    10450, -- undead heart
    10316, -- unholy bone
    31623, -- Urmahlullu's mane
    31624, -- Urmahlullu's paw
    31622, -- Urmahlullu's tail
    34101, -- Utua's poison
    5905, -- vampire dust
    9685, -- vampire teeth
    18927, -- vampire's cape chain
    32009, -- veal
    18995, -- venison
    22728, -- vexclaw talon
    33927, -- vial of Hatred
    34143, -- vibrant heart
    34144, -- vibrant robe
    29347, -- violet glass plate
    23514, -- volatile proto matter
    10405, -- warmaster's wristguards
    10318, -- warwolf fur
    14080, -- waspoid claw
    14081, -- waspoid wing
    10397, -- weaver's wandtip
    22051, -- werebadger claws
    22055, -- werebadger skull
    22057, -- werebear fur
    22056, -- werebear skull
    22053, -- wereboar hooves
    22054, -- wereboar tusks
    27463, -- werefox tail
    33943, -- werehyaena nose
    33944, -- werehyaena talisman
    22052, -- werewolf fangs
    10317, -- werewolf fur
    5909, -- white piece of cloth
    10411, -- widow's mandibles
    25691, -- wild flowers
    17847, -- wimp tooth chain
    10313, -- winged tail
    10295, -- winter wolf fur
    9652, -- witch broom
    27607, -- withered pauldrons
    27608, -- withered scalp
    5897, -- wolf paw
    5901, -- wood
    10319, -- wool
    32600, -- writhing brain
    32599, -- writhing heart
    9665, -- wyrm scale
    9644, -- wyvern talisman
    5914, -- yellow piece of cloth
    12742, -- yielowax
    34102, -- Yirkas' egg
    31590, -- young lich worm
    10413, -- zaogun flag
    10414, -- zaogun shoulderplates
    10398, -- draken trophy
    7401, -- minotaur trophy
    10244, -- bonebeast trophy
    7397, -- deer trophy
    7400, -- lion trophy
    7395, -- orc trophy
    7394, -- wolf trophy
    7396, -- behemoth trophy
    7393, -- demon trophy
    7399, -- dragon lord trophy
    10421, -- disgusting trophy
    22101, -- werebadger trophy
    22102, -- wereboar trophy
    22103, -- werebear trophy
    9613, -- sea serpent trophy
    11679, -- souleater trophy
    902, -- marlin trophy
    32626, -- amber
    32624, -- amber with a bug
    32625, -- amber with a dragonfly
    24390, -- ancient coin
    14112, -- bar of gold
    3027, -- black pearl
    16119, -- blue crystal shard
    16124, -- blue crystal splinter
    3041, -- blue gem
    16123, -- brown crystal splinter
    24391, -- coral brooch
    30055, -- Crunor idol
    3068, -- crystal wand
    16125, -- cyan crystal fragment
    32770, -- diamond
    30053, -- dragon figurine
    3010, -- emerald bangle
    24392, -- gemmed figurine
    32622, -- giant amethyst
    30060, -- giant emerald
    30059, -- giant ruby
    30061, -- giant sapphire
    281, -- giant shimmering pearl
    282, -- giant shimmering pearl
    32623, -- giant topaz
    9058, -- gold ingot
    3040, -- gold nugget
    16127, -- green crystal fragment
    16121, -- green crystal shard
    16122, -- green crystal splinter
    3038, -- green gem
    30180, -- hexagonal ruby
    33781, -- lion figurine
    3062, -- mind stone
    32771, -- moonstone
    22193, -- onyx chip
    22194, -- opal
    5021, -- orichalcum pearl
    30056, -- ornate locket
    24962, -- prismatic quartz
    25737, -- rainbow quartz
    16126, -- red crystal fragment
    3039, -- red gem
    3042, -- scarab coin
    3017, -- silver brooch
    32583, -- skull coin
    3033, -- small amethyst
    3028, -- small diamond
    3032, -- small emerald
    3030, -- small ruby
    3029, -- small sapphire
    9057, -- small topaz
    675, -- small enchanted sapphire
    677, -- small enchanted emerald
    676, -- small enchanted ruby
    678, -- small enchanted amethyst
    3034, -- talon
    24961, -- tiger eye
    30054, -- unicorn figurine
    16120, -- violet crystal shard
    3036, -- violet gem
    33779, -- watermelon tourmaline
    33780, -- watermelon tourmaline
    32769, -- white gem
    3026, -- white pearl
    34008, -- white silk flower
    3037, -- yellow gem
    3092, -- axe ring
    12737, -- broken ring of ending
    25697, -- green bandage
    9392, -- claw of 'The Noxious Spawn'
    3093, -- club ring
    3007, -- crystal ring
    6299, -- death ring
    3097, -- dwarven ring
    3051, -- energy ring
    19359, -- horn
    3052, -- life ring
    3048, -- might ring
    3050, -- power ring
    3100, -- ring of healing
    23529, -- ring of blue plasma
    23531, -- ring of green plasma
    23533, -- ring of red plasma
    3006, -- ring of the sky
    3049, -- stealth ring
    3091, -- sword ring
    3053, -- time ring
    3004, -- wedding ring
    3057, -- amulet of loss
    3025, -- ancient amulet
    10457, -- beetle necklace
    3080, -- broken amulet
    3056, -- bronze amulet
    23542, -- collar of blue plasma
    23543, -- collar of green plasma
    23544, -- collar of red plasma
    3008, -- crystal necklace
    3019, -- demonbone amulet
    3085, -- dragon necklace
    3082, -- elven amulet
    3083, -- garlic necklace
    21170, -- gearwheel chain
    815, -- glacier amulet
    21183, -- glooth amulet
    3013, -- golden amulet
    9303, -- leviathan's amulet
    816, -- lightning pendant
    817, -- magma amulet
    13990, -- necklace of the deep
    22195, -- onyx pendant
    3055, -- platinum amulet
    3084, -- protection amulet
    3016, -- ruby necklace
    9302, -- sacred tree amulet
    3018, -- scarab amulet
    9304, -- shockwave amulet
    3054, -- silver amulet
    3014, -- star amulet
    3081, -- stone skin amulet
    3045, -- strange talisman
    814, -- terra amulet
    10412, -- wailing widow's necklace
    22060, -- werewolf amulet
    3012, -- wolf tooth chain
    7436, -- angelic axe
    3317, -- barbarian axe
    3344, -- beastslayer axe
    7412, -- butcher's axe
    3328, -- daramian waraxe
    13991, -- deepling axe
    3302, -- dragon lance
    10388, -- drakinata
    7419, -- dreaded cleaver
    3323, -- dwarven axe
    21176, -- execowtioner axe
    7453, -- executioner
    3320, -- fire axe
    21180, -- glooth axe
    7454, -- glorious axe
    14043, -- guardian axe
    3315, -- guardian halberd
    3269, -- halberd
    7380, -- headchopper
    12683, -- heavy trident
    7389, -- heroic axe
    14089, -- hive scythe
    3318, -- knight axe
    21174, -- mino lance
    3314, -- naginata
    7456, -- noble axe
    3313, -- obsidian lance
    22172, -- ogre choppa
    3316, -- orcish axe
    7411, -- ornamented axe
    22727, -- rift lance
    7434, -- royal axe
    6553, -- ruthless axe
    7413, -- titan axe
    7388, -- vile axe
    3279, -- war hammer
    14040, -- warrior's axe
    10406, -- Zaoan halberd
    788, -- earth war axe
    805, -- energy war axe
    669, -- fiery war axe
    688, -- icy war axe
    3342, -- war axe
    7414, -- abyss hammer
    7426, -- amber staff
    3341, -- arcane staff
    3348, -- banana staff
    3305, -- battle hammer
    7429, -- blessed sceptre
    3337, -- bone club
    7428, -- bonebreaker
    7379, -- brutetamer's staff
    7427, -- chaos mace
    7415, -- cranial basher
    3333, -- crystal mace
    3327, -- daramian mace
    14250, -- deepling squelcher
    13987, -- deepling staff
    7387, -- diamond sceptre
    10391, -- drachaku
    3322, -- dragon hammer
    7430, -- dragonbone staff
    7432, -- furry club
    21178, -- glooth club
    21172, -- glooth whip
    3332, -- hammer of wrath
    3340, -- heavy mace
    7422, -- jade hammer
    17813, -- life preserver
    7424, -- lunar staff
    7381, -- mammoth whopper
    21171, -- metal bat
    21173, -- moohtant cudgel
    22171, -- ogre klubba
    7421, -- onyx flail
    7392, -- orcish maul
    14001, -- ornate mace
    17828, -- pair of iron fists
    7410, -- queen's sceptre
    7437, -- sapphire hammer
    7451, -- shadow sceptre
    3324, -- skull staff
    7452, -- spiked squelcher
    17859, -- spiky club
    7425, -- taurus mace
    5803, -- arbalest
    8022, -- chain bolter
    8021, -- modified crossbow
    14247, -- ornate crossbow
    22866, -- rift bow
    22867, -- rift crossbow
    8025, -- the ironworker
    8027, -- composite hornbow
    7438, -- elvish bow
    14246, -- hive bow
    16164, -- mycological bow
    8029, -- silkweaver bow
    7404, -- assassin dagger
    7383, -- relic sword
    7406, -- blacksteel sword
    7449, -- crystal sword
    7382, -- demonrage sword
    782, -- earth blacksteel sword
    780, -- earth relic sword
    797, -- energy blacksteel sword
    795, -- energy relic sword
    663, -- fiery blacksteel sword
    661, -- fiery relic sword
    682, -- icy blacksteel sword
    680, -- icy relic sword
    7386, -- mercenary sword
    3334, -- pharaoh sword
    3339, -- djinn blade
    781, -- earth mystic blade
    796, -- energy mystic blade
    662, -- fiery mystic blade
    681, -- icy mystic blade
    7384, -- mystic blade
    7418, -- nightmare blade
    7403, -- berserker
    11693, -- blade of corruption
    7416, -- bloody edge
    3338, -- bone sword
    3295, -- bright sword
    21177, -- cowtana
    7402, -- dragon slayer
    783, -- earth dragon slayer
    798, -- energy dragon slayer
    664, -- fiery dragon slayer
    683, -- icy dragon slayer
    3326, -- epee
    3280, -- fire sword
    3281, -- giant sword
    7407, -- haunted blade
    21179, -- glooth blade
    3284, -- ice rapier
    7417, -- runed sword
    10389, -- sai
    3271, -- spike sword
    7391, -- thaian sword
    6527, -- the avenger
    7390, -- the justice seeker
    11657, -- twiceslicer
    10392, -- twin hooks
    10390, -- Zaoan sword
    3435, -- castle shield
    3429, -- black shield
    3441, -- bone shield
    3418, -- bonelord shield
    14088, -- carapace shield
    3419, -- crown shield
    3421, -- dark shield
    3420, -- demon shield
    3416, -- dragon shield
    3433, -- griffin shield
    3415, -- guardian shield
    3414, -- mastermind shield
    3436, -- medusa shield
    21175, -- mino shield
    7460, -- norse shield
    3424, -- ornamented shield
    22726, -- rift shield
    3445, -- salamander shield
    3440, -- scarab shield
    3444, -- sentinel shield
    17810, -- spike shield
    3442, -- tempest shield
    6131, -- tortoise shield
    3428, -- tower shield
    3443, -- tusk shield
    3434, -- vampire shield
    14042, -- warrior's shield
    13998, -- depth scutum
    8072, -- spellbook of enlightenment
    8075, -- spellbook of lost souls
    8074, -- spellbook of mind control
    8073, -- spellbook of warding
    25699, -- wooden spellbook
    25700, -- dream blossom staff
    16118, -- glacial rod
    3067, -- hailstorm rod
    3070, -- moonlight rod
    16117, -- muck rod
    3069, -- necrotic rod
    8083, -- northwind rod
    3066, -- snakebite rod
    8084, -- springsprout rod
    3065, -- terra rod
    8082, -- underworld rod
    22183, -- ogre scepta
    3073, -- wand of cosmic energy
    3072, -- wand of decay
    16096, -- wand of defiance
    16115, -- wand of everblazing
    3075, -- wand of dragonbreath
    3071, -- wand of inferno
    3074, -- wand of vortex
    8093, -- wand of draconia
    8092, -- wand of starstorm
    8094, -- wand of voodoo
    21204, -- cowbell
    283, -- empty potion flask
    284, -- empty potion flask
    285, -- empty potion flask
    21201, -- execowtioner mask
    21199, -- giant pacifier
    21182, -- glob of glooth
    21103, -- glooth injection tube
    21193, -- metal jaw
    21198, -- metal toe
    21202, -- mooh'tah shell
    21200, -- moohtant horn
    21196, -- necromantic rust
    21195, -- poisoned fang
    21194, -- slime heart
    21747, -- seacrest pearl
    21800, -- seacrest scale
    21801, -- seacrest hair
    21197, -- slimy leaf tentacle
    34219, -- werehyaena trophy
    3297, -- serpent sword
    3063, -- gold ring
    35614, -- cheesy membership card
    35613, -- Ratmiral's hat
    35612, -- Tentugly's jaws
    35611, -- tentacle of Tentugly
    35610, -- Tentugly's eye
    35571, -- small treasure chest
    35572, -- pirate coin
    35573, -- pirat's tail
    35574, -- shark fins
    35578, -- tiara
    35579, -- golden dustbin
    35580, -- golden skull
    35581, -- golden cheese wedge
    35588, -- grappling hook
    36792, -- Abomination's eye
    36791, -- Abomination's tail
    36793, -- Abomination's tongue
    36789, -- afflicted strider head
    36790, -- afflicted strider worms
    36820, -- bashmu fang
    36823, -- bashmu feather
    36821, -- bashmu tongue
    36779, -- blemished spawn abdomen
    36778, -- blemished spawn head
    36780, -- blemished spawn tail
    36795, -- Brainstealer's brain
    36796, -- Brainstealer's brainwave
    36794, -- Brainstealer's tissue
    36806, -- carnisylvan bark
    36805, -- carnisylvan finger
    36787, -- cave chimera head
    36788, -- cave chimera leg
    36809, -- curl of hair
    36776, -- eyeless devourer legs
    36775, -- eyeless devourer maw
    36777, -- eyeless devourer tongue
    36971, -- girtablilu warrior carapace
    36807, -- human teeth
    36785, -- lavafungus head
    36786, -- lavafungus ring
    36771, -- lavaworm jaws
    36769, -- lavaworm spike roots
    36770, -- lavaworm spikes
    36972, -- old girtablilu carapace
    37613, -- Morshabaal's brain
    37810, -- Morshabaal's extract
    36808, -- old royal diary
    36822, -- scorpion charm
    36772, -- streaked devourer eyes
    36773, -- streaked devourer maw
    36774, -- streaked devourer legs
    36783, -- tremendous tyrant head
    36784, -- tremendous tyrant shell
    36781, -- varnished diremaw brainpan
    36782, -- varnished diremaw legs
    2874, -- vial
    9632, -- ancient stone
    11447, -- battle stone
    9656, -- broken gladiator shield
    9028, -- crystal of balance
    9027, -- crystal of focus
    9067, -- crystal of power
    16138, -- crystalline spikes
    12806, -- flintstone
    9655, -- gear crystal
    8775, -- gear wheel
    5892, -- huge chunk of crude iron
    16130, -- magma clump
    10298, -- metal spike
    5889, -- piece of draconian steel
    5888, -- piece of hell steel
    9664, -- piece of hellfire armor
    5887, -- piece of royal steel
    16133, -- pulverized ore
    10310, -- shiny stone
    16137, -- stone nose
    10315, -- sulphurous stone
    16135, -- vein of ore
    9654, -- war crystal
    7408, -- wyvern fang
    5668, -- mysterious voodoo skull
    3432, -- ancient shield
    2848, -- purple tome
    9056, -- black skull
    27706, -- werefox trophy
    8531, -- blood goblet
    11681, -- ectoplasmic sushi
    3301, -- broadsword
    20131, -- remains of a crude dream
    31263, -- Ring of Secret Thoughts
    3282, -- morning star
    17812, -- ratana
    3350, -- bow
    3277, -- spear
    3267, -- dagger
    3301, -- crowbar
}
 


function CheckCanSellId(itemID)
    for i=1,#NotSelling do
        if NotSelling[i] == itemID then
            return false
        end
    end
    return true
end


function GetPlayersInventory()
    local items = {}
    for i= 1, 10 do
        local Info = playerGetInventorySlot(i)
        if Info and Info.id then
            items[tostring(Info.id)] = true
        end
    end
    return items
end

function CheckItem(itemID)
    local Amount = Game.getItemCount(itemID)
    return Amount
end

local StartAutomatically = false
local IsSelling = true
local SellingDelay = 720

local SELLALL = HUD.new(HUD_MUDAR_X + 405, HUD_MUDAR_Y + Diference - 35, "SELL"); 
SELLALL:setColor(255, 255, 255)

function SellAllItens()
    gameTalk("hi", 12)  
    wait(500)  
    gameTalk("trade", 12)  
    IsSelling = true
    local CanSell = {}
    local PlayersInventory = GetPlayersInventory()

    for i=1,#itemList do
        local itemId = itemList[i]
        if CheckCanSellId(itemId) then  
            local Amount = CheckItem(itemId)  
            if Amount and Amount > 0 then
                if PlayersInventory[tostring(itemId)] then
                    Amount = Amount - 1
                end
                table.insert(CanSell, {itemId, Amount})  
            end
        end
    end

    for i=1,#CanSell do
        local itemId = CanSell[i][1]
        local Amount = CanSell[i][2]
        if Amount > 100 then
            local amountToSell = Amount
            while amountToSell ~=  0 do
                local amount = 100
                if amountToSell < 100 then
                    amount = amountToSell
                end
                Npc.sell(itemId, amount, true)
                amountToSell = amountToSell - amount
                wait(SellingDelay)
            end
        else
            Npc.sell(itemId, Amount, true)
            wait(SellingDelay)
        end

        -- Atualiza lastPositionTime apenas quando está vendendo loot
        lastPositionTime = os.time()
    end

    Client.showMessage("Venda de Loot Finalizada")  
    IsSelling = false  
    return true
end



Timer("SellAutomatically", function()
    Client.showMessage("Iniciando Venda de Loot")  
    SellAllItens() 
end, 100, StartAutomatically) 

SELLALL:setCallback(SellAllItens)
