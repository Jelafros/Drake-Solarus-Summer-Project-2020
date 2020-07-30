-- Lua script of map Jake's challenge.
-- This script is executed every time the hero enters this map.

local map = ...
local game = map:get_game()
local dead_1 = 0
local dead_2 = 0
local dead_3 = 0
local dead_4 = 0

function map:on_started()

  exitdoor:set_enabled(true)
  skele_1:set_enabled(false)
  skele_2:set_enabled(false)
  skele_3:set_enabled(false)
  skele_4:set_enabled(false)
  heart_chest:set_enabled(false)

end

function entrance_enemy:on_dead()

  sol.audio.play_sound("enemy_awake")
  skele_1:set_enabled(true)
  skele_2:set_enabled(true)

end

function skele_1:on_dead()

  dead_1 = 1
  if dead_2 == 1 then
  sol.audio.play_sound("enemy_awake")
  skele_3:set_enabled(true)
  skele_4:set_enabled(true)
  heart_chest:set_enabled(true)
  end

end

function skele_2:on_dead()

  dead_2 = 1
  if dead_1 == 1 then
  sol.audio.play_sound("enemy_awake")
  skele_3:set_enabled(true)
  skele_4:set_enabled(true)
  heart_chest:set_enabled(true)
  end

end

function skele_3:on_dead()

  dead_3 = 1
  if dead_4 == 1 then
  sol.audio.play_sound("door_open")
  exitdoor:set_enabled(false)
  end

end

function skele_4:on_dead()

  dead_4 = 1
  if dead_3 == 1 then
  sol.audio.play_sound("door_open")
  exitdoor:set_enabled(false)
  end

end

function map:on_opening_transition_finished()

end
