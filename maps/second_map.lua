-- Lua script of map second_map.
-- This script is executed every time the hero enters this map.

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  block_1:set_enabled(true)
  block_2:set_enabled(true)
  block_3:set_enabled(true)
  block_4:set_enabled(true)

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end

function sensor_1:on_activated()

  --to check if the player has the key from Katja's room
  if game:get_value("possession_key_katja") == true then
  block_1:set_enabled(false)
  end

end

function sensor_2:on_activated()

  --to check if the player has the key from Saul's room
  if game:get_value("possession_key_saul") == true then
  block_2:set_enabled(false)
  end

end

function sensor_3:on_activated()

  --to check if the player has the key from Prof. Urness' room
  if game:get_value("possession_key_urness") == true then
  block_3:set_enabled(false)
  end

end

function sensor_4:on_activated()

  --to check if the player has the key from Jake's room
  if game:get_value("possession_key_jake") == true then
  block_4:set_enabled(false)
  end

end

function health_regen:on_activated()

  sol.audio.play_sound("picked_item")
  self:get_game():add_life(12)

end
