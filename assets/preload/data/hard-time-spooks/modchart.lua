local sway = false 
local swayLarger = false 
local swayApart = false 
local swayApartLarger = false 
local swayApartMerged = false 

function start (song)
    print('Sont Start, Modchart Loaded')
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.33)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.33, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.33, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.33)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.33, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.33, 'setDefault')
    end 
end
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.33, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.33, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.33, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.33, 'setDefault')
    end
end
function mergeArrows()
    tweenPosXAngle(0, _G['defaultStrum0X'] + 120,getActorAngle(0) + 360, 0.33, 'setDefault')
    tweenPosXAngle(1, _G['defaultStrum1X'] + 120,getActorAngle(1) + 360, 0.33, 'setDefault')
    tweenPosXAngle(2, _G['defaultStrum2X'] + 520,getActorAngle(2) + 360, 0.33, 'setDefault')
    tweenPosXAngle(3, _G['defaultStrum3X'] + 520,getActorAngle(3) + 360, 0.33, 'setDefault')

    tweenPosXAngle(4, _G['defaultStrum4X'] - 320,getActorAngle(4) + 360, 0.33, 'setDefault')
    tweenPosXAngle(5, _G['defaultStrum5X'] - 320,getActorAngle(5) + 360, 0.33, 'setDefault')
    tweenPosXAngle(6, _G['defaultStrum6X'] - 320,getActorAngle(6) + 360, 0.33, 'setDefault')
    tweenPosXAngle(7, _G['defaultStrum7X'] - 320,getActorAngle(7) + 360, 0.33, 'setDefault')
    for i = 0, 3 do 
        tweenFadeIn(i, 0.7, 0.6)
    end
end 
function unjointArrows()
    tweenPosXAngle(0, _G['defaultStrum0X'] - 120,getActorAngle(0) + 360, 0.33, 'setDefault')
    tweenPosXAngle(1, _G['defaultStrum1X'] - 120,getActorAngle(1) + 360, 0.33, 'setDefault')
    tweenPosXAngle(2, _G['defaultStrum2X'] - 520,getActorAngle(2) + 360, 0.33, 'setDefault')
    tweenPosXAngle(3, _G['defaultStrum3X'] - 520,getActorAngle(3) + 360, 0.33, 'setDefault')

    tweenPosXAngle(4, _G['defaultStrum4X'] + 320,getActorAngle(4) + 360, 0.33, 'setDefault')
    tweenPosXAngle(5, _G['defaultStrum5X'] + 320,getActorAngle(5) + 360, 0.33, 'setDefault')
    tweenPosXAngle(6, _G['defaultStrum6X'] + 320,getActorAngle(6) + 360, 0.33, 'setDefault')
    tweenPosXAngle(7, _G['defaultStrum7X'] + 320,getActorAngle(7) + 360, 0.33, 'setDefault')
    for i = 0, 3 do 
        tweenFadeOut(i, 1, 0.6)
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
    if swayApart then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayApartLarger then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayApartMerged then 
        for i = 0, 1 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 4, 5 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 2, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] - 32 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 6, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 32 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
end



function stepHit (step)
    if difficulty == 2 then 
        if step == 1 or step == 32 or step == 64 or step == 96 then 
            for i = 0, 7 do 
            tweenFadeIn(i, 0.1, 1.2)
            end
        end
        if step == 16 or step == 48 or step == 80 or step == 112 then
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 1.2)
            end
        end
        if step == 124 then 
            hideP2CentreP1()
        end
        if step == 128 then 
            sway = true 
        end
        if step == 184 then 
            sway = false
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.33)
            end
            spinBackP1()
        end 
        if step == 188 then 
            hideP1CentreP2()
        end
        if step == 192 then 
            sway = true 
        end
        if step == 248 then 
            sway = false 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.33)
            end
            spinBackP2()
        end
        if step == 252 then 
            hideP2CentreP1()
        end
        if step == 256 then 
            sway = true 
        end
        if step == 312 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.33)
            end
            sway = false 
            spinBackP1()
        end
        if step == 316 then 
            hideP1CentreP2()
        end
        if step == 320 then 
            sway = true
        end
        if step == 380 then 
            sway = false 
            spinBackP2()
            for i = 4, 7 do 
                tweenFadeIn(i, 0, 0.33)
            end
        end
        if step == 416 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 0.33)
            end
            swayApart = true
        end
        if step == 508 then 
            swayApart = false 
            swapsides()
        end
        if step == 512 then 
            swayApartLarger = true 
        end
        if step == 636 then 
            swayApartLarger = false 
            swaptonormal()
        end
        if step == 640 then 
            swayLarger = true 
        end
        if step == 764 then 
            swayLarger = false 
            hideP1CentreP2()
        end
        if step == 768 then 
            swayLarger = true 
        end
        if step == 828 then 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.33)
            end
            spinBackP2()
            swayLarger = false 
        end
        if step == 832 then 
            swayApartLarger = true
        end 
        if step == 892 then
            swayApartLarger = false 
            mergeArrows()
        end
        if step == 896 then
            swayApartMerged = true 
        end
        if step == 1024 then 
            swayApartMerged = false 
            unjointArrows()
        end
        if step == 1152 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 2.66)
            end
        end
    end
end