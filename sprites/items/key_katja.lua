-- Lua script of item key_katja.
-- This script is executed only once for the whole game.

local item = ...
local game = item:get_game()

-- Event called when all items have been created.
function item:on_started()

  -- Initialize the properties of your item here,
  -- like whether it can be saved, whether it has an amount
  -- and whether it can be assigned.
end

function item:on_created()

  self:set_shadow("small")
  self:set_can_disappear(false)
  self:set_brandish_when_picked(false)
  self:set_sound_when_picked("key_fall")

end

function item:on_obtaining(variant, savegame_variable)

  game:set_value("possession_key_katja", true)

end

-- Event called when the hero starts using this item.
function item:on_using()

  -- Define here what happens when using this item
  -- and call item:set_finished() to release the hero when you have finished.
  item:set_finished()
end

-- Event called when a pickable treasure representing this item
-- is created on the map.
function item:on_pickable_created(pickable)

  -- You can set a particular movement here if you don't like the default one.
end
