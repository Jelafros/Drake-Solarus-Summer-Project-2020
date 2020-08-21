--[[
Lua script for a treasure room post-boss completion
This script contains two functions. A simple one run on
room initiation to figure out which music track to play,
and a more slightly complicated script for carrying out 
the events upon opening the chest.
   
Author: Katja Mathesius
Date created: 7 - Aug - 2020
Last modified: 20 - Aug - 202
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

-- Calls the victory function upon opening the chest
function grandpaSwordChest:on_opened()

    hero:start_treasure("sword",victory())
end


-- Function designed to run when the chest is opened 
function victory()
    
    -- Changes the state of the questComplete variable to true
    game:set_value("questComplete", true)
    
    -- Plays the dungeon finished music and stops it once it plays one cycle of it
    sol.audio.play_music("eduardo/dungeon_finished", false)

    -- Starts the dialog for when the chest is opened
    game:start_dialog("chestDialog", function()

      -- Adds a new heart to the player and fills up their health to max
      game:add_max_life(4)
      game:set_life(game:get_max_life())
    
      -- Plays the heart container sound affect, then waits till it's played through
      -- fully to begin playing the main song for the room
      sol.audio.play_sound("heart_container")
      sol.timer.start(map, 5000, function()
        sol.audio.play_music("eduardo/mountains")
      end)
    end)

end