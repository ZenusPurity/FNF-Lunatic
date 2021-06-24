local softSway = false 
local roundSway = false 
local softSwayApart = false 
local flicker = false 

function start (song)
    print('Song Start, Modchart Loaded')
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/180)
    if softSway then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
    if roundSway then 
        for i = 0, 7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*5) * math.pi) ,i)
		end
	end
    if softSwayApart then 
        for i = 0, 3 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
        for i = 4, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] - 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
end

function beatHit (beat)
    if difficulty == 2 then 
        if beat == 24 or beat == 56 or beat == 88 or beat == 120 or beat == 152 or beat == 184 or beat == 216 then 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 6)
            end
        end
        if beat == 40 or beat == 72 or beat == 104 or beat == 136 or beat == 168 or beat == 200 or beat == 232 then 
            for i = 0, 7 do 
                tweenFadeOut(i, 1, 6)
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
            flicker = true 
        end
        if step == 64 then 
            softSway = true 
        end
        if step == 192 then 
            softSway = false 
            roundSway = true 
        end
        if step == 320 then 
            roundSway = false 
            softSwayApart = true 
        end
        if step == 448 then 
            softSwayApart = false 
            roundSway = true
        end
        if step == 576 then 
            roundSway = false 
            softSway = true 
        end
        if step == 704 then 
            softSway = false 
            softSwayApart = true
        end
    end
end