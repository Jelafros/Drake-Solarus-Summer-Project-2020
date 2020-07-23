-- Lua script of map katja_room.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

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

  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end

function R1S1:on_activated()

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

function R1S2:on_activated()

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