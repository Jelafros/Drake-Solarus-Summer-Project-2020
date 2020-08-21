--[[
Lua Script for second_map

Author: Jake Elafros
With minor edits by: Katja Mathesius
--]]

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()


  -- Series of checks to determine which blocks should be enabled
  if game:get_value("kBlock")
  then
    block_1:set_enabled(true)
  else
    block_1:set_enabled(false) 
  end

  if game:get_value("sBlock")
  then
    block_2:set_enabled(true)
  else
    block_2:set_enabled(false)
  end

  if game:get_value("uBlock")
  then
    block_3:set_enabled(true)
  else
    block_3:set_enabled(false)
  end

  if game:get_value("jBlock")
  then
    block_4:set_enabled(true)
  else
    block_4:set_enabled(false)
  end

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end

function sensor_1:on_activated()

  --to check if the player has the key from Katja's room
  if game:get_value("possession_key_katja") and game:get_value("kBlock") then
  block_1:set_enabled(false)
  sol.audio.play_sound("open_lock")
  game:set_value("kBlock", false)
  end

end

function sensor_2:on_activated()

  --to check if the player has the key from Saul's room
  if game:get_value("possession_key_saul") and game:get_value("sBlock") then
  block_2:set_enabled(false)
  sol.audio.play_sound("open_lock")
  game:set_value("sBlock", false)
  end

end

function sensor_3:on_activated()

  --to check if the player has the key from Prof. Urness' room
  if game:get_value("possession_key_urness") and game:get_value("uBlock") then
  block_3:set_enabled(false)
  sol.audio.play_sound("open_lock")
  game:set_value("uBlock", false)
  end

end

function sensor_4:on_activated()

  --to check if the player has the key from Jake's room
  if game:get_value("possession_key_jake") and game:get_value("jBlock") then
  block_4:set_enabled(false)
  sol.audio.play_sound("open_lock")
  game:set_value("jBlock", false)
  end

end


function health_regen:on_activated()

  -- Fills the player health
  sol.audio.play_sound("picked_item")
  game:set_life(game:get_max_life())

end
