                local ANTIGM = {}


                
                local callbackFunction = nil
                
                function ANTIGM.setCallback(callback)
                    callbackFunction = callback
                end
                
                local AntiGM = false  
                
                -- Função para carregar o nome

                
                
                local ANTIGMTEXT = HUD.new(15, 35, "Anti GM: OFF", true); ANTIGMTEXT:setFontSize(11);
                ANTIGMTEXT:setDraggable(true)
                ANTIGMTEXT:setColor(255, 0, 0)
                
                
                
                local function toggleAntiGM()
                    if AntiGM == false then
                        ANTIGMTEXT:setText("Anti GM: ON")
                        ANTIGMTEXT:setColor(0, 255, 0)
                        AntiGM = true
                    else
                        ANTIGMTEXT:setText("Anti GM: OFF")
                        ANTIGMTEXT:setColor(255, 0, 0)
                        AntiGM = false
                    end
                end
                
                ANTIGMTEXT:setCallback(toggleAntiGM)
                
                local v0 = "ALARME"
                local v1 = Engine.getScriptsDirectory()
                local v2 = v1 .. "/" .. v0
                local soundInterval = 3  
                local lastSoundTime = os.time()  
                local AtivarResume = false  
                
                local function OToEUAKeAt(v6, v7)
                    for v23, v24 in ipairs(v6) do
                        if (v24 == v7) then
                            return true
                        end
                    end
                    return false
                end
                
                local function containsKeyword(text, keywords)
                    local lowerText = text:lower()
                    for _, keyword in ipairs(keywords) do
                        if lowerText:find(keyword:lower()) then
                            return true
                        end
                    end
                    return false
                end
                
                local function playSoundWithInterval()
                    local currentTime = os.time()
                
                    if currentTime - lastSoundTime >= soundInterval then
                        Sound.play(v2)
                        GoCHSgNMOi = false
                        Engine.enableCaveBot(false)
                        lastSoundTime = currentTime
                
                        if AntiGM and ResumeAfterCheck then
                            if inactivityTimer then
                                inactivityTimer:stop()
                            end
                
                            inactivityTimer = Timer.new("CheckInactivity", function()
                                local currentTime = os.time()
                                if currentTime - lastSoundTime >= TimeAfterCheck then
                                    GoCHSgNMOi = true
                
                                    Engine.enableCaveBot(true)
                                    inactivityTimer:stop()
                                end
                            end, TimeAfterCheck * 1000, false)
                            inactivityTimer:start()
                        end
                    end
                end
                
                local inactivityTimer = nil
                
                
                
                local v3 = DLSJKADSJKLA;
                
                local function v4(v8, v9, v10, v11)
                    if AntiGM then
                        if Player.getState(Enums.States.STATE_PIGEON) then
                            return
                        end
                        
                        if not OToEUAKeAt(v3, v8) then
                            return
                        end
                        ANTIGMTEXT:setText("Effect Detected")
                        ANTIGMTEXT:setColor(255, 255, 0)
                        playSoundWithInterval()
                        Client.focus()
                        if MoveEffectID then
                        wait(1000)
                        Map.goTo(v9, v10, v11)
                        end
                    end
                    if ResumeAfterCheck then
                        AtivarResume = true
                    end
                end
                
                function onTalk(authorName, authorLevel, messageType, x, y, z, text)
                    if AntiGM and (messageType == 36 or messageType == 37) and containsKeyword(text, Palavras_Chave) then
                        playSoundWithInterval()
                        Client.focus()
                        ANTIGMTEXT:setText("Orange Message")
                        ANTIGMTEXT:setColor(255, 255, 0)
                        
                        -- Verifica se MoverOrange está habilitado antes de mover o personagem
                        if MoveOrangeMSG then
                            wait(1000)
                            Map.goTo(x, y, z)
                        end
                    end
                    if ResumeAfterCheck then
                        AtivarResume = true
                    end
                end
                
                function onTextMessageCheck(authorName, authorLevel, messageType, x, y, z, text)
                    if AntiGM and (messageType == 1 or messageType == 4) and containsKeyword(authorName, GM_NAME) then
                        playSoundWithInterval()
                        Client.focus()
                        ANTIGMTEXT:setText("PV/Local Chat")
                        ANTIGMTEXT:setColor(255, 255, 0)
                    end
                    if ResumeAfterCheck then
                        AtivarResume = true
                    end
                end
                
                
                function onDamageOthersEvent(v15)
                    if AntiGM and (v15.messageType == Enums.MessageTypes.MESSAGE_DAMAGE_OTHERS) then
                        if containsKeyword(v15.text, GM_NAME) then
                            playSoundWithInterval()
                            Client.focus()
                            ANTIGMTEXT:setText("Damage Creatures")
                            ANTIGMTEXT:setColor(255, 255, 0)
                        end
                    end
                    if ResumeAfterCheck then
                        AtivarResume = true
                    end
                end
                
                function findKeyword(text, keywords)
                    local textLower = text:lower()
                    for _, keyword in ipairs(keywords) do
                        if textLower:find(keyword) then
                            return keyword
                        end
                    end
                    return nil
                end
                
                function SpyPlayer(authorName, authorLevel, messageType, x, y, z, text)
                    local playerName = Player.getName():lower()  
                    local authorNameLower = authorName:lower()  
                    
                    
                    if authorNameLower == playerName then
                        
                        local keywordFound = findKeyword(text, Palavras_Chave)
                        
                        if AntiGM and messageType == 1 and keywordFound then
                            print("Ativado, Palavra encontrada: " .. keywordFound)
                            playSoundWithInterval()
                            Client.focus()
                            ANTIGMTEXT:setText("GM Msg Cast")
                            ANTIGMTEXT:setColor(255, 255, 0)
                        else
                        end
                
                        if ResumeAfterCheck then
                            AtivarResume = true
                        end
                    else
                    end
                end
                
                function NoHaveAuthor(authorName, authorLevel, messageType, x, y, z, text)
                    if AntiGM and messageType == 1 and authorName == text then
                        playSoundWithInterval()
                        Client.focus()
                        ANTIGMTEXT:setText("Ghost Message")
                        ANTIGMTEXT:setColor(255, 255, 0)
                        
                        if MoveOrangeMSG then
                            wait(1000)
                            Map.goTo(x, y, z)
                        end
                    end
                    if ResumeAfterCheck then
                        AtivarResume = true
                    end
                end
                
                local PreviousCheckMSG = {"banned", "banido", "ban", "mandado para", "preso"}
                
                local PreviousSound = Engine.getScriptsDirectory().."\\sounds\\Alarm Clock.wav"
                
                function playAlarm()
                    if PreviousSound then
                        Sound.play(PreviousSound)
                    end
                end
                
                function onTextEvent(messageData)
                    local messageType = messageData.messageType or 0
                    local text = messageData.text or ""
                
                    if (messageType == 18 or messageType == 19) and containsKeyword(text, PreviousCheckMSG) and Preview_Check then
                        
                        playAlarm()
                        Client.focus()
                        ANTIGMTEXT:setText("GM Checando!")
                        ANTIGMTEXT:setColor(255, 255, 0)
                
                    end
                end
                
                
                Game.registerEvent(Game.Events.TEXT_MESSAGE, onTextEvent)
                Game.registerEvent(Game.Events.TALK, NoHaveAuthor);
                Game.registerEvent(Game.Events.TALK, SpyPlayer)
                Game.registerEvent(Game.Events.MAGIC_EFFECT, OnEffect)
                Game.registerEvent(Game.Events.TALK, onTalk);
                Game.registerEvent(Game.Events.TEXT_MESSAGE, onDamageOthersEvent);
                Game.registerEvent(Game.Events.MAGIC_EFFECT, v4);
                Game.registerEvent(Game.Events.TALK, onTextMessageCheck);

                return ANTIGM
