local swaySlow = false 
local swayFast = false 
local swayIntense = false 
local swayIntense2 = false 
local swayLunatic = false 
local swayGlitch = false 

function start (song)
    print('Song Start, Modchart Loaded... Get ready to die.')
end 

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function hideP1CentreP2()
    for i = 0, 3 do 
        tweenFadeIn(i, 0, 0.285)
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.285, 'setDefault')
    end 
end 
function hideP2CentreP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.285, 'setDefault')
    end
    for i = 4, 7 do 
        tweenFadeIn(i, 0, 0.285)
    end 
end 
function spinBackP1()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320,getActorAngle(i) + 360, 0.285, 'setDefault')
    end 
end
function spinBackP2() 
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i) + 360, 0.285, 'setDefault')
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
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.285, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.285, 'setDefault')
    end
end
function swapsides()
    for i = 0, 3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 640,getActorAngle(i) + 360, 0.285, 'setDefault')
    end
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 640,getActorAngle(i) + 360, 0.285, 'setDefault')
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
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*4) * math.pi) ,i)
		end
	end
    if swayIntense2 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*4) * math.pi) ,i)
		end
	end
    if swayLunatic then 
        for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 320 * math.sin((currentBeat + i*0)) + 320, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 48 * math.cos((currentBeat + i*8) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 320 * math.sin((currentBeat + i*0)) - 320, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 48 * math.cos((currentBeat + i*8) * math.pi),i)
		end
	end
end

function stepHit (step)
    if difficulty == 2 then 
        if step == 124 then 
            hideP2CentreP1()
        end
        if step == 128 then 
            swayFast = true 
        end
        if step == 184 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.285)
            end
            spinBackP1()
            swayFast = false 
        end
        if step == 188 then 
            hideP1CentreP2()
        end
        if step == 192 then 
            swayFast = true 
        end
        if step == 248 then 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.285)
            end
            spinBackP2()
            swayFast = false
        end
        if step == 252 then 
            hideP2CentreP1()
        end
        if step == 256 then 
            swayFast = true
        end
        if step == 312 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.285)
            end
            swayFast = false 
            spinBackP1()
        end
        if step == 316 then 
            hideP1CentreP2()
        end
        if step == 320 then 
            swayFast = true
            for i = 0, 3 do 
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320,getActorAngle(i), 0.001, 'setDefault')
            end
        end
        if step == 380 then
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.285)
            end
            swayFast = false 
            swapfromcentre()
        end
        if step == 384 then
            
        end
        if step == 412 then 
            swaptonormal()
        end
        if step == 444 then 
            swapsides()
        end
        if step == 476 then 
            swaptonormal()
        end
        if step == 508 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 0.285)
                setActorY(_G['defaultStrum'..i..'Y'],i)
            end
        end
        if step == 544 then 
            for i = 0, 7 do  
                tweenFadeOut(i, 1, 0.01)
            end
            swayIntense = true
        end
        if step == 636 then 
            swapsides()
            swayIntense = false
        end
        if step == 640 then 
            swayIntense = true 
        end
        if step == 764 then 
            swayIntense = false 
            swaptonormal()
        end
        if step == 768 then 
            swaySlow = true 
        end
        if step == 892 then 
            swaySlow = false 
            hideP2CentreP1()
        end
        if step == 896 then 
            swayIntense2 = true 
        end
        if step == 948 then 
            for i = 4, 7 do  
                tweenFadeOut(i, 1, 0.285)
            end
            spinBackP1()
            swayIntense2 = false 
        end
        if step == 952 then 
            hideP1CentreP2()
        end
        if step == 956 then 
            swayIntense2 = true 
        end
        if step == 1020 then 
            swayIntense2 = false 
            for i = 0, 3 do  
                tweenFadeOut(i, 1, 0.285)
            end
            spinBackP2()
        end
        if step == 1024 then 
            swayLunatic = true 
        end
        if step == 1152 then 
            swayLunatic = false 
            swaySlow = true 
        end
        if step == 1280 then 
            for i = 0, 7 do  
                tweenFadeIn(i, 0, 13.68)
            end
        end
    end
end


