local sway = false 

function start (song)
    print('Song Start, Modchart Loaded')
end 

function fadeOut()
    for i = 0, 7 do 
        tweenFadeIn(i, 0.1, 0.92)
    end
end
function fadeIn()
    for i = 0, 7 do 
        tweenFadeOut(i, 1, 0.92)
    end
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/120)
    if sway then 
        for i = 0, 7 do 
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end 
    end
end

function stepHit (step)
    if difficulty == 2 then 
        if step == 1 then 
            
        end
        if step == 128 then 
            fadeOut()
        end 
        if step == 136 then
            fadeIn()
        end
        if step == 144 then 
            fadeOut()
        end
        if step == 152 then
            fadeIn()
        end 
        if step == 160 then
            fadeOut()
        end
        if step == 168 then
            fadeIn()
        end
        if step == 176 then
            fadeOut()
        end
        if step == 184 then
            fadeIn()
        end
        if step == 192 then 
            fadeOut()
        end
        if step == 200 then 
            fadeIn()
        end
        if step == 208 then 
            fadeOut()
        end
        if step == 216 then 
            fadeIn()
        end
        if step == 224 then 
            fadeOut()
        end
        if step == 232 then 
            fadeIn()
        end
        if step == 240 then 
            fadeOut()
        end
        if step == 248 then 
            fadeIn()
        end
        if step == 256 then 
            sway = true 
        end 
        if step == 384 then 
            fadeOut()
        end 
        if step == 392 then
            fadeIn()
        end
        if step == 400 then 
            fadeOut()
        end
        if step == 408 then
            fadeIn()
        end 
        if step == 416 then
            fadeOut()
        end
        if step == 424 then
            fadeIn()
        end
        if step == 432 then
            fadeOut()
        end
        if step == 440 then
            fadeIn()
        end
        if step == 448 then 
            fadeOut()
        end
        if step == 456 then 
            fadeIn()
        end
        if step == 464 then 
            fadeOut()
        end
        if step == 472 then 
            fadeIn()
        end
        if step == 480 then 
            fadeOut()
        end
        if step == 488 then 
            fadeIn()
        end
        if step == 496 then 
            fadeOut()
        end
        if step == 504 then 
            fadeIn()
        end
        if step == 512 then 
            sway = false 
            for i = 0, 7 do 
                tweenFadeIn(i, 0, 0.6)
            end
        end 
    end
end



