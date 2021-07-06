local swayWave = false
local swayWavier = false 
local sway = false 
local swayLarger = false 

function start (song)
    print('Song Start, Modchart Loaded')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.36)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.36)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end 
end
function swapfromcentre()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
end 
function swaptonormal()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.36, 'setDefault')
    end
end
function spin()
    for i = 0, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.36, 'setDefault')
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
    if swayWave then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*8)), i)
        end
    end
    if swayWavier then 
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*4) * math.pi) ,i)
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

function beatHit (beat)
    if difficulty == 2 then 
        if beat == 168 or beat == 172 or beat == 176 or beat == 180 or beat == 184 or beat == 188 or beat == 192 or beat == 196 or beat == 200 or beat == 204 or beat == 208 or beat == 212 or beat == 216 or beat == 220 or beat == 224 or beat == 228 or beat == 232 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 0.72)
            end
        end
        if beat == 170 or beat == 174 or beat == 178 or beat == 182 or beat == 186 or beat == 190 or beat == 194 or beat == 198 or beat == 202 or beat == 206 or beat == 210 or beat == 214 or beat == 218 or beat == 222 or beat == 226 or beat == 230 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 0.72)
            end 
        end
    end
end

function stepHit (step)
    if difficulty == 2 then 
        if step == 28 then 
            hideP2CentreP1()
        end
        if step == 32 then 
            sway = true 
        end
        if step == 88 then 
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.36)
            end
            sway = false 
            spinBackP1()
        end
        if step == 92 then 
            hideP1CentreP2()
        end
        if step == 96 then 
            sway = true 
        end
        if step == 152 then 
            for i = 0, 3 do 
                tweenFadeOut(i, 1, 0.36)
            end
            sway = false 
            spinBackP2()
        end
        if step == 156 then 
            hideP2CentreP1()
        end
        if step == 160 then 
            swayLarger = true 
        end
        if step == 200 then 
            swayLarger = false 
            spinBackP1()
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.36)
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.36, 'setDefault')
            end
        end
        if step == 204 then 
            swayLarger = true 
        end
        if step == 220 then 
            swayLarger = false 
            hideP1CentreP2()
        end
        if step == 224 then 
            swayLarger = true 
        end
        if step == 284 then 
            swayLarger = false 
            spinBackP2()
            for i = 0, 3 do 
                tweenFadeOut(i, 1, 0.36)
            end
        end
        if step == 288 then 
            swayWave = true 
        end
        if step == 416 then 
            swapsides()
            swayWave = false 
        end
        if step == 420 then 
            swayLarger = true 
        end
        if step == 540 then 
            swayLarger = false 
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.36, 'setDefault')
            end
            for i = 4, 7 do 
                tweenFadeIn(i, 0, 0.36)
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.36, 'setDefault')
            end
        end
        if step == 544 then 
            swayWave = true 
        end
        if step == 600 then 
            swayWave = false 
            spinBackP1()
            for i = 4, 7 do 
                tweenFadeOut(i, 1, 0.36)
            end
        end
        if step == 604 then 
            swayWave = true 
        end
        if step == 672 then 
            swayWave = false 
            swayLarger = true 
        end
        if step == 704 or step == 768 or step == 832 or step == 848 or step == 896 or step == 912 then 
            swayLarger = false 
            swayWavier = true 
        end
        if step == 736 or step == 800 then 
            swayWavier = false 
            swayLarger = true 
        end
        if step == 844 or step == 908 then 
            swayWavier = false 
            swapsides()
        end
        if step == 860 or step == 924 then 
            swayWavier = false 
            swaptonormal()
        end
        if step == 864 then 
            swayLarger = true 
            for i = 0, 7 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'], getActorAngle(i), 0.36, 'setDefault')
                tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], getActorAngle(i), 0.36, 'setDefault')
            end
        end
    end 
end