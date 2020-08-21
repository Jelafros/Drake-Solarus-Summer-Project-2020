--[[
Lua file for before_boss

Author: Katja Mathesius
--]]

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()


  -- Checks if the quest has been completed, and sets the music for the room accordingly
  -- If the game has been beat: Play music, If not: Don't play music
  if game:get_value("questComplete")
  then
      sol.audio.play_music("eduardo/mountains")
  else
      sol.audio.stop_music()
  end
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
