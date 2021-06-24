local swaySlow = false 
local swayFast = false 
local swayIntense = false 
local swayLunatic = false 

function start (song)
    print('Song Start, Modchart Loaded... Get ready to die.')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.27)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.27)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end 
end
function spin()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.27, 'setDefault')
    end
end
function swapfromcentre()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
end
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.27, 'setDefault')
    end
end
function hideP1Away()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.54, 'setDefault')
    end
end
function hideP2Away()
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.54, 'setDefault')
    end
end
function swayInP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.54, 'setDefault')
    end
end
function swayInP2()
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.54, 'setDefault')
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
    if swayIntense then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*5) * math.pi) ,i)
        end
    end
    if swayLunatic then 
        for i=0,3 do
            setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*5) * math.pi),i)
        end
        for i=4,7 do
            setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 325, i)
            setActorY(_G['defaultStrum'..i..'Y'] - 8 * math.cos((currentBeat + i*5) * math.pi),i)
        end
    end
end

function stepHit (step)
    if difficulty == 2 then 
        if step == 1 then 

        end
        if step == 32 then 
            swayIntense = true 
        end
        if step == 156 then 
            swayIntense = false 
            hideP2CentreP1()
        end
        if step == 160 then 
            swaySlow = true 
        end
        if step == 216 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.27)
            end
        end 
        if step == 220 then 
            swaySlow = false 
            hideP1CentreP2()
        end
        if step == 224 then 
            swaySlow = true 
        end
        if step == 280 then 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.27)
            end
        end
        if step == 284 then 
            swaySlow = false 
            swapfromcentre()
        end 
        if step == 288 or step == 352 then 
            swayIntense = true 
        end
        if step == 344 then 
            swayIntense = false 
        end
        if step == 408 then 
            swayIntense = false 
            swaptonormal()
        end
        if step == 416 then 
            swayFast = true 
        end
        if step == 536 or step == 538 or step == 540 or step == 542 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.05, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.05, 'setDefault')
            end
        end
        if step == 537 or step == 539 or step == 541 or step == 543 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.05, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.05, 'setDefault')
            end
        end
        if step == 672 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.001)
            end
            swayFast = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.54, 'setDefault')
            end
            hideP2Away()
        end
        if step == 704 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.001)
            end
            swayFast = true
        end
        if step == 728 or step == 792 then 
            swayFast = false 
            swayInP2()
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 736 or step == 800 or step == 776 then 
            swayFast = true 
        end
        if step == 768 then 
            swayFast = false 
            hideP2Away()
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 828 then 
            swayFast = false
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.27, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.27, 'setDefault')
            end
        end
        if step == 832 or step == 904 or step == 864 or step == 928 then 
            swayFast = true 
        end
        if step == 856 or step == 920 then 
            swayFast = false 
            swayInP1()
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 736 or step == 800 or step == 776 then 
            swayFast = true 
        end
        if step == 896 then 
            swayFast = false 
            hideP1Away()
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 960 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.001)
            end
            swayFast = false 
        end
        if step == 992 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.001)
            end
            spin()
        end
        if step == 996 then 
            swaySlow = true 
        end
        if step == 1088 then 
            swaySlow = false 
            swayIntense = true 
        end
        if step == 1152 then 
            swayIntense = false 
            swayLunatic = true 
            for i = 0, 3 do  
                tweenFadeIn(i, 0.7, 0.001)
            end
        end
        if step == 1212 then 
            swayLunatic = false 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.001)
            end
            hideP2CentreP1()
        end
        if step == 1216 then 
            swayFast = true 
        end
        if step == 1276 then 
            spinBackP1()
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.27)
            end
        end
        if step == 1280 then 
            swayFast = true 
        end
        if step == 1344 then 
            swayFast = false 
            swaySlow = true 
        end
        if step == 1600 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 4.32)
            end
            swaySlow = false 
        end
        if step == 1680 then 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.001, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 1280,getActorAngle(i), 0.001, 'setDefault')
            end
        end
        if step == 1776 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.001)
            end
            swayIntense = true 
        end
        if step == 1800 or step == 1864 then 
            swayIntense = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.54, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 1808 or step == 1848 or step == 1872 then 
            swayIntense = true 
        end
        if step == 1840 then 
            swayIntense = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.54, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 1900 then 
            swayIntense = false
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.27, 'setDefault')
            end
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 1904 or step == 1936 or step == 1976 or step == 2000 then 
            swayIntense = true 
        end
        if step == 1928 or step == 1992 then 
            swayIntense = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i), 0.54, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 1968 then 
            swayIntense = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i), 0.54, 'setDefault')
            end
            for i = 4, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.54, 'setDefault')
            end
        end
        if step == 2032 then 
            swayIntense = false 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 4.32)
            end
        end
    end
end