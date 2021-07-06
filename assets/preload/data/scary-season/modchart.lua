local softSway = false
local swayMess2 = false
local swayMess = false
local swayMess3 = false
local flicker = false

function start (song)
    print('Song Start, Modchart Loaded')
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function centreBoth()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.37, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.37, 'setDefault')
    end
end

function splitBoth()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.37, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.37, 'setDefault')
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/180)
    if softSway then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayMess then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*4)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if swayMess2 then 
        for i = 0, 7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*4)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*8) * math.pi) ,i)
		end
	end
    if swayMess3 then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] + 48 * math.sin((currentBeat + i*4)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*8) * math.pi) ,i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 48 * math.sin((currentBeat + i*4)), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 32 * math.cos((currentBeat + i*8) * math.pi) ,i)
        end 
    end
end

function beatHit (beat)
    if difficulty == 2 then 
        if beat == 24 or beat == 56 or beat == 88 or beat == 120 or beat == 152 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0.2, 6)
            end
        end
        if beat == 40 or beat == 72 or beat == 104 or beat == 136 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 6)
            end
        end
        if beat == 168 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 2.7)
            end
        end
        if beat == 248 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 1.5)
            end
        end
    end
end

function stepHit (step)
    if difficulty == 2 then  
        if step == 1 then 
            --flicker = true 
        end
        if step == 64 then 
            softSway = true 
        end
        if step == 192 then 
            softSway = false 
            swayMess2 = true 
        end
        if step == 316 then 
            for i = 0, 7 do 
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.30, i)
            end
            swayMess2 = false 
        end
        if step == 319 then 
            swayMess = true 
        end
        if step == 320 then 
            swayMess = true 
        end
        if step == 444 then 
            for i = 0, 7 do 
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.30, i)
            end
            swayMess = false 
        end
        if step == 448 then 
            swayMess2 = true
        end
        if step == 572 then 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.30, i)
            end
            swayMess2 = false 
        end
        if step == 576 then 
            swaySlow = true 
        end
        if step == 700 then 
            for i = 0, 7 do 
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.30, i)
            end
            swaySlow = false 
        end
        if step == 700 then 
            centreBoth()
            for i = 0, 3 do 
                tweenFadeIn(i, 0.5, 0.37)
            end
        end
        if step == 704 then 
            swayMess3 = true
        end
        if step == 952 then 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.3, 'setDefault')
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.30, i)
            end
            for i = 0, 3 do 
                tweenFadeOut(i, 1, 0.37)
            end
            swayMess3 = false
        end
        if step == 956 then 
            splitBoth()
        end
    end
end