--[[
Lua script for the boss room, designed specifically
to work with the simplified variant of the "Truff Stuff" boss


Author: Katja Mathesius
Date created: 4 - Aug - 2020
Last modified: 13 - Aug - 202
--]]


local map = ...
local game = map:get_game()
local hero = map:get_hero()
local blackOut = sol.surface.create()
  

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
 
  blackOut:set_opacity(0)

  sol.audio.stop_music()
  r1Bottom:set_enabled(false)
  r1Top:set_enabled(false)
  r2Bottom:set_enabled(false)
  r2Top:set_enabled(false)
  startBoss:set_enabled(false)
  
  if game:get_value("questComplete") == false 
  then
    boss:set_enabled(false)
    startBoss:set_enabled(true)
  else  
    sol.audio.play_music("eduardo/mountains")
  end

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()


end

function map:on_draw(dst_surface)
  blackOut:fill_color({0, 0, 0})
  blackOut:draw(dst_surface)

end

function startBoss:on_activated()

  startBoss:set_enabled(false)
  --blackOut:set_opacity(255)
  blackOut:fade_in(20)
  print("1")


  sol.timer.start(map, 1000, function()
   sol.audio.play_sound("thunder1")
    blackOut:set_opacity(0)
    print("2")

   boss:set_enabled(true)
  end)


  sol.timer.start(map, 500, function()

  end)
  
  sol.timer.start(map, 1000, function()
    r1Bottom:set_enabled(true)
    r1Top:set_enabled(true)
    bossNearExit:set_enabled(false)
    r2Bottom:set_enabled(true)
    r2Top:set_enabled(true)
    bossFarExit:set_enabled(false) 
    sol.audio.play_sound("thunder3")
  end)


  sol.timer.start(map, 3000, function()
    sol.audio.play_music("eduardo/boss")
  end)

end
