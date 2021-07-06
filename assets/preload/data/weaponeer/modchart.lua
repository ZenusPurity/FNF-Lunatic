local sway = false 
local swayLarger = false 

function start (song)
    print('Song Start, Modchart Loaded.')
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.3)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.3, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.3, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.3)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.3, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.3, 'setDefault')
    end 
end
function spin()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 1440, 1.22, 'setDefault')
    end
end
function spinSlower()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 720, 1.2, 'setDefault')
    end
end
function centerBoth()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.1, 'setDefault')
    end 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.1, 'setDefault')
    end 
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
    if sway then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayLarger then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
end

function beatHit (beat)
    if difficulty == 2 then
        if beat == 210 or beat == 212 or beat == 214 or beat == 216 or beat == 218 or beat == 220 or beat == 222 or beat == 224 or beat == 226 or beat == 228 or beat == 230 or beat == 232 or beat == 234 or beat == 236 or beat == 238 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0.1, 0.3)
            end 
        end
        if beat == 211 or beat == 213 or beat == 215 or beat == 217 or beat == 219 or beat == 221 or beat == 223 or beat == 225 or beat == 227 or beat == 229 or beat == 231 or beat == 233 or beat == 235 or beat == 237 or beat == 239 then 
            for i = 0, 3 do 
                tweenFadeOut(i, 0.5, 0.3)
            end
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.3)
            end
        end
    end
end

function stepHit (step)
    if difficulty == 2 then
        if step == 64 then 
            spin()
        end
        if step == 80 then 
            spinSlower()
        end
        if step == 188 then 
            hideP2CentreP1()
        end
        if step == 192 then 
            sway = true 
        end
        if step == 248 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.3)
            end
            spinBackP1()
            sway = false 
        end
        if step == 252 then 
            hideP1CentreP2()
        end
        if step == 256 then 
            sway = true 
        end
        if step == 316 then 
            spinBackP2()
            sway = false 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.3)
            end
        end
        if step == 320 then 
            spin()
        end
        if step == 336 then 
            spinSlower()
        end
        if step == 448  or step == 480 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.01)
            end
        end
        if step == 476 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.01)
            end
        end

        if step == 482 then 
            centerBoth()
            for i = 0, 3 do  
                tweenFadeOut(i, 0.5, 0.01)
            end
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.01)
            end
            swayLarger = true
        end
        if step == 576 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.01)
            end
        end
        if step == 577 then 
            for i = 0, 3 do  
                tweenFadeOut(i, 0.5, 0.01)
            end
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.01)
            end
        end
        if step == 578 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.01)
            end
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.01, 'setDefault')
            end 
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.01, 'setDefault')
            end 
        end
        if step == 580 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.01)
            end
        end
        if step == 732 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.01, 'setDefault')
            end 
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.01, 'setDefault')
            end 
        end
        if step == 736 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.01, 'setDefault')
            end 
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.01, 'setDefault')
            end
        end
        if step == 832 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 0.01)
            end
        end
        if step == 834 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.01, 'setDefault')
                tweenFadeOut(i, 0.5, 0.01)
            end 
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.01, 'setDefault')
                tweenFadeOut(i, 1, 0.01)
            end
        end
        if step == 960 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.01, 'setDefault')
            end 
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.01, 'setDefault')
            end 
            swayLarger = false 
            sway = true 
        end
        if step == 961 then 
            for i = 0, 3 do
                tweenFadeOut(i, 1, 0.01)
            end
        end
        if step == 1088 then 
            sway = false 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 5.28)
            end
        end
    end
end

