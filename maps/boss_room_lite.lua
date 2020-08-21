--[[
Lua script for the boss room, designed specifically
to work with the simplified variant of the "Truff Stuff" boss


Author: Katja Mathesius
Date created: 4 - Aug - 2020
Last modified: 20 - Aug - 202
--]]


local map = ...
local game = map:get_game()
local hero = map:get_hero()

-- Initializes the blackOut surface used to hide the boss arena set up
local blackOut = sol.surface.create()
  

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
 
  blackOut:set_opacity(0)
   
  -- Disables all the objects in the boss arena
  r1Bottom:set_enabled(false)
  r1Top:set_enabled(false)
  r2Bottom:set_enabled(false)
  r2Top:set_enabled(false)
  
  -- Checks if the boss entity is alive on the map, and if so, disables it
  -- otherwise, simply disables the sensor
  if game:get_value("bossDefeated") == false
  then

    boss:set_enabled(false)

  else

    startBoss:set_enabled(false)

  end

  -- Checks if the chest in the treasure room has been opened
  -- If it has: plays "mountains", if not: stops the music
  if game:get_value("questComplete") == false 
  then

    sol.audio.stop_music()

  else  

    sol.audio.play_music("eduardo/mountains")

  end

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()


end


-- Sets up the blackOut drawable object
function map:on_draw(dst_surface)
  blackOut:fill_color({0, 0, 0})
  blackOut:draw(dst_surface)

end


-- Activates when the corresponding sensor in the room is walked over
function startBoss:on_activated()

  -- Turns off the sensor
  startBoss:set_enabled(false)

  -- Fades in the blackOut object to hide the spawning of 
  -- entities for the boss fight
  blackOut:fade_in(10)


  -- Controls/paces out the boss room set up
  sol.timer.start(map, 500, function()

   -- Enables/disables the entities for the boss fight
   boss:set_enabled(true)
   r1Bottom:set_enabled(true)
   r1Top:set_enabled(true)
   bossNearExit:set_enabled(false)
   r2Bottom:set_enabled(true)
   r2Top:set_enabled(true)
   bossFarExit:set_enabled(false)

   -- Plays an audio effect
   sol.audio.play_sound("thunder3")
    
    -- Disables the blackOut screen
    blackOut:set_opacity(0)
  end)

  -- Waits so the thunder effect to play through, then enables boss music
  sol.timer.start(map, 3000, function()
    sol.audio.play_music("eduardo/boss")
  end)

end
