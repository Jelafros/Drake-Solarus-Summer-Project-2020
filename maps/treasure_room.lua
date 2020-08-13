--[[
Lua script for a treasure room post-boss completion
This script contains two functions. A simple one run on
room initiation to figure out which music track to play,
and a more slightly complicated script for carrying out 
the events upon opening the chest.
   
Author: Katja Mathesius
Date created: 7 - Aug - 2020
Last modified: 13 - Aug - 202
--]]

local map = ...
local game = map:get_game()

-- Event called at initialization time
function map:on_started()
    
    --Checks if the chest is open when the room boots up
    --If yes, plays the general music. If no, turns the music off for atmosphere
    if grandpaSwordChest:is_open()
    then
      sol.audio.play_music("eduardo/mountains")
    else
      sol.audio.stop_music()
    end
end

-- Event called after the opening transition effect of the map
function map:on_opening_transition_finished()

end


function grandpaSwordChest:on_opened()

    hero:start_treasure("sword",victory())
end

function victory()
    game:set_value("questComplete", true)
    sol.audio.play_music("eduardo/dungeon_finished", false)
    game:start_dialog("chestDialog", function()
      game:add_max_life(4)
      game:add_life(4)
      sol.audio.play_sound("heart_container")
      sol.timer.start(map, 5000, function()
        sol.audio.play_music("eduardo/mountains")
      end)
    end)

end