local swaySlow = false 
local swayFast = false 
local swayWave = false
local swayWavier = false 
local centreSway = false 
local centreWave = false 

function start (song)
    print('Song Start, Modchart Loaded')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.35)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.35)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end 
end
function centreBoth()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.35, 'setDefault')
        tweenFadeIn(i, 0.3, 0.35)
    end 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end 
end
function splitBoth()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.35, 'setDefault')
        tweenFadeOut(i, 1, 0.35)
    end 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.35, 'setDefault')
    end 
end
function spin()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.35, 'setDefault')
    end
end
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.35, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.35, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.35, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.35, 'setDefault')
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
local currentBeat2 = (songPos / 1000)*(bpm/120)
    if swaySlow then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat2 + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayFast then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayWave then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)) * math.pi, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*8)) * math.pi, i)
        end
    end
    if swayWavier then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)) * math.pi, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*8)) * math.pi, i)
        end
    end
    if centreSway then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] - 64 * math.sin((currentBeat2 + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat2 + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if centreWave then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)) * math.pi, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*8)) * math.pi, i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 32 * math.sin((currentBeat + i*0)) * math.pi, i)
            setActorY(_G['defaultStrum'..i..'Y'] - 8 * math.cos((currentBeat + i*8)) * math.pi, i)
        end 
    end
end

function stepHit (step)
    if difficulty == 2 then 
        if step == 32 then 
            spin()
            swaySlow = true
        end
        if step == 96 then 
            spin()
        end
        if step == 156 then 
            swaySlow = false 
            hideP2CentreP1()
        end
        if step == 160 then 
            swayWave = true 
        end
        if step == 216 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.35)
            end
            spinBackP1()
            swayWave = false
        end
        if step == 220 then 
            hideP1CentreP2()
        end
        if step == 224 then 
            swayWave = true
        end
        if step == 284 then 
            swayWave = false 
            for i = 4, 7 do  
                tweenFadeIn(i, 0, 0.35)
            end
            spinBackP2()
        end
        if step == 320 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.35)
            end
            swapsides()
        end
        if step == 332 or step == 364 or step == 396 then 
            swaptonormal()
            swayFast = false 
        end
        if step == 348 or step == 380 then 
            swapsides()
            swayFast = false 
        end
        if step == 324 or step == 336 or step == 352 or step == 368 or step == 384 or step == 400 then
            swayFast = true 
        end
        if step == 412 then 
            swayFast = false 
            centreBoth()
        end
        if step == 416 then 
            centreSway = true
        end
        if step == 536 then 
            centreSway = false 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'], getActorAngle(i), 0.6, 'setDefault')
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0.6, 'setDefault')
            end
        end
        if step == 544 then 
            centreWave = true 
        end
        if step == 668 then 
            splitBoth()
            centreWave = false 
        end
        if step == 672 then 
            swaySlow = true
        end
        if step == 800 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 2.8)
            end
        end
    end
end