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
    local url = "https://raw.githubusercontent.com/GuiibScripts/Chaves/master/Combo_Ultimate.lua?nocache=" .. os.time()
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
                local CAMINHO = Engine.getScriptsDirectory()
local filePath = CAMINHO .. "\\waypoint.txt"

local HUD_MUDAR_X = 0
local HUD_MUDAR_Y = 0

local function readFile(filePath)
    local file = io.open(filePath, "r")
    if not file then return {} end
    
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
        file:close()
    return lines
end

local function writeFile(filePath, lines)
    local file = io.open(filePath, "w")
    if not file then 
        return
    end
        for _, line in ipairs(lines) do
        file:write(line .. "\n")
    end
       file:close()
end

local function deleteLastCoordinate()
    local lines = readFile(filePath)
        if #lines > 0 then
        table.remove(lines, #lines) 
        writeFile(filePath, lines) 
        Client.showMessage("Coordenada REMOVIDA")
    else
        Client.showMessage("Nenhuma Coordenada Encontrada")
    end
end



local function GUIIBSCRIPTS(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
    end
end

local xCoords3 = {17, 24, 67, 74, 117, 124, 167, 174}
local xCoords2 = {-7, 25, 43, 75, 93, 125, 143, 175}
local xCoords1 = {-7, 125, 143, 175}
local xCoords11 = {17, 21, 51, 81, 111, 124}
local xCoords4 = {167, 174}
local xCoords5 = {21, 51, 81, 111, 120}
local xCoords6 = {21, 51, 81, 95, 111, 120}
local xCoords7 = {21, 61, 120}

GUIIBSCRIPTS(xCoords4, 55, 17470)



GUIIBSCRIPTS(xCoords1, 60, 17471)
GUIIBSCRIPTS(xCoords11, 55, 17470)
GUIIBSCRIPTS(xCoords11, 87, 17470)


GUIIBSCRIPTS(xCoords2, 100, 17471)
GUIIBSCRIPTS(xCoords2, 150, 17471)
GUIIBSCRIPTS(xCoords2, 200, 17471)
GUIIBSCRIPTS(xCoords4, 88, 17470)

GUIIBSCRIPTS(xCoords3, 97, 17470)
GUIIBSCRIPTS(xCoords3, 147, 17470)
GUIIBSCRIPTS(xCoords3, 197, 17470)
GUIIBSCRIPTS(xCoords3, 129, 17470)
GUIIBSCRIPTS(xCoords3, 179, 17470)
GUIIBSCRIPTS(xCoords3, 229, 17470)
GUIIBSCRIPTS(xCoords5, 60, 33150)

GUIIBSCRIPTS(xCoords6, 60, 2697)
GUIIBSCRIPTS(xCoords7, 55, 2696)



local GUIIB_SCRIPTS = HUD.new(HUD_MUDAR_X + 25, HUD_MUDAR_Y + 64, "uiiB S", true)
local GUIIB_SCRIPTS2 = HUD.new(HUD_MUDAR_X + 43, HUD_MUDAR_Y + 70, "            cripts", true)
GUIIB_SCRIPTS2:setColor(60, 190, 255)
GUIIB_SCRIPTS2:setFontSize(12)

GUIIB_SCRIPTS:setColor(60, 190, 255)
GUIIB_SCRIPTS:setFontSize(15)

local createdHUDs = {}

-- Função para criar HUDs com parâmetros básicos e callbacks
local function CONFIGHUD(x, y, spriteID, callback)
    local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
    hud:setCallback(callback)
    hud:setColor(255, 255, 255)  -- Define a cor branca
    table.insert(createdHUDs, hud)
end

function Client.showMessage(message)
    -- Exibe a mensagem original
    local adjustedY = y + 50
end

function Client.showMessage(message)
    local greenMessage = "<font color='#00FF00'>" .. message .. "</font>"
    clientShowMessage(greenMessage)

    -- Esperar 200 milissegundos e depois retornar à cor original
    wait(200)  -- Espera 0,2 segundos
    local whiteMessage = "<font color='#FFFFFF'>" .. message .. "</font>"
    clientShowMessage(whiteMessage)
end


---------------- CALLBACKS
local function DeleteCoord()
    deleteLastCoordinate()
end


local function CaitBOX()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "CAIT BOX")
    Client.showMessage("Add: CaitBOX SQM")
end

local function BoxSqm()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "BOX")
    Client.showMessage("Add: BOX SQM")
end

local function standCallback()
    MARCARTALK(0, 0, 'STAND', 'SINGLE_STEP_DELAY', 'nil', "Stand")
    Client.showMessage("Add: STAND")
end

local function ExaniTeraCallback()
    MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() castExaniTera() end', "Exani Tera")
    Client.showMessage("Add: EXANI TERA")
end


local function UseEscada()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(0, 0, nil, "DELAY_FUNCOES", "SUBIR")
    Client.showMessage("Add: SUBIR ESCADA")
end

local function ClickNorthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(0, -1, nil, "DELAY_FUNCOES", "Click North")
    Client.showMessage("Add: Click North")
end

local function ClickNorthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(1, -1, nil, "DELAY_FUNCOES", "Click North East")
    Client.showMessage("Add: Click North East")
end

local function ClickEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(1, 0, nil, "DELAY_FUNCOES", "Click East")
    Client.showMessage("Add: Click East")
end

local function ClickSouthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(1, 1, nil, "DELAY_FUNCOES", "Click South East")
    Client.showMessage("Add: Click South East")
end

local function ClickSouthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(0, 1, nil, "DELAY_FUNCOES", "Click South")
    Client.showMessage("Add: Click South")
end

local function ClickSouthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(-1, 1, nil, "DELAY_FUNCOES", "Click South West")
    Client.showMessage("Add: Click South West")
end

local function ClickWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(-1, 0, nil, "DELAY_FUNCOES", "Click West")
    Client.showMessage("Add: Click West")
end

local function ClickNorthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARLEVER(-1, -1, nil, "DELAY_FUNCOES", "Click North West")
    Client.showMessage("Add: Click North West")
end

---------------------------------

local function centerCallback()
    MARCARPASSOS(0, 0)
    Client.showMessage("Add: Node")

end

local function northCallback()
    MARCARPASSOS2(0, -1)
    Client.showMessage("Add: North")

end

local function southCallback()
    MARCARPASSOS2(0, 1)
    Client.showMessage("Add: South")

end

local function eastCallback()
    MARCARPASSOS2(1, 0)
    Client.showMessage("Add: East")

end

local function westCallback()
    MARCARPASSOS2(-1, 0)
    Client.showMessage("Add: West")

end
-- Coordenadas base e configurações
local baseX = 70
local baseY = 150
local Diference = 50

-- Tabela de configurações dos HUDs
local hudConfigs = {
    {name = "Exani Tera", x = baseX - Diference, y = baseY - Diference, spriteID = 33150, callback = ExaniTeraCallback},
    {name = "Exani Tera", x = baseX - Diference, y = baseY - Diference, spriteID = 23518, callback = ExaniTeraCallback},

    {name = "Escada", x = baseX + Diference, y = baseY - Diference, spriteID = 33150, callback = UseEscada},
    {name = "Escada", x = baseX + Diference, y = baseY - Diference, spriteID = 1948, callback = UseEscada},

    {name = "Config", x = baseX + Diference, y = baseY + Diference, spriteID = 33150, callback = toggleHUDs},
    {name = "AutoRecord", x = baseX + Diference * 2, y = baseY - Diference - 40, spriteID = 33150, callback = AutoRecord},

    {name = "DeleteCoord", x = baseX + Diference * 2, y = baseY - Diference, spriteID = 33150, callback = DeleteCoord},
    {name = "DeleteCoord", x = baseX + Diference * 2 + 2, y = baseY - Diference, spriteID = 30293, callback = DeleteCoord},

    {name = "BoxSqm", x = baseX + Diference * 2, y = baseY, spriteID = 33150, callback = BoxSqm},
    {name = "BoxSqm", x = baseX + Diference * 2, y = baseY, spriteID = 14760, callback = BoxSqm},

    {name = "CaitBOX", x = baseX + Diference * 2, y = baseY + Diference, spriteID = 33150, callback = CaitBOX},
    {name = "CaitBOX", x = baseX + Diference * 2, y = baseY + Diference, spriteID = 34079, callback = CaitBOX},

    {name = "Center", x = baseX, y = baseY, spriteID = 33150, callback = centerCallback},
    {name = "Center", x = baseX, y = baseY, spriteID = 33150, callback = centerCallback},
    {name = "Center", x = baseX, y = baseY, spriteID = 40475, callback = centerCallback},
    


    {name = "North", x = baseX, y = baseY - Diference, spriteID = 33150, callback = northCallback},
    {name = "North", x = baseX, y = baseY - Diference, spriteID = 40477, callback = northCallback},

    {name = "South", x = baseX, y = baseY + Diference, spriteID = 33150, callback = southCallback},
    {name = "South", x = baseX, y = baseY + Diference, spriteID = 40480, callback = southCallback},

    {name = "East", x = baseX + Diference, y = baseY, spriteID = 33150, callback = eastCallback},
    {name = "East", x = baseX + Diference, y = baseY, spriteID = 40479, callback = eastCallback},

    {name = "West", x = baseX - Diference, y = baseY, spriteID = 33150, callback = westCallback},
    {name = "West", x = baseX - Diference, y = baseY, spriteID = 40478, callback = westCallback},

    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 33150, callback = standCallback},
    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 33150, callback = standCallback},
    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 40481, callback = standCallback},
    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 40483, callback = standCallback},
    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 40486, callback = standCallback},
    {name = "Stand", x = baseX - Diference, y = baseY + Diference, spriteID = 40488, callback = standCallback},


}

-- Cria HUDs com base nas configurações especificadas
for _, config in ipairs(hudConfigs) do
    CONFIGHUD(config.x + HUD_MUDAR_X, config.y + HUD_MUDAR_Y, config.spriteID, config.callback)
end

-- Exemplo com texto específico
local hudTextConfigs = {
    {name = "West", x = baseX - Diference + 3, y = baseY + 23, spriteID = "WEST", callback = westCallback},
    {name = "Node", x = baseX - Diference + 53, y = baseY + 23, spriteID = "NODE", callback = centerCallback},
    {name = "East", x = baseX - Diference + 103, y = baseY + 23, spriteID = "EAST", callback = eastCallback},
    {name = "BOX", x = baseX - Diference + 155, y = baseY + 23, spriteID = "BOX", callback = BoxSqm},
    {name = "STAND", x = baseX - Diference, y = baseY + 73, spriteID = "STAND", callback = standCallback},
    {name = "SOUTH", x = baseX - Diference + 50, y = baseY + 73, spriteID = "SOUTH", callback = southCallback},
    {name = "CONFIG", x = baseX - Diference + 98, y = baseY + 73, spriteID = "CONFIG", callback = config},
    {name = "CAITBOX", x = baseX - Diference + 145, y = baseY + 73, spriteID = "CAITBOX", callback = CaitBOX},
    {name = "EXANI", x = baseX - Diference + 3, y = baseY - 35, spriteID = "EXANI", callback = ExaniTeraCallback},
    {name = "TERA", x = baseX - Diference + 5, y = baseY - 27, spriteID = "TERA", callback = ExaniTeraCallback},
    {name = "NORTH", x = baseX - Diference + 50, y = baseY - 27, spriteID = "NORTH", callback = northCallback},
    {name = "ESCADA", x = baseX - Diference + 106, y = baseY - 27, spriteID = "USE", callback = UseEscada},
    {name = "EXCLUIR", x = baseX - Diference + 150, y = baseY - 27, spriteID = "DELETE", callback = DeleteCoord},



}

-- Função de configuração do HUD
local function CONFIGHUD(x, y, spriteID, callback)
    local hud = HUD(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID, true)
    hud:setCallback(callback)
    hud:setFontSize(6)  -- Define o tamanho da fonte para 8
    hud:setColor(255, 255, 255)
    return hud
end

-- Cria HUDs com base nas configurações especificadas
for _, config in ipairs(hudTextConfigs) do
    CONFIGHUD(config.x + HUD_MUDAR_X, config.y + HUD_MUDAR_Y, config.spriteID, config.callback)
end

----------------- FUNÇÕES

function MARCARPASSOS(xOffset, yOffset)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }
        local coordinaFUNCAOxt = string.format(
            "{ x = %d, y = %d, z = %d, type = 'NODE', wait = SINGLE_STEP_DELAY, direction = 8, action = nil, label = '' },",
            roundedPos.x, roundedPos.y, roundedPos.z
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCAOxt .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARPASSOS2(xOffset, yOffset)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }
        local coordinaFUNCAOxt = string.format(
            "{ x = %d, y = %d, z = %d, type = 'STAND', wait = SINGLE_STEP_DELAY, direction = 8, action = nil, label = '' },",
            roundedPos.x, roundedPos.y, roundedPos.z
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCAOxt .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARTALK(xOffset, yOffset, funcType, wait, action, label)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }
        -- Escapa aspas simples na label para evitar problemas de formatação
        local escapedLabel = label:gsub("'", "\\'")
        
        -- Verifica se funcType e action são números ou strings
        local funcTypeStr = funcType
        local actionStr = action
        if type(funcType) == "string" then
            funcTypeStr = string.format("'%s'", funcType)
        end
        
        -- Não coloca aspas ao redor de `action`, se for uma string, para evitar aspas extras
        if type(action) == "string" then
            actionStr = action
        else
            actionStr = tostring(action)  -- Converte o valor para string, se não for string
        end
        
        local coordinaFUNCOES = string.format(
            "{ x = %d, y = %d, z = %d, type = %s, wait = %s, direction = 8, action = %s, label = '%s' },",
            roundedPos.x, roundedPos.y, roundedPos.z, funcTypeStr, wait, actionStr, escapedLabel
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCOES .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARUSEITEMID(xOffset, yOffset, actionFunction, wait, label)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }

        local funcType = "'USE_LEVER'"
        local escapedLabel = label:gsub("'", "\\'")

        -- Formatar o valor de wait como uma string
        local waitStr = wait
        if type(wait) == "string" then
            waitStr = wait
        else
            waitStr = tostring(wait)
        end

        -- Usar os valores de coordenada para a ação
        local actionStr = string.format(
            "function() Game.useItemOnGround(USEITEM_ID, %d, %d, %d) end",
            roundedPos.x, roundedPos.y, roundedPos.z
        )

        -- Usar a coordenada fornecida para a ação
        local coordinaFUNCOES = string.format(
            "{ x = %d, y = %d, z = %d, type = %s, wait = %s, direction = 8, action = %s, label = '%s' },",
            roundedPos.x, roundedPos.y, roundedPos.z, funcType, waitStr, actionStr, escapedLabel
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCOES .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARUSESHOVEL(xOffset, yOffset, actionFunction, wait, label)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }

        local funcType = "'USE_LEVER'"
        local escapedLabel = label:gsub("'", "\\'")

        -- Formatar o valor de wait como uma string
        local waitStr = wait
        if type(wait) == "string" then
            waitStr = wait
        else
            waitStr = tostring(wait)
        end

        -- Usar os valores de coordenada para a ação
        local actionStr = string.format(
            "function() Game.useItemOnGround(SHOVEL_ID, %d, %d, %d) end",
            roundedPos.x, roundedPos.y, roundedPos.z
        )

        -- Usar a coordenada fornecida para a ação
        local coordinaFUNCOES = string.format(
            "{ x = %d, y = %d, z = %d, type = %s, wait = %s, direction = 8, action = %s, label = '%s' },",
            roundedPos.x, roundedPos.y, roundedPos.z, funcType, waitStr, actionStr, escapedLabel
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCOES .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARUSEROPE(xOffset, yOffset, actionFunction, wait, label)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }

        local funcType = "'USE_LEVER'"
        local escapedLabel = label:gsub("'", "\\'")

        -- Formatar o valor de wait como uma string
        local waitStr = wait
        if type(wait) == "string" then
            waitStr = wait
        else
            waitStr = tostring(wait)
        end

        -- Usar os valores de coordenada para a ação
        local actionStr = string.format(
            "function() Game.useItemOnGround(ROPE_ID, %d, %d, %d) end",
            roundedPos.x, roundedPos.y, roundedPos.z
        )

        -- Usar a coordenada fornecida para a ação
        local coordinaFUNCOES = string.format(
            "{ x = %d, y = %d, z = %d, type = %s, wait = %s, direction = 8, action = %s, label = '%s' },",
            roundedPos.x, roundedPos.y, roundedPos.z, funcType, waitStr, actionStr, escapedLabel
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCOES .. "\n")
            file:close()
        else
        end
    else
    end
end

function MARCARLEVER(xOffset, yOffset, actionFunction, wait, label)
    if filePath then
        local pos = Creature(Player.getId()):getPosition()
        local roundedPos = {
            x = math.floor(pos.x + xOffset + 0.5),
            y = math.floor(pos.y + yOffset + 0.5),
            z = math.floor(pos.z + 0.5)
        }

        local funcType = "'USE_LEVER'"
        local escapedLabel = label:gsub("'", "\\'")

        -- Formatar o valor de wait como uma string
        local waitStr = wait
        if type(wait) == "string" then
            waitStr = wait
        else
            waitStr = tostring(wait)
        end

        -- Usar os valores de coordenada para a ação
        local actionStr = string.format(
            "function() Game.useItemFromGround(%d, %d, %d) end",
            roundedPos.x, roundedPos.y, roundedPos.z
        )

        -- Usar a coordenada fornecida para a ação
        local coordinaFUNCOES = string.format(
            "{ x = %d, y = %d, z = %d, type = %s, wait = %s, direction = 8, action = %s, label = '%s' },",
            roundedPos.x, roundedPos.y, roundedPos.z, funcType, waitStr, actionStr, escapedLabel
        )
        local file, err = io.open(filePath, "a")
        if file then
            file:write(coordinaFUNCOES .. "\n")
            file:close()
        else
        end
    else
    end
end
-------------------------

local createdHUDs = {}

-- Função para criar HUDs
local function createHUD(name, x, y, spriteID, callback)
    local hud = HUD.new(x, y, spriteID)
    hud:setCallback(callback)
    hud:setText(name)  -- Define o nome do HUD
    hud:setColor(255, 255, 255)  -- Define a cor do texto como branco
    return hud
end

-- Tabela para armazenar os HUDs criados
local huds = {}

-- Estado para verificar se os HUDs foram criados
local hudsCreated = false

-- Função para criar vários HUDs de texto
local function createTextHUDs()
    
    local function CreateModelTravel(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
            table.insert(huds, hud)
        end
    end

    local xCoords1 = {285, 315, 365, 395, 440, 470}
    local xCoords2 = {280, 310, 320, 360, 390, 400, 435, 465, 475}
    local xCoords3 = {257, 320, 337, 400, 412, 475}

    CreateModelTravel(xCoords3, Diference + 5, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 30, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 60, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 90, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 120, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 150, 17471)
    CreateModelTravel(xCoords3, Diference + 5 + 155, 17471)




    CreateModelTravel(xCoords2, Diference + 5, 17470)
    CreateModelTravel(xCoords2, Diference * 5 - 10, 17470)





    CreateModelTravel(xCoords1, Diference + 10, 33150)
    CreateModelTravel(xCoords1, Diference + 40, 33150)
    CreateModelTravel(xCoords1, Diference + 70, 33150)
    CreateModelTravel(xCoords1, Diference + 100, 33150)
    CreateModelTravel(xCoords1, Diference + 130, 33150)
    CreateModelTravel(xCoords1, Diference + 160, 33150)



--TRAVEL
local delayTravel = 400

local function IssaviCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Issavi", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Issavi")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Issavi", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Issavi")
end

local function ANKRAHMUNCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Ankrahmun", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Ankrahmun")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Ankrahmun", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Ankrahmun")
end

local function CARLINCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Carlin", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Carlin")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Carlin", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Carlin")
end

local function DARASHIACallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Darashia", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Darashia")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Darashia", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Darashia")
end

local function EDRONCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Edron", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Edron")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Edron", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Edron")
end

local function GRAYCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Port hope", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Port hope")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Port hope", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Port hope")
end

local function KAZZCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Kazordoon", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Kazzordoon")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("kazordoon", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Kazordoon")
end

local function KRAILOSCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Krailos", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Krailos")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Krailos", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Krailos")
end

local function MARAPURCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Marapur", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Marapur")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Marapur", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Marapur")
end

local function ORAMONDCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Oramond", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Oramond")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Oramond", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Oramond")
end

local function ROSHACallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Roshamuul", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Roshamuul")
    Game.talk("hi", 12) wait(1000); Game.talk("Roshamuul", 12) wait(1000); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Roshamuul")
end

local function THAISCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Thais", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Thais")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Thais", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Thais")
end

local function VENORECallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Venore", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Venore")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Venore", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Venore")
end

local function YALAHARCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("Yalahar", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Yalahar")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Yalahar", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Yalahar")
end

local function PASSAGECallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("passage", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Passage")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("passage", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Passage")
end

local function SAILSAFECallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("sail", 12) wait(1000); Game.talk("safe", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Sail Safe")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("sail", 12) wait(delayTravel); Game.talk("safe", 12) wait(1000); Game.talk("yes", 12) wait(1000)
    Client.showMessage("Add: Travel Sail")
end

local function BANUTACallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("banuta", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "Banuta")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("banuta", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel Banuta")
end

local function MOUNTAINCallback()
    MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() Game.talk("hi", 12) wait(1000); Game.talk("mountain", 12) wait(1000); Game.talk("yes", 12) wait(1000)  end', "mountain")
    Game.talk("hi", 12) wait(delayTravel); Game.talk("Mountain", 12) wait(delayTravel); Game.talk("yes", 12)
    Client.showMessage("Add: Travel mountain")
end
    
    
    -- Criar HUDs com textos fixos
    local ISSAVI = HUD.new(Diference * 6 + HUD_MUDAR_X, Diference + HUD_MUDAR_Y, "Issavi"); ISSAVI:setColor(255, 255, 255)
    ISSAVI:setCallback(IssaviCallback)
    table.insert(huds, ISSAVI)

    local ANKRAHMUN = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference + 30, "Ankrah"); ANKRAHMUN:setColor(255, 255, 255)
    ANKRAHMUN:setCallback(ANKRAHMUNCallback)
    table.insert(huds, ANKRAHMUN)
    
    local CARLIN = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference + 60, "Carlin"); CARLIN:setColor(255, 255, 255)
    CARLIN:setCallback(CARLINCallback)
    table.insert(huds, CARLIN)
    
    local DARASHIA = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference + 90, "Darashia"); DARASHIA:setColor(255, 255, 255)
    DARASHIA:setCallback(DARASHIACallback)
    table.insert(huds, DARASHIA)
    
    local EDRON = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference + 120, "Edron"); EDRON:setColor(255, 255, 255)
    EDRON:setCallback(EDRONCallback)
    table.insert(huds, EDRON)

    local GRAYISLAND = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference + 150, "Port hope"); GRAYISLAND:setColor(255, 255, 255)
    GRAYISLAND:setCallback(GRAYCallback)
    table.insert(huds, GRAYISLAND)    

    local KAZZORDOON = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference, "Kazzord"); KAZZORDOON:setColor(255, 255, 255)
    KAZZORDOON:setCallback(KAZZCallback)
    table.insert(huds, KAZZORDOON)

    local KRAILOS = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference + 30, "Krailos"); KRAILOS:setColor(255, 255, 255)
    KRAILOS:setCallback(KRAILOSCallback)
    table.insert(huds, KRAILOS)
    
    local MARAPUR = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference + 60, "Marapur"); MARAPUR:setColor(255, 255, 255)
    MARAPUR:setCallback(MARAPURCallback)
    table.insert(huds, MARAPUR)
    
    local ORAMOND = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference + 90, "Oramond"); ORAMOND:setColor(255, 255, 255)
    ORAMOND:setCallback(ORAMONDCallback)
    table.insert(huds, ORAMOND)
    
    local ROSHAMUUL = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference + 120, "Rosha"); ROSHAMUUL:setColor(255, 255, 255)
    ROSHAMUUL:setCallback(ROSHACallback)
    table.insert(huds, ROSHAMUUL)
    
    local THAIS = HUD.new(HUD_MUDAR_X + Diference * 6 + 80, HUD_MUDAR_Y + Diference + 150, "Thais"); THAIS:setColor(255, 255, 255)
    THAIS:setCallback(THAISCallback)
    table.insert(huds, THAIS)    

    local VENORE = HUD.new(HUD_MUDAR_X + Diference * 6 + 150 + 5, HUD_MUDAR_Y + Diference, "Venore"); VENORE:setColor(255, 255, 255)
    VENORE:setCallback(VENORECallback)
    table.insert(huds, VENORE)
    
    local YALAHAR = HUD.new(HUD_MUDAR_X + Diference * 6 + 150 + 5, HUD_MUDAR_Y + Diference + 30, "Yalahar"); YALAHAR:setColor(255, 255, 255)
    YALAHAR:setCallback(YALAHARCallback)
    table.insert(huds, YALAHAR)
    
    local PASSAGE = HUD.new(HUD_MUDAR_X + Diference * 6 + 150 + 5, HUD_MUDAR_Y + Diference + 60, "Passage"); PASSAGE:setColor(255, 255, 255)
    PASSAGE:setCallback(PASSAGECallback)
    table.insert(huds, PASSAGE)
    
    local SAIL = HUD.new(HUD_MUDAR_X + Diference * 6 + 154, HUD_MUDAR_Y + Diference + 90, "Sail Safe"); SAIL:setColor(255, 255, 255)
    SAIL:setCallback(SAILSAFECallback)
    table.insert(huds, SAIL)
    
    local BANUTA = HUD.new(HUD_MUDAR_X + Diference * 6 + 155, HUD_MUDAR_Y + Diference + 120, "Banuta"); BANUTA:setColor(255, 255, 255)
    BANUTA:setCallback(BANUTACallback)
    table.insert(huds, BANUTA)
    
    local MOUNTAIN = HUD.new(HUD_MUDAR_X + Diference * 6 + 155, HUD_MUDAR_Y + Diference + 150, "Mountain"); MOUNTAIN:setColor(255, 255, 255)
    MOUNTAIN:setCallback(MOUNTAINCallback)
    table.insert(huds, MOUNTAIN)      
end

local function ROPENORTHCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(0, -1, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope North")
end

local function RopeNorthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(1, -1, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope North East")
end

local function RopeEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(1, 0, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope East")
end

local function RopeSouthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(1, 1, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope South East")
end

local function RopeSouthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(0, 1, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope South")
end

local function RopeSouthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(-1, 1, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope South West")
end

local function RopeWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(-1, 0, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope West")
end

local function RopeNorthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEROPE(-1, 01, nil, "DELAY_FUNCOES", "Use Rope")
    Client.showMessage("Add: Rope North West")
end
---

local function ShovelNorthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(0, -1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel North")
end

local function ShovelNorthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(1, -1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel North East")
end

local function ShovelEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(1, 0, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel East")
end

local function ShovelSouthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(1, 1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel South East")
end

local function ShovelSouthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(0, 1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel South")
end

local function ShovelSouthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(-1, 1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel South West")
end

local function ShovelWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(-1, 0, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel West")
end

local function ShovelNorthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSESHOVEL(-1, -1, nil, "DELAY_FUNCOES", "Use Shovel")
    Client.showMessage("Add: Shovel North West")
end

local function UseItemIDNorthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(0, -1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item North")
end

local function UseItemIDNorthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(1, -1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item North East")
end

local function UseItemIDEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(1, 0, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item East")
end

local function UseItemIDSouthEastCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(1, 1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item South East")
end

local function UseItemIDSouthCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(0, 1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item South")
end

local function UseItemIDSouthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(-1, 1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item South West")
end

local function UseItemIDWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(-1, 0, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item West")
end

local function UseItemIDNorthWestCallback()
    -- Chama MARCARLEVER com coordenadas e parâmetros apropriados
    MARCARUSEITEMID(-1, -1, nil, "DELAY_FUNCOES", "Use Item")
    Client.showMessage("Add: Item North West")
end

local UseItemIDHudz = {}

local hudsCreateUseItemID = false

-- Função para criar vários HUDs de texto
local function createUseItemIDHUDs()
    
    local function CreateModeUseItemID(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 350, spriteID)
            table.insert(UseItemIDHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120}
    local xCoords2 = {17, 24, 67, 74, 117, 124}
    local xCoords3 = {-7, 25, 43, 75, 93, 125}

    CreateModeUseItemID(xCoords3, - Diference, 17471)
    CreateModeUseItemID(xCoords3, Diference - 50, 17471)
    CreateModeUseItemID(xCoords3, Diference * 2 - 50, 17471)

    CreateModeUseItemID(xCoords2, - Diference - 3, 17470)
    CreateModeUseItemID(xCoords2, - Diference + 29, 17470)
    CreateModeUseItemID(xCoords2, Diference - 50 - 3, 17470)
    CreateModeUseItemID(xCoords2, Diference - 50 + 29, 17470)
    CreateModeUseItemID(xCoords2, Diference * 2 - 50 - 3, 17470)
    CreateModeUseItemID(xCoords2, Diference * 2 - 50 + 29, 17470)

    CreateModeUseItemID(xCoords1, - Diference, 33150)
    CreateModeUseItemID(xCoords1, Diference - 50, 33150)
    CreateModeUseItemID(xCoords1, Diference * 2 - 50, 33150)

    local USEITEMIDNORTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 31296)
    USEITEMIDNORTH:setCallback(UseItemIDNorthCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTH)
    local USEITEMIDNORTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "North", true)
    USEITEMIDNORTHTEXT:setColor(255, 255, 255)
    USEITEMIDNORTHTEXT:setFontSize(7)
    USEITEMIDNORTHTEXT:setCallback(UseItemIDNorthCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTHTEXT)

    local USEITEMIDNORTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 31296)
    USEITEMIDNORTHEAST:setCallback(UseItemIDNorthEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTHEAST)
    local USEITEMIDNORTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NE", true)
    USEITEMIDNORTHEASTTEXT:setColor(255, 255, 255)
    USEITEMIDNORTHEASTTEXT:setFontSize(7)
    USEITEMIDNORTHEASTTEXT:setCallback(UseItemIDNorthEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTHEASTTEXT)

    local USEITEMIDEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 6 + 50, 31296)
    USEITEMIDEAST:setCallback(UseItemIDEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDEAST)
    local USEITEMIDEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "East", true)
    USEITEMIDEASTTEXT:setColor(255, 255, 255)
    USEITEMIDEASTTEXT:setFontSize(7)
    USEITEMIDEASTTEXT:setCallback(UseItemIDEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDEASTTEXT)

    local USEITEMIDSOUTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 31296)
    USEITEMIDSOUTHEAST:setCallback(UseItemIDSouthEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTHEAST)
    local USEITEMIDSOUTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SE", true)
    USEITEMIDSOUTHEASTTEXT:setColor(255, 255, 255)
    USEITEMIDSOUTHEASTTEXT:setFontSize(7)
    USEITEMIDSOUTHEASTTEXT:setCallback(UseItemIDSouthEastCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTHEASTTEXT)

    local USEITEMIDSOUTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 31296)
    USEITEMIDSOUTH:setCallback(UseItemIDSouthCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTH)
    local USEITEMIDSOUTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "South", true)
    USEITEMIDSOUTHTEXT:setColor(255, 255, 255)
    USEITEMIDSOUTHTEXT:setFontSize(7)
    USEITEMIDSOUTHTEXT:setCallback(UseItemIDSouthCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTHTEXT)

    local USEITEMIDSOUTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 7 + 50, 31296)
    USEITEMIDSOUTHWEST:setCallback(UseItemIDSouthWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTHWEST)
    local USEITEMIDSOUTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SW", true)
    USEITEMIDSOUTHWESTTEXT:setColor(255, 255, 255)
    USEITEMIDSOUTHWESTTEXT:setFontSize(7)
    USEITEMIDSOUTHWESTTEXT:setCallback(UseItemIDSouthWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDSOUTHWESTTEXT)

    local USEITEMIDWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 6 + 50, 31296)
    USEITEMIDWEST:setCallback(UseItemIDWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDWEST)
    local USEITEMIDWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "West", true)
    USEITEMIDWESTTEXT:setColor(255, 255, 255)
    USEITEMIDWESTTEXT:setFontSize(7)
    USEITEMIDWESTTEXT:setCallback(UseItemIDWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDWESTTEXT)

    local USEITEMIDNORTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 50, 31296)
    USEITEMIDNORTHWEST:setCallback(UseItemIDNorthWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTHWEST)
    local USEITEMIDNORTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NW", true)
    USEITEMIDNORTHWESTTEXT:setColor(255, 255, 255)
    USEITEMIDNORTHWESTTEXT:setFontSize(7)
    USEITEMIDNORTHWESTTEXT:setCallback(UseItemIDNorthWestCallback)
    table.insert(UseItemIDHudz, USEITEMIDNORTHWESTTEXT)
end

-- Função para destruir todos os HUDs
local function destroyUseItemIDHUDs()
    for _, hud in ipairs(UseItemIDHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    UseItemIDHudz = {}
end




local ShovelHudz = {}

local hudsCreateShovel = false

-- Função para criar vários HUDs de texto
local function createShovelHUDs()
    
    local function CreateModeShovel(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 300 + 50, spriteID)
            table.insert(ShovelHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120}
    local xCoords2 = {17, 24, 67, 74, 117, 124}
    local xCoords3 = {-7, 25, 43, 75, 93, 125}

    CreateModeShovel(xCoords3, - Diference, 17471)
    CreateModeShovel(xCoords3, Diference - 50, 17471)
    CreateModeShovel(xCoords3, Diference * 2 - 50, 17471)

    CreateModeShovel(xCoords2, - Diference - 3, 17470)
    CreateModeShovel(xCoords2, - Diference + 29, 17470)
    CreateModeShovel(xCoords2, Diference - 50 - 3, 17470)
    CreateModeShovel(xCoords2, Diference - 50 + 29, 17470)
    CreateModeShovel(xCoords2, Diference * 2 - 50 - 3, 17470)
    CreateModeShovel(xCoords2, Diference * 2 - 50 + 29, 17470)

    CreateModeShovel(xCoords1, - Diference, 33150)
    CreateModeShovel(xCoords1, Diference - 50, 33150)
    CreateModeShovel(xCoords1, Diference * 2 - 50, 33150)

    local SHOVELNORTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3457)
    SHOVELNORTH:setCallback(ShovelNorthCallback)
    table.insert(ShovelHudz, SHOVELNORTH)
    local SHOVELNORTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "North", true)
    SHOVELNORTHTEXT:setColor(255, 255, 255)
    SHOVELNORTHTEXT:setFontSize(7)
    SHOVELNORTHTEXT:setCallback(ShovelNorthCallback)
    table.insert(ShovelHudz, SHOVELNORTHTEXT)

    local SHOVELNORTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3457)
    SHOVELNORTHEAST:setCallback(ShovelNorthEastCallback)
    table.insert(ShovelHudz, SHOVELNORTHEAST)
    local SHOVELNORTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NE", true)
    SHOVELNORTHEASTTEXT:setColor(255, 255, 255)
    SHOVELNORTHEASTTEXT:setFontSize(7)
    SHOVELNORTHEASTTEXT:setCallback(ShovelNorthEastCallback)
    table.insert(ShovelHudz, SHOVELNORTHEASTTEXT)

    local SHOVELEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 6 + 50, 3457)
    SHOVELEAST:setCallback(ShovelEastCallback)
    table.insert(ShovelHudz, SHOVELEAST)
    local SHOVELEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "East", true)
    SHOVELEASTTEXT:setColor(255, 255, 255)
    SHOVELEASTTEXT:setFontSize(7)
    SHOVELEASTTEXT:setCallback(ShovelEastCallback)
    table.insert(ShovelHudz, SHOVELEASTTEXT)

    local SHOVELSOUTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3457)
    SHOVELSOUTHEAST:setCallback(ShovelSouthEastCallback)
    table.insert(ShovelHudz, SHOVELSOUTHEAST)
    local SHOVELSOUTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SE", true)
    SHOVELSOUTHEASTTEXT:setColor(255, 255, 255)
    SHOVELSOUTHEASTTEXT:setFontSize(7)
    SHOVELSOUTHEASTTEXT:setCallback(ShovelSouthEastCallback)
    table.insert(ShovelHudz, SHOVELSOUTHEASTTEXT)

    local SHOVELSOUTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3457)
    SHOVELSOUTH:setCallback(ShovelSouthCallback)
    table.insert(ShovelHudz, SHOVELSOUTH)
    local SHOVELSOUTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "South", true)
    SHOVELSOUTHTEXT:setColor(255, 255, 255)
    SHOVELSOUTHTEXT:setFontSize(7)
    SHOVELSOUTHTEXT:setCallback(ShovelSouthCallback)
    table.insert(ShovelHudz, SHOVELSOUTHTEXT)

    local SHOVELSOUTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3457)
    SHOVELSOUTHWEST:setCallback(ShovelSouthWestCallback)
    table.insert(ShovelHudz, SHOVELSOUTHWEST)
    local SHOVELSOUTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SW", true)
    SHOVELSOUTHWESTTEXT:setColor(255, 255, 255)
    SHOVELSOUTHWESTTEXT:setFontSize(7)
    SHOVELSOUTHWESTTEXT:setCallback(ShovelSouthWestCallback)
    table.insert(ShovelHudz, SHOVELSOUTHWESTTEXT)

    local SHOVELWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 6 + 50, 3457)
    SHOVELWEST:setCallback(ShovelWestCallback)
    table.insert(ShovelHudz, SHOVELWEST)
    local SHOVELWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "West", true)
    SHOVELWESTTEXT:setColor(255, 255, 255)
    SHOVELWESTTEXT:setFontSize(7)
    SHOVELWESTTEXT:setCallback(ShovelWestCallback)
    table.insert(ShovelHudz, SHOVELWESTTEXT)

    local SHOVELNORTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3457)
    SHOVELNORTHWEST:setCallback(ShovelNorthWestCallback)
    table.insert(ShovelHudz, SHOVELNORTHWEST)
    local SHOVELNORTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NW", true)
    SHOVELNORTHWESTTEXT:setColor(255, 255, 255)
    SHOVELNORTHWESTTEXT:setFontSize(7)
    SHOVELNORTHWESTTEXT:setCallback(ShovelNorthWestCallback)
    table.insert(ShovelHudz, SHOVELNORTHWESTTEXT)
end

-- Função para destruir todos os HUDs
local function destroyShovelHUDS()
    for _, hud in ipairs(ShovelHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    ShovelHudz = {}
end




local RopeInHudz = {}

local hudsCreateRopeIn = false

-- Função para criar vários HUDs de texto
local function createRopeInHUDs()
    
    local function CreateModeRopeIn(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 300 + 50, spriteID)
            table.insert(RopeInHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120}
    local xCoords2 = {17, 24, 67, 74, 117, 124}
    local xCoords3 = {-7, 25, 43, 75, 93, 125}

    CreateModeRopeIn(xCoords3, - Diference, 17471)
    CreateModeRopeIn(xCoords3, Diference - 50, 17471)
    CreateModeRopeIn(xCoords3, Diference * 2 - 50, 17471)

    CreateModeRopeIn(xCoords2, - Diference - 3, 17470)
    CreateModeRopeIn(xCoords2, - Diference + 29, 17470)
    CreateModeRopeIn(xCoords2, Diference - 50 - 3, 17470)
    CreateModeRopeIn(xCoords2, Diference - 50 + 29, 17470)
    CreateModeRopeIn(xCoords2, Diference * 2 - 50 - 3, 17470)
    CreateModeRopeIn(xCoords2, Diference * 2 - 50 + 29, 17470)

    CreateModeRopeIn(xCoords1, - Diference, 33150)
    CreateModeRopeIn(xCoords1, Diference - 50, 33150)
    CreateModeRopeIn(xCoords1, Diference * 2 - 50, 33150)



    local ROPENORTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3003)
    ROPENORTH:setCallback(ROPENORTHCallback)
    table.insert(RopeInHudz, ROPENORTH)
    local ROPENORTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "North", true)
    ROPENORTHTEXT:setColor(255, 255, 255)
    ROPENORTHTEXT:setFontSize(7)
    ROPENORTHTEXT:setCallback(ROPENORTHCallback)
    table.insert(RopeInHudz, ROPENORTHTEXT)

    local ROPENORTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3003)
    ROPENORTHEAST:setCallback(RopeNorthEastCallback)
    table.insert(RopeInHudz, ROPENORTHEAST)
    local ROPENORTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NE", true)
    ROPENORTHEASTTEXT:setColor(255, 255, 255)
    ROPENORTHEASTTEXT:setFontSize(7)
    ROPENORTHEASTTEXT:setCallback(RopeNorthEastCallback)
    table.insert(RopeInHudz, ROPENORTHEASTTEXT)

    local ROPEEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 6 + 50, 3003)
    ROPEEAST:setCallback(RopeEastCallback)
    table.insert(RopeInHudz, ROPEEAST)
    local ROPEEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "East", true)
    ROPEEASTTEXT:setColor(255, 255, 255)
    ROPEEASTTEXT:setFontSize(7)
    ROPEEASTTEXT:setCallback(RopeEastCallback)
    table.insert(RopeInHudz, ROPEEASTTEXT)

    local ROPESOUTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3003)
    ROPESOUTHEAST:setCallback(RopeSouthEastCallback)
    table.insert(RopeInHudz, ROPESOUTHEAST)
    local ROPESOUTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SE", true)
    ROPESOUTHEASTTEXT:setColor(255, 255, 255)
    ROPESOUTHEASTTEXT:setFontSize(7)
    ROPESOUTHEASTTEXT:setCallback(RopeSouthEastCallback)
    table.insert(RopeInHudz, ROPESOUTHEASTTEXT)

    local ROPESOUTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3003)
    ROPESOUTH:setCallback(RopeSouthCallback)
    table.insert(RopeInHudz, ROPESOUTH)
    local ROPESOUTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "South", true)
    ROPESOUTHTEXT:setColor(255, 255, 255)
    ROPESOUTHTEXT:setFontSize(7)
    ROPESOUTHTEXT:setCallback(RopeSouthCallback)
    table.insert(RopeInHudz, ROPESOUTHTEXT)

    local ROPESOUTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 7 + 50, 3003)
    ROPESOUTHWEST:setCallback(RopeSouthWestCallback)
    table.insert(RopeInHudz, ROPESOUTHWEST)
    local ROPESOUTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 7 + 20 + 50, "SW", true)
    ROPESOUTHWESTTEXT:setColor(255, 255, 255)
    ROPESOUTHWESTTEXT:setFontSize(7)
    ROPESOUTHWESTTEXT:setCallback(RopeSouthWestCallback)
    table.insert(RopeInHudz, ROPESOUTHWESTTEXT)

    local ROPEWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 6 + 50, 3003)
    ROPEWEST:setCallback(RopeWestCallback)
    table.insert(RopeInHudz, ROPEWEST)
    local ROPEWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20 + 50, "West", true)
    ROPEWESTTEXT:setColor(255, 255, 255)
    ROPEWESTTEXT:setFontSize(7)
    ROPEWESTTEXT:setCallback(RopeWestCallback)
    table.insert(RopeInHudz, ROPEWESTTEXT)

    local ROPENORTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 50, 3003)
    ROPENORTHWEST:setCallback(RopeNorthWestCallback)
    table.insert(RopeInHudz, ROPENORTHWEST)
    local ROPENORTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 5 + 20 + 50, "NW", true)
    ROPENORTHWESTTEXT:setColor(255, 255, 255)
    ROPENORTHWESTTEXT:setFontSize(7)
    ROPENORTHWESTTEXT:setCallback(RopeNorthWestCallback)
    table.insert(RopeInHudz, ROPENORTHWESTTEXT)
end

-- Função para destruir todos os HUDs
local function destroyRopeInHUDS()
    for _, hud in ipairs(RopeInHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    RopeInHudz = {}
end

local function UseItemIDCallback()
    if not hudsCreateUseItemID then
        createUseItemIDHUDs()
        destroyRopeInHUDS()
        destroyShovelHUDS()


        hudsCreateUseItemID = true
    else
        destroyRopeInHUDS()
        destroyUseItemIDHUDs()
        destroyShovelHUDS()

        hudsCreateUseItemID = false
    end
end

local function RopeInCallback()
    if not hudsCreateRopeIn then
        destroyUseItemIDHUDs()

        -- Criar os HUDs se ainda não foram criados
        createRopeInHUDs()
        destroyShovelHUDS()

        hudsCreateRopeIn = true
    else
        destroyUseItemIDHUDs()

        destroyRopeInHUDS()
        destroyShovelHUDS()


        hudsCreateRopeIn = false
    end
end

local function ShovelCallback()
    if not hudsCreateShovel then
        destroyUseItemIDHUDs()

        -- Criar os HUDs se ainda não foram criados
        createShovelHUDs()
        destroyRopeInHUDS()
        
        hudsCreateShovel = true
    else
        destroyUseItemIDHUDs()

        destroyRopeInHUDS()
        destroyShovelHUDS()
        hudsCreateShovel = false
    end
end

local UseAllHudz = {}

local hudsCreateUseAll = false



-- Função para criar vários HUDs de texto
local function createUseAllHUDs()
    
    local function CreateModeUseAll(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 300, spriteID)
            table.insert(UseAllHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120}
    local xCoords2 = {17, 24, 67, 74, 117, 124}
    local xCoords3 = {-7, 25, 43, 75, 93, 125}

    CreateModeUseAll(xCoords3, - Diference, 17471)

--


    CreateModeUseAll(xCoords2, - Diference - 3, 17470)
    CreateModeUseAll(xCoords2, - Diference + 29, 17470)



--
    CreateModeUseAll(xCoords1,  - Diference, 33150)




    local USESHOVEL = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5, 3457)
    table.insert(UseAllHudz, USESHOVEL)
    USESHOVEL:setCallback(ShovelCallback)
    local USESHOVELTEXT = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 20, "Shovel", true); USESHOVELTEXT:setColor(255, 255, 255); USESHOVELTEXT:setFontSize(7)
    table.insert(UseAllHudz, USESHOVELTEXT)
    USESHOVELTEXT:setCallback(ShovelCallback)




    local USEROPE = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5, 3003)
    table.insert(UseAllHudz, USEROPE)
    USEROPE:setCallback(RopeInCallback)
    local USEROPETEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 26, HUD_MUDAR_Y + Diference * 5 + 20, "Rope", true); USEROPETEXT:setColor(255, 255, 255); USEROPETEXT:setFontSize(7)
    table.insert(UseAllHudz, USEROPETEXT)
    USEROPETEXT:setCallback(RopeInCallback)


    local USEItem_IDSHUD = {3456, 3308, 31296, 28477, 3032, 3030, 3033, 3029}

    -- Variável para controlar o índice atual
    local currentUSEIDIndex = 1
    
    -- Inicializa o HUD com o ID atual
    local USE_ITEM = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5, 3456)
    table.insert(UseAllHudz, USE_ITEM)
    USE_ITEM:setCallback(UseItemIDCallback)
    local USE_ITEMTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 26, HUD_MUDAR_Y + Diference * 5 + 20, "Item", true); USE_ITEMTEXT:setColor(255, 255, 255); USE_ITEMTEXT:setFontSize(7)
    table.insert(UseAllHudz, USE_ITEMTEXT)
    USE_ITEM:setCallback(UseItemIDCallback)


    
    -- Função que altera o ID do HUD
    local function changeHUDID2()
        -- Atualiza o índice do ID atual
        currentUSEIDIndex = (currentUSEIDIndex % #USEItem_IDSHUD) + 1
        -- Define o próximo ID do HUD
        local newID = USEItem_IDSHUD[currentUSEIDIndex]
        USE_ITEM:setItemId(newID)  -- Atualiza o ID do HUD
    end
    
    -- Cria um timer para alterar o ID do HUD a cada 5 segundos
    local timer = Timer.new("ChangeHUDIDTimer", changeHUDID2, 1000, true)
    
end

    local function destroyUseALLHUDS()
        for _, hud in ipairs(UseAllHudz) do
            if hud then
                hud:destroy()
            end
        end
    
        -- Limpar a tabela após destruir os HUDs
        UseAllHudz = {}
    end
    
    -- Função de callback para criar e destruir HUDs


local ClickInHudz = {}

local hudsCreateClickIn = false

-- Função para criar vários HUDs de texto
local function createClickInHUDs()
    
    local function CreateModeClickIn(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 300, spriteID)
            table.insert(ClickInHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120}
    local xCoords2 = {17, 24, 67, 74, 117, 124}
    local xCoords3 = {-7, 25, 43, 75, 93, 125}

    CreateModeClickIn(xCoords3, - Diference, 17471)

    CreateModeClickIn(xCoords3, Diference - 50, 17471)

    CreateModeClickIn(xCoords3, Diference * 2 - 50, 17471)
--


    CreateModeClickIn(xCoords2, - Diference - 3, 17470)
    CreateModeClickIn(xCoords2, - Diference + 29, 17470)

    CreateModeClickIn(xCoords2, Diference - 50 - 3, 17470)
    CreateModeClickIn(xCoords2, Diference - 50 + 29, 17470)

    CreateModeClickIn(xCoords2, Diference * 2 - 50 - 3, 17470)
    CreateModeClickIn(xCoords2, Diference * 2 - 50 + 29, 17470)

--
    CreateModeClickIn(xCoords1,  - Diference, 33150)
    CreateModeClickIn(xCoords1, Diference - 50, 33150)
    CreateModeClickIn(xCoords1, Diference * 2 - 50, 33150)



    local CLICKNORTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5, 2772)
    CLICKNORTH:setCallback(ClickNorthCallback)
    table.insert(ClickInHudz, CLICKNORTH)
    local CLICKNORTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 5 + 20, "North", true)
    CLICKNORTHTEXT:setColor(255, 255, 255)
    CLICKNORTHTEXT:setFontSize(7)
    CLICKNORTHTEXT:setCallback(ClickNorthCallback)
    table.insert(ClickInHudz, CLICKNORTHTEXT)

    local CLICKNORTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5, 2772)
    CLICKNORTHEAST:setCallback(ClickNorthEastCallback)
    table.insert(ClickInHudz, CLICKNORTHEAST)
    local CLICKNORTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 5 + 20, "NE", true)
    CLICKNORTHEASTTEXT:setColor(255, 255, 255)
    CLICKNORTHEASTTEXT:setFontSize(7)
    CLICKNORTHEASTTEXT:setCallback(ClickNorthEastCallback)
    table.insert(ClickInHudz, CLICKNORTHEASTTEXT)

    local CLICKEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 6, 2772)
    CLICKEAST:setCallback(ClickEastCallback)
    table.insert(ClickInHudz, CLICKEAST)
    local CLICKEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20, "East", true)
    CLICKEASTTEXT:setColor(255, 255, 255)
    CLICKEASTTEXT:setFontSize(7)
    CLICKEASTTEXT:setCallback(ClickEastCallback)
    table.insert(ClickInHudz, CLICKEASTTEXT)

    local CLICKSOUTHEAST = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 7, 2772)
    CLICKSOUTHEAST:setCallback(ClickSouthEastCallback)
    table.insert(ClickInHudz, CLICKSOUTHEAST)
    local CLICKSOUTHEASTTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30 + 10, HUD_MUDAR_Y + Diference * 7 + 20, "SE", true)
    CLICKSOUTHEASTTEXT:setColor(255, 255, 255)
    CLICKSOUTHEASTTEXT:setFontSize(7)
    CLICKSOUTHEASTTEXT:setCallback(ClickSouthEastCallback)
    table.insert(ClickInHudz, CLICKSOUTHEASTTEXT)

    local CLICKSOUTH = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 7, 2772)
    CLICKSOUTH:setCallback(ClickSouthCallback)
    table.insert(ClickInHudz, CLICKSOUTH)
    local CLICKSOUTHTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30 + 3, HUD_MUDAR_Y + Diference * 7 + 20, "South", true)
    CLICKSOUTHTEXT:setColor(255, 255, 255)
    CLICKSOUTHTEXT:setFontSize(7)
    CLICKSOUTHTEXT:setCallback(ClickSouthCallback)
    table.insert(ClickInHudz, CLICKSOUTHTEXT)

    local CLICKSOUTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 7, 2772)
    CLICKSOUTHWEST:setCallback(ClickSouthWestCallback)
    table.insert(ClickInHudz, CLICKSOUTHWEST)
    local CLICKSOUTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 7 + 20, "SW", true)
    CLICKSOUTHWESTTEXT:setColor(255, 255, 255)
    CLICKSOUTHWESTTEXT:setFontSize(7)
    CLICKSOUTHWESTTEXT:setCallback(ClickSouthWestCallback)
    table.insert(ClickInHudz, CLICKSOUTHWESTTEXT)

    local CLICKWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 6, 2772)
    CLICKWEST:setCallback(ClickWestCallback)
    table.insert(ClickInHudz, CLICKWEST)
    local CLICKWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 3, HUD_MUDAR_Y + Diference * 6 + 20, "West", true)
    CLICKWESTTEXT:setColor(255, 255, 255)
    CLICKWESTTEXT:setFontSize(7)
    CLICKWESTTEXT:setCallback(ClickWestCallback)
    table.insert(ClickInHudz, CLICKWESTTEXT)

    local CLICKNORTHWEST = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5, 2772)
    CLICKNORTHWEST:setCallback(ClickNorthWestCallback)
    table.insert(ClickInHudz, CLICKNORTHWEST)
    local CLICKNORTHWESTTEXT = HUD.new(HUD_MUDAR_X + Diference - 30 + 7, HUD_MUDAR_Y + Diference * 5 + 20, "NW", true)
    CLICKNORTHWESTTEXT:setColor(255, 255, 255)
    CLICKNORTHWESTTEXT:setFontSize(7)
    CLICKNORTHWESTTEXT:setCallback(ClickNorthWestCallback)
    table.insert(ClickInHudz, CLICKNORTHWESTTEXT)



end
-- Função para destruir todos os HUDs
local function destroyClickInHUDS()
    for _, hud in ipairs(ClickInHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    ClickInHudz = {}
end

local function UseAllCallback()
    if not hudsCreateUseAll then

        -- Criar os HUDs se ainda não foram criados
        createUseAllHUDs()
        destroyClickInHUDS()
        destroyShovelHUDS()
        destroyRopeInHUDS()
        destroyUseItemIDHUDs()
        
        hudsCreateUseAll = true
    else
        -- Destruir os HUDs se já foram criados
        destroyUseALLHUDS()
        destroyClickInHUDS()
        destroyShovelHUDS()
        destroyRopeInHUDS()
        destroyUseItemIDHUDs()


          
        hudsCreateUseAll = false
    end
end
-- Função de callback para criar e destruir HUDs
local function ClickInCallback()
    if not hudsCreateClickIn then

        -- Criar os HUDs se ainda não foram criados
        createClickInHUDs()
        destroyUseALLHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyUseItemIDHUDs()
        
        hudsCreateClickIn = true
    else
        destroyUseALLHUDS()
        destroyClickInHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyUseItemIDHUDs()



        
        hudsCreateClickIn = false
    end
end

local PortasHudz = {}

-- Estado para verificar se os PortasHudz foram criados
local hudsCreatePortas = false

-- Função para criar vários HUDs de texto
local function createPortasHUDs()
    
    local function CreateModelTravel(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
            table.insert(PortasHudz, hud)
        end
    end

    local xCoords1 = {285, 315}
    local xCoords2 = {285, 315}
    local xCoords3 = {257, 320}

    CreateModelTravel(xCoords3, Diference + 5, 17471)
    CreateModelTravel(xCoords3, Diference + 30, 17471)

    CreateModelTravel(xCoords3, Diference * 2 + 20, 17471)
    CreateModelTravel(xCoords3, Diference * 2 + 45, 17471)

    CreateModelTravel(xCoords3, Diference * 3 + 20 + 15, 17471)
    CreateModelTravel(xCoords3, Diference * 3 + 45 + 15, 17471)
--


    CreateModelTravel(xCoords2, Diference + 5, 17470)
    CreateModelTravel(xCoords2, Diference + 55, 17470)

    CreateModelTravel(xCoords2, Diference * 2 + 5 + 15, 17470)
    CreateModelTravel(xCoords2, Diference * 2 + 55 + 15, 17470)

    CreateModelTravel(xCoords2, Diference * 3 + 5 + 30, 17470)
    CreateModelTravel(xCoords2, Diference * 3 + 55 + 30, 17470)

--
    CreateModelTravel(xCoords1, Diference + 10, 33150)
    CreateModelTravel(xCoords1, Diference + 25, 33150)

    CreateModelTravel(xCoords1, Diference * 2 + 10 + 15, 33150)
    CreateModelTravel(xCoords1, Diference * 2 + 25 + 15, 33150)

    CreateModelTravel(xCoords1, Diference * 3 + 10 + 30, 33150)
    CreateModelTravel(xCoords1, Diference * 3 + 25 + 30, 33150)






local function OPENDOORCALLBACK()
    MARCARTALK(0, 0, 'USE_LEVER', 'DELAY_FUNCOES', 'function() findAndOpenDoor() end', "Open Door")
    Client.showMessage("Add: Pass/Open Door")
end


-- Definindo a tabela com os IDs dos itens
local Item_IDSHUD = {3003, 5710, 3456, 3308, 31296, 28477, 3032, 3030, 3033, 3029}

-- Variável para controlar o índice atual
local currentIDIndex = 1

-- Inicializa o HUD com o ID atual
local SHOVELHUD = HUD.new(HUD_MUDAR_X + Diference * 5 + 50, HUD_MUDAR_Y + Diference * 4 - 5, Item_IDSHUD[currentIDIndex])

-- Função que altera o ID do HUD
local function changeHUDID()
    -- Atualiza o índice do ID atual
    currentIDIndex = (currentIDIndex % #Item_IDSHUD) + 1
    -- Define o próximo ID do HUD
    local newID = Item_IDSHUD[currentIDIndex]
    SHOVELHUD:setItemId(newID)  -- Atualiza o ID do HUD
end

-- Cria um timer para alterar o ID do HUD a cada 5 segundos
local timer = Timer.new("ChangeHUDIDTimer", changeHUDID, 1000, true)

    SHOVELHUD:setCallback(UseAllCallback)
    table.insert(PortasHudz, SHOVELHUD)
    local SHOVELHUDTEXT = HUD.new(HUD_MUDAR_X + Diference * 5 + 40, HUD_MUDAR_Y + Diference * 4 + 25, "USE ITEM", true); SHOVELHUDTEXT:setColor(255, 255, 255); SHOVELHUDTEXT:setFontSize(7)
    SHOVELHUDTEXT:setCallback(UseAllCallback)
    table.insert(PortasHudz, SHOVELHUDTEXT)

    
    local OPENDOORHUD = HUD.new(HUD_MUDAR_X + Diference * 5 + 40, HUD_MUDAR_Y + Diference + 5, 9355, true); OPENDOORHUD:setSize(50, 50)
    OPENDOORHUD:setCallback(OPENDOORCALLBACK)
    table.insert(PortasHudz, OPENDOORHUD)
    local OPENDOORHUDTEXT = HUD.new(HUD_MUDAR_X + Diference * 5 + 35, HUD_MUDAR_Y + Diference + 45, "OPEN DOOR", true); OPENDOORHUDTEXT:setColor(255, 255, 255); OPENDOORHUDTEXT:setFontSize(7)
    OPENDOORHUDTEXT:setCallback(OPENDOORCALLBACK)
    table.insert(PortasHudz, OPENDOORHUDTEXT)

    local ALLCLICK = HUD.new(HUD_MUDAR_X + Diference * 6, HUD_MUDAR_Y + Diference * 2 + 30, 2772, true); ALLCLICK:setSize(70, 70)
    ALLCLICK:setCallback(ClickInCallback)
    table.insert(PortasHudz, ALLCLICK)
    local ALLCLICKTEXT = HUD.new(HUD_MUDAR_X + Diference * 6 - 5, HUD_MUDAR_Y + Diference * 2 + 60, "CLICK IN", true); ALLCLICKTEXT:setColor(255, 255, 255); ALLCLICKTEXT:setFontSize(7)
    ALLCLICKTEXT:setCallback(ClickInCallback)
    table.insert(PortasHudz, ALLCLICKTEXT)
    
   
end

local function Equipe1Callback()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "EQUIP 1")
    Client.showMessage("Add: Profile Equipment 1")
end
local function Equip2Callback()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "EQUIP 2")
    Client.showMessage("Add: Profile Equipment 2")
end
local function Magic1Callback()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "MAGIC 1")
    Client.showMessage("Add: Profile MagicShooter 1")
end
local function Magic2Callback()
    MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "MAGIC 2")
    Client.showMessage("Add: Profile MagicShooter 2")
end

local ProfileHudz = {}

local hudsCreateProfile = false

-- Função para criar vários HUDs de texto
local function createProfileHUDs()
    
    local function CreateModeProfile(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y + 300 + 100, spriteID)
            table.insert(ProfileHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120, 170}
    local xCoords2 = {17, 24, 67, 74, 117, 124, 167, 174}
    local xCoords3 = {-7, 25, 43, 75, 93, 125, 143, 175}

    CreateModeProfile(xCoords3, - Diference, 17471)


    CreateModeProfile(xCoords2, - Diference - 3, 17470)
    CreateModeProfile(xCoords2, - Diference + 29, 17470)



    CreateModeProfile(xCoords1, - Diference, 33150)


    local EQUIP1 = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 100, 43864)
    EQUIP1:setCallback(Equipe1Callback)
    table.insert(ProfileHudz, EQUIP1)
    local EQUIP1TEXT = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 20 + 100, "Equip1", true)
    EQUIP1TEXT:setColor(255, 255, 255)
    EQUIP1TEXT:setFontSize(7)
    EQUIP1TEXT:setCallback(Equipe1Callback)
    table.insert(ProfileHudz, EQUIP1TEXT)

    local EQUIP2 = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 100, 43864)
    EQUIP2:setCallback(Equip2Callback)
    table.insert(ProfileHudz, EQUIP2)
    local EQUIP2TEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 20 + 100, "Equip2", true)
    EQUIP2TEXT:setColor(255, 255, 255)
    EQUIP2TEXT:setFontSize(7)
    EQUIP2TEXT:setCallback(Equip2Callback)
    table.insert(ProfileHudz, EQUIP2TEXT)

    local MAGIC1 = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5 + 100, 43885)
    MAGIC1:setCallback(Magic1Callback)
    table.insert(ProfileHudz, MAGIC1)
    local MAGIC1TEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5 + 20 + 100, "Magic1", true)
    MAGIC1TEXT:setColor(255, 255, 255)
    MAGIC1TEXT:setFontSize(7)
    MAGIC1TEXT:setCallback(Magic1Callback)
    table.insert(ProfileHudz, MAGIC1TEXT)

    local MAGIC2 = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 100, 43885)
    MAGIC2:setCallback(Magic2Callback)
    table.insert(ProfileHudz, MAGIC2)
    local MAGIC2TEXT = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 20 + 100, "Magic2", true)
    MAGIC2TEXT:setColor(255, 255, 255)
    MAGIC2TEXT:setFontSize(7)
    MAGIC2TEXT:setCallback(Magic2Callback)
    table.insert(ProfileHudz, MAGIC2TEXT)

end

-- Função para destruir todos os HUDs
local function destroyProfileHUDS()
    for _, hud in ipairs(ProfileHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    ProfileHudz = {}
end

local function ProfileCallback()
    if not hudsCreateProfile then

        -- Criar os HUDs se ainda não foram criados
        createProfileHUDs()
        
        hudsCreateProfile = true
    else
        destroyProfileHUDS()
        hudsCreateProfile = false
    end
end

------------------
local ExtraHudz = {}

-- Estado para verificar se os ExtraHudz foram criados
local hudsCreateExtras = false

-- Função para criar vários HUDs de texto
local function createExtrasHUDs()
    local function CreateModeExtras(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
            table.insert(ExtraHudz, hud)
        end
    end

    local xCoords1 = {20, 70, 120, 170, 220}
    local xCoords2 = {18, 23, 68, 73, 118, 123, 168, 173, 218, 223}
    local xCoords3 = {-6, 24, 44, 74, 94, 124, 144, 174, 194, 224}

    CreateModeExtras(xCoords3, Diference * 5, 17471)
    CreateModeExtras(xCoords3, Diference * 5 + 50, 17471)
    CreateModeExtras(xCoords2, Diference * 5 - 3, 17470)
    CreateModeExtras(xCoords2, Diference * 5 + 30, 17470)
    CreateModeExtras(xCoords2, Diference * 5 - 3 + 50, 17470)
    CreateModeExtras(xCoords2, Diference * 5 + 80, 17470)
    CreateModeExtras(xCoords1, Diference * 5, 33150)
    CreateModeExtras(xCoords1, Diference * 6, 33150)

    local function STONERUBINOTCALLBACK()
        MARCARTALK(0, 0, 'USE_LEVER', 'DELAY_FUNCOES', 'function() AdventurersRubinot() end', "Adventurers RUBINOT")
        Client.showMessage("Add: Adventurers Rubinot")
    end

    local function STONECALLBACK()
        MARCARTALK(0, 0, 'USE_LEVER', 'DELAY_FUNCOES', 'function() Game.useItem(16277) end', "Adventurers Stone")
        Client.showMessage("Add: Adventurers Stone")
    end


    local function WAITPKCallback()
        MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "CHECK PK")
        Client.showMessage("Add: Wait PK")
    end

    local function DEPOSITITEMCallback()
        MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "DEPOSIT ITEM")
        Client.showMessage("Add: Deposit Item")
    end

    local function CHECKSUPPLIESCallback()
        MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "CHECK SUPPLIES")
        Client.showMessage("Add: Check Supplies")
    end

    local function ENDREFILCallback()
        MARCARTALK(0, 0, 'NODE', 'SINGLE_STEP_DELAY', 'nil', "REFIL FINALIZADO")
        Client.showMessage("Add: Refil Finalizado")
    end

    local function HURUPCallback()
        MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() castHurUp() end', "EXANI HUR UP")
        Client.showMessage("Add: Exani Hur Up")
    end

    local function HURDOWNCallback()
        MARCARTALK(0, 0, 'TALK', 'SINGLE_STEP_DELAY', 'function() castHurDown() end', "EXANI HUR DOWN")
        Client.showMessage("Add: Exani Hur Down")
    end

    local function FORGECallback()
        MARCARTALK(0, 0, 'USE_LEVER', 'DELAY_FUNCOES', 'function() findAndClickForge() end', "Convert Forge")
        Client.showMessage("Add: Convert Forge")
    end

    local HURDOWN = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 6, 36978)
    HURDOWN:setCallback(HURDOWNCallback)
    table.insert(ExtraHudz, HURDOWN)
    local HURDOWNTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 23, HUD_MUDAR_Y + Diference * 6 + 10, "Hur", true)
    HURDOWNTEXT:setColor(255, 255, 255)
    HURDOWNTEXT:setFontSize(7)
    HURDOWNTEXT:setCallback(HURDOWNCallback)
    table.insert(ExtraHudz, HURDOWNTEXT)
    local HURDOWNTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 28, HUD_MUDAR_Y + Diference * 6 + 20, "Down", true)
    HURDOWNTEXT:setColor(255, 255, 255)
    HURDOWNTEXT:setFontSize(7)
    HURDOWNTEXT:setCallback(HURDOWNCallback)
    table.insert(ExtraHudz, HURDOWNTEXT)

    local HURUP = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5, 36978)
    HURUP:setCallback(HURUPCallback)
    table.insert(ExtraHudz, HURUP)
    local HURUPTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 23, HUD_MUDAR_Y + Diference * 5 + 10, "Hur", true)
    HURUPTEXT:setColor(255, 255, 255)
    HURUPTEXT:setFontSize(7)
    HURUPTEXT:setCallback(HURUPCallback)
    table.insert(ExtraHudz, HURUPTEXT)    local HURUPTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 22, HUD_MUDAR_Y + Diference * 5 + 20, "Up", true)
    HURUPTEXT:setColor(255, 255, 255)
    HURUPTEXT:setFontSize(7)
    HURUPTEXT:setCallback(HURUPCallback)
    table.insert(ExtraHudz, HURUPTEXT)

    local ENDREFIL = HUD.new(HUD_MUDAR_X + Diference * 5 - 30, HUD_MUDAR_Y + Diference * 6, 34266)
    ENDREFIL:setCallback(ENDREFILCallback)
    table.insert(ExtraHudz, ENDREFIL)
    local ENDREFILTEXT = HUD.new(HUD_MUDAR_X + Diference * 5 - 25, HUD_MUDAR_Y + Diference * 6 + 10, "END", true)
    ENDREFILTEXT:setColor(255, 255, 255)
    ENDREFILTEXT:setFontSize(7)
    ENDREFILTEXT:setCallback(ENDREFILCallback)
    table.insert(ExtraHudz, ENDREFILTEXT)
    local CHECKSUPPLIESTEXT2 = HUD.new(HUD_MUDAR_X + Diference * 5 - 27, HUD_MUDAR_Y + Diference * 6 + 20, "REFIL", true)
    CHECKSUPPLIESTEXT2:setColor(255, 255, 255)
    CHECKSUPPLIESTEXT2:setFontSize(7)
    CHECKSUPPLIESTEXT2:setCallback(ENDREFILCallback)
    table.insert(ExtraHudz, CHECKSUPPLIESTEXT2)

    local FORGEHUD = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5, 37110)
    FORGEHUD:setCallback(FORGECallback)
    table.insert(ExtraHudz, FORGEHUD)
    local FORGEHUDTEXT = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 20, "FORGE", true)
    FORGEHUDTEXT:setColor(255, 255, 255)
    FORGEHUDTEXT:setFontSize(7)
    FORGEHUDTEXT:setCallback(FORGECallback)
    table.insert(ExtraHudz, FORGEHUDTEXT)

    local EQUIPSWITCH = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 50, 43864)
    EQUIPSWITCH:setCallback(ProfileCallback)
    table.insert(ExtraHudz, EQUIPSWITCH)
    local EQUIPSWITCHTEXT = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 60, "Profile", true)
    EQUIPSWITCHTEXT:setColor(255, 255, 255)
    EQUIPSWITCHTEXT:setFontSize(7)
    EQUIPSWITCHTEXT:setCallback(ProfileCallback)
    table.insert(ExtraHudz, EQUIPSWITCHTEXT)
    local EQUIPSWITCHTEXT2 = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5 + 70, "Switch", true)
    EQUIPSWITCHTEXT2:setColor(255, 255, 255)
    EQUIPSWITCHTEXT2:setFontSize(7)
    EQUIPSWITCHTEXT2:setCallback(ProfileCallback)
    table.insert(ExtraHudz, EQUIPSWITCHTEXT2)

    local CHECKSUPPLIES = HUD.new(HUD_MUDAR_X + Diference * 5 - 30, HUD_MUDAR_Y + Diference * 5, 23375)
    CHECKSUPPLIES:setCallback(CHECKSUPPLIESCallback)
    table.insert(ExtraHudz, CHECKSUPPLIES)
    local CHECKSUPPLIESTEXT = HUD.new(HUD_MUDAR_X + Diference * 5 - 30, HUD_MUDAR_Y + Diference * 5 + 20, "CHECK", true)
    CHECKSUPPLIESTEXT:setColor(255, 255, 255)
    CHECKSUPPLIESTEXT:setFontSize(7)
    CHECKSUPPLIESTEXT:setCallback(CHECKSUPPLIESCallback)
    table.insert(ExtraHudz, CHECKSUPPLIESTEXT)

    local STONE = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5, 16277)
    STONE:setCallback(STONECALLBACK)
    table.insert(ExtraHudz, STONE)
    local STONETEXT = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 20, "STONE", true)
    STONETEXT:setColor(255, 255, 255)
    STONETEXT:setFontSize(7)
    STONETEXT:setCallback(STONECALLBACK)
    table.insert(ExtraHudz, STONETEXT)

    local STONERUBINOT = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 6, 16277)
    STONERUBINOT:setCallback(STONERUBINOTCALLBACK)
    table.insert(ExtraHudz, STONERUBINOT)
    local STONERUBINOTTEXT = HUD.new(HUD_MUDAR_X + Diference - 33, HUD_MUDAR_Y + Diference * 6 + 20, "RUBINI", true)
    STONERUBINOTTEXT:setColor(255, 255, 255)
    STONERUBINOTTEXT:setFontSize(7)
    STONERUBINOTTEXT:setCallback(STONERUBINOTCALLBACK)
    table.insert(ExtraHudz, STONERUBINOTTEXT)

    local DEPOSITITEM = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 6, 3502)
    DEPOSITITEM:setCallback(DEPOSITITEMCallback)
    table.insert(ExtraHudz, DEPOSITITEM)
    local DEPOSITITEMTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 33, HUD_MUDAR_Y + Diference * 6 + 20, "Dep Iten", true)
    DEPOSITITEMTEXT:setColor(255, 255, 255)
    DEPOSITITEMTEXT:setFontSize(7)
    DEPOSITITEMTEXT:setCallback(DEPOSITITEMCallback)
    table.insert(ExtraHudz, DEPOSITITEMTEXT)

    local WAITPK = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 - 5, 37337)
    WAITPK:setCallback(WAITPKCallback)
    table.insert(ExtraHudz, WAITPK)
    local WAITPKTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 20, "WaitPK", true)
    WAITPKTEXT:setColor(255, 255, 255)
    WAITPKTEXT:setFontSize(7)
    WAITPKTEXT:setCallback(WAITPKCallback)
    table.insert(ExtraHudz, WAITPKTEXT)
end

local ClickInHudz = {}

local hudsCreateClickIn = false

-- Função para criar vários HUDs de texto
local function createClickInHUDs()
    
    local function CreateModeClickIn(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
            table.insert(ClickInHudz, hud)
        end
    end

    local xCoords1 = {285, 315}
    local xCoords2 = {285, 315}
    local xCoords3 = {257, 320}

    CreateModeClickIn(xCoords3, Diference + 5, 17471)
    CreateModeClickIn(xCoords3, Diference + 30, 17471)

    CreateModeClickIn(xCoords3, Diference * 2 + 20, 17471)
    CreateModeClickIn(xCoords3, Diference * 2 + 45, 17471)

    CreateModeClickIn(xCoords3, Diference * 3 + 20 + 15, 17471)
    CreateModeClickIn(xCoords3, Diference * 3 + 45 + 15, 17471)
--


    CreateModeClickIn(xCoords2, Diference + 5, 17470)
    CreateModeClickIn(xCoords2, Diference + 55, 17470)

    CreateModeClickIn(xCoords2, Diference * 2 + 5 + 15, 17470)
    CreateModeClickIn(xCoords2, Diference * 2 + 55 + 15, 17470)

    CreateModeClickIn(xCoords2, Diference * 3 + 5 + 30, 17470)
    CreateModeClickIn(xCoords2, Diference * 3 + 55 + 30, 17470)

--
    CreateModeClickIn(xCoords1, Diference + 10, 33150)
    CreateModeClickIn(xCoords1, Diference + 25, 33150)

    CreateModeClickIn(xCoords1, Diference * 2 + 10 + 15, 33150)
    CreateModeClickIn(xCoords1, Diference * 2 + 25 + 15, 33150)

    CreateModeClickIn(xCoords1, Diference * 3 + 10 + 30, 33150)
    CreateModeClickIn(xCoords1, Diference * 3 + 25 + 30, 33150)



    local function LOOTSELLCallback()
        MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() SellAllItens() end', "Sell All Itens")
        Client.showMessage("Add: Vender Loot")
    end

    local function ENCHANTITEMCallback()
        MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() EnchantItem() end', "ENCHANT ITEM")
        Client.showMessage("Add: Enchant Itens")
    end

    local LOOTSELL = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 - 5, 3043)
    LOOTSELL:setCallback(LOOTSELLCallback)
    table.insert(ClickInHudz, LOOTSELL)
    local LOOTSELLTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 20, "Sell All", true)
    LOOTSELLTEXT:setColor(255, 255, 255)
    LOOTSELLTEXT:setFontSize(7)
    LOOTSELLTEXT:setCallback(LOOTSELLCallback)
    table.insert(ClickInHudz, LOOTSELLTEXT)


end



-- Função para destruir todos os HUDs
local function destroyExtrasHUDs()
    for _, hud in ipairs(ExtraHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    ExtraHudz = {}
end

local NpcHudz = {}

local hudsCreateNPC = false

-- Função para criar vários HUDs de texto
local function createNPCHUDs()
    
    local function CreateModeNPC(xCoords, y, spriteID)
        for _, x in ipairs(xCoords) do
            local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
            table.insert(NpcHudz, hud)
        end
    end



    local xCoords1 = {20, 70, 120, 170}
    local xCoords2 = {18, 23, 68, 73, 118, 123, 168, 173}
    local xCoords3 = {-6, 24, 44, 74, 94, 124, 144, 174}

    CreateModeNPC(xCoords3, Diference * 5, 17471)
    CreateModeNPC(xCoords2, Diference * 5 - 3, 17470)
    CreateModeNPC(xCoords2, Diference * 5 + 30, 17470)
    CreateModeNPC(xCoords1, Diference * 5, 33150)



    local function LOOTSELLCallback()
        MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() SellAllItens() end', "Sell All Itens")
        Client.showMessage("Add: Vender Loot")
    end

    local function DEPOSITALLCallback()
        MARCARTALK(0, 0, 'NODE', 'DELAY_FUNCOES', 'nil', "Deposit All")
        Client.showMessage("Add: Deposit All")
    end

    local function REFILSUPPLIESCallback()
        MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() refillSupplies() end', "Refill Supplies")
        Client.showMessage("Add: Refil Supplies")
    end

    local function ENCHANTITEMCallback()
        MARCARTALK(0, 0, 'TALK', 'DELAY_FUNCOES', 'function() EnchantItem() end', "ENCHANT ITEM")
        Client.showMessage("Add: Enchant Itens")
    end



    local LOOTSELL = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 - 5, 3043)
    LOOTSELL:setCallback(LOOTSELLCallback)
    table.insert(NpcHudz, LOOTSELL)
    local LOOTSELLTEXT = HUD.new(HUD_MUDAR_X + Diference - 30, HUD_MUDAR_Y + Diference * 5 + 20, "Sell All", true)
    LOOTSELLTEXT:setColor(255, 255, 255)
    LOOTSELLTEXT:setFontSize(7)
    LOOTSELLTEXT:setCallback(LOOTSELLCallback)
    table.insert(NpcHudz, LOOTSELLTEXT)

    local DEPOSITALL = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5, 5675)
    DEPOSITALL:setCallback(DEPOSITALLCallback)
    table.insert(NpcHudz, DEPOSITALL)
    local DEPOSITALLTEXT = HUD.new(HUD_MUDAR_X + Diference * 2 - 30, HUD_MUDAR_Y + Diference * 5 + 20, "Dep All", true)
    DEPOSITALLTEXT:setColor(255, 255, 255)
    DEPOSITALLTEXT:setFontSize(7)
    DEPOSITALLTEXT:setCallback(DEPOSITALLCallback)
    table.insert(NpcHudz, DEPOSITALLTEXT)

    local REFILSUPPLIES = HUD.new(HUD_MUDAR_X + Diference * 3 - 30, HUD_MUDAR_Y + Diference * 5, 35901)
    REFILSUPPLIES:setCallback(REFILSUPPLIESCallback)
    table.insert(NpcHudz, REFILSUPPLIES)
    local REFILSUPPLIESTEXT = HUD.new(HUD_MUDAR_X + Diference * 3 - 28, HUD_MUDAR_Y + Diference * 5 + 20, "REFIL", true)
    REFILSUPPLIESTEXT:setColor(255, 255, 255)
    REFILSUPPLIESTEXT:setFontSize(7)
    REFILSUPPLIESTEXT:setCallback(REFILSUPPLIESCallback)
    table.insert(NpcHudz, REFILSUPPLIESTEXT)

    local REFILENCHANT = HUD.new(HUD_MUDAR_X + Diference * 4 - 30, HUD_MUDAR_Y + Diference * 5, 22516)
    REFILENCHANT:setCallback(ENCHANTITEMCallback)
    table.insert(NpcHudz, REFILENCHANT)
    local REFILENCHANTTEXT = HUD.new(HUD_MUDAR_X + Diference * 4 - 33, HUD_MUDAR_Y + Diference * 5 + 20, "Enchant", true)
    REFILENCHANTTEXT:setColor(255, 255, 255)
    REFILENCHANTTEXT:setFontSize(7)
    REFILENCHANTTEXT:setCallback(ENCHANTITEMCallback)
    table.insert(NpcHudz, REFILENCHANTTEXT)
end
-- Função para destruir todos os HUDs
local function destroyNPCHUDS()
    for _, hud in ipairs(NpcHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    NpcHudz = {}
end

------------------------- Função para destruir todos os HUDs
local function destroyPortasHUDS()
    for _, hud in ipairs(PortasHudz) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    PortasHudz = {}
end

-- Função de callback para criar e destruir HUDs



-- Função para destruir todos os HUDs
local function destroyTravelHUDS()
    for _, hud in ipairs(huds) do
        if hud then
            hud:destroy()
        end
    end

    -- Limpar a tabela após destruir os HUDs
    huds = {}
end

-- Função de callback para criar e destruir HUDs
local function TravelCallback()
    if not hudsCreated then
        destroyPortasHUDS()        -- Criar os HUDs se ainda não foram criados
        createTextHUDs()
        destroyClickInHUDS()
        destroyUseALLHUDS()
        destroyRopeInHUDS()
        destroyUseItemIDHUDs()


        hudsCreated = true
    else
        destroyUseItemIDHUDs()

        destroyPortasHUDS()
        destroyTravelHUDS()
        destroyClickInHUDS()
        destroyUseALLHUDS()
        destroyRopeInHUDS()


        
        hudsCreated = false
    end
end



local function PortasCallback()
    if not hudsCreatePortas then
        createPortasHUDs()
        destroyTravelHUDS()
        destroyProfileHUDS()
        destroyUseItemIDHUDs()

        hudsCreatePortas = true
    else
        destroyUseItemIDHUDs()

        destroyUseALLHUDS()
        destroyPortasHUDS()
        destroyTravelHUDS()
        destroyClickInHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyProfileHUDS()

        hudsCreatePortas = false
    end
end


local function NPCCallback()
    if not hudsCreateNPC then
        destroyUseALLHUDS()
        destroyExtrasHUDs()
        destroyClickInHUDS()
        createNPCHUDs()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyProfileHUDS()
        destroyUseItemIDHUDs()


        hudsCreateNPC = true
    else
        destroyUseItemIDHUDs()

        destroyExtrasHUDs()
        destroyClickInHUDS()
        destroyNPCHUDS()
        destroyUseALLHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyProfileHUDS()


        
        hudsCreateNPC = false
    end
end


local function ExtrasCallback()
    if not hudsCreateExtras then
        destroyNPCHUDS()
        destroyClickInHUDS()
        destroyUseALLHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyProfileHUDS()
        destroyUseItemIDHUDs()




        -- Criar os HUDs se ainda não foram criados
        createExtrasHUDs()
        hudsCreateExtras = true
    else
        destroyUseItemIDHUDs()

        destroyNPCHUDS()
        destroyRopeInHUDS()
        destroyShovelHUDS()
        destroyProfileHUDS()
        destroyClickInHUDS()
        destroyUseALLHUDS()



        -- Destruir os HUDs se já foram criados
        destroyExtrasHUDs()
        hudsCreateExtras = false
    end
end



-- Função para criar HUDs a partir das coordenadas
local function CONFIGHUDS(xCoords, y, spriteID)
    for _, x in ipairs(xCoords) do
        local hud = HUD.new(x + HUD_MUDAR_X, y + HUD_MUDAR_Y, spriteID)
        table.insert(createdHUDs, hud)  -- Adiciona o HUD criado à lista
    end
end

-- Configuração dos HUDs com coordenadas fornecidas
local xCoords3 = {}
local xCoords2 = {187, 241}
local xCoords11 = {211, 241}
local xCoords1 = {215, 235}


-- Função para criar e exibir os HUDs
local function toggleHUDs()
    if #createdHUDs > 0 then
        -- Se os HUDs já foram criados, destrua-os
        for _, hud in ipairs(createdHUDs) do
            destroyExtrasHUDs()
            destroyPortasHUDS()
            destroyTravelHUDS()
            destroyNPCHUDS()
            destroyClickInHUDS()
            destroyUseALLHUDS()
            destroyRopeInHUDS()
            destroyShovelHUDS()
            destroyProfileHUDS()
            destroyUseItemIDHUDs()




            hud:destroy()
        end
        createdHUDs = {}  -- Limpa a lista de HUDs criados
    else
        -- Se os HUDs não foram criados, crie-os

        -- Crie os HUDs com IDs usando CONFIGHUDS
        CONFIGHUDS(xCoords11, baseY - Diference * 2 + 5, 17470)
        CONFIGHUDS(xCoords11, baseY - Diference * 2 + 37, 17470)
        CONFIGHUDS(xCoords2, baseY - Diference * 2 + 10, 17471)
        CONFIGHUDS(xCoords1, baseY - Diference * 2 + 10, 33150)

        CONFIGHUDS(xCoords11, baseY - Diference + 5 - 8, 17470)
        CONFIGHUDS(xCoords11, baseY - Diference + 37 - 8, 17470)
        CONFIGHUDS(xCoords2, baseY - Diference + 10 - 8, 17471)
        CONFIGHUDS(xCoords1, baseY - Diference + 10 - 10, 33150)

        CONFIGHUDS(xCoords11, baseY + 5 - 8, 17470)
        CONFIGHUDS(xCoords11, baseY + 37 - 8, 17470)
        CONFIGHUDS(xCoords2, baseY + 10 - 8, 17471)
        CONFIGHUDS(xCoords1, baseY + 10 - 10, 33150)

        CONFIGHUDS(xCoords11, baseY + Diference + 5 - 8, 17470)
        CONFIGHUDS(xCoords11, baseY + Diference + 37 - 8, 17470)
        CONFIGHUDS(xCoords2, baseY + Diference + 10 - 8, 17471)
        CONFIGHUDS(xCoords1, baseY + Diference + 10 - 10, 33150)




        -- Crie os novos HUDs de texto e adicione-os à lista
        local newHudConfigs = {
            {name = "TRAVEL", x = baseX + 155, y = baseY - Diference * 2, spriteID = "TRAVEL", callback = TravelCallback},
            {name = "PORTAS", x = baseX + 155, y = baseY - Diference - 17, spriteID = "PORTAS", callback = PortasCallback},
            {name = "CLICKS", x = baseX + 155, y = baseY - Diference - 3, spriteID = "CLICKS", callback = PortasCallback},

            {name = "TALK", x = baseX + 155, y = baseY - 15, spriteID = "TALK", callback = NPCCallback},
            {name = "NPC", x = baseX + 155, y = baseY - 3, spriteID = "NPC", callback = NPCCallback},
            {name = "EXTRAS", x = baseX + 155, y = baseY + Diference - 10, spriteID = "EXTRAS", callback = ExtrasCallback}
        }

        -- Crie os novos HUDs de texto e adicione-os à lista
        for _, config in ipairs(newHudConfigs) do
            local hud = createHUD(config.name, config.x + HUD_MUDAR_X, config.y + HUD_MUDAR_Y, config.spriteID, config.callback)
            hud:setFontSize(7)
            table.insert(createdHUDs, hud)
        end
    end
end
-- Crie o HUD principal e defina o callback para toggle
local toggleButton = createHUD("Toggle Button", baseX + Diference + HUD_MUDAR_X, baseY + Diference - 5 + HUD_MUDAR_Y, 21906, toggleHUDs)
toggleButton:setColor(255, 0, 0)  -- Exemplo de cor para o botão de toggle


--AUTO RECORDING
local ToggleFunctionHUD = HUD.new(Diference * 3 + 20 + HUD_MUDAR_X, baseY - Diference - 40 + HUD_MUDAR_Y, 9019)
local isFunctionActive = false 
local threshold = 2 -- Defina o limiar aqui

local ToggleTest2HUD = HUD.new(Diference * 3 + 27 + HUD_MUDAR_X, baseY - Diference - 20 + HUD_MUDAR_Y, "-", true)
ToggleTest2HUD:setColor(255, 0, 0)
ToggleTest2HUD:setText("OFF") 
ToggleTest2HUD:setFontSize(6)

local function toggleFunctionState()
    if isFunctionActive then
        isFunctionActive = false
        Client.showMessage("AUTO WAYPOINT CAVEHUNT DESATIVADO.")
        ToggleTest2HUD:setText("OFF")
        ToggleTest2HUD:setColor(255, 0, 0) 
    else
        isFunctionActive = true
        Client.showMessage("AUTO WAYPOINT CAVEHUNT ATIVADO.")
        ToggleTest2HUD:setText("ON")
        ToggleTest2HUD:setColor(0, 255, 0) 
    end
end



ToggleFunctionHUD:setCallback(toggleFunctionState)

ToggleTest2HUD:setCallback(toggleFunctionState)

local lastPosition = nil
local sqmCounter = 0 

local function isSamePosition(playerPos1, playerPos2, threshold)
    return (playerPos1.x == playerPos2.x and playerPos1.y == playerPos2.y and playerPos1.z == playerPos2.z) or
           (math.abs(playerPos1.x - playerPos2.x) <= threshold and
            math.abs(playerPos1.y - playerPos2.y) <= threshold and
            math.abs(playerPos1.z - playerPos2.z) <= threshold)
end

local function AddCoordenada()
    if isFunctionActive then
        local player = Creature(Player.getId())
        if player then
            local playerPos = player:getPosition()

            if not lastPosition or not isSamePosition(playerPos, lastPosition, 2) then
                sqmCounter = sqmCounter + 1
                if sqmCounter >= threshold then
                    local coordenadaTxt = string.format("{ x = %d, y = %d, z = %d, type = 'NODE', wait = SINGLE_STEP_DELAY, direction = 8, action = nil, label = '' },", playerPos.x, playerPos.y, playerPos.z)

                    local CAMINHO = Engine.getScriptsDirectory()
                    local filePath = CAMINHO .. "\\waypoint.txt"

                    local file = io.open(filePath, "a")
                    if file then
                        file:write(coordenadaTxt .. "\n")
                        file:close()
                        lastPosition = playerPos
                        sqmCounter = 0 
                        Client.showMessage(string.format("Add: X = %d Y = %d Z = %d", playerPos.x, playerPos.y, playerPos.z))
                    else
                    end
                end
            end
        end
    end
end

Timer("AdicionarSQMs", function()
    AddCoordenada()
end, 50)

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
