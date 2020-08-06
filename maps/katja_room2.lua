-- Lua script of map katja_room2.
-- This script is executed every time the hero enters this map.

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- Enabling all the puzzle walls
  E11:set_enabled(true)
  E12:set_enabled(true)
  E21:set_enabled(true)
  E22:set_enabled(true)
  E23:set_enabled(true)
  E31:set_enabled(true)
  E32:set_enabled(true)
  E41:set_enabled(true)
  E51:set_enabled(true)
  E52:set_enabled(true)
  E53:set_enabled(true)
  E61:set_enabled(true)
  E62:set_enabled(true)
  E63:set_enabled(true)
  E71:set_enabled(true)
  E72:set_enabled(true)
  E81:set_enabled(true)
  E82:set_enabled(true)
  E83:set_enabled(true)
  E91:set_enabled(true)
  E101:set_enabled(true)
  E102:set_enabled(true)

  -- Disabling all the puzzle jump pads
  JE11:set_enabled(false)
  JE12:set_enabled(false)
  JE21:set_enabled(false)
  JE22:set_enabled(false)
  JE23:set_enabled(false)
  JE31:set_enabled(false)
  JE32:set_enabled(false)
  JE41:set_enabled(false)
  JE51:set_enabled(false)
  JE52:set_enabled(false)
  JE53:set_enabled(false)
  JE61:set_enabled(false)
  JE62:set_enabled(false)
  JE63:set_enabled(false)
  JE71:set_enabled(false)
  JE72:set_enabled(false)
  JE81:set_enabled(false)
  JE82:set_enabled(false)
  JE83:set_enabled(false)
  JE91:set_enabled(false)
  JE101:set_enabled(false)
  JE102:set_enabled(false)

  -- Disabling all the splash affect points
  sp11:set_enabled(false)
  sp12:set_enabled(false)
  sp13:set_enabled(false)
  sp14:set_enabled(false)
  sp21:set_enabled(false)
  sp22:set_enabled(false)
  sp23:set_enabled(false)
  sp24:set_enabled(false)
  sp31:set_enabled(false)
  sp32:set_enabled(false)
  sp33:set_enabled(false)
  sp34:set_enabled(false)
  sp41:set_enabled(false)
  sp42:set_enabled(false)
  sp43:set_enabled(false)
  sp44:set_enabled(false)
  sp51:set_enabled(false)
  sp52:set_enabled(false)
  sp53:set_enabled(false)
  sp54:set_enabled(false)
  sp61:set_enabled(false)
  sp62:set_enabled(false)
  sp63:set_enabled(false)
  sp64:set_enabled(false)
  sp71:set_enabled(false)
  sp72:set_enabled(false)
  sp73:set_enabled(false)
  sp74:set_enabled(false)
  sp81:set_enabled(false)
  sp82:set_enabled(false)
  sp83:set_enabled(false)
  sp84:set_enabled(false)
  sp91:set_enabled(false)
  sp92:set_enabled(false)
  sp93:set_enabled(false)
  sp94:set_enabled(false)

end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end


-- First switch the player will press, sets up the inital puzzle state
function switchInit:on_activated()

  -- The two main blockades
  sol.audio.play_sound("stone")
  E101:set_enabled(false)
  E102:set_enabled(false)
  JE101:set_enabled(true)
  JE102:set_enabled(true)
  
  sp81:set_enabled(true)
  sp82:set_enabled(true)
  sp83:set_enabled(true)
  sp84:set_enabled(true)

  -- The puzzle platform barriers and jump pads
  JE11:set_enabled(true)
  JE12:set_enabled(true)
  JE21:set_enabled(true)
  JE22:set_enabled(true)
  JE23:set_enabled(true)
  JE31:set_enabled(true)
  JE32:set_enabled(true)
  JE41:set_enabled(true)
  JE51:set_enabled(true)
  JE52:set_enabled(true)

  JE61:set_enabled(true)
  JE62:set_enabled(true)

  E11:set_enabled(false)
  E12:set_enabled(false)
  E21:set_enabled(false)
  E22:set_enabled(false)
  E23:set_enabled(false)
  E31:set_enabled(false)
  E32:set_enabled(false)
  E41:set_enabled(false)
  E51:set_enabled(false)
  E52:set_enabled(false)

  E61:set_enabled(false)
  E62:set_enabled(false)
  

  sp11:set_enabled(true)
  sp12:set_enabled(true)
  sp13:set_enabled(true)
  sp14:set_enabled(true)
  sp21:set_enabled(true)
  sp22:set_enabled(true)
  sp23:set_enabled(true)
  sp24:set_enabled(true)
  sp31:set_enabled(true)
  sp32:set_enabled(true)
  sp33:set_enabled(true)
  sp34:set_enabled(true)
  sp41:set_enabled(true)
  sp42:set_enabled(true)

  sp51:set_enabled(true)
  sp52:set_enabled(true)
  sp53:set_enabled(true)

  sp93:set_enabled(true)
  sp94:set_enabled(true)



  
end


-- The reset switch in the upper right corner
function switchReset:on_activated()

  -- Runs all the start up code to again to reset the map cause it's 4 am and
  -- I'm prioritizing functionality over efficency
  -- Enabling all the puzzle walls
  E11:set_enabled(true)
  E12:set_enabled(true)
  E21:set_enabled(true)
  E22:set_enabled(true)
  E23:set_enabled(true)
  E31:set_enabled(true)
  E32:set_enabled(true)
  E41:set_enabled(true)
  E51:set_enabled(true)
  E52:set_enabled(true)
  E53:set_enabled(true)
  E61:set_enabled(true)
  E62:set_enabled(true)
  E63:set_enabled(true)
  E71:set_enabled(true)
  E72:set_enabled(true)
  E81:set_enabled(true)
  E82:set_enabled(true)
  E83:set_enabled(true)
  E91:set_enabled(true)
  E101:set_enabled(true)
  E102:set_enabled(true)

  -- Disabling all the puzzle jump pads
  JE11:set_enabled(false)
  JE12:set_enabled(false)
  JE21:set_enabled(false)
  JE22:set_enabled(false)
  JE23:set_enabled(false)
  JE31:set_enabled(false)
  JE32:set_enabled(false)
  JE41:set_enabled(false)
  JE51:set_enabled(false)
  JE52:set_enabled(false)
  JE53:set_enabled(false)
  JE61:set_enabled(false)
  JE62:set_enabled(false)
  JE63:set_enabled(false)
  JE71:set_enabled(false)
  JE72:set_enabled(false)
  JE81:set_enabled(false)
  JE82:set_enabled(false)
  JE83:set_enabled(false)
  JE91:set_enabled(false)
  JE101:set_enabled(false)
  JE102:set_enabled(false)

  -- Disabling all the splash affect points
  sp11:set_enabled(false)
  sp12:set_enabled(false)
  sp13:set_enabled(false)
  sp14:set_enabled(false)
  sp21:set_enabled(false)
  sp22:set_enabled(false)
  sp23:set_enabled(false)
  sp24:set_enabled(false)
  sp31:set_enabled(false)
  sp32:set_enabled(false)
  sp33:set_enabled(false)
  sp34:set_enabled(false)
  sp41:set_enabled(false)
  sp42:set_enabled(false)
  sp43:set_enabled(false)
  sp44:set_enabled(false)
  sp51:set_enabled(false)
  sp52:set_enabled(false)
  sp53:set_enabled(false)
  sp54:set_enabled(false)
  sp61:set_enabled(false)
  sp62:set_enabled(false)
  sp63:set_enabled(false)
  sp64:set_enabled(false)
  sp71:set_enabled(false)
  sp72:set_enabled(false)
  sp73:set_enabled(false)
  sp74:set_enabled(false)
  sp81:set_enabled(false)
  sp82:set_enabled(false)
  sp83:set_enabled(false)
  sp84:set_enabled(false)
  sp91:set_enabled(false)
  sp92:set_enabled(false)
  sp93:set_enabled(false)
  sp94:set_enabled(false)



  -- Reused code for the Init Switch
  -- The two main blockades
  sol.audio.play_sound("stone")
  E101:set_enabled(false)
  E102:set_enabled(false)
  JE101:set_enabled(true)
  JE102:set_enabled(true)
  
  sp81:set_enabled(true)
  sp82:set_enabled(true)
  sp83:set_enabled(true)
  sp84:set_enabled(true)

  -- The puzzle platform barriers
  JE11:set_enabled(true)
  JE12:set_enabled(true)
  JE21:set_enabled(true)
  JE22:set_enabled(true)
  JE23:set_enabled(true)
  JE31:set_enabled(true)
  JE32:set_enabled(true)
  JE41:set_enabled(true)
  JE51:set_enabled(true)
  JE52:set_enabled(true)

  JE61:set_enabled(true)
  JE62:set_enabled(true)


  E11:set_enabled(false)
  E12:set_enabled(false)
  E21:set_enabled(false)
  E22:set_enabled(false)
  E23:set_enabled(false)
  E31:set_enabled(false)
  E32:set_enabled(false)
  E41:set_enabled(false)
  E51:set_enabled(false)
  E52:set_enabled(false)

  E61:set_enabled(false)
  E62:set_enabled(false)
  

  sp11:set_enabled(true)
  sp12:set_enabled(true)
  sp13:set_enabled(true)
  sp14:set_enabled(true)
  sp21:set_enabled(true)
  sp22:set_enabled(true)
  sp23:set_enabled(true)
  sp24:set_enabled(true)
  sp31:set_enabled(true)
  sp32:set_enabled(true)
  sp33:set_enabled(true)
  sp34:set_enabled(true)
  sp41:set_enabled(true)
  sp42:set_enabled(true)

  sp51:set_enabled(true)
  sp52:set_enabled(true)
  sp53:set_enabled(true)

  sp93:set_enabled(true)
  sp94:set_enabled(true)

  -- Switches
  switch1:set_activated(false)
  switch2:set_activated(false)
  switch3:set_activated(false)
  switch4:set_activated(false)
  

end


-- The puzzle switch functions, each is in charge of raising/lowering certain walls to create a puzzle
function switch1:on_activated()

  switchReset:set_activated(false)
  sol.audio.play_sound("stone")

  E83:set_enabled(false)
  E91:set_enabled(false)

  JE83:set_enabled(true)
  JE91:set_enabled(true)

  sp82:set_enabled(true)
  sp84:set_enabled(true)
  sp91:set_enabled(true)
  sp92:set_enabled(true)

end

function switch2:on_activated()

  switchReset:set_activated(false)
  sol.audio.play_sound("stone")

  E53:set_enabled(false)
  E71:set_enabled(false)
  E83:set_enabled(false)
  E91:set_enabled(false)

  JE53:set_enabled(true)
  JE71:set_enabled(true)
  JE83:set_enabled(true)
  JE91:set_enabled(true)

  sp43:set_enabled(true)
  sp44:set_enabled(true)
  sp61:set_enabled(true)
  sp62:set_enabled(true)
  sp82:set_enabled(true)
  sp84:set_enabled(true)
  sp91:set_enabled(true)
  sp92:set_enabled(true)

end

function switch3:on_activated()

  switchReset:set_activated(false)
  sol.audio.play_sound("stone")

  E53:set_enabled(true)
  E71:set_enabled(true)
  E83:set_enabled(true)
  E91:set_enabled(true)

  E81:set_enabled(false)
  E82:set_enabled(false)
  E72:set_enabled(false)
  E63:set_enabled(false)

  JE53:set_enabled(false)
  JE71:set_enabled(false)
  JE83:set_enabled(false)
  JE91:set_enabled(false)


  JE81:set_enabled(true)
  JE82:set_enabled(true)
  JE72:set_enabled(true)
  JE63:set_enabled(true)

  sp43:set_enabled(true)
  sp44:set_enabled(true)
  sp61:set_enabled(true)
  sp62:set_enabled(true)
  sp82:set_enabled(true)
  sp84:set_enabled(true)
  sp91:set_enabled(true)
  sp92:set_enabled(true)

end

function switch4:on_activated()

  switchReset:set_activated(false)
  sol.audio.play_sound("stone")

  E53:set_enabled(false)
  E71:set_enabled(false)

  E83:set_enabled(true)
  E91:set_enabled(true)

  E12:set_enabled(true)
  E51:set_enabled(true)
  E52:set_enabled(true)
  E61:set_enabled(true)

  JE53:set_enabled(true)
  JE71:set_enabled(true)

  JE83:set_enabled(false)
  JE91:set_enabled(false)

  JE12:set_enabled(false)
  JE51:set_enabled(false)
  JE52:set_enabled(false)
  JE61:set_enabled(false) 

  sp43:set_enabled(true)
  sp44:set_enabled(true)
  sp61:set_enabled(true)
  sp62:set_enabled(true)
  sp82:set_enabled(true)
  sp84:set_enabled(true)
  sp91:set_enabled(true)
  sp92:set_enabled(true)

end


-- The switch at the end of the room that disables the puzzle for easy travel
function switchEnd:on_activated()

  sol.audio.play_sound("stone")
  E11:set_enabled(false)
  E12:set_enabled(false)
  E21:set_enabled(false)
  E22:set_enabled(false)
  E23:set_enabled(false)
  E31:set_enabled(false)
  E32:set_enabled(false)
  E41:set_enabled(false)
  E51:set_enabled(false)
  E52:set_enabled(false)
  E53:set_enabled(false)
  E61:set_enabled(false)
  E62:set_enabled(false)
  E63:set_enabled(false)
  E71:set_enabled(false)
  E72:set_enabled(false)
  E81:set_enabled(false)
  E82:set_enabled(false)
  E83:set_enabled(false)
  E91:set_enabled(false)
  E101:set_enabled(false)
  E102:set_enabled(false)

  JE11:set_enabled(true)
  JE12:set_enabled(true)
  JE21:set_enabled(true)
  JE22:set_enabled(true)
  JE23:set_enabled(true)
  JE31:set_enabled(true)
  JE32:set_enabled(true)
  JE41:set_enabled(true)
  JE51:set_enabled(true)
  JE52:set_enabled(true)
  JE53:set_enabled(true)
  JE61:set_enabled(true)
  JE62:set_enabled(true)
  JE63:set_enabled(true)
  JE71:set_enabled(true)
  JE72:set_enabled(true)
  JE81:set_enabled(true)
  JE82:set_enabled(true)
  JE83:set_enabled(true)
  JE91:set_enabled(true)
  JE101:set_enabled(true)
  JE102:set_enabled(true)

  sp11:set_enabled(true)
  sp12:set_enabled(true)
  sp13:set_enabled(true)
  sp14:set_enabled(true)
  sp21:set_enabled(true)
  sp22:set_enabled(true)
  sp23:set_enabled(true)
  sp24:set_enabled(true)
  sp31:set_enabled(true)
  sp32:set_enabled(true)
  sp33:set_enabled(true)
  sp34:set_enabled(true)
  sp41:set_enabled(true)
  sp42:set_enabled(true)
  sp43:set_enabled(true)
  sp44:set_enabled(true)
  sp51:set_enabled(true)
  sp52:set_enabled(true)
  sp53:set_enabled(true)
  sp54:set_enabled(true)
  sp61:set_enabled(true)
  sp62:set_enabled(true)
  sp63:set_enabled(true)
  sp64:set_enabled(true)
  sp71:set_enabled(true)
  sp72:set_enabled(true)
  sp73:set_enabled(true)
  sp74:set_enabled(true)
  sp81:set_enabled(true)
  sp82:set_enabled(true)
  sp83:set_enabled(true)
  sp84:set_enabled(true)
  sp91:set_enabled(true)
  sp92:set_enabled(true)
  sp93:set_enabled(true)
  sp94:set_enabled(true)

  switch1:set_enabled(false)
  switch2:set_enabled(false)
  switch3:set_enabled(false)
  switch4:set_enabled(false)
  switchReset:set_enabled(false)
  switchInit:set_enabled(false)


end