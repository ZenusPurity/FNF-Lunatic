local sway = false 
local swayLarger = false 
local swayWave = false 

function start (song)
    print('Song Start, Modchart Loaded')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.4)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.4)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end 
end
function swapfromcentre()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
end 
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
end
function spin()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.4, 'setDefault')
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
    if swayWave then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)) * math.pi, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*8)) * math.pi, i)
        end
    end
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

function stepHit (step)
    if difficulty == 2 then 
        if step == 28 then 
            swapsides()
        end
        if step == 32 then 
            sway = true 
        end
        if step == 124 then 
            sway = false 
            swaptonormal()
        end
        if step == 128 then 
            sway = true 
        end
        if step == 160 then 
            sway = false 
            swayWave = true 
        end
        if step == 220 then 
            swayWave = false
            hideP2CentreP1()
        end
        if step == 224 then 
            swayLarger = true 
        end
        if step == 248 then 
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.4)
            end 
            swayLarger = false 
            spinBackP1()       
        end
        if step == 252 then 
            hideP1CentreP2()
        end
        if step == 256 then 
            swayLarger = true 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.1, 'setDefault')
            end
        end
        if step == 284 then 
            swayLarger = false 
            for i = 0, 3 do 
                tweenFadeOut(i, 1, 0.4)
            end 
            swapfromcentre()
        end
        if step == 288 then 
            swayLarger = true 
        end
        if step == 316 then 
            swayLarger = false 
            swaptonormal()
        end
        if step == 320 then 
            swayLarger = true 
        end
        if step == 416 then 
            swayLarger = false 
            swayWave = true 
        end
        if step == 428 or step == 460 then 
            swapsides()
            swayWave = false 
        end
        if step == 432 or step == 448 or step == 464 then 
            swayWave = true 
        end
        if step == 444 or step == 476 then 
            swayWave = false 
            swaptonormal()
        end
        if step == 480 then 
            swayLarger = true 
        end
        if step == 608 then 
            swayLarger = false 
            sway = true 
        end
        if step == 640 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 1.6)
            end 
        end
    end
end
