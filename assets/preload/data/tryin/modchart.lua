local sway = false
local swayFaster = false 
local spin = false
local hideP1CentreP2 = false 
local hideP2CentreP1 = false 
local spinBackP1 = false 
local spinBackP2 = false 
local swap = false 
local cameraBeatHit = false 

function start (song)
    print('Song Start, Modchart Loaded')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.6)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.6)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end 
end
function swapfromcentre()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
end 
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/120)
local currentBeat2 = (songPos / 1000)*(bpm/60)
    if sway then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayFaster then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat2 + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end
    end 
end
function beatHit (beat)
    if cameraBeatHit then 
        setCamZoom(1)
    end 
end

function stepHit (step)
    if difficulty == 2 then
        if step == 1 then 

        end
        if step == 256 then 
            hideP2CentreP1()
        end 
        if step == 264 then 
            sway = true 
        end 
        if step == 312 then 
            sway = false 
            hideP1CentreP2()
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.6)
            end
        end
        if step == 320 then 
            sway = true
        end
        if step == 376 then 
            sway = false 
            swapfromcentre()
            for i = 0, 3 do 
                tweenFadeOut(i, 1, 0.6)
            end 
        end 
        if step == 384 then 
            sway = true 
        end 
        if step == 640 then 
            sway = false
            swaptonormal()
        end
        if step == 648 then 
            sway = true
        end
        if step == 888 then 
            sway = false 
            hideP2CentreP1()
        end
        if step == 896 then 
            swayFaster = true
        end
        if step == 1000 then 
            swayFaster = false 
            spinBackP1()
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.6)
            end 
        end
        if step == 1008 then 
            swayFaster = true
        end
        if step == 1080 then 
            swayFaster = false 
            swapsides()
        end
        if step == 1088 then 
            swayFaster = true
        end 
        if step == 1144 then
            swayFaster = false 
            swaptonormal()
        end
        if step == 1152 then 
            sway = true
        end
        if step == 1264 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 2.1)
            end
        end
        if step == 704 or step == 736 or step == 768 or step == 800 or step == 832 or step == 864 or step == 928 or step == 960 or step == 992 or step == 1024 or step == 1056 then 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.4, 'setDefault')
            end
        end
        if step == 1120 then 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.4, 'setDefault')
            end
        end
    end
end