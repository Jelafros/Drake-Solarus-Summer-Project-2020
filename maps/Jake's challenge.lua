-- Lua script of map Jake's challenge.
-- This script is executed every time the hero enters this map.

local map = ...
local game = map:get_game()
--the "dead" variables are how the wave system was accomplished.
--each variable is assigned to the "skele" enemy of the correlating number
--("dead_1" correlates to "skele_1", "dead_2" to "skele_2", etc.).
--each "dead" variable starts at "0", and is changed to "1" when
--the correlating "skele" dies.  this allowed the quest to check the number of
--the "dead" variable when deciding on whether to move to the next wave
--instead of trying to see if the "skele" exists, which causes problems
--because it is impossible to reference an enemy after it has died
local dead_1 = 0
local dead_2 = 0
local dead_3 = 0
local dead_4 = 0

--enabling the locked exit door and disabling the enemies and chests of future waves
function map:on_started()

  exitdoor:set_enabled(true)
  skele_1:set_enabled(false)
  skele_2:set_enabled(false)
  skele_3:set_enabled(false)
  skele_4:set_enabled(false)
  heart_chest:set_enabled(false)

end

--enabling the second wave of enemies after the first wave is complete
function entrance_enemy:on_dead()

  sol.audio.play_sound("enemy_awake")
  skele_1:set_enabled(true)
  skele_2:set_enabled(true)

end

--when the first enemy of the second wave dies,
--this checks to see if the other enemy is also dead.
--If so, it enables the third wave and the supplemental heart chest
function skele_1:on_dead()

  dead_1 = 1
  if dead_2 == 1 then
  sol.audio.play_sound("enemy_awake")
  skele_3:set_enabled(true)
  skele_4:set_enabled(true)
  heart_chest:set_enabled(true)
  end

end

--when the second enemy of the second wave dies,
--this checks to see if the other enemy is also dead.
--If so, it enables the third wave and the supplemental heart chest
function skele_2:on_dead()

  dead_2 = 1
  if dead_1 == 1 then
  sol.audio.play_sound("enemy_awake")
  skele_3:set_enabled(true)
  skele_4:set_enabled(true)
  heart_chest:set_enabled(true)
  end

end

--when the first enemy of the third wave dies,
--this checks to see if the other enemy is also dead.
--If so, it disables the locked exit door and stops music
function skele_3:on_dead()

  dead_3 = 1
  if dead_4 == 1 then
  exitdoor:open()
  sol.audio.stop_music()

  end

end

--when the second enemy of the third wave dies,
--this checks to see if the other enemy is also dead.
--If so, it disables the locked exit door and stops music
function skele_4:on_dead()

  dead_4 = 1
  if dead_3 == 1 then
  exitdoor:open()
  sol.audio.stop_music()

  end

end
