-- Lua script of map katha_room_treasure.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- Start warp is turned off
  backToStart:set_enabled(false)

  -- Check to see if start warp is supposed to be on
  if kChest:is_open() then
  backToStart:set_enabled(true)
  end


end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end


-- Events that occur upon the opening of the room's chest
function kChest:on_opened()

  backToStart:set_enabled(true)
  sol.audio.play_sound("chest_appears")
  hero:start_treasure("key_katja",1,katjaChest)


end