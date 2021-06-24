local funSway = false 
local sway = false
local swayFaster = false 
local move = false

local swayingForce = 1;
local waitForTween = false
local waitForBeat = false

function start (song)
    print('Song Start, Modchart Loaded')
end

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	print('angle 0')
	setActorAngle(0,id)
end

function splitArrows()
    tweenPosXAngle(0, _G['defaultStrum0X'] - 40,getActorAngle(0) + 360, 0.3, 'setDefault')
    tweenPosXAngle(1, _G['defaultStrum1X'] - 30,getActorAngle(1) + 360, 0.3, 'setDefault')
    tweenPosXAngle(2, _G['defaultStrum2X'] + 30,getActorAngle(2) + 360, 0.3, 'setDefault')
    tweenPosXAngle(3, _G['defaultStrum3X'] + 40,getActorAngle(3) + 360, 0.3, 'setDefault')

    tweenPosXAngle(4, _G['defaultStrum4X'] - 40,getActorAngle(4) + 360, 0.3, 'setDefault')
    tweenPosXAngle(5, _G['defaultStrum5X'] - 30,getActorAngle(5) + 360, 0.3, 'setDefault')
    tweenPosXAngle(6, _G['defaultStrum6X'] + 30,getActorAngle(6) + 360, 0.3, 'setDefault')
    tweenPosXAngle(7, _G['defaultStrum7X'] + 40,getActorAngle(7) + 360, 0.3, 'setDefault')
end 

function joinArrows()
    tweenPosXAngle(0, _G['defaultStrum0X'] + 40,getActorAngle(0) + 360, 0.3, 'setDefault')
    tweenPosXAngle(1, _G['defaultStrum1X'] + 30,getActorAngle(1) + 360, 0.3, 'setDefault')
    tweenPosXAngle(2, _G['defaultStrum2X'] - 30,getActorAngle(2) + 360, 0.3, 'setDefault')
    tweenPosXAngle(3, _G['defaultStrum3X'] - 40,getActorAngle(3) + 360, 0.3, 'setDefault')

    tweenPosXAngle(4, _G['defaultStrum4X'] + 40,getActorAngle(4) + 360, 0.3, 'setDefault')
    tweenPosXAngle(5, _G['defaultStrum5X'] + 30,getActorAngle(5) + 360, 0.3, 'setDefault')
    tweenPosXAngle(6, _G['defaultStrum6X'] - 30,getActorAngle(6) + 360, 0.3, 'setDefault')
    tweenPosXAngle(7, _G['defaultStrum7X'] - 40,getActorAngle(7) + 360, 0.3, 'setDefault')
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
    if funSway then
        for i = 0, 7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat2 + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat2 + i*5) * math.pi) ,i)
		end
	end
end

function stepHit (step)
    if difficulty == 2 then
        if step == 1 then

        end
        if step == 64 then 
            sway = true 
        end 
        if step == 332 then 
            sway = false 
            funSway = true 
        end
        if step == 448 then 
            swayFaster = true 
            funSway = false 
        end
        if step == 512 then 
            swayFaster = false 
            funSway = true 
        end 
        if step == 576 then 
            funSway = false 
            for i = 0, 7 do 
                tweenFadeIn(i, 0.1, 0.85)
            end 
        end 
        if step == 584 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 0.85)
            end 
        end
        if step == 656 then
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 0.6)
            end
        end
        if step == 192 or step == 256 or step == 448 or step == 480 or step == 512 or step == 544 then 
            splitArrows()
        end
        if step == 224 or step == 288 or step == 464 or step == 496 or step == 528 or step == 560 then 
            joinArrows()
        end
    end
end