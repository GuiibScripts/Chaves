--CONFIGS
local IgnoreCreatureList =  {"creature1"}  -- Lista de criaturas que serao Ignoradas Obs: escrever em minusculo
local NameTransfer          = 'Char Name'               -- Nome Personagem para Enviar Transfer
local SQM_DP				= {40480, 10145}	        -- ID SQM Frente ao DP
local BACKPACK_LOOT 		= "Loot Pouch" 		        -- Nome da sua BP de Loot.
local SINGLE_STEP_DELAY = 50   		                    -- Delay minimo entre os passos, Multiplicando por cada mosntro na tela ate chegar no "MAX_STEP_DELAY"
local DELAY_FUNCOES = 300			                    -- Delay ao executar funcoes (abrir portas, Clicks, Shovel etc)
local DoNotSell = {7439, 7443, 9635, 11452, 11309, 11464, 18994, 10298, 9691, 21202, 9654, 11444, 10311, 22728, 9685, 9633, 9663, 11492, 20200, 22730, 3081, 9302, 16113, 16108, 3057, 23542, 23543, 23544, 16114, 32621, 3048, 3051, 23529, 23531, 23533, 5912, 5910, 5914, 5909, 44604, 44607, 44610, 44613, 7440}
local SHOVEL_ID = 3457 local ROPE_ID = 3003 local USEITEM_ID = 28477



local KdshnadsaSADKL = {
----------------------------------------------------------
---------------- COORDENADAS DA HUNT AQUI ----------------


}


local DJOISAoismaD2 = {
-----------------------------------------------------------
---------------- COORDENADAS DO REFIL AQUI ----------------

}


--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXX         XXX   XXX  XXX   XXX   XXX        XXXXXXXXX         XXXXX         XXX        XXX   XXX         XXX          XXXX          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXX   XXXXXXXXX   XXX  XXX   XXX   XXX  XXXXX  XXXXXX   XXXXXXXXXXXXX  XXXXXXXXXX  XXXX  XXX  XXXX  XXXXXX  XXXXXX  XXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXX   XX    XXX   XXX  XXX   XXX   XXX       XXXXXXXXXX        XXXXXX  XXXXXXXXXX     XXXXXX  XXXX         XXXXXXX  XXXXXXXX          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXX   XXX  XXXX   XXX  XXX   XXX   XXX  XXXXX  XXXXXXXXXXXXXXXX   XXX  XXXXXXXXXX  XXX  XXXX  XXXX  XXXXXXXXXXXXXX  XXXXXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXX        XXXX        XXX   XXX   XXX        XXXXXXXX          XXXXX         XXX  XXXX  XXX  XXXX  XXXXXXXXXXXXXX  XXXXXXXX          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

local Delay_Supplies = 2000; local NPC_REFIL_TYPE = 1; local ManterBalance = 250000; local CAP_TO_REFIL = 100; local MAX_STEP_DELAY = 500; local STEP_DELAY_REFILL = 50; local MAX_MONSTER_STOP = 99; local MIN_MONSTER_RESUME = 1; local MONSTER_COUNT_AREA = 5; local MONSTER_COUNT_AREA_REFIL = 5; local CAITBOX_DISTANCE = 4; local RUN_LOST_MONSTER_COUNT = 0; local STOP_WITH_MANA = 0; local RESUME_WITH_MANA = 0; local LATENCIA_STOP = {0, 100}; local RESET_CAVEBOT = {0, 15, 20, 30, 60}
-- START PARAMETROS
local ConvertForge = 1; local AntiKS = false; local LimitBuySupplies = false; local ReturnHuntAfterDead = false; local DISABLE_TO_REFILL = true; local TransferAfterDeposit = false; local IGNORE_CAP_TO_REFIL = false; local REFIL_AUTOMATICO = true; local AUTOLOOT = false
-- END PARAMETROS
-- START ITEMS LIST
local items = {paladin = {{name = "Diamond Arrows", id = 35901, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "distance"}, {name = "Spectral Bolt", id = 35902, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "distance"}, {name = "Great Mana Potions", id = 238, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Ultimate Spirit Potions", id = 23374, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Spirit Potions", id = 7642, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Fireball Rune", id = 3191, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Avalanche Rune", id = 3161, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Thunderstorm Rune", id = 3202, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Stone Shower Rune", id = 3175, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Sudden Death Rune", id = 3155, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, }, knight = {{name = "Supreme Health Potion", id = 23375, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Ultimate Health Potion", id = 7643, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Health Potion", id = 239, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Strong Mana Potions", id = 237, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, }, mage = {{name = "Ultimate Mana Potion", id = 23373, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Mana Potions", id = 238, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "potions"}, {name = "Great Fireball Rune", id = 3191, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Avalanche Rune", id = 3161, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Thunderstorm Rune", id = 3202, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Stone Shower Rune", id = 3175, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, {name = "Sudden Death Rune", id = 3155, MinRefil = 0, Amount = 0, category = "trade", categoryHouse = "runes"}, }}
-- END ITEMS LIST
-- START ENCHANTLIST
local EnchantList = {paladin = {{name = "enchanted sleep shawl", id = 29428, amount = false, category = "Sleep Shawl"}, {name = "enchanted pendulet", id = 29429, amount = false, category = "pendulet"}, {name = "charged alicorn ring", id = 39182, amount = false, category = "alicorn ring"}, {name = "enchanted ring of souls", id = 32636, amount = false, category = "ring of souls"}, {name = "enchantedblister ring", id = 31621, amount = false, category = "blister ring"}, }, knight = {{name = "enchanted turtle amulet", id = 39235, amount = false, category = "turtle amulet"}, {name = "charged spiritthorn ring", id = 39179, amount = false, category = "spiritthorn ring"}, {name = "enchanted ring of souls", id = 32636, amount = false, category = "ring of souls"}, {name = "enchantedblister ring", id = 31621, amount = false, category = "blister ring"}, }, mage = {{name = "enchanted theurgic amulet", id = 30401, amount = false, category = "theurgic amulet"}, {name = "charged arboreal ring", id = 39188, amount = false, category = "arboreal ring"}, {name = "charged arcanomancer sigil", id = 39185, amount = false, category = "arcanomancer sigil"}, {name = "enchanted ring of souls", id = 32636, amount = false, category = "ring of souls"}, {name = "enchantedblister ring", id = 31621, amount = false, category = "blister ring"}, }}
-- END ENCHANTLIST

-------------------------------------------------
-------------- INCLUDE DLLS --------------------
package.path = package.path .. ";" .. 
Engine.getScriptsDirectory() .. "\\dlls_lib\\lua\\?.lua" .. ";" .. 
Engine.getScriptsDirectory() .. "\\dlls_lib\\lua\\socket\\?.lua"
package.cpath = package.cpath .. ";" .. 
Engine.getScriptsDirectory() .. "\\dlls_lib\\?.dll"

-- Importa o módulo socket.http
local http = require("socket.http")
local ltn12 = require("ltn12")

-- Função para converter uma string para hexadecimal
local function toHex(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex
end

-- Função para baixar o arquivo de IDs e carregar como uma tabela
local function carregarIDs()
    local url = "https://raw.githubusercontent.com/GuiibScripts/Chaves/master/Combo_Basico.lua?nocache=" .. os.time()
    local response_body = {}

    local _, status_code = http.request{
        url = url,
        sink = ltn12.sink.table(response_body)
    }

    if status_code == 200 then
        local conteudo = table.concat(response_body)
        local ids_autorizados = load(conteudo)()  -- Carrega o conteúdo como uma tabela Lua
        return ids_autorizados
    else
        return nil
    end
end


local function verificarAutorizacao()
    local userId = Engine.getUserId()
    local userIdHex = toHex(userId)  -- Converte o userId para hexadecimal
    local ids_autorizados = carregarIDs()

    if ids_autorizados then
        for _, idHex in ipairs(ids_autorizados) do
            if idHex == userIdHex then
                
                -- Cria o HUD de autorização
                

--------------------------------------------------
--HUD
local HUD_MUDAR_X = 0
local HUD_MUDAR_Y = 0

local scriptDir = Engine.getScriptsDirectory() .. "/"  
package.path = scriptDir .. "?.lua;" .. package.path
local ANTIGM = nil
local success, loadError = pcall(function()
    ANTIGM = require("ANTIGM")
end)

if not success then
    print("Erro ao carregar ANTI GM:", loadError)
end

if ANTIGM and type(ANTIGM) == "table" then  -- Verifica se ANTIGM é uma tabela

    local function alterarGoCHSgNMOi(novoValor)
        GoCHSgNMOi = novoValor
    end

    -- Verifica se a função setCallback existe antes de chamá-la
    if ANTIGM.setCallback then
        ANTIGM.setCallback(alterarGoCHSgNMOi)
    else
        print("A função setCallback não está disponível no ANTI GM.")
    end
else
    print("ATENCAO!!")
    print("ANTIGM nao esta disponivel")
    print("Voce pode comprar diretamente no nosso discord")
    print("https://discord.gg/pVckpyc5Du")
end

--------------------------------------------------

local function updateRefillDelay()
    for _, coord in ipairs(DJOISAoismaD2) do
        coord.wait = STEP_DELAY_REFILL
    end
end

-- Chama a função para atualizar o delay
updateRefillDelay()

-- Verifica se a atualização foi aplicada corretamente
for _, coord in ipairs(DJOISAoismaD2) do
end
-- CONFIG HUD
local Diference = 50


-- HUD GUIIBSCRIPTS
local function GUIIBSCRIPTS(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
    end
end

local xCoords2 = {-5, 105}
local xCoords1 = {10, 20, 50, 80, 90}
GUIIBSCRIPTS(xCoords1, 60, 9850)
GUIIBSCRIPTS(xCoords1, 45, 40469)
GUIIBSCRIPTS(xCoords1, 75, 40469)
GUIIBSCRIPTS(xCoords2, 60, 40470)


local configHudElements = {}  -- Nova tabela para armazenar os HUDs do CONFIGHUD

--CONFIG HUD
local function CONFIGHUD(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
        -- Armazena a referência e a posição original do HUD
        table.insert(configHudElements, {hud = hud, originalX = x + HUD_MUDAR_X, originalY = y + HUD_MUDAR_Y})
    end
end

local xCoords2 = {115, 175}
local xCoords1 = {130, 150, 160}
CONFIGHUD(xCoords1, 60, 9850)
CONFIGHUD(xCoords1, 45, 40469)
CONFIGHUD(xCoords1, 75, 40469)
CONFIGHUD(xCoords2, 60, 40470)

CONFIGHUD(xCoords1, 100, 9850)
CONFIGHUD(xCoords1, 85, 40469)
CONFIGHUD(xCoords1, 115, 40469)
CONFIGHUD(xCoords2, 100, 40470)

local hudsCriados = false  -- Flag para controlar se os HUDs foram criados
local createdHUDs = {}  -- Tabela para armazenar os HUDs criados

local horizontalSpacing = 60
local verticalSpacing = 30
local Multiplicador = {5, 10, 25, 50, 100, 200, 500, 1000}
local currentMultiplicadorIndex = 5

local HUDs = {}

function VerificarVocacaoDoPlayer()
    local playerId = Player:getId() -- Obtém o ID do jogador
    
    if playerId then
        -- Obtém a instância da criatura usando o ID do jogador
        local playerCreature = Creature(playerId)
        
        if playerCreature then
            -- Obtém a vocação do jogador
            local vocacao = playerCreature:getVocation()
            
            if vocacao then
                return vocacao
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
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
        
        local xCoords2 = {195, 235, 310, 390}
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

        local MinRefilHudz = HUD.new(270 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "MinRefil"); MinRefilHudz:setColor(255, 255, 255)
        table.insert(HUDs, MinRefilHudz)

        local AmountHudz = HUD.new(350 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
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
        
        local xCoords2 = {195, 235, 310, 390}
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

        local MinRefilHudz = HUD.new(270 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "MinRefil"); MinRefilHudz:setColor(255, 255, 255)
        table.insert(HUDs, MinRefilHudz)

        local AmountHudz = HUD.new(350 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
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
        
        local xCoords2 = {195, 235, 310, 390}
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

        local MinRefilHudz = HUD.new(270 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "MinRefil"); MinRefilHudz:setColor(255, 255, 255)
        table.insert(HUDs, MinRefilHudz)

        local AmountHudz = HUD.new(350 + HUD_MUDAR_X, 27 + 40 + HUD_MUDAR_Y, "Amount"); AmountHudz:setColor(255, 255, 255)
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



        local MinRefilValue = HUD.new(startX + Diference * 2 - 30 + 200, startY + 40 + Diference * 6 + 30 - 280, tostring(item.MinRefil))
        MinRefilValue:setColor(255, 255, 255)
        table.insert(HUDs, MinRefilValue)

        local function incrementMinRefil()
            item.MinRefil = item.MinRefil + tostring(Multiplicador[currentMultiplicadorIndex])
            MinRefilValue:setText(tostring(item.MinRefil))
        end

        local function decrementMinRefil()
            item.MinRefil = math.max(0, item.MinRefil - tostring(Multiplicador[currentMultiplicadorIndex]))
            MinRefilValue:setText(tostring(item.MinRefil))
        end

        local MAISMINREFIL = HUD.new(startX + Diference * 1 + 215 + horizontalSpacing / 2, startY + 40 + Diference * 6 + 30 - 280, "+")
        MAISMINREFIL:setColor(255, 255, 255)
        MAISMINREFIL:setCallback(incrementMinRefil)
        table.insert(HUDs, MAISMINREFIL)

        local MENOSMINREFIL = HUD.new(startX + Diference * 1 - 35 + horizontalSpacing / 2 + 200, startY + 40 + Diference * 6 + 30 - 280, "-")
        MENOSMINREFIL:setColor(255, 255, 255)
        MENOSMINREFIL:setCallback(decrementMinRefil)
        table.insert(HUDs, MENOSMINREFIL)

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

local HUDs2 = {}



local function createItemHUDs2(startX, startY)
    local playerVocation = VerificarVocacaoDoPlayer()
    if not playerVocation then
        return
    end
    
    local sublist

    if playerVocation == 1 then
        sublist = EnchantList.knight
        
        local function SUPPLIESCONFIG(xCoords, y, spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs2, hud)
            end
        end
        
        local xCoords2 = {195, 235, 315}
        local xCoords1 = {210, 240, 270, 300}
        local xCoords3 = {195, 315}

        
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









    elseif playerVocation == 2 then
        sublist = EnchantList.paladin

        local function SUPPLIESCONFIG(xCoords, y, spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs2, hud)
            end
        end
        
        local xCoords2 = {195, 235, 315}
        local xCoords1 = {210, 240, 270, 300}
        local xCoords3 = {195, 315}

        
        SUPPLIESCONFIG(xCoords1, 20, 4598)
        SUPPLIESCONFIG(xCoords1, 45, 9850)
        SUPPLIESCONFIG(xCoords1, 60, 9850)
        SUPPLIESCONFIG(xCoords1, 90, 9850)
        SUPPLIESCONFIG(xCoords1, 120, 9850)
        SUPPLIESCONFIG(xCoords1, 150, 9850)
        SUPPLIESCONFIG(xCoords1, 180, 9850)


        
        SUPPLIESCONFIG(xCoords3, 20, 40470)

        SUPPLIESCONFIG(xCoords1, 5, 40469)
        SUPPLIESCONFIG(xCoords1, 30, 40469)
        SUPPLIESCONFIG(xCoords1, 45, 40469)
        SUPPLIESCONFIG(xCoords1, 75, 40469)
        SUPPLIESCONFIG(xCoords1, 105, 40469)
        SUPPLIESCONFIG(xCoords1, 135, 40469)
        SUPPLIESCONFIG(xCoords1, 165, 40469)
        SUPPLIESCONFIG(xCoords1, 195, 40469)


        SUPPLIESCONFIG(xCoords2, 45, 40470)
        SUPPLIESCONFIG(xCoords2, 75, 40470)
        SUPPLIESCONFIG(xCoords2, 105, 40470)
        SUPPLIESCONFIG(xCoords2, 135, 40470)
        SUPPLIESCONFIG(xCoords2, 165, 40470)
        SUPPLIESCONFIG(xCoords2, 180, 40470)







    elseif playerVocation == 3 or playerVocation == 4 then
        sublist = EnchantList.mage

        local function SUPPLIESCONFIG(xCoords, y, spriteID)
            for _, x in ipairs(xCoords) do
                local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 40, spriteID)
                table.insert(HUDs2, hud)
            end
        end
        
        local xCoords2 = {195, 235, 315}
        local xCoords1 = {210, 240, 270, 300}
        local xCoords3 = {195, 315}

        
        SUPPLIESCONFIG(xCoords1, 20, 4598)
        SUPPLIESCONFIG(xCoords1, 45, 9850)
        SUPPLIESCONFIG(xCoords1, 60, 9850)
        SUPPLIESCONFIG(xCoords1, 90, 9850)
        SUPPLIESCONFIG(xCoords1, 120, 9850)
        SUPPLIESCONFIG(xCoords1, 150, 9850)
        SUPPLIESCONFIG(xCoords1, 180, 9850)


        
        SUPPLIESCONFIG(xCoords3, 20, 40470)

        SUPPLIESCONFIG(xCoords1, 5, 40469)
        SUPPLIESCONFIG(xCoords1, 30, 40469)
        SUPPLIESCONFIG(xCoords1, 45, 40469)
        SUPPLIESCONFIG(xCoords1, 75, 40469)
        SUPPLIESCONFIG(xCoords1, 105, 40469)
        SUPPLIESCONFIG(xCoords1, 135, 40469)
        SUPPLIESCONFIG(xCoords1, 165, 40469)
        SUPPLIESCONFIG(xCoords1, 195, 40469)


        SUPPLIESCONFIG(xCoords2, 45, 40470)
        SUPPLIESCONFIG(xCoords2, 75, 40470)
        SUPPLIESCONFIG(xCoords2, 105, 40470)
        SUPPLIESCONFIG(xCoords2, 135, 40470)
        SUPPLIESCONFIG(xCoords2, 165, 40470)
        SUPPLIESCONFIG(xCoords2, 180, 40470)






        
    else
        return
    end
    local itemhudz = HUD.new(215, 27 + 40, "item"); itemhudz:setColor(255, 255, 255)
    table.insert(HUDs2, itemhudz)

    local MinRefilHudz = HUD.new(275, 27 + 40, "ENCANTAR"); MinRefilHudz:setColor(255, 255, 255)
    table.insert(HUDs2, MinRefilHudz)
    local textenchant = HUD.new(255, 7 + 40, "Check e Enchant"); textenchant:setColor(255, 255, 255)
    table.insert(HUDs2, textenchant)

    for _, EnchantItem in ipairs(sublist) do
        local ItemIcon = HUD.new(startX + 210, startY + Diference * 6 + 40 - 280 + 40, EnchantItem.id)
        table.insert(HUDs2, ItemIcon)
    
        local ENCANTAR = HUD.new(startX + Diference + 225, startY + Diference * 6 + 30 - 280 + 40, EnchantItem.amount and "SIM" or "NAO")
        ENCANTAR:setColor(EnchantItem.amount and 0 or 255, 255, EnchantItem.amount and 0 or 255)
        
        ENCANTAR:setCallback(function()
            EnchantItem.amount = not EnchantItem.amount
            ENCANTAR:setText(EnchantItem.amount and "SIM" or "NAO")
            ENCANTAR:setColor(EnchantItem.amount and 0 or 255, 255, EnchantItem.amount and 0 or 255)
        end)
        
        table.insert(HUDs2, ENCANTAR)
    
        startY = startY + verticalSpacing
    end
end

local function destroyItemHUDs2()
    for _, hud in ipairs(HUDs2) do
        hud:destroy()
    end
    HUDs2 = {}
end

local HUDs3 = {}

-- Função para criar HUDs3 extras
local function CreateHUDEXTRA(startX, startY)

    local function GUIIBSCRIPTS(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local zzHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 30, spriteID)
            table.insert(HUDs3, zzHUD)
        end
    end

    local xCoords2 = {185, 455}
    local xCoords1 = {200, 230, 260, 290, 310, 330, 360, 390, 410, 440}
    local xCoords3 = {370}

    GUIIBSCRIPTS(xCoords1, 30, 4598)
    GUIIBSCRIPTS(xCoords1, 60, 9850)
    GUIIBSCRIPTS(xCoords1, 90, 9850)
    GUIIBSCRIPTS(xCoords1, 120, 9850)
    GUIIBSCRIPTS(xCoords1, 150, 9850)
    GUIIBSCRIPTS(xCoords1, 180, 9850)





    GUIIBSCRIPTS(xCoords1, 15, 40469)
    GUIIBSCRIPTS(xCoords1, 45, 40469)
    GUIIBSCRIPTS(xCoords1, 75, 40469)
    GUIIBSCRIPTS(xCoords1, 105, 40469)
    GUIIBSCRIPTS(xCoords1, 135, 40469)
    GUIIBSCRIPTS(xCoords1, 165, 40469)
    GUIIBSCRIPTS(xCoords1, 195, 40469)


    GUIIBSCRIPTS(xCoords2, 30, 40470)
    GUIIBSCRIPTS(xCoords2, 60, 40470)
    GUIIBSCRIPTS(xCoords2, 90, 40470)
    GUIIBSCRIPTS(xCoords2, 120, 40470)
    GUIIBSCRIPTS(xCoords2, 150, 40470)
    GUIIBSCRIPTS(xCoords2, 180, 40470)

    GUIIBSCRIPTS(xCoords3, 60, 40470)
    GUIIBSCRIPTS(xCoords3, 90, 40470)
    GUIIBSCRIPTS(xCoords3, 120, 40470)
    GUIIBSCRIPTS(xCoords3, 150, 40470)
    GUIIBSCRIPTS(xCoords3, 180, 40470)

  local CONFIGURACAOREFILHUD = HUD.new(320, 20 + 30, "CONFIGURACAO DE REFIL"); CONFIGURACAOREFILHUD:setColor(255, 255, 255)
  table.insert(HUDs3, CONFIGURACAOREFILHUD)



   --------------------------------------------------------------------- --CAP REFIL
        -- HUD para CAP TO REFIL
        local capToRefilHUD2 = HUD.new(startX + horizontalSpacing * 4 + 20, startY + 30 + Diference, "Cap para Refilar:"); capToRefilHUD2:setColor(255, 255, 255)
        local capToRefilHUD = HUD.new(startX + 35 + horizontalSpacing * 6 + 15, startY + 30 + Diference, tostring(CAP_TO_REFIL))
        capToRefilHUD:setColor(255, 255, 255)
        table.insert(HUDs3, capToRefilHUD)
        table.insert(HUDs3, capToRefilHUD2)
    
    
        -- HUD para botão de diminuir (-)
        local decreaseCapHUD = HUD.new(startX + 35 + horizontalSpacing * 6 - 5, startY + 30 + Diference, "-")
        decreaseCapHUD:setColor(255, 255, 255)
        decreaseCapHUD:setCallback(function()
            CAP_TO_REFIL = math.max(0, CAP_TO_REFIL - 50)
            capToRefilHUD:setText(tostring(CAP_TO_REFIL))
        end)
        table.insert(HUDs3, decreaseCapHUD)
    
        -- HUD para botão de aumentar (+)
        local increaseCapHUD = HUD.new(startX + 35 + horizontalSpacing * 6 + 40, startY + 30 + Diference, "+")
        increaseCapHUD:setColor(255, 255, 255)
        increaseCapHUD:setCallback(function()
            CAP_TO_REFIL = CAP_TO_REFIL + 50
            capToRefilHUD:setText(tostring(CAP_TO_REFIL)) 
            
        end)
        table.insert(HUDs3, increaseCapHUD)
        table.insert(HUDs3, increaseCapHUD2)
--------------------------------------------------------------------------NPC TYPE
-- Inicialize NPC_REFIL_TYPE se ainda não estiver definido
NPC_REFIL_TYPE = NPC_REFIL_TYPE  -- Define o valor padrão como 1 se não estiver definido

-- Crie o HUD para o texto do tipo de NPC refil
local npcRefilTypeHUD2 = HUD.new(startX + horizontalSpacing * 4 + 20, startY + 30 + Diference * 2 - 20, "Tipo NPC Refiller:")
npcRefilTypeHUD2:setColor(255, 255, 255)

-- Defina o texto inicial com base no valor atual de NPC_REFIL_TYPE
local initialText
if NPC_REFIL_TYPE == 1 then
    initialText = "COMUM"
elseif NPC_REFIL_TYPE == 2 then
    initialText = "HOUSE"
elseif NPC_REFIL_TYPE == 3 then
    initialText = "CUSTOM"
else
    initialText = "DESCONHECIDO" -- Valor padrão para casos inesperados
end

-- Crie o HUD com o texto inicial apropriado
local npcRefilTypeHUD = HUD.new(startX + 35 + horizontalSpacing * 6 + 10, startY + 30 + Diference * 2 - 20, initialText)
npcRefilTypeHUD:setColor(255, 255, 255)

-- Configure a função de callback
npcRefilTypeHUD:setCallback(function()
    NPC_REFIL_TYPE = NPC_REFIL_TYPE % 3 + 1 -- Alterna entre 1, 2 e 3
    if NPC_REFIL_TYPE == 1 then
        npcRefilTypeHUD:setText("COMUM")
    elseif NPC_REFIL_TYPE == 2 then
        npcRefilTypeHUD:setText("HOUSE")
    elseif NPC_REFIL_TYPE == 3 then
        npcRefilTypeHUD:setText("CUSTOM")
        startY = startY + verticalSpacing 
    end
end)

-- Adicione os HUDs à tabela
table.insert(HUDs3, npcRefilTypeHUD)
table.insert(HUDs3, npcRefilTypeHUD2)


--------------------------------------------------------------------------DISBALE TO REFIL
local disableToRefillHUD2 = HUD.new(startX + horizontalSpacing * 4 + 33, startY + 30 + Diference * 3 - 40, "Target OFF no REFIL:"); disableToRefillHUD2:setColor(255, 255, 255)
local disableToRefillHUD = HUD.new(startX + horizontalSpacing * 5 + 60 + 50, startY + 30 + Diference * 3 - 40, DISABLE_TO_REFILL and "SIM" or "NAO")
disableToRefillHUD:setColor(DISABLE_TO_REFILL and 0 or 255, 255, DISABLE_TO_REFILL and 0 or 255) -- Verde se true, Branco se false
disableToRefillHUD:setCallback(function()
    DISABLE_TO_REFILL = not DISABLE_TO_REFILL
    disableToRefillHUD:setText(DISABLE_TO_REFILL and "SIM" or "NAO")
    disableToRefillHUD:setColor(DISABLE_TO_REFILL and 0 or 255, 255, DISABLE_TO_REFILL and 0 or 255) -- Atualiza a cor diretamente
end)
table.insert(HUDs3, disableToRefillHUD)
table.insert(HUDs3, disableToRefillHUD2)


--------------------------------------------------------------------------REFIL AUTOMATICO
local refilAutomaticoHUD2 = HUD.new(startX + horizontalSpacing * 4 + 22, startY + 30 + Diference * 4 - 60, "Refil Automatico:"); refilAutomaticoHUD2:setColor(255, 255, 255)
local refilAutomaticoHUD = HUD.new(startX + 50 + horizontalSpacing * 5 + 60, startY + 30 + Diference * 4 - 60, REFIL_AUTOMATICO and "SIM" or "NAO")
refilAutomaticoHUD:setColor(REFIL_AUTOMATICO and 0 or 255, 255, REFIL_AUTOMATICO and 0 or 255) -- Verde se true, Branco se false
refilAutomaticoHUD:setCallback(function()
    REFIL_AUTOMATICO = not REFIL_AUTOMATICO
    refilAutomaticoHUD:setText(REFIL_AUTOMATICO and "SIM" or "NAO")
    refilAutomaticoHUD:setColor(REFIL_AUTOMATICO and 0 or 255, 255, REFIL_AUTOMATICO and 0 or 255) -- Atualiza a cor diretamente
end)
table.insert(HUDs3, refilAutomaticoHUD)
table.insert(HUDs3, refilAutomaticoHUD2)


--------------------------------------------------------------------------IGNORE CAP BUY

local ignoreCapToRefillHUD2 = HUD.new(startX + horizontalSpacing * 4 + 47, startY + 30 + Diference * 5 - 80, "Ignore Cap Buy Supplies:"); ignoreCapToRefillHUD2:setColor(255, 255, 255)
local ignoreCapToRefillHUD = HUD.new(startX + 50 +horizontalSpacing * 5 + 60, startY + 30 + Diference * 5 - 80, IGNORE_CAP_TO_REFIL and "SIM" or "NAO")
ignoreCapToRefillHUD:setColor(IGNORE_CAP_TO_REFIL and 0 or 255, 255, IGNORE_CAP_TO_REFIL and 0 or 255) -- Verde se true, Branco se false
ignoreCapToRefillHUD:setCallback(function()
    IGNORE_CAP_TO_REFIL = not IGNORE_CAP_TO_REFIL
    ignoreCapToRefillHUD:setText(IGNORE_CAP_TO_REFIL and "SIM" or "NAO")
    ignoreCapToRefillHUD:setColor(IGNORE_CAP_TO_REFIL and 0 or 255, 255, IGNORE_CAP_TO_REFIL and 0 or 255) 
end)
table.insert(HUDs3, ignoreCapToRefillHUD)
table.insert(HUDs3, ignoreCapToRefillHUD2)



    startY = startY + verticalSpacing 
end

    


local function destroyItemHUDs3()
    for _, hud in ipairs(HUDs3) do
        hud:destroy()
        
    end
    HUDs3 = {}
end

local HUDsDelays = {}  -- Lista para armazenar as HUDs criadas para os DELAYS

-- Função para criar uma HUD de controle de delay
local function createDelayHUD(startX, startY)
    local function GUIIBSCRIPTS(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local zzHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 30, spriteID)
            table.insert(HUDsDelays, zzHUD)
        end
    end

    local xCoords1 = {200, 230, 260, 290, 310, 330, 360, 390, 410, 440}
    local xCoords2 = {185, 455}
    local xCoords3 = {370}

    GUIIBSCRIPTS(xCoords1, 30, 4598)
    GUIIBSCRIPTS(xCoords1, 60, 9850)
    GUIIBSCRIPTS(xCoords1, 90, 9850)
    GUIIBSCRIPTS(xCoords1, 120, 9850)
    GUIIBSCRIPTS(xCoords1, 150, 9850)
    GUIIBSCRIPTS(xCoords1, 180, 9850)

    GUIIBSCRIPTS(xCoords1, 15, 40469)
    GUIIBSCRIPTS(xCoords1, 45, 40469)
    GUIIBSCRIPTS(xCoords1, 75, 40469)
    GUIIBSCRIPTS(xCoords1, 105, 40469)
    GUIIBSCRIPTS(xCoords1, 135, 40469)
    GUIIBSCRIPTS(xCoords1, 165, 40469)
    GUIIBSCRIPTS(xCoords1, 195, 40469)

    GUIIBSCRIPTS(xCoords2, 30, 40470)
    GUIIBSCRIPTS(xCoords2, 60, 40470)
    GUIIBSCRIPTS(xCoords2, 90, 40470)
    GUIIBSCRIPTS(xCoords2, 120, 40470)
    GUIIBSCRIPTS(xCoords2, 150, 40470)
    GUIIBSCRIPTS(xCoords2, 180, 40470)

    GUIIBSCRIPTS(xCoords3, 60, 40470)
    GUIIBSCRIPTS(xCoords3, 90, 40470)
    GUIIBSCRIPTS(xCoords3, 120, 40470)
    GUIIBSCRIPTS(xCoords3, 150, 40470)
    GUIIBSCRIPTS(xCoords3, 180, 40470)

    local CONFIGURACAO_DELAY = HUD.new(startX + Diference * 5 + 65, startY + Diference, "CONFIGURACAO DELAY PASSOS"); CONFIGURACAO_DELAY:setColor(255, 255, 255)
    table.insert(HUDsDelays, CONFIGURACAO_DELAY)

    local singleStepDelayHUD2 = HUD.new(startX + Diference * 5 + 20, startY + Diference + 30, "SINGLE DELAY PASSOS:"); singleStepDelayHUD2:setColor(255, 255, 255)
    local singleStepDelayHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 30, tostring(SINGLE_STEP_DELAY))
    singleStepDelayHUD:setColor(255, 255, 255)
    table.insert(HUDsDelays, singleStepDelayHUD)
    table.insert(HUDsDelays, singleStepDelayHUD2)

    local maxStepDelayHUD2 = HUD.new(startX + Diference * 5 + 20, startY + Diference + 60, "MAXIMO DELAY PASSOS:"); maxStepDelayHUD2:setColor(255, 255, 255)
    local maxStepDelayHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 60, tostring(MAX_STEP_DELAY))
    maxStepDelayHUD:setColor(255, 255, 255)
    table.insert(HUDsDelays, maxStepDelayHUD)
    table.insert(HUDsDelays, maxStepDelayHUD2)

    local delayFuncoesHUD2 = HUD.new(startX + Diference * 5 + 20, startY + Diference + 90, "DELAY PARA FUNCOES:"); delayFuncoesHUD2:setColor(255, 255, 255)
    local delayFuncoesHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 90, tostring(DELAY_FUNCOES))
    delayFuncoesHUD:setColor(255, 255, 255)
    table.insert(HUDsDelays, delayFuncoesHUD)
    table.insert(HUDsDelays, delayFuncoesHUD2)

    local stepDelayRefillHUD2 = HUD.new(startX + Diference * 5 + 20, startY + Diference + 120, "DELAY PASSOS REFIL:"); stepDelayRefillHUD2:setColor(255, 255, 255)
    local stepDelayRefillHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 120, tostring(STEP_DELAY_REFILL))
    stepDelayRefillHUD:setColor(255, 255, 255)
    table.insert(HUDsDelays, stepDelayRefillHUD)
    table.insert(HUDsDelays, stepDelayRefillHUD2)

    local DelayBuySupplies = HUD.new(startX + Diference * 5 + 20, startY + Diference + 150, "DELAY BUY SUPPLIES:"); DelayBuySupplies:setColor(255, 255, 255)
    local DelayBuySupplies2 = HUD.new(startX + Diference * 8 + 10, startY + Diference + 150, tostring(Delay_Supplies))
    DelayBuySupplies2:setColor(255, 255, 255)
    table.insert(HUDsDelays, DelayBuySupplies2)
    table.insert(HUDsDelays, DelayBuySupplies)

    -- Funções para ajustar os valores de delay

    local function adjustSingleStepDelay(value)
        SINGLE_STEP_DELAY = math.max(SINGLE_STEP_DELAY + value, 0)  -- Garantir que o delay não seja negativo
        singleStepDelayHUD:setText(tostring(SINGLE_STEP_DELAY))
    end

    local function adjustMaxStepDelay(value)
        MAX_STEP_DELAY = math.max(MAX_STEP_DELAY + value, 0)  -- Garantir que o delay não seja negativo
        maxStepDelayHUD:setText(tostring(MAX_STEP_DELAY))
    end

    local function adjustDelayFuncoes(value)
        DELAY_FUNCOES = math.max(DELAY_FUNCOES + value, 0)  -- Garantir que o delay não seja negativo
        delayFuncoesHUD:setText(tostring(DELAY_FUNCOES))
    end

    local function adjustStepDelayRefill(value)
        STEP_DELAY_REFILL = math.max(STEP_DELAY_REFILL + value, 0)  -- Garantir que o delay não seja negativo
        stepDelayRefillHUD:setText(tostring(STEP_DELAY_REFILL))
    end

    local function adjustStepDelaySupplies(value)
        Delay_Supplies = math.max(Delay_Supplies + value, 500)  -- Garantir que o delay não seja negativo
        DelayBuySupplies2:setText(tostring(Delay_Supplies))
    end


    -- Criar botões de ajuste para cada tipo de delay
    local startXAdjust = startX + Diference * 8 + 10
    local startYAdjust = startY + Diference + 30

    local btnMinusSingle = HUD.new(startXAdjust - 30, startYAdjust, "-")
    btnMinusSingle:setColor(255, 255, 255)
    btnMinusSingle:setCallback(function()
        adjustSingleStepDelay(-10)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusSingle = HUD.new(startXAdjust + 30, startYAdjust, "+")
    btnPlusSingle:setColor(255, 255, 255)
    btnPlusSingle:setCallback(function()
        adjustSingleStepDelay(10)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusMax = HUD.new(startXAdjust - 30, startYAdjust + 30, "-")
    btnMinusMax:setColor(255, 255, 255)
    btnMinusMax:setCallback(function()
        adjustMaxStepDelay(-50)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusMax = HUD.new(startXAdjust + 30, startYAdjust + 30, "+")
    btnPlusMax:setColor(255, 255, 255)
    btnPlusMax:setCallback(function()
        adjustMaxStepDelay(50)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusDelayFuncoes = HUD.new(startXAdjust - 30, startYAdjust + 60, "-")
    btnMinusDelayFuncoes:setColor(255, 255, 255)
    btnMinusDelayFuncoes:setCallback(function()
        adjustDelayFuncoes(-10)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusDelayFuncoes = HUD.new(startXAdjust + 30, startYAdjust + 60, "+")
    btnPlusDelayFuncoes:setColor(255, 255, 255)
    btnPlusDelayFuncoes:setCallback(function()
        adjustDelayFuncoes(10)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusStepDelayRefill = HUD.new(startXAdjust - 30, startYAdjust + 90, "-")
    btnMinusStepDelayRefill:setColor(255, 255, 255)
    btnMinusStepDelayRefill:setCallback(function()
        adjustStepDelayRefill(-10)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusStepDelayRefill = HUD.new(startXAdjust + 30, startYAdjust + 90, "+")
    btnPlusStepDelayRefill:setColor(255, 255, 255)
    btnPlusStepDelayRefill:setCallback(function()
        adjustStepDelayRefill(10)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusStepDelaySupplies = HUD.new(startXAdjust - 30, startYAdjust + 120, "-")
    btnMinusStepDelaySupplies:setColor(255, 255, 255)
    btnMinusStepDelaySupplies:setCallback(function()
        adjustStepDelaySupplies(-500)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusStepDelaySupplies = HUD.new(startXAdjust + 30, startYAdjust + 120, "+")
    btnPlusStepDelaySupplies:setColor(255, 255, 255)
    btnPlusStepDelaySupplies:setCallback(function()
        adjustStepDelaySupplies(500)  -- Ajustar o valor conforme necessário
    end)

    table.insert(HUDsDelays, btnMinusSingle)
    table.insert(HUDsDelays, btnPlusSingle)
    table.insert(HUDsDelays, btnMinusMax)
    table.insert(HUDsDelays, btnPlusMax)
    table.insert(HUDsDelays, btnMinusDelayFuncoes)
    table.insert(HUDsDelays, btnPlusDelayFuncoes)
    table.insert(HUDsDelays, btnMinusStepDelayRefill)
    table.insert(HUDsDelays, btnPlusStepDelayRefill)
    table.insert(HUDsDelays, btnMinusStepDelaySupplies)
    table.insert(HUDsDelays, btnPlusStepDelaySupplies)
end
-- Função para destruir todas as HUDs de delay criadas
local function destroyDelayHUDs4()
    for _, hud in ipairs(HUDsDelays) do
        hud:destroy()
    end
    HUDsDelays = {}  -- Limpar a lista após destruir as HUDs
end

local HUDsHUNT = {}  -- Lista para armazenar as HUDs criadas para os DELAYS
function table.find(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end

local validMaxMonsterStopValues = {0, 2, 4, 7, 9, 99}

-- Função para criar uma HUD de controle de delay
local function CreateHUNT(startX, startY)
    local function GUIIBSCRIPTS(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local zzHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 30, spriteID)
            table.insert(HUDsHUNT, zzHUD)
        end
    end

    local xCoords1 = {200, 230, 260, 290, 310, 330, 360, 390, 410, 440}
    local xCoords2 = {185, 455}
    local xCoords3 = {370}

    GUIIBSCRIPTS(xCoords1, 30, 4598)
    GUIIBSCRIPTS(xCoords1, 60, 9850)
    GUIIBSCRIPTS(xCoords1, 90, 9850)
    GUIIBSCRIPTS(xCoords1, 120, 9850)
    GUIIBSCRIPTS(xCoords1, 150, 9850)
    GUIIBSCRIPTS(xCoords1, 180, 9850)
    GUIIBSCRIPTS(xCoords1, 210, 9850)
    GUIIBSCRIPTS(xCoords1, 240, 9850)
    GUIIBSCRIPTS(xCoords1, 270, 9850)
    GUIIBSCRIPTS(xCoords1, 300, 9850)



    GUIIBSCRIPTS(xCoords1, 15, 40469)
    GUIIBSCRIPTS(xCoords1, 45, 40469)
    GUIIBSCRIPTS(xCoords1, 75, 40469)
    GUIIBSCRIPTS(xCoords1, 105, 40469)
    GUIIBSCRIPTS(xCoords1, 135, 40469)
    GUIIBSCRIPTS(xCoords1, 165, 40469)
    GUIIBSCRIPTS(xCoords1, 195, 40469)
    GUIIBSCRIPTS(xCoords1, 225, 40469)
    GUIIBSCRIPTS(xCoords1, 255, 40469)
    GUIIBSCRIPTS(xCoords1, 285, 40469)
    GUIIBSCRIPTS(xCoords1, 315, 40469)



    GUIIBSCRIPTS(xCoords2, 30, 40470)
    GUIIBSCRIPTS(xCoords2, 60, 40470)
    GUIIBSCRIPTS(xCoords2, 90, 40470)
    GUIIBSCRIPTS(xCoords2, 120, 40470)
    GUIIBSCRIPTS(xCoords2, 150, 40470)
    GUIIBSCRIPTS(xCoords2, 180, 40470)
    GUIIBSCRIPTS(xCoords2, 210, 40470)
    GUIIBSCRIPTS(xCoords2, 240, 40470)
    GUIIBSCRIPTS(xCoords2, 270, 40470)
    GUIIBSCRIPTS(xCoords2, 300, 40470)



    GUIIBSCRIPTS(xCoords3, 60, 40470)
    GUIIBSCRIPTS(xCoords3, 90, 40470)
    GUIIBSCRIPTS(xCoords3, 120, 40470)
    GUIIBSCRIPTS(xCoords3, 150, 40470)
    GUIIBSCRIPTS(xCoords3, 180, 40470)
    GUIIBSCRIPTS(xCoords3, 210, 40470)
    GUIIBSCRIPTS(xCoords3, 240, 40470)
    GUIIBSCRIPTS(xCoords3, 270, 40470)
    GUIIBSCRIPTS(xCoords3, 300, 40470)



    local CONFIGURACAOHUNT = HUD.new(startX + Diference * 5 + 65, startY + Diference, "CONFIGURACAO DA HUNT")
    CONFIGURACAOHUNT:setColor(255, 255, 255)
    table.insert(HUDsHUNT, CONFIGURACAOHUNT)

    -- HUDs para configurar os delays
    local MAX_MONSTER_STOPHUD2 = HUD.new(startX + Diference * 5 + 20, startY + Diference + 30, "QNT PARA MATAR BOX:")
    MAX_MONSTER_STOPHUD2:setColor(255, 255, 255)
    local MAX_MONSTER_STOPHUD = HUD.new(startX + Diference * 8 + 20, startY + Diference + 50, tostring(MAX_MONSTER_STOP), true)
    MAX_MONSTER_STOPHUD:setColor(255, 255, 255)
    table.insert(HUDsHUNT, MAX_MONSTER_STOPHUD2)
    table.insert(HUDsHUNT, MAX_MONSTER_STOPHUD)
    table.insert(HUDsHUNT, MAX_MONSTER_STOPHUDz)

    -- Verifique se MAX_MONSTER_STOP é 99 e ajuste o texto e tamanho da fonte
    if MAX_MONSTER_STOP == 99 then
        MAX_MONSTER_STOPHUD:setText("LURE")
        MAX_MONSTER_STOPHUD:setFontSize(7.5)
        MAX_MONSTER_STOPHUD:setPos(startX + Diference * 8 + 10, startY + Diference + 45)
        if not MAX_MONSTER_STOPHUDz then
            MAX_MONSTER_STOPHUDz = HUD.new(startX + Diference * 8 + 15, startY + Diference + 55, "SQM", true)
            MAX_MONSTER_STOPHUDz:setColor(255, 255, 255)
            MAX_MONSTER_STOPHUDz:setFontSize(7)
            
        end
    end

    local MIN_MONSTER_RESUMEHUD2 = HUD.new(startX + Diference * 5 + 25, startY + Diference + 60, "QNT PARA VOLTAR ANDAR:")
    MIN_MONSTER_RESUMEHUD2:setColor(255, 255, 255)
    local MIN_MONSTER_RESUMEHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 60, tostring(MIN_MONSTER_RESUME))
    MIN_MONSTER_RESUMEHUD:setColor(255, 255, 255)
    table.insert(HUDsHUNT, MIN_MONSTER_RESUMEHUD2)
    table.insert(HUDsHUNT, MIN_MONSTER_RESUMEHUD)

    local MONSTER_COUNT_AREAHUD2 = HUD.new(startX + Diference * 5 + 20 - 65, startY + Diference + 110, "AREA CONTAGEM CRIATURAS:", true); MONSTER_COUNT_AREAHUD2:setFontSize(7.5)
    MONSTER_COUNT_AREAHUD2:setColor(255, 255, 255)
    local MONSTER_COUNT_AREAHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 90, tostring(MONSTER_COUNT_AREA))
    MONSTER_COUNT_AREAHUD:setColor(255, 255, 255)
    table.insert(HUDsHUNT, MONSTER_COUNT_AREAHUD2)
    table.insert(HUDsHUNT, MONSTER_COUNT_AREAHUD)

    local CAITBOX_DISTANCE2 = HUD.new(startX + Diference * 5 + 25, startY + Diference + 120, "DISTANCIA SQM CAIT BOX:")
    CAITBOX_DISTANCE2:setColor(255, 255, 255)
    local CAITBOX_DISTANCEHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 120, tostring(CAITBOX_DISTANCE))
    CAITBOX_DISTANCEHUD:setColor(255, 255, 255)
    table.insert(HUDsHUNT, CAITBOX_DISTANCE2)
    table.insert(HUDsHUNT, CAITBOX_DISTANCEHUD)

    local RUNLOSTHUD2 = HUD.new(startX + Diference * 5 + 25, startY + Diference + 150, "QNT FUGIR DE CRIATURAS:")
    RUNLOSTHUD2:setColor(255, 255, 255)
    local RUNLOSTHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 150, tostring(RUN_LOST_MONSTER_COUNT))
    RUNLOSTHUD:setColor(255, 255, 255)
    table.insert(HUDsHUNT, RUNLOSTHUD2)
    table.insert(HUDsHUNT, RUNLOSTHUD)

    local STOPMANA2 = HUD.new(startX + Diference * 5 + 25, startY + Diference + 180, "PARAR COM % MANA")
    STOPMANA2:setColor(255, 255, 255)
    local STOPMANA = HUD.new(startX + Diference * 8 + 10, startY + Diference + 180, tostring(STOP_WITH_MANA))
    STOPMANA:setColor(255, 255, 255)
    table.insert(HUDsHUNT, STOPMANA2)
    table.insert(HUDsHUNT, STOPMANA)

    local RESUMEMANA2 = HUD.new(startX + Diference * 5 + 25, startY + Diference + 210, "RETORNAR COM % MANA:")
    RESUMEMANA2:setColor(255, 255, 255)
    local RESUMEMANA = HUD.new(startX + Diference * 8 + 10, startY + Diference + 210, tostring(RESUME_WITH_MANA))
    RESUMEMANA:setColor(255, 255, 255)
    table.insert(HUDsHUNT, RESUMEMANA2)
    table.insert(HUDsHUNT, RESUMEMANA)

    local AntiKSHUDText = HUD.new(startX + Diference * 5 + 25, startY + Diference + 240, "Ativar Anti KS:"); AntiKSHUDText:setColor(255, 255, 255)
    local AntiKSHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 240, AntiKS and "SIM" or "NAO")
    AntiKSHUD:setColor(AntiKS and 0 or 255, 255, AntiKS and 0 or 255) -- Verde se true, Branco se false
    AntiKSHUD:setCallback(function()
    AntiKS = not AntiKS
    AntiKSHUD:setText(AntiKS and "SIM" or "NAO")
    AntiKSHUD:setColor(AntiKS and 0 or 255, 255, AntiKS and 0 or 255) -- Atualiza a cor diretamente
    end)
    table.insert(HUDsHUNT, AntiKSHUD)
    table.insert(HUDsHUNT, AntiKSHUDText)

    local ReturnHuntText = HUD.new(startX + Diference * 5 + 25, startY + Diference + 270, "Hunt apos Dead (!bless):"); ReturnHuntText:setColor(255, 255, 255)
    local ReturnHuntHUD = HUD.new(startX + Diference * 8 + 10, startY + Diference + 270, ReturnHuntAfterDead and "SIM" or "NAO")
    ReturnHuntHUD:setColor(ReturnHuntAfterDead and 0 or 255, 255, ReturnHuntAfterDead and 0 or 255) -- Verde se true, Branco se false
    ReturnHuntHUD:setCallback(function()
    ReturnHuntAfterDead = not ReturnHuntAfterDead
    ReturnHuntHUD:setText(ReturnHuntAfterDead and "SIM" or "NAO")
    ReturnHuntHUD:setColor(ReturnHuntAfterDead and 0 or 255, 255, ReturnHuntAfterDead and 0 or 255) -- Atualiza a cor diretamente
    end)
    table.insert(HUDsHUNT, ReturnHuntHUD)
    table.insert(HUDsHUNT, ReturnHuntText)

    local MAX_MONSTER_STOP_TEXTS = {
        [1] = "1",
        [2] = "3",
        [3] = "5",
        [4] = "8",
        [5] = "10"
    }
    -- Funções para ajustar os valores de delay
    local function adjustMaxMonsterStop(value)
        local currentIndex = table.find(validMaxMonsterStopValues, MAX_MONSTER_STOP)
        if currentIndex then
            local newIndex = math.max(1, math.min(currentIndex + value, #validMaxMonsterStopValues))
            MAX_MONSTER_STOP = validMaxMonsterStopValues[newIndex]
            MAX_MONSTER_STOPHUD:setText(MAX_MONSTER_STOP_TEXTS[newIndex] or tostring(MAX_MONSTER_STOP))
            
            -- Verifica se MAX_MONSTER_STOP está no índice 6 (valor 99) e ajusta o texto e o tamanho da fonte
            if newIndex == 6 then
                MAX_MONSTER_STOPHUD:setText("LURE")
                if not MAX_MONSTER_STOPHUDz then
                    MAX_MONSTER_STOPHUDz = HUD.new(startX + Diference * 8 + 15, startY + Diference + 55, "SQM", true)
                    MAX_MONSTER_STOPHUDz:setColor(255, 255, 255)
                    MAX_MONSTER_STOPHUDz:setFontSize(7)
                end
                MAX_MONSTER_STOPHUD:setFontSize(7.5)
                MAX_MONSTER_STOPHUD:setPos(startX + Diference * 8 + 10, startY + Diference + 45)
            else
                -- Caso contrário, remove MAX_MONSTER_STOPHUDz se ele existir e restaura o texto e o tamanho da fonte padrão
                if MAX_MONSTER_STOPHUDz then
                    MAX_MONSTER_STOPHUDz:destroy()
                    MAX_MONSTER_STOPHUDz = nil
                end
                MAX_MONSTER_STOPHUD:setText(MAX_MONSTER_STOP_TEXTS[newIndex] or tostring(MAX_MONSTER_STOP))
                MAX_MONSTER_STOPHUD:setFontSize(8.25)  -- Ajuste o tamanho padrão da fonte aqui
                MAX_MONSTER_STOPHUD:setPos(startX + Diference * 8 + 20, startY + Diference + 50)
            end
        end
    end
    
    


    local function adjustMinMonsterResume(value)
        MIN_MONSTER_RESUME = math.max(math.min(MIN_MONSTER_RESUME + value, 5), 0)  -- Limitar entre 1 e 5
        MIN_MONSTER_RESUMEHUD:setText(tostring(MIN_MONSTER_RESUME))
    end

    local function adjustMonsterCountArea(value)
        MONSTER_COUNT_AREA_REFIL = math.max(math.min(MONSTER_COUNT_AREA_REFIL + value, 6), 1)  -- Garantir que o valor não seja negativo
        MONSTER_COUNT_AREA = math.max(math.min(MONSTER_COUNT_AREA + value, 6), 1)  -- Garantir que o valor não seja negativo
        MONSTER_COUNT_AREAHUD:setText(tostring(MONSTER_COUNT_AREA))
    end

    local function adjustCaitBoxDistance(value)
        CAITBOX_DISTANCE = math.max(math.min(CAITBOX_DISTANCE + value, 6), 2)  -- Garantir que o valor não seja negativo
        CAITBOX_DISTANCEHUD:setText(tostring(CAITBOX_DISTANCE))
    end
-----------------------------------------
local function adjustTOPMANA(value)
    STOP_WITH_MANA = math.max(math.min(STOP_WITH_MANA + value, 80), 0)  -- Garantir que o valor não seja negativo
    STOPMANA:setText(tostring(STOP_WITH_MANA))
end

local function adjustRESUMEMANA(value)
    RESUME_WITH_MANA = math.max(math.min(RESUME_WITH_MANA + value, 100), 0)  -- Garantir que o valor não seja negativo
    RESUMEMANA:setText(tostring(RESUME_WITH_MANA))
end

    local function adjustLOST(value)
        RUN_LOST_MONSTER_COUNT = math.max(math.min(RUN_LOST_MONSTER_COUNT + value, 30), 0)  -- Garantir que o valor não seja negativo
        RUNLOSTHUD:setText(tostring(RUN_LOST_MONSTER_COUNT))
    end

    -- Criar botões de ajuste para cada tipo de delay
    local startXAdjust = startX + Diference * 8 + 10
    local startYAdjust = startY + Diference + 30

    local btnMinusMax = HUD.new(startXAdjust - 30, startYAdjust, "-")
    btnMinusMax:setColor(255, 255, 255)
    btnMinusMax:setCallback(function()
        adjustMaxMonsterStop(-1)  -- Ajustar o valor conforme necessário
    end)
    
    -- Criando botão de incremento para MAX_MONSTER_STOP
    local btnPlusMax = HUD.new(startXAdjust + 30, startYAdjust, "+")
    btnPlusMax:setColor(255, 255, 255)
    btnPlusMax:setCallback(function()
        adjustMaxMonsterStop(1)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusResume = HUD.new(startXAdjust - 30, startYAdjust + 30, "-")
    btnMinusResume:setColor(255, 255, 255)
    btnMinusResume:setCallback(function()
        adjustMinMonsterResume(-1)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusResume = HUD.new(startXAdjust + 30, startYAdjust + 30, "+")
    btnPlusResume:setColor(255, 255, 255)
    btnPlusResume:setCallback(function()
        adjustMinMonsterResume(1)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusArea = HUD.new(startXAdjust - 30, startYAdjust + 60, "-")
    btnMinusArea:setColor(255, 255, 255)
    btnMinusArea:setCallback(function()
        adjustMonsterCountArea(-1)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusArea = HUD.new(startXAdjust + 30, startYAdjust + 60, "+")
    btnPlusArea:setColor(255, 255, 255)
    btnPlusArea:setCallback(function()
        adjustMonsterCountArea(1)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusCaitBox = HUD.new(startXAdjust - 30, startYAdjust + 90, "-")
    btnMinusCaitBox:setColor(255, 255, 255)
    btnMinusCaitBox:setCallback(function()
        adjustCaitBoxDistance(-1)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusCaitBox = HUD.new(startXAdjust + 30, startYAdjust + 90, "+")
    btnPlusCaitBox:setColor(255, 255, 255)
    btnPlusCaitBox:setCallback(function()
        adjustCaitBoxDistance(1)  -- Ajustar o valor conforme necessário
    end)


    local btnMinusSTOPMANA = HUD.new(startXAdjust - 30, startYAdjust + 150, "-")
    btnMinusSTOPMANA:setColor(255, 255, 255)
    btnMinusSTOPMANA:setCallback(function()
        adjustTOPMANA(-10)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusSTOP = HUD.new(startXAdjust + 30, startYAdjust + 150, "+")
    btnPlusSTOP:setColor(255, 255, 255)
    btnPlusSTOP:setCallback(function()
        adjustTOPMANA(10)  -- Ajustar o valor conforme necessário
    end)

    local btnMinusRESUMEMANA = HUD.new(startXAdjust - 30, startYAdjust + 180, "-")
    btnMinusRESUMEMANA:setColor(255, 255, 255)
    btnMinusRESUMEMANA:setCallback(function()
        adjustRESUMEMANA(-10)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusRESUMEMANA = HUD.new(startXAdjust + 30, startYAdjust + 180, "+")
    btnPlusRESUMEMANA:setColor(255, 255, 255)
    btnPlusRESUMEMANA:setCallback(function()
        adjustRESUMEMANA(10)  -- Ajustar o valor conforme necessário
    end)

--BOTAO LOST
    local btnMinusLost = HUD.new(startXAdjust - 30, startYAdjust + 120, "-")
    btnMinusLost:setColor(255, 255, 255)
    btnMinusLost:setCallback(function()
        adjustLOST(-5)  -- Ajustar o valor conforme necessário
    end)

    local btnPlusLost = HUD.new(startXAdjust + 30, startYAdjust + 120, "+")
    btnPlusLost:setColor(255, 255, 255)
    btnPlusLost:setCallback(function()
        adjustLOST(5)  -- Ajustar o valor conforme necessário
    end)
-------------NEW




-------------NEW
    -- Adicionar os botões de ajuste à lista de HUDs
    table.insert(HUDsHUNT, btnPlusLost)
    table.insert(HUDsHUNT, btnMinusLost)
    table.insert(HUDsHUNT, btnPlusRESUMEMANA)
    table.insert(HUDsHUNT, btnMinusRESUMEMANA)
    table.insert(HUDsHUNT, btnPlusSTOP)
    table.insert(HUDsHUNT, btnMinusSTOPMANA)


    table.insert(HUDsHUNT, btnMinusMax)
    table.insert(HUDsHUNT, btnPlusMax)
    table.insert(HUDsHUNT, btnMinusResume)
    table.insert(HUDsHUNT, btnPlusResume)
    table.insert(HUDsHUNT, btnMinusArea)
    table.insert(HUDsHUNT, btnPlusArea)
    table.insert(HUDsHUNT, btnMinusCaitBox)
    table.insert(HUDsHUNT, btnPlusCaitBox)
end

-- Função para destruir todas as HUDs de delay criadas
local function destroyHUNTHUDs5()
    if MAX_MONSTER_STOPHUDz then
        MAX_MONSTER_STOPHUDz:destroy()
        MAX_MONSTER_STOPHUDz = nil  -- Garantir que a variável seja redefinida após a destruição
    end

    for _, hud in ipairs(HUDsHUNT) do
        hud:destroy()
    end
    HUDsHUNT = {}  -- Limpar a lista após destruir as HUDs
end

local HUDsEXTRA = nil
local HUD_LATENCIA_STOP = nil
local HUD_RESET_CAVEBOT = nil
local HUD_AUTOLOOT = nil
local ROPEHUD = nil
local SHOVELHUD = nil
local ITEM_IDHUD = nil


local currentResetIndex = 2 -- Começa com index 1
local currentRopeIndex = 5 -- Começa com index 1
local currentShovelIndex = 5 

local function DestroyHUDs()
    if HUDsEXTRA then
        for _, hud in ipairs(HUDsEXTRA) do
            hud:destroy()
        end
        HUDsEXTRA = nil
    end
    HUD_AUTOLOOT = nil
    ROPEHUD = nil
    SHOVELHUD = nil
    ITEM_IDHUD = nil

end

local function CreateEXTRAHUD(startX, startY)
    -- Destruir os HUDs existentes antes de criar novos
    DestroyHUDs()

    HUDsEXTRA = {}

    local function GUIIBSCRIPTS(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local zzHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 30, spriteID)
            table.insert(HUDsEXTRA, zzHUD)
        end
    end

    local xCoords1 = {200, 230, 260, 290, 310, 330, 360, 390, 410, 440}
    local xCoords2 = {185, 370, 455}
    local xCoords3 = {370}
    local xCoords4 = {185, 455}


    GUIIBSCRIPTS(xCoords1, 30, 4598)
    GUIIBSCRIPTS(xCoords1, 60, 9850)
    GUIIBSCRIPTS(xCoords1, 90, 9850)
    GUIIBSCRIPTS(xCoords1, 120, 9850)
    GUIIBSCRIPTS(xCoords1, 150, 9850)
    GUIIBSCRIPTS(xCoords1, 180, 9850)
    GUIIBSCRIPTS(xCoords1, 210, 9850)
    GUIIBSCRIPTS(xCoords1, 240, 9850)
--------------------------------------------
    GUIIBSCRIPTS(xCoords1, 240, 9850)
    GUIIBSCRIPTS(xCoords1, 270, 9850)
    GUIIBSCRIPTS(xCoords1, 300, 9850)
    GUIIBSCRIPTS(xCoords1, 330, 9850)
    GUIIBSCRIPTS(xCoords1, 360, 9850)

    GUIIBSCRIPTS(xCoords1, 255, 40469)
    GUIIBSCRIPTS(xCoords1, 285, 40469)
    GUIIBSCRIPTS(xCoords1, 315, 40469)
    GUIIBSCRIPTS(xCoords1, 345, 40469)
    GUIIBSCRIPTS(xCoords1, 375, 40469)

    GUIIBSCRIPTS(xCoords2, 240, 40470)
    GUIIBSCRIPTS(xCoords2, 270, 40470)
    GUIIBSCRIPTS(xCoords2, 300, 40470)
    GUIIBSCRIPTS(xCoords2, 330, 40470)
    GUIIBSCRIPTS(xCoords2, 360, 40470)


    GUIIBSCRIPTS(xCoords1, 15, 40469)
    GUIIBSCRIPTS(xCoords1, 45, 40469)
    GUIIBSCRIPTS(xCoords1, 75, 40469)
    GUIIBSCRIPTS(xCoords1, 105, 40469)
    GUIIBSCRIPTS(xCoords1, 135, 40469)
    GUIIBSCRIPTS(xCoords1, 165, 40469)
    GUIIBSCRIPTS(xCoords1, 195, 40469)
    GUIIBSCRIPTS(xCoords1, 225, 40469)
    GUIIBSCRIPTS(xCoords1, 255, 40469)



    GUIIBSCRIPTS(xCoords2, 60, 40470)
    GUIIBSCRIPTS(xCoords2, 90, 40470)
    GUIIBSCRIPTS(xCoords2, 120, 40470)
    GUIIBSCRIPTS(xCoords2, 150, 40470)
    GUIIBSCRIPTS(xCoords2, 180, 40470)
    GUIIBSCRIPTS(xCoords2, 210, 40470)
    GUIIBSCRIPTS(xCoords2, 230, 40470)


    GUIIBSCRIPTS(xCoords4, 30, 40470)
    GUIIBSCRIPTS(xCoords3, 60, 40470)
    GUIIBSCRIPTS(xCoords3, 90, 40470)
    GUIIBSCRIPTS(xCoords3, 120, 40470)
    GUIIBSCRIPTS(xCoords3, 150, 40470)
    GUIIBSCRIPTS(xCoords3, 180, 40470)
    GUIIBSCRIPTS(xCoords3, 210, 40470)
    GUIIBSCRIPTS(xCoords3, 230, 40470)

    local USEITEM_CONFIG = HUD.new(startX + Diference * 5 + 15, startY + verticalSpacing + 200, "Selecione Item to Use:")
    table.insert(HUDsEXTRA, USEITEM_CONFIG)
    USEITEM_CONFIG:setColor(255, 255, 255)

    local DUST_CONVERTER = HUD.new(startX + Diference * 5 + 15, startY + verticalSpacing + Diference * 5 - 20, "Transformar DUST em:")
    table.insert(HUDsEXTRA, DUST_CONVERTER)
    DUST_CONVERTER:setColor(255, 255, 255)

    local convertForgeHUD

    local function updateHUD()
        if ConvertForge == 1 then
            convertForgeHUD:setText("Add Limit")
            convertForgeHUD:setColor(255, 255, 255) 
        elseif ConvertForge == 2 then
            convertForgeHUD:setText("Slivers")
            convertForgeHUD:setColor(255, 255, 255) 
        elseif ConvertForge == 0 then
            convertForgeHUD:setText("Desligado")
            convertForgeHUD:setColor(255, 0, 0) 
        end
    end
    
    -- Criar o HUD pela primeira vez
    convertForgeHUD = HUD.new(startX + Diference * 5 + 160, startY + verticalSpacing + Diference * 5 - 20, "")
    table.insert(HUDsEXTRA, convertForgeHUD)

    updateHUD()
    
    convertForgeHUD:setCallback(function()
        if ConvertForge == 0 then
            ConvertForge = 1
        elseif ConvertForge == 1 then
            ConvertForge = 2
        else
            ConvertForge = 0
        end
    
        updateHUD()
    
    end)


    local DUST_CONVERTER = HUD.new(startX + Diference * 5 + 15, startY + verticalSpacing + Diference * 6 - 40, "Transfer apos Deposit:")
    table.insert(HUDsEXTRA, DUST_CONVERTER)
    DUST_CONVERTER:setColor(255, 255, 255)

        local text = TransferAfterDeposit and "SIM" or "NAO"
        local color = TransferAfterDeposit and {0, 255, 0} or {255, 255, 255}  -- Verde se SIM, Branco se NÃO
    
        TransferHUD = HUD.new(startX + Diference * 5 + 160, startY + verticalSpacing + Diference * 6 - 40, text)
        table.insert(HUDsEXTRA, TransferHUD)
        TransferHUD:setText(text)
        TransferHUD:setColor(unpack(color))  -- Define a cor do HUD
    
    -- Função chamada quando o HUD é clicado
    function onTransferHUDClick()
        -- Alterna o valor de TransferAfterDeposit entre true e false
        TransferAfterDeposit = not TransferAfterDeposit
        
        -- Atualiza o HUD com o novo valor e cor
        local text = TransferAfterDeposit and "SIM" or "NAO"
        local color = TransferAfterDeposit and {0, 255, 0} or {255, 255, 255}  -- Verde se SIM, Branco se NÃO
        
        TransferHUD:setText(text)  -- Atualiza o texto do HUD
        TransferHUD:setColor(unpack(color))  -- Atualiza a cor do HUD
    end

    TransferHUD:setCallback(onTransferHUDClick)  -- Define o callback para quando o HUD for clicado

    local DUST_CONVERTER = HUD.new(startX + Diference * 5 + 25, startY + verticalSpacing + Diference * 7 - 60, "Char Name para Transfer:")
    table.insert(HUDsEXTRA, DUST_CONVERTER)
    DUST_CONVERTER:setColor(255, 255, 255)
    local NomeCharacterHUD = HUD.new(startX + Diference * 5 + 150, startY + verticalSpacing + Diference * 7 - 40, NameTransfer, true); NomeCharacterHUD:setColor(255, 255, 255); NomeCharacterHUD:setFontSize(7)
    NomeCharacterHUD:setDraggable(true)
    table.insert(HUDsEXTRA, NomeCharacterHUD)



    
    local DUST_CONVERTER = HUD.new(startX + Diference * 5 + 25, startY + verticalSpacing + Diference * 8 - 80, "Valor Minimo para Manter:")
    table.insert(HUDsEXTRA, DUST_CONVERTER)
    DUST_CONVERTER:setColor(255, 255, 255)
    local function formatBalance(value)
        if value >= 1000 then
            return string.format("%.0fk", value / 1000)
        else
            return tostring(value)
        end
    end

    local LimitSuppliesText = HUD.new(startX + Diference * 5 + 25, startY + verticalSpacing + Diference * 9 - 100, "Limite Compra Supplies?"); LimitSuppliesText:setColor(255, 255, 255)
    local LimitSuppliesHUD = HUD.new(startX + Diference * 5 + 160, startY + verticalSpacing + Diference * 9 - 100, LimitBuySupplies and "SIM" or "NAO")
    LimitSuppliesHUD:setColor(LimitBuySupplies and 0 or 255, 255, LimitBuySupplies and 0 or 255) -- Verde se true, Branco se false
    LimitSuppliesHUD:setCallback(function()
    LimitBuySupplies = not LimitBuySupplies
    LimitSuppliesHUD:setText(LimitBuySupplies and "SIM" or "NAO")
    LimitSuppliesHUD:setColor(LimitBuySupplies and 0 or 255, 255, LimitBuySupplies and 0 or 255) -- Atualiza a cor diretamente
    end)
    table.insert(HUDsEXTRA, LimitSuppliesHUD)
    table.insert(HUDsEXTRA, LimitSuppliesText)


    
    
    -- HUD que exibe o valor atual de ManterBalance com formatação "k" para milhares
    local manterBalanceHUD = HUD.new(startX + Diference * 5 + 160, startY + verticalSpacing + Diference * 8 - 80, formatBalance(ManterBalance))
    manterBalanceHUD:setColor(255, 255, 255)
    
    -- HUD para diminuir o valor de ManterBalance (-)
    local decreaseBalanceHUD = HUD.new(startX + Diference * 5 + 130, startY + verticalSpacing + Diference * 8 - 80, "-")
    decreaseBalanceHUD:setColor(255, 255, 255)
    decreaseBalanceHUD:setCallback(function()
        ManterBalance = math.max(0, ManterBalance - 50000)  -- Diminui 5000 no valor
        manterBalanceHUD:setText(formatBalance(ManterBalance))  -- Atualiza o HUD com o novo valor formatado
    end)
    
    -- HUD para aumentar o valor de ManterBalance (+)
    local increaseBalanceHUD = HUD.new(startX + Diference * 5 + 190, startY + verticalSpacing + Diference * 8 - 80, "+")
    increaseBalanceHUD:setColor(255, 255, 255)
    increaseBalanceHUD:setCallback(function()
        ManterBalance = ManterBalance + 50000  -- Aumenta 5000 no valor
        manterBalanceHUD:setText(formatBalance(ManterBalance))  -- Atualiza o HUD com o novo valor formatado
    end)
    
    -- Exemplo de organização em uma tabela de HUDs
    local HUDs = {}
    table.insert(HUDsEXTRA, manterBalanceHUD)
    table.insert(HUDsEXTRA, decreaseBalanceHUD)
    table.insert(HUDsEXTRA, increaseBalanceHUD)


    local CONFIG_EXTRA = HUD.new(startX + Diference * 5 + 75, startY + verticalSpacing + 20, "CONFIGURACOES EXTRAS")
    table.insert(HUDsEXTRA, CONFIG_EXTRA)
    CONFIG_EXTRA:setColor(255, 255, 255)

    local ROPE_CONFIG = HUD.new(startX + Diference * 5 + 5, startY + verticalSpacing + 135, "Selecione sua ROPE:")
    table.insert(HUDsEXTRA, ROPE_CONFIG)
    ROPE_CONFIG:setColor(255, 255, 255)

    local SHOVEL_CONFIG = HUD.new(startX + Diference * 5 + 10, startY + verticalSpacing + 165, "Selecione sua Shovel:")
    table.insert(HUDsEXTRA, SHOVEL_CONFIG)
    SHOVEL_CONFIG:setColor(255, 255, 255)


    local PINGALTO = HUD.new(startX + Diference * 5 + 30, startY + verticalSpacing + 45, "Parar Hunt com PING 100+ ")
    table.insert(HUDsEXTRA, PINGALTO)
    PINGALTO:setColor(255, 255, 255)

    local segundos = HUD.new(startX + Diference * 7 + 50, startY + verticalSpacing * 2 + 75, "(segundos)", true)
    table.insert(HUDsEXTRA, segundos)
    segundos:setColor(255, 255, 255)
    segundos:setFontSize(6)

    local function atualizarSegundos()
        if RESET_CAVEBOT[currentResetIndex] <= 1 then
            segundos:setText("(desligado)")
        else
            segundos:setText("(segundos)")
        end
    end
    atualizarSegundos()
    local RESETCAVEBOTHUD = HUD.new(startX + Diference * 5 + 25, startY + verticalSpacing + 75, "Reset Cavebot parado por:")
    table.insert(HUDsEXTRA, RESETCAVEBOTHUD)
    RESETCAVEBOTHUD:setColor(255, 255, 255)

    local AUTOLOOTHUDz = HUD.new(startX + Diference * 5 + 8, startY + verticalSpacing + 105, "Lootiar apos Kill BOX:")
    table.insert(HUDsEXTRA, AUTOLOOTHUDz)
    AUTOLOOTHUDz:setColor(255, 255, 255)

    -- Criar HUD de latência se não existir
-- Inicialize a variável currentLatenciaIndex, se ainda não estiver definida
if currentLatenciaIndex == nil then
    currentLatenciaIndex = 1
end

if not HUD_LATENCIA_STOP then
    local initialText = currentLatenciaIndex == 1 and "NAO" or "SIM"
    local initialColor = currentLatenciaIndex == 1 and {255, 255, 255} or {0, 255, 0}
    
    -- Crie o HUD_LATENCIA_STOP com as propriedades iniciais
    HUD_LATENCIA_STOP = HUD.new(startX + Diference * 8 + 12, startY + verticalSpacing + 50, tostring(LATENCIA_STOP[currentLatenciaIndex]))
    HUD_LATENCIA_STOP:setColor(unpack(initialColor))
    HUD_LATENCIA_STOP:setText(initialText)
    
    -- Defina o callback para alternar o estado
    HUD_LATENCIA_STOP:setCallback(function()
        -- Atualize o índice para o próximo valor
        currentLatenciaIndex = currentLatenciaIndex % #LATENCIA_STOP + 1
        local newText = currentLatenciaIndex == 1 and "NAO" or "SIM"
        local newColor = currentLatenciaIndex == 1 and {255, 255, 255} or {0, 255, 0}
        
        -- Atualize o texto e a cor do HUD
        HUD_LATENCIA_STOP:setText(newText)
        HUD_LATENCIA_STOP:setColor(unpack(newColor))
    end)
    
    -- Adicione o HUD à lista extra
    table.insert(HUDsEXTRA, HUD_LATENCIA_STOP)
end


    -- Criar HUD de reset de cavebot se não existir
    if not HUD_RESET_CAVEBOT then
        -- Cria o HUD e define seu texto inicial
        HUD_RESET_CAVEBOT = HUD.new(startX + Diference * 8 + 12, startY + verticalSpacing + 75, tostring(RESET_CAVEBOT[currentResetIndex]))
        
        -- Define a cor do texto do HUD para branco
        HUD_RESET_CAVEBOT:setColor(255, 255, 255)
        
        -- Define o texto inicial do HUD com base no índice atual
        HUD_RESET_CAVEBOT:setText(tostring(RESET_CAVEBOT[currentResetIndex]))
        
        -- Define a função de callback para quando o HUD for clicado
        HUD_RESET_CAVEBOT:setCallback(function()
            -- Atualiza o índice para o próximo valor na lista, retornando ao início se necessário
            currentResetIndex = (currentResetIndex % #RESET_CAVEBOT) + 1
            
            -- Atualiza o texto do HUD com base no novo índice
            if RESET_CAVEBOT[currentResetIndex] <= 1 then
                -- Se o valor atual for 1, define o texto do HUD e do "segundos" como "(desligado)"
                HUD_RESET_CAVEBOT:setText(tostring(RESET_CAVEBOT[currentResetIndex]))
                segundos:setText("(desligado)")
            else
                -- Caso contrário, define o texto com o novo valor e mantém o texto do "segundos" padrão
                HUD_RESET_CAVEBOT:setText(tostring(RESET_CAVEBOT[currentResetIndex]))
                segundos:setText("(segundos)")
            end
            
            -- Retorna o índice atual
            return currentResetIndex
        end)
        
        -- Adiciona o HUD à lista de HUDs extras
        table.insert(HUDsEXTRA, HUD_RESET_CAVEBOT)
    end   
    

    -- Criar HUD de auto-loot se não existir
    if not HUD_AUTOLOOT then
        local initialText = AUTOLOOT and "SIM" or "NAO"
        local initialColor = AUTOLOOT and {0, 255, 0} or {255, 255, 255}
        
        HUD_AUTOLOOT = HUD.new(startX + Diference * 8 + 12, startY + verticalSpacing + 110, initialText)
        HUD_AUTOLOOT:setColor(unpack(initialColor))
        
        HUD_AUTOLOOT:setCallback(function()
            AUTOLOOT = not AUTOLOOT
            local newText = AUTOLOOT and "SIM" or "NAO"
            local newColor = AUTOLOOT and {0, 255, 0} or {255, 255, 255}
            
            HUD_AUTOLOOT:setText(newText)
            HUD_AUTOLOOT:setColor(unpack(newColor))
        end)
        
        table.insert(HUDsEXTRA, HUD_AUTOLOOT)
    end

    local ROPE_ID_LIST = {3003, 646, 9594, 9598, 9596}
    local SHOVEL_ID_LIST = {3457, 5710, 9594, 9598, 9596}
    local USEITEM_LIST = {28477, 31296, 3032, 3030, 3033, 3029, 3456, 3308, 28468} 

    
    if not ROPEHUD then
        ROPEHUD = HUD.new(startX + Diference * 9 - 40, startY + verticalSpacing + 150, ROPE_ID)
        ROPEHUD:setColor(255, 255, 255)
        ROPEHUD:setCallback(function()
            local currentIndexrope = table.find(ROPE_ID_LIST, ROPE_ID)
            if currentIndexrope then
                currentIndexrope = (currentIndexrope % #ROPE_ID_LIST) + 1
                ROPE_ID = ROPE_ID_LIST[currentIndexrope]
                ROPEHUD:setItemId(ROPE_ID)
            end
        end)
        table.insert(HUDsEXTRA, ROPEHUD)
    end
    
    if not SHOVELHUD then
        SHOVELHUD = HUD.new(startX + Diference * 9 - 40, startY + verticalSpacing + 180, SHOVEL_ID)
        SHOVELHUD:setColor(255, 255, 255)
        SHOVELHUD:setCallback(function()
            local currentIndexshovel = table.find(SHOVEL_ID_LIST, SHOVEL_ID)
            if currentIndexshovel then
                currentIndexshovel = (currentIndexshovel % #SHOVEL_ID_LIST) + 1
                SHOVEL_ID = SHOVEL_ID_LIST[currentIndexshovel]
                SHOVELHUD:setItemId(SHOVEL_ID)
            end
        end)
        table.insert(HUDsEXTRA, SHOVELHUD)
    end
    
    if not ITEM_IDHUD then
        ITEM_IDHUD = HUD.new(startX + Diference * 9 - 40, startY + verticalSpacing + 210, USEITEM_ID)
        ITEM_IDHUD:setColor(255, 255, 255)
        ITEM_IDHUD:setCallback(function()
            local currentIndexitem = table.find(USEITEM_LIST, USEITEM_ID)
            if currentIndexitem then
                currentIndexitem = (currentIndexitem % #USEITEM_LIST) + 1
                USEITEM_ID = USEITEM_LIST[currentIndexitem]
                ITEM_IDHUD:setItemId(USEITEM_ID)
            end
        end)
        table.insert(HUDsEXTRA, ITEM_IDHUD)
    end
end

local function destroyExtraHUDs()
    if HUDsEXTRA then
        for _, hud in ipairs(HUDsEXTRA) do
            hud:destroy()
        end

        HUDsEXTRA = nil
        HUD_LATENCIA_STOP = nil
        HUD_RESET_CAVEBOT = nil
    end
end
-- Função para criar os HUDs de configuração
function CriarConfig()
    local function SUPPLIES(xCoords, y, spriteID)
        local huds = {}
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 105 - 40, spriteID)
            table.insert(huds, hud)
            table.insert(createdHUDs, hud)  -- Adiciona o HUD à lista de criados
        end
        return huds
    end

    local xCoords2 = {-10, 60, 70, 110, 120, 175}
    local xCoords1 = {5, 35, 45, 85, 95, 135, 160}
    local huds = {}
    table.insert(huds, SUPPLIES(xCoords1, Diference * 6, 9850))
    table.insert(huds, SUPPLIES(xCoords1, Diference * 6 + 15, 40469))
    table.insert(huds, SUPPLIES(xCoords1, Diference * 6 - 15, 40469))
    table.insert(huds, SUPPLIES(xCoords2, Diference * 6, 40470))

    table.insert(huds, SUPPLIES(xCoords1, Diference * 6 + 40, 9850))
    table.insert(huds, SUPPLIES(xCoords1, Diference * 6 + 40 + 15, 40469))
    table.insert(huds, SUPPLIES(xCoords1, Diference * 6 + 40 - 15, 40469))
    table.insert(huds, SUPPLIES(xCoords2, Diference * 6 + 40, 40470))

    local HUDToggle = false
    local REFIL = HUD.new(HUD_MUDAR_X + 25, HUD_MUDAR_Y + Diference * 6 - 10 + 105 - 40, "SUPPLIES")
    REFIL:setColor(255, 255, 255)
    REFIL:setCallback(function()
        if HUDToggle then
            destroyExtraHUDs()
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
        else
            destroyExtraHUDs()
            destroyHUNTHUDs5()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            
            local playerVocation = VerificarVocacaoDoPlayer()
            createItemHUDs(playerVocation, HUD_MUDAR_X, HUD_MUDAR_Y)

        end
        HUDToggle = not HUDToggle
    end)    

    local ENCHANTITEM = HUD.new(HUD_MUDAR_X + 90, HUD_MUDAR_Y + Diference * 6 - 10 + 105 - 40, "ITEM")
    ENCHANTITEM:setColor(255, 255, 255)
    ENCHANTITEM:setCallback(function()
        if HUDToggle then
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
            destroyExtraHUDs()
        else
            destroyExtraHUDs()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
            destroyItemHUDs()
            destroyItemHUDs3()

            local playerVocation = VerificarVocacaoDoPlayer()
            createItemHUDs2(playerVocation, HUD_MUDAR_X, HUD_MUDAR_Y)
        end
        HUDToggle = not HUDToggle
    end)
    
    local HUDToggle = false
    local REFILHUDZ = HUD.new(HUD_MUDAR_X + 122 + 25, HUD_MUDAR_Y + Diference * 6 - 10 + 105 - 40, "REFIL"); REFILHUDZ:setColor(255, 255, 255)
    REFILHUDZ:setColor(255, 255, 255)
    REFILHUDZ:setCallback(function()
        if HUDToggle then
            destroyExtraHUDs()
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
        else
            destroyExtraHUDs()
            destroyHUNTHUDs5()
            CreateHUDEXTRA(HUD_MUDAR_X, HUD_MUDAR_Y)
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyDelayHUDs4()

        end
        HUDToggle = not HUDToggle
    end)
    

    table.insert(createdHUDs, REFIL)
    table.insert(createdHUDs, ENCHANTITEM)
    table.insert(createdHUDs, REFILHUDZ)


    local DELAY_HUD = HUD.new(HUD_MUDAR_X + 25, HUD_MUDAR_Y + Diference * 6 + 30 + 105 - 40, "DELAYS")
    table.insert(createdHUDs, DELAY_HUD)
    
    DELAY_HUD:setColor(255, 255, 255)
    DELAY_HUD:setCallback(function()
        if HUDToggle then
            destroyExtraHUDs()
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
        else
            destroyExtraHUDs()
            destroyHUNTHUDs5()
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            createDelayHUD(HUD_MUDAR_X, HUD_MUDAR_Y)
        end
    
        HUDToggle = not HUDToggle
    end)
    
    local HUNTSHUD = HUD.new(HUD_MUDAR_X + 90, HUD_MUDAR_Y + Diference * 6 + 30 + 105 - 40, "HUNT")
    table.insert(createdHUDs, HUNTSHUD)
    HUNTSHUD:setColor(255, 255, 255)
    HUNTSHUD:setCallback(function()
        if HUDToggleHUNT then
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            destroyHUNTHUDs5()
            destroyExtraHUDs()
        else
            destroyExtraHUDs()
            destroyItemHUDs()
            destroyItemHUDs2()
            destroyItemHUDs3()
            destroyDelayHUDs4()
            CreateHUNT(HUD_MUDAR_X, HUD_MUDAR_Y)
        end
        HUDToggleHUNT = not HUDToggleHUNT
    end)

    local EXTRASHUDZ = HUD.new(HUD_MUDAR_X + 148, HUD_MUDAR_Y + Diference * 6 + 30 + 105 - 40, "EXTRAS")
    table.insert(createdHUDs, EXTRASHUDZ)
EXTRASHUDZ:setColor(255, 255, 255)
EXTRASHUDZ:setCallback(function()
    if HUDsEXTRA then
        destroyItemHUDs()
        destroyItemHUDs2()
        destroyItemHUDs3()
        destroyDelayHUDs4()
        destroyHUNTHUDs5()
        destroyExtraHUDs() 
       else
        destroyItemHUDs()
        destroyItemHUDs2()
        destroyItemHUDs3()
        destroyDelayHUDs4()
        destroyHUNTHUDs5()
        CreateEXTRAHUD(HUD_MUDAR_X, HUD_MUDAR_Y)
    end
end)
    return huds
end



-- Função para destruir os HUDs criados
function DestruirConfig()
    for _, hud in ipairs(createdHUDs) do
        hud:destroy()
        destroyItemHUDs()
        destroyItemHUDs2()
        destroyItemHUDs3()
        destroyDelayHUDs4()
        destroyHUNTHUDs5()
        destroyExtraHUDs()
    end
    createdHUDs = {}  -- Limpa a tabela de HUDs criados
end


-- Criação do HUD CONFIG
local originalPosX = HUD_MUDAR_X  -- Armazena a posição X original
local originalPosY = HUD_MUDAR_Y    -- Armazena a posição Y original
local CONFIG = HUD.new(HUD_MUDAR_X + 145, HUD_MUDAR_Y + 50, "CONFIG")
CONFIG:setColor(255, 255, 255)






-- Configura o callback para alternar entre criar e destruir os HUDs
CONFIG:setCallback(function()
    if hudsCriados then

        DestruirConfig()
        CONFIG:setColor(255, 255, 255)  -- Volta a cor para branca
    else
        CriarConfig()
        CONFIG:setColor(0, 255, 0)  -- Muda a cor para verde
    end
    hudsCriados = not hudsCriados  -- Inverte o estado do toggle
end)





-- HUD CAVEBOT
local function CAVEBOT(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
    end
end
local xCoords2 = {-5, 105}
local xCoords1 = {10, 20, 50, 80, 90}
CAVEBOT(xCoords1, 50 + Diference, 9850)
CAVEBOT(xCoords1, 35 + Diference, 40469)
CAVEBOT(xCoords1, 65 + Diference, 40469)
CAVEBOT(xCoords2, 50 + Diference, 40470)

-- HUD REFIL
local function REFIL(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
    end
end
local xCoords2 = {-5, 105}
local xCoords1 = {10, 20, 50, 80, 90}
REFIL(xCoords1, 40 + (Diference * 2), 9850)
REFIL(xCoords1, 25 + (Diference * 2), 40469)
REFIL(xCoords1, 55 + (Diference * 2), 40469)
REFIL(xCoords2, 40 + (Diference * 2), 40470)



--HUD INFO
local infoHudElements = {}

local function INFO(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        local INFOHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y - 40, spriteID)
        table.insert(infoHudElements, {hud = INFOHUD, originalX = x + HUD_MUDAR_X, originalY = y + HUD_MUDAR_Y - 40})
    end
end

local xCoords2 = {-10, 135}
local xCoords1 = {5, 20, 50, 80, 90, 110, 120}
INFO(xCoords1, 70 + (Diference * 3), 9850)
INFO(xCoords1, 70 + (Diference * 3 + 35), 9850)
INFO(xCoords1, 70 + (Diference * 3 + 20), 9850)
INFO(xCoords1, 55 + (Diference * 3), 40469)
INFO(xCoords1, 120 + (Diference * 3), 40469)
INFO(xCoords2, 70 + (Diference * 3), 40470)    
INFO(xCoords2, 70 + (Diference * 3 + 30), 40470)    
INFO(xCoords2, 70 + (Diference * 3 + 35), 40470)    






local zerobotHudElements = {}

local function FUNCAOZEROBOT(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        local FUNCAOZEROBOTHUD = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 20 - 40, spriteID)
        table.insert(zerobotHudElements, {hud = FUNCAOZEROBOTHUD, originalX = x + HUD_MUDAR_X, originalY = y + HUD_MUDAR_Y + 20 - 40})
    end
end

local xCoords3 = {-10, 135}
local xCoords2 = {- 10, 65, 135}
local xCoords1 = {5, 35, 65, 95, 120}
FUNCAOZEROBOT(xCoords1, 270, 4598)
FUNCAOZEROBOT(xCoords1, 290, 9850)
FUNCAOZEROBOT(xCoords1, 320, 9850)
FUNCAOZEROBOT(xCoords1, 350, 9850)

FUNCAOZEROBOT(xCoords3, 270, 40470)
FUNCAOZEROBOT(xCoords2, 290, 40470)
FUNCAOZEROBOT(xCoords2, 320, 40470)
FUNCAOZEROBOT(xCoords2, 350, 40470)

FUNCAOZEROBOT(xCoords1, 255, 40469)
FUNCAOZEROBOT(xCoords1, 275, 40469)
FUNCAOZEROBOT(xCoords1, 305, 40469)
FUNCAOZEROBOT(xCoords1, 335, 40469)
FUNCAOZEROBOT(xCoords1, 365, 40469)

local zerobotfuncoes = HUD.new(60, 275 - 40, "Funcoes ZEROBOT"); zerobotfuncoes:setColor(255, 255, 255)

local function toggle_feature(func, ...)
    if func then
        func(...)
    else
    end
end

local function update_hud(hud, text, state_func)
    local current_state = state_func()
    hud:setText(text)
    hud:setColor(current_state and 0 or 255, current_state and 255 or 0, 0)  -- Verde se true, vermelho se false
end

local hudElements = {}

local elements = {
    {label = "HEALING", x = 25 + HUD_MUDAR_X, y = 280 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableHealing, state_func = Engine.isHealingEnabled},
    {label = "FRIEND", x = 130 - 30 + HUD_MUDAR_X, y = 280 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableHealFriend, state_func = Engine.isHealFriendEnabled},
    {label = "MAGIC", x = 125 - 30 + HUD_MUDAR_X, y = 310 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableMagicShooter, state_func = Engine.isMagicShooterEnabled},
    {label = "TARGET", x = 20 + HUD_MUDAR_X, y = 310 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableTargeting, state_func = Engine.isTargetingEnabled},
    {label = "EQUIP", x = 15 + HUD_MUDAR_X, y = 340 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableEquipment, state_func = Engine.isEquipmentEnabled},
    {label = "TIMER", x = 125 - 30 + HUD_MUDAR_X, y = 340 + HUD_MUDAR_Y + 20 - 40, toggle_func = Engine.enableTimer, state_func = Engine.isTimerEnabled}
}

local function create_hud_elements()
    for _, element in ipairs(elements) do
        local hudText = HUD.new(element.x, element.y, element.label)
        hudText:setColor(255, 0, 0)  -- Inicialmente vermelho

        -- Atualiza o estado do HUD ao ser criado
        update_hud(hudText, element.label, element.state_func)
        
        hudText:setCallback(function()
            toggle_feature(element.toggle_func, not element.state_func())
            update_hud(hudText, element.label, element.state_func)
        end)

        element.hudText = hudText
        table.insert(hudElements, {hud = hudText, originalX = element.x, originalY = element.y})

    end
end

Timer("handle", function()
    for _, element in ipairs(elements) do
        update_hud(element.hudText, element.label, element.state_func)
    end
end, 100)


create_hud_elements()








  

--
local CAVEBOT_ICON_X               = 35
local CAVEBOT_ICON_Y               = 50
local CAVEBOT_STATUS_X             = 1100
local CAVEBOT_STATUS_Y             = 500
local KkkXsKiWAQ = KdshnadsaSADKL





local hudAlternarCoordenadas = HUD.new(CAVEBOT_ICON_X + HUD_MUDAR_X, CAVEBOT_ICON_Y + 80 + HUD_MUDAR_Y, "REFILANDO:"); hudAlternarCoordenadas:setColor(255, 255, 255)
local hudAlternarCoordenadastext = HUD.new(CAVEBOT_ICON_X + 55 + HUD_MUDAR_X, CAVEBOT_ICON_Y + 80 + HUD_MUDAR_Y, "-"); hudAlternarCoordenadastext:setColor(255, 0, 0)

local function alternarCoordenadas()
    if coordenadasAtivas then
        KkkXsKiWAQ = DJOISAoismaD2
        coordenadasAtivas = false
        hudAlternarCoordenadastext:setColor(0, 255, 0) 
        hudAlternarCoordenadastext:setText("ON")
        bKSTeHCRkd = 1 
    else
        KkkXsKiWAQ = KdshnadsaSADKL
        coordenadasAtivas = true
        hudAlternarCoordenadastext:setColor(255, 0, 0) 
        hudAlternarCoordenadastext:setText("OFF")
    end
end



local zerarcount = 0
local KSAlASKsa = MONSTER_COUNT_AREA

local function alternarContagemMonstros()
    if MONSTER_COUNT_AREA == KSAlASKsa then
        MONSTER_COUNT_AREA = zerarcount
    else
        MONSTER_COUNT_AREA = MONSTER_COUNT_AREA_REFIL
    end
end

alternarCoordenadas()

hudAlternarCoordenadas:setCallback(function() 
    alternarCoordenadas()
    alternarContagemMonstros()
end)

hudAlternarCoordenadastext:setCallback(function() 
    alternarCoordenadas()
    alternarContagemMonstros()
end)




local FcCAtJCtkU = HUD(CAVEBOT_ICON_X + 25 + HUD_MUDAR_X, CAVEBOT_ICON_Y + 195 + HUD_MUDAR_Y - 40, "")
FcCAtJCtkU:setColor(255, 255, 255)

function TvpqfBPOgs(status, index, waypointsCount, monsterCunt, monsterToStop)
  FcCAtJCtkU:setText(
    "Funcao: " .. tostring(status) .. "\n" ..
    "Passo: " .. index .. " / " .. waypointsCount .. "\n" ..
    "Monstros: " .. monsterCunt .. "\n" ..
    "Qtd BOX: " .. monsterToStop
  )
end


local JDLVXexYuC = {
  STAND = "STAND",
  NODE = "NODE",
  MOVE = "MOVE",
  LADDER = "LADDER",
  USE_LEVER = "USE_LEVER",
  OPEN_DOOR = "OPEN_DOOR",
  TARGET = "TARGET",
  TALK = "TALK"
}

local YGINBNZXEE = {
  [JDLVXexYuC.TARGET] = "Ligando/Desligando Target",
  [JDLVXexYuC.TALK] = "Talk NPC",
  LADDER = "Walk",
  WALKING = "Walk",
  CAITING_BOX = "Cait BOX",
  KILLING_BOX = "Kill Box",
  KITING = "Cainting",
  WAITING = "Wait mana",
  WAITING_PK = "Wait PK",
  DEPOSIT_ITENS = "Guardando",
  STUCK = "Anti Stuck",
  RUN_AWAY_FROM_MONSTERS = "Fugindo",
  [JDLVXexYuC.USE_LEVER] = "Click in",
}



local timerInterval = 5000  -- Intervalo do timer em milissegundos (por exemplo, 5 segundos)
local lastbKSTeHCRkd = nil  -- Variável para armazenar o valor anterior de bKSTeHCRkd
local RESET_TIMER_CAVEBOT = RESET_CAVEBOT
local lastPositionTime = os.time()  -- Variável para rastrear o tempo da última posição do jogador
local inCaitBox = false  -- Variável para rastrear se estamos na condição CAIT BOX



-- Função para atualizar lastbKSTeHCRkd e verificar a posição
local function updateLastbKSTeHCRkd()
    -- Verifica se o índice de RESET_CAVEBOT é maior que 1
    if currentResetIndex > 1 and GoCHSgNMOi then
        if bKSTeHCRkd == lastbKSTeHCRkd then
            -- Não mudou de posição, verifica o tempo desde a última posição
            local currentTime = os.time()
            local timeSinceLastPosition = currentTime - lastPositionTime

            if timeSinceLastPosition >= RESET_CAVEBOT[currentResetIndex] then
                -- Se bKSTeHCRkd for menor que 4, define como 1
                if bKSTeHCRkd < 4 then
                    bKSTeHCRkd = 1
                else
                    -- Caso contrário, reduz bKSTeHCRkd em 3
                    bKSTeHCRkd = bKSTeHCRkd - 3
                end
                
                -- Exibe a mensagem e reseta o tempo
                Client.showMessage("Personagem parado por " .. RESET_CAVEBOT[currentResetIndex] .. " segundos: <font color='#f77802'> Ativando RollBack. </font>")
                
                -- Reseta o tempo da última posição apenas quando não há movimento
                lastPositionTime = os.time()
            end
        else
            -- Se o personagem mudou de posição, atualize o tempo da última posição
            lastPositionTime = os.time()
        end
        
        -- Atualiza lastbKSTeHCRkd com o valor atual de bKSTeHCRkd
        lastbKSTeHCRkd = bKSTeHCRkd
    end
    
    -- Verificação dos valores ao final da função
end




-- Função para iniciar o timer
local function startUpdateTimer()
    -- Verifica se RESET_CAVEBOT[currentResetIndex] é 2 ou maior antes de iniciar o timer
    if RESET_CAVEBOT[currentResetIndex] >= 2 and GoCHSgNMOi then
        if updateTimer then
            updateTimer:stop()
        end

        updateTimer = Timer.new("updateTimer", updateLastbKSTeHCRkd, timerInterval)
        updateTimer:start()
    else
        -- Opcional: Adicione um log ou uma mensagem se desejar saber quando o índice não atende a condição
    end
end

startUpdateTimer()

-- Função para verificar a atividade do jogador
local function checkPlayerActivity()
    -- Verifica se RESET_CAVEBOT[currentResetIndex] é 2 ou maior antes de verificar a atividade do jogador
    if RESET_CAVEBOT[currentResetIndex] >= 2 then
        if GoCHSgNMOi then
            if inCaitBox then
                return
            end

            -- Chama a função updateLastbKSTeHCRkd para verificar a atividade do jogador
            updateLastbKSTeHCRkd()
        end
    else
        -- Opcional: Adicione um log ou uma mensagem se desejar saber quando o índice não atende a condição
    end
end

-- Exemplo de como chamar checkPlayerActivity
checkPlayerActivity()






local function DepositAndTransfer()
    Game.talk("hi", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("deposit all", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("balance", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(2000)
end

-- Função para extrair o saldo da mensagem do NPC
local function extractBalance(message)
    local searchString = "Your account balance is "
    local balanceIndex = string.find(message, searchString)
    if balanceIndex then
        local start = balanceIndex + string.len(searchString)
        local finish = string.find(message, " gold", start)
        if finish then
            local balance = string.sub(message, start, finish)
            return tonumber(balance)
        end
    end
    return nil
end

-- Função chamada quando o evento TALK é disparado
function onTalk(authorName, authorLevel, type, x, y, z, text)
    local balance = extractBalance(text)
    
    if balance then
        if TransferAfterDeposit and balance > ManterBalance then
            local transferAmount = balance - ManterBalance
            
            Game.talk("transfer", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
            wait(2000)
            Game.talk(tostring(transferAmount), Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
            wait(2000)
            Game.talk(NameTransfer, Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
            wait(2000)
            Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
            wait(5000)
            Client.showMessage("Voce transferiu <font color='#f77802'>" .. transferAmount .. "</font> golds para <font color='#f77802'>" .. NameTransfer .. "</font>.")
        else
        end
    else
    end
end

Game.registerEvent(Game.Events.TALK, onTalk)

local dustsMaximum = Player.getDustsMaximum()
local dusts = Player.getDusts()
local requiredDusts = dustsMaximum - 75
local TimerCheckForge = nil  -- Inicialize com nil
local convertendoforge = false

function esc()
    Client.sendHotkey(16777216, 0)
end
function enter()
    Client.sendHotkey(16777220, 0)
end

-- Função que fará a verificação do limite de dusts
local function checkForgeLimit()
    local dustsMaximum, dusts, requiredDusts
    
    repeat
        -- Atualiza as variáveis de dusts
        dustsMaximum = Player.getDustsMaximum()
        dusts = Player.getDusts()
        requiredDusts = dustsMaximum - 75

        if ConvertForge == 1 then
            if dusts >= requiredDusts then
                wait(500)  -- Aguarda meio segundo
                Game.forgeIncreaseLimit()  -- Aumenta o limite de dusts
                dusts = Player.getDusts()  -- Atualiza os dusts após a ação
            else
                esc()  -- Fecha a janela se não há dusts suficientes
                break  -- Sai do loop
            end
        elseif ConvertForge == 2 then
            if dusts >= 60 then
                wait(500)  -- Aguarda meio segundo
                Game.forgeConvertDust()  -- Converte os dusts
                dusts = Player.getDusts()  -- Atualiza os dusts após a conversão
            else
                esc()  -- Fecha a janela se não há dusts suficientes
                break  -- Sai do loop
            end
        else
            -- Caso ConvertForge não seja nem 1 nem 2, encerra o loop
            break
        end

        -- Aguarda 1 segundo antes de verificar novamente
        wait(1000)
        
    until false  -- Mantém o loop até que `break` seja acionado
end


local ForgeID = 37128
local PORTAS_IDS = {1628, 1629, 1631, 1632, 1638, 1640, 1642, 1644, 1650, 1651, 1653, 1654, 1656, 1658, 1660, 1662, 1668, 1669, 1671, 1672, 1674, 1676, 1682, 1683, 1685, 1689, 1691 ,1692, 1694, 1698, 4912, 4913, 5006, 5007, 5082, 5084, 5097, 5098, 5100, 5104, 5106, 5107, 5109, 5113, 5115, 5116, 5118, 5122, 5124, 5125, 5127, 5131, 5133, 5134, 5136, 5137, 5139, 5140, 5142, 5143, 5277, 5278, 5280, 5281, 5283, 5285, 5287, 5289, 5514, 5516, 5232, 5733, 5735, 5736, 5745, 5749, 6191, 6292, 6194, 6195, 6197, 6199, 6201, 6203, 6248, 6249, 6251, 6252, 6254, 6256, 6258, 6260, 6891, 6892, 6894, 6898, 6900, 6901, 6903, 6907, 7033, 7034, 7036, 7040, 7042, 4043, 7045, 7049, 7054, 7056, 7711, 7712, 7714, 7715, 7717, 7719, 7721, 7723, 7868, 7941, 8249, 8250, 8252, 8253, 8255, 8257, 8259, 8261, 8351, 8352, 8353, 8354, 8355, 8357, 8359, 8361, 8363, 9351, 9352, 9354, 9355, 9357, 9359, 9361, 9363, 9551, 9552, 9554, 9558, 9560, 9561, 9563, 9567, 9858, 9859, 9865, 9867, 9868, 9874, 10520, 10521, 11136, 11137, 11141, 11143, 11144, 11148, 11232, 11233, 11239, 11241, 11242, 11248, 11705, 11714, 12033, 12035, 12249, 13135, 13136, 13142, 13143, 15687, 15890, 15892, 17560, 17561, 17563, 17567, 17569, 17570, 17572, 17576, 17700, 17701, 17703, 17707, 17709, 17710, 17712, 17716, 17993, 17994, 17996, 18000, 18002, 18003, 18005, 18009, 20443, 20444, 20446, 20450, 20452, 20453, 20455, 20459, 21970, 22506, 22508, 23873, 23874, 23875, 23876, 24541, 24543, 24903, 28364, 28365, 28366, 28367, 28519, 28658, 28659, 29327, 29987, 30772, 30773, 30774, 30775, 30833, 30834, 30835, 30836, 31494, 31495, 31568, 31570, 31663, 31665, 33271, 33273, 33335, 33336, 33632, 33633, 33634, 33635, 33767, 34221, 34223, 37981, 37982, 37983, 37984, 38851, 39351, 39352, 39660, 396610}


function clickForge(x, y, z)
    local things = Map.getThings(x, y, z)

    for _, thing in ipairs(things) do
        if thing.id == ForgeID then
            Game.useItemFromGround(x, y, z, ForgeID)
            return true  -- Retorna true se a forja foi aberta
        end
    end
    return false  -- Retorna false se a forja não foi encontrada
end


function Player.getDustsMaximum()
    local maxDusts = playerGetDustsMaximum()
    return maxDusts
end

function Player.getDusts()
    local dusts = playerGetDusts()
    return dusts
end

function findAndClickForge()
    -- Obtenha a posição da câmera (ou do jogador)
    local cameraPos = Map.getCameraPosition()
    local x, y, z = cameraPos.x, cameraPos.y, cameraPos.z

    local forgeOpened = false  -- Variável para rastrear se a forja foi aberta

    -- Verifique a posição atual e os tiles ao redor
    for dx = -1, 1 do
        for dy = -1, 1 do
            local tileX = x + dx
            local tileY = y + dy
            
            -- Função para clicar na forja
            if clickForge(tileX, tileY, z) then
                forgeOpened = true  -- Define como verdadeiro se a forja for aberta
                break  -- Sai do loop se a forja for aberta
            end
        end
        if forgeOpened then break end  -- Sai do loop externo se a forja for aberta
    end

    if not forgeOpened then
        Client.showMessage("Forja nao encontrada.")
        return  -- Sai da função se a forja não foi encontrada
    end

    -- Obtenha a quantidade máxima e atual de dusts do jogador
    local dustsMaximum = Player.getDustsMaximum()
    local dusts = Player.getDusts()
    local requiredDusts = dustsMaximum - 75

    if ConvertForge == 0 then
        Client.showMessage("Funcao Forja esta desligada")
        esc()  -- Fecha a janela se a forja está desligada
        return
    end

    -- Verifique se há dusts suficientes para proceder com ConvertForge == 1
    if ConvertForge == 1 and dusts >= requiredDusts then
        -- Após clicar na forja, verifique o limite de dusts
        checkForgeLimit()
        
    -- Verifique se há dusts suficientes para proceder com ConvertForge == 2
    elseif ConvertForge == 2 and dusts >= 60 then
        -- Após clicar na forja, verifique o limite de dusts
        checkForgeLimit()
        
    else
        wait(1000)
        esc()  -- Fecha a janela se não houver dusts suficientes
        Client.showMessage("Nao tem dusts suficientes para Converter.")
    end
end

function switchEquip1()
    Engine.equipmentSwitchProfile(0)
    Client.showMessage("Equipment: <font color='#f77802'> Profile 1 Ativado </font>")
end

function switchEquip2()
    Engine.equipmentSwitchProfile(1)
    Client.showMessage("Equipment: <font color='#f77802'> Profile 2 Ativado </font>")
end

function switchMagic1()
    Engine.magicShooterSwitchProfile(0)
    Client.showMessage("MagicShooter: <font color='#f77802'> Profile 1 Ativado </font>")
end

function switchMagic2()
    Engine.magicShooterSwitchProfile(1)
    Client.showMessage("MagicShooter: <font color='#f77802'> Profile 2 Ativado </font>")
end

local function checkPlayersInArea(area)
    local playerId = Player.getId()  -- Obtém o ID do jogador atual
    local _, playerCount = 0, 0      -- Inicializa as variáveis para contagem de jogadores

    -- Obtém a lista de criaturas e verifica se há jogadores
    local creatureIds = Map.getCreatureIds(true, false)
    for i = 1, #creatureIds do
        local creature = Creature(creatureIds[i])
        if creature:getType() == Enums.CreatureTypes.CREATURETYPE_PLAYER then
            if creature:getId() ~= playerId then  -- Ignora o próprio jogador
                local pos = creature:getPosition()
                if ibZPcQQDrE(area, area, pos, Map.getCameraPosition()) then
                    playerCount = playerCount + 1  -- Conta outros jogadores na área
                end
            end
        end
    end
    return playerCount > 0  -- Retorna true se houver outros jogadores na área
end

local playerIsDead = false  -- Variável para indicar se o jogador morreu

-- Função para capturar o evento de mensagens e verificar se o jogador morreu
function onTextEvent(messageData)
    -- Verifica se a mensagem é "You are dead."
    if messageData.text and messageData.text == "You are dead." then
        playerIsDead = true  -- Marca que o jogador morreu
    end
end

-- Registra a função onTextEvent para o evento de mensagens de texto
Game.registerEvent(Game.Events.TEXT_MESSAGE, onTextEvent)

function handleReturnHunt()
    print("You are dead: Aguardando reconnect...")
    wait(3000)
    enter()

    -- Loop de espera até que a vida do jogador esteja em 50%
    repeat
        wait(1000)  -- Espera 1 segundo antes de checar novamente
    until Player.getHealthPercent() >= 50  -- Espera até a vida estar em 50%
    print("You are dead: Jogador Reconectado")
    Client.showMessage("Jogador Morreu: Ativando <font color='#f77802'>Return Hunt (!bless)</font>.")

    wait(3000)  -- Aguardar 3 segundos

    -- Verifica se as coordenadas estão ativas e altera conforme necessário
    gameTalk("!bless", 12)  -- Comando para usar bless após a morte
    playerIsDead = false  -- Reseta o estado de morte para evitar repetições desnecessárias

    return 0, 0  -- Retorna 0s quando o jogador reconectar
end

local lootedPositions = {}  -- Tabela para armazenar coordenadas saqueadas
local AutoLootBOX = false  -- Inicia como false até ser definido como Timer

-- Função para converter coordenadas em uma string única
local function getCoordinateKey(x, y, z)
    return x .. "," .. y .. "," .. z
end

local timerInterval = 400  -- Intervalo em milissegundos

-- Função para resetar as posições saqueadas
local function resetLootedPositions()
    lootedPositions = {}
end

-- Função para executar o saque e verificar se deve parar o timer
function lootAndCheck()
    if not AUTOLOOT then
        return
    end

    local lootedAny = lootNearbyCorpses()
    if not lootedAny and AutoLootBOX then
        AutoLootBOX:stop()
        resetLootedPositions()
    end
end

function lootNearbyCorpses()
    local lootedAny = false  -- Variável para rastrear se algum saque ocorreu
    local foundLoot = false  -- Variável para sinalizar se encontrou um corpo para saquear

    if not AutoLootBOX then
        AutoLootBOX = Timer.new("lootTimer", lootAndCheck, timerInterval)
        AutoLootBOX:start()
    end

    local playerPosition = Map.getCameraPosition()
    local characterX, characterY, characterZ = playerPosition.x, playerPosition.y, playerPosition.z

    local searchRange = 1  -- Ajustado para 5 de alcance

    for offsetX = -searchRange, searchRange do
        for offsetY = -searchRange, searchRange do
            local targetX = characterX + offsetX
            local targetY = characterY + offsetY
            local coordinateKey = getCoordinateKey(targetX, targetY, characterZ)

            -- Verifica se a posição já foi saqueada
            if not lootedPositions[coordinateKey] then
                if Map.canWalk(targetX, targetY, characterZ, false, false, true) then
                    local success = Game.lootCorpse(targetX, targetY, characterZ)

                    if success then
                        -- Marca a posição como saqueada
                        lootedPositions[coordinateKey] = true
                        lootedAny = true  -- Marca que um saque ocorreu
                        foundLoot = true  -- Sinaliza que encontrou um corpo para saquear
                    end
                end
            end
        end
    end

    -- Se encontrou um corpo para saquear, interrompe o temporizador e reseta as posições saqueadas
    if foundLoot then
        AutoLootBOX:stop()
        resetLootedPositions()
    end

    return lootedAny  -- Retorna se algum saque ocorreu
end


function FtcNZdGleb()
    if not GoCHSgNMOi then return end
    local OEIZVpqVzN = KkkXsKiWAQ[bKSTeHCRkd]
    local ZVPuQtuoZo = Map.getCameraPosition()

        -- Verifica se OEIZVpqVzN é nil
    if OEIZVpqVzN == nil then
        Client.showMessage("Nao ha coordenada para seguir")
        return  -- Sai da função se não houver coordenadas
    end

    if currentLatenciaIndex and currentLatenciaIndex == 2 then
        local latencia = Client.getLatency()
        local monsterCount = GwmhhKprUn(MONSTER_COUNT_AREA)

        if latencia > LATENCIA_STOP[currentLatenciaIndex] and monsterCount == 0 then
            Client.showMessage("Cavebot Pausado: <font color='#f77802'>Larencia Alta</font> sem <font color='#f77802'>Criaturas Proximas</font>")
            return  -- Pausa o cavebot se a latência estiver alta e não houver monstros
        end
    end

    if OEIZVpqVzN.label == "CHECK SUPPLIES" then
        if REFIL_AUTOMATICO then
                GeJAZqZqqM(CAP_TO_REFIL)
                checkSuppliesBelowLimit()

            end
        else
            checkSuppliesBelowLimit()
        end
  

    local CECzfBdxsS = GwmhhKprUn(MONSTER_COUNT_AREA)

    if bKSTeHCRkd == 1 then
        bKSTeHCRkd = CsSeTWvRwq(ZVPuQtuoZo, bKSTeHCRkd, KkkXsKiWAQ)
    end

    local mJHcjoFXOL = OEIZVpqVzN.type == JDLVXexYuC.STAND or OEIZVpqVzN.type == JDLVXexYuC.NODE
    local McLUDEvwkX = JEsBMjvgMx(CECzfBdxsS, OEIZVpqVzN.wait, MAX_STEP_DELAY)
    local ZHJMSitMqY = CECzfBdxsS > 0

    if OEIZVpqVzN.label == "EQUIP 1" then
        switchEquip1()
    end

    if OEIZVpqVzN.label == "EQUIP 2" then
        switchEquip2()
    end

    if OEIZVpqVzN.label == "MAGIC 1" then
        switchMagic1()
    end

    if OEIZVpqVzN.label == "MAGIC 2" then
        switchMagic2()
    end

    if playerIsDead and ReturnHuntAfterDead then
        handleReturnHunt()  
        if coordenadasAtivas then
            alternarCoordenadas()
            alternarContagemMonstros()
            bKSTeHCRkd = 1  -- Define bKSTeHCRkd como 1 se as coordenadas forem alteradas
        end
    end

    function nGGpsvLxDb(status)
        TvpqfBPOgs(status, bKSTeHCRkd, #KkkXsKiWAQ, CECzfBdxsS, MAX_MONSTER_STOP)
    end

    if mJHcjoFXOL and not ZHJMSitMqY then
        oUnnNDDDqA = YGINBNZXEE.WALKING
    end

    local qNRmuXPrMt = 0

    if qNRmuXPrMt > 0 and os.time() - qNRmuXPrMt >= 10 then
        oUnnNDDDqA = YGINBNZXEE.STUCK
        qNRmuXPrMt = 0
        bKSTeHCRkd = 1
    end

    nGGpsvLxDb(oUnnNDDDqA)

    if RUN_LOST_MONSTER_COUNT > 0 and CECzfBdxsS >= RUN_LOST_MONSTER_COUNT then
        oUnnNDDDqA = YGINBNZXEE.RUN_AWAY_FROM_MONSTERS
        bKSTeHCRkd = xCYTtINnaU(bKSTeHCRkd, KkkXsKiWAQ)
        local IunTrbGgft = KkkXsKiWAQ[bKSTeHCRkd]
        ukEPyaWbpB(IunTrbGgft)
        wait(OEIZVpqVzN.wait)
        nGGpsvLxDb(oUnnNDDDqA)
        return
    end

    wait(OEIZVpqVzN.wait)

    if mJHcjoFXOL then
        if CECzfBdxsS <= MIN_MONSTER_RESUME and AHozyIEnlQ and AUTOLOOT then
            lootAndCheck()
            AHozyIEnlQ = false
            oUnnNDDDqA = YGINBNZXEE.WALKING
        end
            
        if CECzfBdxsS <= MIN_MONSTER_RESUME and AHozyIEnlQ and not AUTOLOOT then
            AHozyIEnlQ = false
            oUnnNDDDqA = YGINBNZXEE.WALKING
        end

        if CECzfBdxsS <= MAX_MONSTER_STOP and not AHozyIEnlQ then
            ukEPyaWbpB(OEIZVpqVzN)
            wait(McLUDEvwkX)
            if ZHJMSitMqY then
                oUnnNDDDqA = YGINBNZXEE.KITING
            end
        else
            oUnnNDDDqA = YGINBNZXEE.KILLING_BOX
            nGGpsvLxDb(oUnnNDDDqA)
            AHozyIEnlQ = true
            qNRmuXPrMt = 0
            lastPositionTime = os.time()  
            return
        end
    end
    

    if OEIZVpqVzN.label == "BOX" and CECzfBdxsS > MIN_MONSTER_RESUME then
        if not inCaitBox then
            local hasPlayers = checkPlayersInArea(MONSTER_COUNT_AREA)
            if hasPlayers and AntiKS then  
                Client.showMessage("AntiKS Ativado: <font color='#f77802'> Player detectado </font> BOX Ignorada")
                bKSTeHCRkd = bKSTeHCRkd + 1 
                return 
            end
        end
    
        -- Se não houver jogadores ou se a BOX já estiver ativa, continuar a execução
        AHozyIEnlQ = true
        inCaitBox = true
        oUnnNDDDqA = YGINBNZXEE.KILLING_BOX
        nGGpsvLxDb(oUnnNDDDqA)

    
        CECzfBdxsS = GwmhhKprUn(MONSTER_COUNT_AREA)
    
        if inCaitBox then
            lastPositionTime = os.time()
        end
        
    end

    if OEIZVpqVzN.label == "CAIT BOX" and CECzfBdxsS > MIN_MONSTER_RESUME then
        AHozyIEnlQ = true
        inCaitBox = true
        oUnnNDDDqA = YGINBNZXEE.CAITING_BOX
        nGGpsvLxDb(oUnnNDDDqA)
        rotateAround(OEIZVpqVzN.x, OEIZVpqVzN.y, OEIZVpqVzN.z, CAITBOX_DISTANCE, 200)
    
        if inCaitBox then
            inCaitBox = false
            lastPositionTime = os.time()
        end
    end

    if sQaHgkGYXm(OEIZVpqVzN.type) then
        oUnnNDDDqA = YGINBNZXEE[OEIZVpqVzN.type]
        nGGpsvLxDb(oUnnNDDDqA)
        OEIZVpqVzN.action()
        while fENYYWrvFo == true do end
    end

    nGGpsvLxDb(oUnnNDDDqA)

    if OEIZVpqVzN.type == JDLVXexYuC.TARGET then
        oUnnNDDDqA = YGINBNZXEE[OEIZVpqVzN.type]
        nGGpsvLxDb(oUnnNDDDqA)
        OEIZVpqVzN.action()
        bKSTeHCRkd = xCYTtINnaU(bKSTeHCRkd, KkkXsKiWAQ)
        return
    end

    if OEIZVpqVzN.type == JDLVXexYuC.MOVE then
        Game.walk(OEIZVpqVzN.direction)
        bKSTeHCRkd = xCYTtINnaU(bKSTeHCRkd, KkkXsKiWAQ)
        return
    end

    if tWLotQIWdI(ZVPuQtuoZo, OEIZVpqVzN) or CrLAKLIrTZ(ZVPuQtuoZo, OEIZVpqVzN) then
        bKSTeHCRkd = xCYTtINnaU(bKSTeHCRkd, KkkXsKiWAQ)
        qNRmuXPrMt = 0
    end

    if qNRmuXPrMt == 0 then qNRmuXPrMt = os.time() end

    if OEIZVpqVzN.label == 'REFIL FINALIZADO' then
        if DISABLE_TO_REFILL then
            Engine.enableEquipment(true)
            Engine.enableTargeting(true)
            Engine.enableMagicShooter(true)
            Client.showMessage("Target Ligado: <font color='#f77802'>HUNT Iniciada</font>")

        end
        alternarCoordenadas()
        alternarContagemMonstros()
       
    end

    if OEIZVpqVzN.label == "CHECK PK" then
        oUnnNDDDqA = YGINBNZXEE.WAITING_PK
        nGGpsvLxDb(oUnnNDDDqA)
        local waitingForPK = true

        repeat
            wait(1000)
            waitingForPK = Player.getState(13)
        until not waitingForPK

        if not inCaitBox then
            lastPositionTime = os.time()
        end
    end

    if OEIZVpqVzN.label == "Deposit All" then
        DepositAndTransfer()  
    end

    local manaatual = Player.getManaPercent()

    if manaatual <= STOP_WITH_MANA then
        local waitingMana = true
        oUnnNDDDqA = YGINBNZXEE.WAITING
        nGGpsvLxDb(oUnnNDDDqA)

        repeat
            wait(1000)
            manaatual = Player.getManaPercent()  -- Atualiza a mana a cada iteração
            if manaatual >= RESUME_WITH_MANA then
                lastPositionTime = os.time()
                waitingMana = false  -- Interrompe o loop
            end
        until not waitingMana
    end

    if OEIZVpqVzN.label == "DEPOSIT ITEM" then
        oUnnNDDDqA = YGINBNZXEE.DEPOSIT_ITENS
        nGGpsvLxDb(oUnnNDDDqA)
        inCaitBox = true
            DepositDP() 

        else

        if inCaitBox then
            inCaitBox = false
            lastPositionTime = os.time()
        end
    end
   
    checkPlayerActivity()
end


local timers = {}

function rotateAround(x, y, z, maxDistance, delay)
    local originalPos = {x = x, y = y, z = z}
    local angle = 0  -- Ângulo inicial

    -- Função que será chamada pelo timer
    local function rotateStep()
        if not GoCHSgNMOi then
            -- Parar o timer se GoCHSgNMOi for false
            if timers["rotateTimer"] then
                timers["rotateTimer"]:stop()
                timers["rotateTimer"] = nil
            end
            return
        end

        -- Calcular posição ao redor da originalPos com base no ângulo
        local offsetX = maxDistance * math.cos(angle)
        local offsetY = maxDistance * math.sin(angle)
        
        -- Calcular a posição para onde o personagem deve ir
        local goToX = originalPos.x + offsetX
        local goToY = originalPos.y + offsetY
        
        -- Mover o personagem para a posição calculada
        Map.goTo(goToX, goToY, originalPos.z)
        
        -- Atualizar o ângulo para a próxima iteração
        angle = angle + math.rad(10)  -- Incremento de ângulo (10 graus)
        
        -- Verificar a contagem de monstros
        local CECzfBdxsS = GwmhhKprUn(MONSTER_COUNT_AREA)
        if CECzfBdxsS <= MIN_MONSTER_RESUME then
            -- Parar o timer se a contagem de monstros for menor ou igual ao limite
            if timers["rotateTimer"] then
                timers["rotateTimer"]:stop()
                timers["rotateTimer"] = nil
            end
        end
    end

    -- Criar e iniciar o timer
    if timers["rotateTimer"] then
        timers["rotateTimer"]:stop()
    end
    timers["rotateTimer"] = Timer.new("rotateTimer", rotateStep, delay)
end





local yvijwUAUqW = HUD(CAVEBOT_ICON_X - 5 + HUD_MUDAR_X, CAVEBOT_ICON_Y + 40 + HUD_MUDAR_Y, "HUNTING:"); yvijwUAUqW:setColor(255, 255, 255)
yvijwUAUqW:setCallback(function()
  GoCHSgNMOi = not GoCHSgNMOi
end)

local HkjWSkAhab = HUD(CAVEBOT_ICON_X + 50 + HUD_MUDAR_X, CAVEBOT_ICON_Y + 40 + HUD_MUDAR_Y, "ON")

HkjWSkAhab:setCallback(function()
  GoCHSgNMOi = not GoCHSgNMOi
end)
HkjWSkAhab:setColor(255, 0, 0)

local INFORMACAO = HUD.new(HUD_MUDAR_X + 60, HUD_MUDAR_Y + 215 - 40, "" ); INFORMACAO:setColor(255, 255, 255)
local INFORMACAO2 = HUD.new(HUD_MUDAR_X + 60, HUD_MUDAR_Y + 230 - 40, "" ); INFORMACAO2:setColor(255, 255, 255)


local dYdYbFRyPA = Timer("Cavebot", FtcNZdGleb)
Timer("GoCHSgNMOi", function()
  if not GoCHSgNMOi then
    HkjWSkAhab:setText("OFF")
    HkjWSkAhab:setColor(255, 0, 0)
    INFORMACAO:setText("Inicie o Script para")
    INFORMACAO2:setText("exibir Informacoes")
    if dYdYbFRyPA:isActive() then
      dYdYbFRyPA:stop()
      FcCAtJCtkU:setText("")
      if not tzGpVMQVZS then
        bKSTeHCRkd = 1
      end
    end
    return
  end

  HkjWSkAhab:setText("ON")
  HkjWSkAhab:setColor(0, 255, 0)
  INFORMACAO:setText("")
  INFORMACAO2:setText("")

  if not dYdYbFRyPA:isActive() then
    dYdYbFRyPA:start()
  end
end, 100)

function rMlZMIaHtx(osWrnGjxrz)
  local aWmDtpoqae = Map.getTiles()
  if #aWmDtpoqae > 0 then
    for i = 1, #aWmDtpoqae do
      local qOWQslVpaB = aWmDtpoqae[i]
      if #qOWQslVpaB.things > 0 then
        for j = 1, #qOWQslVpaB.things do
          local ElDdBVmnBp = qOWQslVpaB.things[j]
          if ElDdBVmnBp.id and osWrnGjxrz[ElDdBVmnBp.id] then
            return qOWQslVpaB.pos
          end
        end
      end
    end
  end

  return nil
end


function tWLotQIWdI(IunTrbGgft, destination)
  local hNfpysGlSQ = math.abs(destination.x - IunTrbGgft.x)
  local alPAufGviw = math.abs(destination.y - IunTrbGgft.y)

  return hNfpysGlSQ <= 1 and alPAufGviw <= 1
end

function CrLAKLIrTZ(player, goal)
  return player.x == goal.x and player.y == goal.y
      and player.z == goal.z
end

function xCYTtINnaU(currentIndex, waypoints)
  if currentIndex == #waypoints then
    return 1
  else
    return bKSTeHCRkd + 1
  end
end

function ibZPcQQDrE(x, y, xRbLxIDktj, player)
  return math.abs(player.x - xRbLxIDktj.x) <= x and math.abs(player.y - xRbLxIDktj.y) <= y
end





function GwmhhKprUn(area, countPlayers)
    local x, y = area, area

    local loTpuuYxkM = 0
    local RkFTUIqenW = 0
    if Player.getState(Enums.States.STATE_PIGEON) then
        return loTpuuYxkM, RkFTUIqenW
    end

    local XYwGxWKVZO = Map.getCreatureIds(true, false)

    -- Verifica se a lista de criaturas é nil
    if not XYwGxWKVZO then
        local playerId = Player.getId()  
        print("Jogador desconectado: Aguardando...")

        repeat
            wait(1000)  -- Espera 1 segundo antes de checar novamente
            XYwGxWKVZO = Map.getCreatureIds(true, false)  -- Tenta obter novamente a lista de criaturas
        until XYwGxWKVZO  -- Continua até que a lista de criaturas não seja mais nil

        print("Jogador reconectado.")
        return 0, 0  -- Retorna 0s quando o jogador reconectar
    end

    local RhiXZRiCvv = Map.getCameraPosition()
    if RhiXZRiCvv then
        for i = 1, #XYwGxWKVZO do
            local xRbLxIDktj = Creature(XYwGxWKVZO[i])
            local creatureName = xRbLxIDktj:getName()  -- Mantém o nome da criatura sem transformá-lo
    
            -- Verifica se a criatura está na lista de ignoradas
            local ignore = false
            for _, ignoreName in ipairs(IgnoreCreatureList) do
                if creatureName == ignoreName then  -- Comparação direta sem transformação
                    ignore = true
                    break
                end
            end

            -- Se a criatura não estiver na lista de ignoradas, continua o processamento
            if not ignore then
                local sDZbdqMSHB = xRbLxIDktj:getType()
                if sDZbdqMSHB == Enums.CreatureTypes.CREATURETYPE_MONSTER then
                    local nGIiDEcGzT = xRbLxIDktj:getPosition()
                    
                    -- Verifica se a posição da criatura é válida (não nil)
                    if nGIiDEcGzT and nGIiDEcGzT.x and ibZPcQQDrE(x, y, nGIiDEcGzT, RhiXZRiCvv) then
                        loTpuuYxkM = loTpuuYxkM + 1
                    end
                end
                if countPlayers and sDZbdqMSHB == Enums.CreatureTypes.CREATURETYPE_PLAYER then
                    local nGIiDEcGzT = xRbLxIDktj:getPosition()

                    -- Verifica se a posição da criatura é válida (não nil)
                    if nGIiDEcGzT and nGIiDEcGzT.x and ibZPcQQDrE(x, y, nGIiDEcGzT, RhiXZRiCvv) then
                        RkFTUIqenW = RkFTUIqenW + 1
                    end
                end
            end
        end
    end
    return loTpuuYxkM, RkFTUIqenW
end



function JEsBMjvgMx(CECzfBdxsS, stepDelay, maxDelay)
  local YHwnoHxJPA = CECzfBdxsS * stepDelay

  if YHwnoHxJPA > MAX_STEP_DELAY then
    return MAX_STEP_DELAY
  end

  return YHwnoHxJPA
end

function sQaHgkGYXm(type)
  return type == JDLVXexYuC.LADDER or
      type == JDLVXexYuC.USE_LEVER or type == JDLVXexYuC.OPEN_DOOR or type == JDLVXexYuC.TALK
end

function CsSeTWvRwq(player, currentIndex, waypoints)
  if not ruJCGqbhOk(player, waypoints[currentIndex]) then
    for i = 1, #waypoints do
      if ruJCGqbhOk(player, waypoints[i]) then
        return i
      end
    end
  end

  return currentIndex
end

function ruJCGqbhOk(pos, nextPos)
  local x = math.abs(pos.x - nextPos.x)
  local y = math.abs(pos.y - nextPos.y)

  for i = 1, 7 do
    for j = 1, 5 do
      if x <= i and y <= j and pos.z == nextPos.z then
        return true
      end
    end
  end

  return false
end

function ukEPyaWbpB(pos)
  Map.goTo(pos.x, pos.y, pos.z)
end

	


function GeJAZqZqqM(minCap)
    local refilNecessario = false

    if CAP_TO_REFIL > 0 then  -- Verifica se o refil por CAP está ativado
        local PbqxVhXvAI = Player.getCapacity()
        local qVwXbAfDvw = math.floor(PbqxVhXvAI * 0.01)
        
        if qVwXbAfDvw <= minCap then
            refilNecessario = true
            Client.showMessage("Refil ativado: Capacidade abaixo de <font color='#f77802'>" .. CAP_TO_REFIL .. "</font>.")


        end
    end

    if checkSuppliesBelowLimit() or AreSuppliesBelowLimit() then
        refilNecessario = true
    end

    if refilNecessario and coordenadasAtivas then
        
        alternarCoordenadas()
        alternarContagemMonstros()
    end
end



function checkSuppliesBelowLimit()
    local OEIZVpqVzN = KkkXsKiWAQ[bKSTeHCRkd] -- Obtém a coordenada atual

    if OEIZVpqVzN.label == "CHECK SUPPLIES" then
        local vocacao = VerificarVocacaoDoPlayer()
        
        if not vocacao then
            return false
        end
        
        local subList
        if vocacao == 1 then
            subList = items.knight
        elseif vocacao == 2 then
            subList = items.paladin
        elseif vocacao == 3 or vocacao == 4 then
            subList = items.mage
        else
            return false
        end

        for _, item in ipairs(subList) do
            if item.Amount > 0 and item.MinRefil > 0 then -- Verifica se o item tem uma quantidade e um limite mínimo de recarga
                local itemCount = Game.getItemCount(item.id)
                if itemCount <= item.MinRefil then
                    if DISABLE_TO_REFILL then
                        Engine.enableEquipment(false)
                        Engine.enableTargeting(false)
                        Engine.enableMagicShooter(false)
                    end
                    Client.showMessage("Refil Ativado: <font color='#f77802'>" .. item.name .. "</font> atingiu quantidade minima de <font color='#f77802'>" .. item.MinRefil .. " x </font>")
                    bKSTeHCRkd = 1
                    return true
                end
            end
        end
    end
    return false
end


function AreSuppliesBelowLimit()
    local currentCoordinate = KkkXsKiWAQ[bKSTeHCRkd] -- Obtém a coordenada atual

    if currentCoordinate.label == "CHECK SUPPLIES" then
        local vocacao = VerificarVocacaoDoPlayer()
        
        if not vocacao then
            return false
        end
        
        local subList
        if vocacao == 1 then
            subList = EnchantList.knight
        elseif vocacao == 2 then
            subList = EnchantList.paladin
        elseif vocacao == 3 or vocacao == 4 then
            subList = EnchantList.mage
        else
            return false
        end

        for _, enchant in ipairs(subList) do
            if enchant.amount then -- Verifica se 'amount' é verdadeiro
                local itemCount = Game.getItemCount(enchant.id)
                if itemCount > 0 then
                    if DISABLE_TO_REFILL then
                        Engine.enableEquipment(false)
                        Engine.enableTargeting(false)
                        Engine.enableMagicShooter(false)
                    end
                    Client.showMessage("Refil Ativado: <font color='#f77802'>" .. enchant.category .. "</font> Precisa ser encantado!")
                    return true
                end
            end
        end
    end
    return false
end





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
    for i=1,#DoNotSell do
        if DoNotSell[i] == itemID then
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


function AreEnchantsBelowLimit()
    local currentPos = KkkXsKiWAQ[currentPosition] -- Obtém a coordenada atual

    if currentPos.label == "CHECK ENCHANTS" then
        local vocacao = VerificarVocacaoDoPlayer() -- Obtém a vocação do jogador

        if not vocacao then
            return false
        end

        local enchantList
        if vocacao == 1 then
            enchantList = EnchantList.knight
        elseif vocacao == 2 then
            enchantList = EnchantList.paladin
        elseif vocacao == 3 or vocacao == 4 then
            enchantList = EnchantList.mage
        else
            return false
        end

        for _, enchant in ipairs(enchantList) do
            if enchant.amount then -- Verifica se 'amount' é verdadeiro
                local itemCount = Game.getItemCount(enchant.id)
                if itemCount > 0 then
                    return true
                end
            end
        end
    end
    return false
end



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

function EnchantItemsAndOpenTrade(enchant)
    local itemCount = Game.getItemCount(enchant.id)
    if itemCount == 0 or not enchant.amount then
        return
    end

    Game.talk("hi", 12)
    wait(Delay_Supplies)
    
    Game.talk("enchant", 12)
    wait(Delay_Supplies)
    
    Game.talk(enchant.category, 12)
    wait(Delay_Supplies)
    
    Game.talk("yes", 12)
    wait(Delay_Supplies)

    local newItemCount = Game.getItemCount(enchant.id)

    -- Se o item não existir no inventário, o encantamento foi bem-sucedido
    if newItemCount == 0 then
        Client.showMessage("Voce encantou: <font color='#f77802'>" .. enchant.category .. "</font>")
    else
        Client.showMessage("Voce nao tem <font color='#f77802'>Silver Token</font> para o Enchant.")
    end


end



function refillItemsAndOpenTrade(item)
    if item.Amount <= 0 then
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




function getEnchantByVocacao()
    local vocacao = VerificarVocacaoDoPlayer()

    if not vocacao then
        return nil
    end

    if vocacao == 1 then
        return EnchantList.knight
    elseif vocacao == 2 then
        return EnchantList.paladin
    elseif vocacao == 3 or vocacao == 4 then
        return EnchantList.mage
    else
        return nil
    end
end

function EnchantItem()
    isRefilling = true
    Client.showMessage("Enchant Itens Iniciado")

    local enchantList = getEnchantByVocacao()

    if not enchantList then
        isRefilling = false
        return
    end

    for _, enchant in ipairs(enchantList) do
        EnchantItemsAndOpenTrade(enchant)

        -- Atualiza lastPositionTime durante o encantamento de itens
        lastPositionTime = os.time()
    end

    isRefilling = false
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

        -- Atualiza lastPositionTime durante o refil de itens
        lastPositionTime = os.time()
    end

    isRefilling = false
end


function castExaniTera()
    local spellName = "EXANI TERA"
    local spellId = Spells.getIdByName(spellName) 
    local spellGroup = 3 

    while Spells.groupIsInCooldown(spellGroup) do
        wait(1000) 
    end

    Game.talk("exani tera", Enums.TalkTypes.TALKTYPE_SAY)
end




function castHurUp()

    local spellName = "EXANI HUR UP"
    local spellId = Spells.getIdByName(spellName) 
    local spellGroup = 3 

    while Spells.groupIsInCooldown(spellGroup) do
        wait(1000) 
    end

    Game.talk("exani hur up", Enums.TalkTypes.TALKTYPE_SAY)
end


function castHurDown()
    local spellName = "EXANI HUR DOWN"
    local spellId = Spells.getIdByName(spellName) 
    local spellGroup = 3 

    while Spells.groupIsInCooldown(spellGroup) do
        wait(1000) 
    end

    Game.talk("exani hur down", Enums.TalkTypes.TALKTYPE_SAY)
end


function openDoor(x, y, z)
    local things = Map.getThings(x, y, z)
    
    for _, thing in ipairs(things) do
        for _, doorID in ipairs(PORTAS_IDS) do
            if thing.id == doorID then
                if not thing.isOpen then
                    Game.useItemFromGround(x, y, z, doorID)
                    return  -- Saia após abrir a primeira porta encontrada
                else
                end
            end
        end
    end
end

function findAndOpenDoor()
    -- Obtenha a posição da câmera (ou do jogador)
    local cameraPos = Map.getCameraPosition()
    local x, y, z = cameraPos.x, cameraPos.y, cameraPos.z
    
    -- Verifique a posição atual para abrir portas
    
    -- Verifique a posição atual e os tiles ao redor
    for dx = -1, 1 do
        for dy = -1, 1 do
            local tileX = x + dx
            local tileY = y + dy
            openDoor(tileX, tileY, z)
        end
    end
end



OpenNewWIndow = false
local moveToDepotActive = false
Depot = 22797 -- depot I ID
DepotName = "Depot Box I" -- depot name

local lootPouchId = 23721
Locker = {3497, 3498, 3499, 3500}


function OpenDepot()
    wait(400)
    local containers = Player.getContainers()
    if containers then
        for i, containerIndex in pairs(containers or {}) do
            local container = Container(containerIndex)
            local containerName = container:getName()

            if containerName == DepotName then
                return container
            elseif containerName == "Depot Chest" then 
                local containerItems = container:getItems()
                
                for i = 1, #containerItems do
                    if containerItems[i].id == Depot then
                        container:useItem(i-1, OpenNewWIndow)
                        Client.showMessage("Abrindo DP")
                        return container
                    end
                end   
            elseif containerName == "Locker" then
                container:useItem(0, OpenNewWIndow)
                return OpenDepot()
            elseif containerName == "Browse Field" then
                wait(100)
                
                container:useItem(0, OpenNewWIndow)
                return OpenDepot() 
            end
        end
        if FindDepot() then
            return OpenDepot()
        else
            Client.showMessage("Nao ha DP Proximo")
        end
    end
end

function FindDepot()
    local player_pos = Map.getCameraPosition()
    local x, y, z = player_pos.x, player_pos.y, player_pos.z
    local adjacentCoordinates = {
        {x = x - 1  , y = y     , z = z},
        {x = x + 1  , y = y     , z = z},
        {x = x      , y = y - 1 , z = z},
        {x = x      , y = y + 1 , z = z}
    }
    
    for _, coord in ipairs(adjacentCoordinates) do
        local items_on_ground = Map.getThings(coord.x, coord.y, coord.z)
        
        if items_on_ground then
            for _, item in ipairs(items_on_ground) do
                if isInTable(item.id,Locker) then
                    Map.browseField(coord.x, coord.y, coord.z)
                    return true
                end
            end
        end
    end
    return false
end

function isInTable(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function openLootPouch()
    local containers = Player.getContainers()
    if containers then
        for i, containerIndex in pairs(containers or {}) do
            local container = Container(containerIndex)
            
            if container:getName() == BACKPACK_LOOT then
                return container
            elseif container:getName() == "Your Store Inbox" then
                local store = container:getItems()
                for i = 1, #store do
                    if store[i].id == lootPouchId then
                        container:useItem(i-1, false)
                        wait(100)
                        return container
                    end
                end
            end
        end
    end
    return false
end

function moveToDepot()    
    moveToDepotActive = true  -- Marca que o processo de depósito está ativo
    local lootPouch = openLootPouch()

    if lootPouch then
        lootPouch:moveUp()  -- Mover a mochila de loot para cima
        wait(1000)  -- Esperar um pouco para garantir que a ação seja concluída
        lootPouch = openLootPouch()  -- Reabrir a mochila de loot após movê-la para cima
    end

    local locker = OpenDepot()
    local delay = 150

    if locker and lootPouch then
        local pouch = lootPouch:getItems()

        while #pouch > 0 do
            lootPouch:moveItemToContainer(0, pouch[1].count, locker.cid, 0)
            wait(delay)
            pouch = lootPouch:getItems()  -- Atualiza a lista de itens da mochila
        end

        Client.showMessage("DEPOSIT ITENS FINALIZADO!")
        locker:close()

    else
        Client.showMessage("Por favor, Corrigir nome da sua Backpack")
    end

    moveToDepotActive = false
end

local timer_id = nil

function find_available_item()
    local player_pos = Map.getCameraPosition()

    for dx = -7, 7 do
        for dy = -7, 7 do
            local check_pos = { x = player_pos.x + dx, y = player_pos.y + dy, z = player_pos.z }
            local items_on_ground = Map.getThings(check_pos.x, check_pos.y, check_pos.z)

            if items_on_ground then
                for _, item in ipairs(items_on_ground) do
                    for _, id in ipairs(SQM_DP) do
                        if item.id == id then
                            local is_empty = is_location_empty(check_pos)
                            if is_empty then
                                return check_pos
                            end
                        end
                    end
                end
            end
        end
    end

    return nil
end

function is_location_empty(pos)
    local creature_ids = Map.getCreatureIds(true, true) -- Obtém IDs de jogadores no mesmo andar
    for _, id in ipairs(creature_ids) do
        local creature = Creature.new(id)
        local creature_pos = creature:getPosition()
        if creature_pos.x == pos.x and creature_pos.y == pos.y and creature_pos.z == pos.z then
            return false -- Local ocupado
        end
    end
    return true -- Local vago
end

function onTimer()
 isMovingToDepot = true
    local available_item_pos = find_available_item()
    if available_item_pos then
        Map.goTo(available_item_pos.x, available_item_pos.y, available_item_pos.z)
        Timer.stop(timer_id)
        wait(2000) -- Pausa de 2 segundos
        moveToDepot() -- Chamando a função moveToDepot()
		bKSTeHCRkd = bKSTeHCRkd + 1
    else
	 isMovingToDepot = false
    end
end


function DepositDP()
    -- Criando um novo timer
    timer_id = Timer.new("myTimer", onTimer, 10)
    -- Iniciando o timer
    Timer.start(timer_id)
end

function stopScript()
    -- Parando o timer
    Timer.stop(timer_id)
end

function AdventurersRubinot()
    Game.useItem(16277)
    wait(2500)

    -- 4x WEST
    for i = 1, 4 do
        Game.walk(3) -- WEST
        wait(DELAY_FUNCOES)
    end

    -- 1x NORTH
    Game.walk(0) -- NORTH
    wait(DELAY_FUNCOES)

    -- 4x WEST
    for i = 1, 4 do
        Game.walk(3) -- WEST
        wait(DELAY_FUNCOES)
    end

    -- 2x SOUTH
    for i = 1, 2 do
        Game.walk(2) -- SOUTH
        wait(DELAY_FUNCOES)
    end

	SellAllItens()    
    wait(1000)

    -- 3x NORTH
    for i = 1, 3 do
        Game.walk(0) -- NORTH
        wait(DELAY_FUNCOES)
    end

	EnchantItem()    
    wait(1000)
	
	-- 1x SOUTH
		Game.walk(2) -- SOUTH
		wait(DELAY_FUNCOES)

    -- 8x EAST
    for i = 1, 8 do
        Game.walk(1) -- EAST
        wait(DELAY_FUNCOES)
    end

    --AQUI FORGE
    ForgeEstanciaRUBINOT()
    --FORGE

    -- 4x SOUTH
    for i = 1, 4 do
        Game.walk(2) -- SOUTH
        wait(DELAY_FUNCOES)
    end

    -- 2x EAST
    for i = 1, 2 do
        Game.walk(1) -- EAST
        wait(DELAY_FUNCOES)

    end

    -- 1x NORTH
    wait(2000)

    Game.walk(0) -- NORTH
    wait(DELAY_FUNCOES)
    wait(300)


    -- 7x EAST
    for i = 1, 7 do
        Game.walk(1) -- EAST
        wait(DELAY_FUNCOES)
    end

    -- 5x NORTH
    for i = 1, 5 do
        Game.walk(0) -- NORTH
        wait(DELAY_FUNCOES)
    end

end

function ForgeEstanciaRUBINOT()

    if ConvertForge == 0 then
        Client.showMessage("Forja esta desligada")
        return
    end

    local dustsMaximum = Player.getDustsMaximum()
    local dusts = Player.getDusts()
    local requiredDusts = dustsMaximum - 75

    -- Verifique se há dusts suficientes para proceder com ConvertForge == 1
    if ConvertForge == 1 and dusts >= requiredDusts or ConvertForge == 2 and dusts >= 60 then

        for i = 1, 8 do
            Game.walk(1) -- EAST
            wait(DELAY_FUNCOES)
        end

        for i = 1, 14 do
            Game.walk(0) -- NORTH
            wait(DELAY_FUNCOES)
        end

        wait(1000)

            Game.walk(1) -- EAST
            wait(DELAY_FUNCOES)

        for i = 1, 5 do
            Game.walk(0) -- NORTH
            wait(DELAY_FUNCOES)
        end        

        wait(1000)

        for i = 1, 5 do
            Game.walk(0) -- NORTH
            wait(DELAY_FUNCOES)
        end 

            for i = 1, 2 do
                Game.walk(1) -- NORTH
                wait(DELAY_FUNCOES)
            end 

            findAndClickForge()

            wait(500)

            for i = 1, 5 do
                Game.walk(2) -- SOUTH
                wait(DELAY_FUNCOES)
            end 

            for i = 1, 3 do
                Game.walk(2) -- SOUTH
                wait(DELAY_FUNCOES)
            end 

            wait(1000)

        for i = 1, 13 do
            Game.walk(2) -- SOUTH
             wait(DELAY_FUNCOES)
        end 

        for i = 1, 9 do
            Game.walk(3) -- NORTH
            wait(DELAY_FUNCOES)
        end 
    end
end

        

 



local SAVE = HUD.new(145 + HUD_MUDAR_X, 90 + HUD_MUDAR_Y, "SAVE")
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
                            ", MinRefil = " .. item.MinRefil .. ", Amount = " .. item.Amount ..
                            ", category = \"" .. item.category .. "\", categoryHouse = \"" .. item.categoryHouse .. "\"}, ")
        end
        table.insert(itemLines, "}, ")
    end

    -- Remove a vírgula e o espaço extras no final da lista
    str = str .. table.concat(itemLines):gsub(", %s*$", "") .. "}" -- Fecha a lista de itens
    str = str .. "\n" .. ITEMS_END_MARKER -- Marcador de fim

    return str
end


local ENCHANTLIST_START_MARKER = "-- START ENCHANTLIST"
local ENCHANTLIST_END_MARKER = "-- END ENCHANTLIST"

-- Função para serializar a tabela `EnchantList` em formato de string Lua
local function serializeEnchantList(tbl)
    local str = ENCHANTLIST_START_MARKER .. "\n" -- Marcador de início
    str = str .. "local EnchantList = {" -- Início da lista de encantos

    -- Monta a lista de encantos em uma única linha
    local enchantLines = {}
    for category, itemsList in pairs(tbl) do
        table.insert(enchantLines, category .. " = {")
        for _, item in ipairs(itemsList) do
            table.insert(enchantLines, "{name = \"" .. item.name .. "\", id = " .. item.id ..
                            ", amount = " .. tostring(item.amount) .. ", category = \"" .. item.category .. "\"}, ")
        end
        table.insert(enchantLines, "}, ")
    end

    -- Remove a vírgula e o espaço extras no final da lista
    str = str .. table.concat(enchantLines):gsub(", %s*$", "") .. "}" -- Fecha a lista de encantos
    str = str .. "\n" .. ENCHANTLIST_END_MARKER -- Marcador de fim

    return str
end


local PARAMETROS_START_MARKER = "-- START PARAMETROS"
local PARAMETROS_END_MARKER = "-- END PARAMETROS"

-- Função para serializar os parâmetros em formato de string Lua
local function serializeParametros()
    return PARAMETROS_START_MARKER .. "\n" ..
           "local ConvertForge = " .. tostring(ConvertForge) .. "; " ..
           "local AntiKS = " .. tostring(AntiKS) .. "; " ..
           "local LimitBuySupplies = " .. tostring(LimitBuySupplies) .. "; " ..
           "local ReturnHuntAfterDead = " .. tostring(ReturnHuntAfterDead) .. "; " ..
           "local DISABLE_TO_REFILL = " .. tostring(DISABLE_TO_REFILL) .. "; " ..
           "local TransferAfterDeposit = " .. tostring(TransferAfterDeposit) .. "; " ..
           "local IGNORE_CAP_TO_REFIL = " .. tostring(IGNORE_CAP_TO_REFIL) .. "; " ..
           "local REFIL_AUTOMATICO = " .. tostring(REFIL_AUTOMATICO) .. "; " ..
           "local AUTOLOOT = " .. tostring(AUTOLOOT) .. "\n" ..
           PARAMETROS_END_MARKER
end

-- Função para salvar a configuração e a lista de itens
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

    -- Atualiza os parâmetros
    local params = {
        Delay_Supplies = Delay_Supplies,
        SINGLE_STEP_DELAY = SINGLE_STEP_DELAY,
        MAX_STEP_DELAY = MAX_STEP_DELAY,
        DELAY_FUNCOES = DELAY_FUNCOES,
        STEP_DELAY_REFILL = STEP_DELAY_REFILL,
        CAP_TO_REFIL = CAP_TO_REFIL,
        ManterBalance = ManterBalance,
        MAX_MONSTER_STOP = MAX_MONSTER_STOP,
        MIN_MONSTER_RESUME = MIN_MONSTER_RESUME,
        MONSTER_COUNT_AREA = MONSTER_COUNT_AREA,
        CAITBOX_DISTANCE = CAITBOX_DISTANCE,
        RUN_LOST_MONSTER_COUNT = RUN_LOST_MONSTER_COUNT,
        STOP_WITH_MANA = STOP_WITH_MANA,
        RESUME_WITH_MANA = RESUME_WITH_MANA,
        NPC_REFIL_TYPE = NPC_REFIL_TYPE,
        currentResetIndex = currentResetIndex,
        currentMultiplicadorIndex = currentMultiplicadorIndex,
        currentShovelIndex = currentShovelIndex,
        currentRopeIndex = currentRopeIndex,
        currentLatenciaIndex = currentLatenciaIndex,
        ROPE_ID = ROPE_ID,  
        SHOVEL_ID = SHOVEL_ID,
        USEITEM_ID = USEITEM_ID,
        MONSTER_COUNT_AREA_REFIL = MONSTER_COUNT_AREA_REFIL
    }

    for param, value in pairs(params) do
        local pattern = param .. "%s*=%s*[%d]+"
        local replacement = param .. " = " .. tostring(value)
        content = string.gsub(content, pattern, replacement)
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

    -- Verifica se os marcadores da lista de encantos existem no conteúdo
    local enchantStartIdx = content:find(ENCHANTLIST_START_MARKER)
    local enchantEndIdx = content:find(ENCHANTLIST_END_MARKER)

    if enchantStartIdx and enchantEndIdx then
        enchantEndIdx = enchantEndIdx + #ENCHANTLIST_END_MARKER - 1
        content = content:sub(1, enchantStartIdx - 1) ..
                  serializeEnchantList(EnchantList) ..
                  content:sub(enchantEndIdx + 1)
    end

    -- Verifica se os marcadores dos parâmetros existem no conteúdo
    local paramStartIdx = content:find(PARAMETROS_START_MARKER)
    local paramEndIdx = content:find(PARAMETROS_END_MARKER)

    if paramStartIdx and paramEndIdx then
        paramEndIdx = paramEndIdx + #PARAMETROS_END_MARKER - 1
        content = content:sub(1, paramStartIdx - 1) ..
                  serializeParametros() ..
                  content:sub(paramEndIdx + 1)
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

-- Criação do HUD principal
local GUIIBHUD = HUD.new(HUD_MUDAR_X + 14, HUD_MUDAR_Y + 67, "GuiiBScripts", true)
GUIIBHUD:setColor(60, 190, 255)
GUIIBHUD:setFontSize(12)


local esconder = false  -- Variável de controle para esconder

-- Função para alternar a posição do HUD CONFIG
function HideHuds()
    if not esconder then
        esconder = true
        DestruirConfig()
        CONFIG:setColor(255, 255, 255)  -- Volta a cor para branca
        CONFIG:setPos(originalPosX - 5000, originalPosY)  
        SAVE:setPos(originalPosX - 5000, originalPosY)  
        INFORMACAO:setPos(originalPosX - 5000, originalPosY)  
        INFORMACAO2:setPos(originalPosX - 5000, originalPosY)  
        zerobotfuncoes:setPos(originalPosX - 5000, originalPosY)  
        FcCAtJCtkU:setPos(originalPosX - 5000, originalPosY)


        -- Move os elementos do HUD armazenados
        for _, element in ipairs(hudElements) do
            element.hud:setPos(element.originalX + 5000, element.originalY)
        end
        
        -- Move os HUDs de configuração armazenados
        for _, element in ipairs(configHudElements) do
            element.hud:setPos(element.originalX + 5000, element.originalY)
        end

        for _, element in ipairs(zerobotHudElements) do
            element.hud:setPos(element.originalX + 5000, element.originalY)
        end
        for _, element in ipairs(infoHudElements) do
            element.hud:setPos(element.originalX + 5000, element.originalY)
        end
    else
        esconder = false
        CONFIG:setPos(originalPosX + 145, originalPosY + 50)  
        SAVE:setPos(originalPosX + 145, originalPosY + 90)  
        INFORMACAO:setPos(originalPosX + 60, originalPosY + 175)  
        INFORMACAO2:setPos(originalPosX + 60, originalPosY + 190)  
        zerobotfuncoes:setPos(originalPosX + 60, originalPosY + 235)  
        FcCAtJCtkU:setPos(CAVEBOT_ICON_X + 25 + HUD_MUDAR_X, CAVEBOT_ICON_Y + 195 + HUD_MUDAR_Y - 40)


        -- Restaura os elementos do HUD para suas posições originais
        for _, element in ipairs(hudElements) do
            element.hud:setPos(element.originalX, element.originalY)
        end

        -- Restaura os HUDs de configuração para suas posições originais
        for _, element in ipairs(configHudElements) do
            element.hud:setPos(element.originalX, element.originalY)
        end

        for _, element in ipairs(zerobotHudElements) do
            element.hud:setPos(element.originalX, element.originalY)
        end
        for _, element in ipairs(infoHudElements) do
            element.hud:setPos(element.originalX, element.originalY)
        end
    end
end

-- Define a função de callback para GUIIBHUD
GUIIBHUD:setCallback(HideHuds)


                return true
            end
        end
    end
    local teste = HUD.new(650, 500, "Usuario nao autorizado!!", true); teste:setColor(255, 255, 255); teste:setFontSize(16)
    local teste = HUD.new(550, 530, "Solicite Suporte via Ticket no nosso Discord", true); teste:setColor(255, 255, 255); teste:setFontSize(16)

    return false
end

-- Executa a verificação
verificarAutorizacao()
