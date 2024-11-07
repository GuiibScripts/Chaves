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
                
                Game.registerEvent(Game.Events.MAGIC_EFFECT, v4);
