--[[
This is the Lua script for the map "katja_room"

Key for the variable names:
"splash" - the particle affects when walls are raised/lowered


"P" - Indicates it should be enabled when in the button is in the "pressed" state
"U" - Indicates it should be enabled when in the button is in the "unpressed" state
"R" - An object within Room 1 (that's state doesn't change by pressed/unpressed)

"F" - Floor
"E" - Edges
"C" - Corners
"S" - Switch

Author: Katja Mathesius
--]] 

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  --Sets the room to its initial state
  PF1:set_enabled(false)
  PC1:set_enabled(false)
  PC2:set_enabled(false)
  PC3:set_enabled(false)
  PC4:set_enabled(false)
  PC5:set_enabled(false)
  PC6:set_enabled(false)
  PE1:set_enabled(false)
  PE2:set_enabled(false)
  PE3:set_enabled(false)

  UE1:set_enabled(true)
  UE2:set_enabled(true)
  UE3:set_enabled(true)

  splash1:set_enabled(false)
  splash2:set_enabled(false)
  splash3:set_enabled(false)
  splash4:set_enabled(false)
  splash5:set_enabled(false)
  splash6:set_enabled(false)

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end

-- Activates when the corresponding button in the room is pressed
function R1S1:on_activated()

  --Sets the room to its "solved" state + plays the stone sounds affect
  sol.audio.play_sound("stone")
  PF1:set_enabled(true)
  PC1:set_enabled(true)
  PC2:set_enabled(true)
  PC3:set_enabled(true)
  PC4:set_enabled(true)
  PC5:set_enabled(true)
  PC6:set_enabled(true)
  PE1:set_enabled(true)
  PE2:set_enabled(true)
  PE3:set_enabled(true)

  UE1:set_enabled(false)
  UE2:set_enabled(false)
  UE3:set_enabled(false)
  
  splash1:set_enabled(true)
  splash2:set_enabled(true)
  splash3:set_enabled(true)
  splash4:set_enabled(true)
  splash5:set_enabled(true)
  splash6:set_enabled(true)

  R1S2:set_enabled(false)

end

-- Activates when the corresponding button in the room is pressed
function R1S2:on_activated()

  --Sets the room to its "solved" state + plays the stone sounds affect
  sol.audio.play_sound("stone")
  PF1:set_enabled(true)
  PC1:set_enabled(true)
  PC2:set_enabled(true)
  PC3:set_enabled(true)
  PC4:set_enabled(true)
  PC5:set_enabled(true)
  PC6:set_enabled(true)
  PE1:set_enabled(true)
  PE2:set_enabled(true)
  PE3:set_enabled(true)

  UE1:set_enabled(false)
  UE2:set_enabled(false)
  UE3:set_enabled(false)

  splash1:set_enabled(true)
  splash2:set_enabled(true)
  splash3:set_enabled(true)
  splash4:set_enabled(true)
  splash5:set_enabled(true)
  splash6:set_enabled(true)

  R1S1:set_enabled(false)

end