--[[ 
Lua script for a boss enemy
affectionately nicknamed "Truff Stuff"

This is a simpler version of a scrapped boss.
Initially intended to have a charge attack, this version instead
opts to simply chase the player and summon minions as a distraction

This boss is tailored to function with the boss lite map and won't
work in any other enviorment. 

Author: Katja Mathesius
Date Created: 4 - Aug - 2020
Last Modified: 13 - Aug - 2020 
--]]


-- Basic set up variables
local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local movement
local sprite

-- Variables to store distances values (inital values are rough ordering for
-- distance from hero spawn)
local bird = 200
local snake = 500
local fish = 500
local ard = 300
local octo = 199
local dist = 200


-- Tables for the creation of the enemies
tBat = {}
tBat["name"] = "bat"
tBat["layer"] = 0
tBat["x"] = 352
tBat["y"] = 352
tBat["direction"] = 3
tBat["breed"] = "pterobat"

tLiz = {}
tLiz["name"] = "lizard"
tLiz["layer"] = 0
tLiz["x"] = 352
tLiz["y"] = 144
tLiz["direction"] = 3
tLiz["breed"] = "chameleon"

tSli = {}
tSli["name"] = "slime"
tSli["layer"] = 0
tSli["x"] = 128
tSli["y"] = 352
tSli["direction"] = 3
tSli["breed"] = "slime_cyan"

tGob = {}
tGob["name"] = "goblin"
tGob["layer"] = 0
tGob["x"] = 240
tGob["y"] = 272
tGob["direction"] = 3
tGob["breed"] = "goblin_green"

tIce = {}
tIce["name"] = "ice"
tIce["layer"] = 0
tIce["x"] = 128
tIce["y"] = 144
tIce["direction"] = 3
tIce["breed"] = "iceball"



-- Called when the enemy was just created on the map.
function enemy:on_created()

  -- Defines the properties of this enemy.
  self:set_life(21)
  self:set_damage(4)
  self:create_sprite("enemies/boss_lite")
  self:set_size(48, 64)
  self:set_origin(24, 32)
  self:set_hurt_style("boss")

end

-- Called when the enemy should start or restart its movement
-- (for example if the enemy has just been created or was just hurt).
function enemy:on_restarted()
  
  movement = sol.movement.create("target")
  movement:set_target(hero)
  movement:set_speed(35)
  movement:start(enemy)
  

end

-- Update direction for sprites.
function enemy:on_movement_changed(movement)
  local direction4 = movement:get_direction4()
  if direction4 then
    for _, s in enemy:get_sprites() do
      s:set_direction(direction4)
    end
  end
end


-- Runs when the boss is hurt by any means
-- In charge of spawning enemies to distract the player from the boss
-- enemy spawn is determined by whichever pillar the player to closest too
-- as well as a random roll to see if anything spawns at all
function enemy:on_hurt()
  
  -- Timer for spacing out spawning
  sol.timer.start(map, math.random(2500, 4500), function()

  -- Grabs distance between all statues and the hero and stores them in variables
  bird = hero:get_distance(map:get_entity("statueBird"))
  snake = hero:get_distance(map:get_entity("statueSnake"))
  ard = hero:get_distance(map:get_entity("statueArd"))
  octo = hero:get_distance(map:get_entity("statueOcto"))
  fish = hero:get_distance(map:get_entity("statueFish"))

  -- Finds the shortest distance between the hero and a pillar
  dist = math.min(bird, snake, ard, octo, fish)

  -- Compares the distance values to figure out which pillar matches
  -- the shortest distance, then runs the corresponding spawn command
  if dist == bird then
  
  -- Pterobats (1 in 2 chance of spawning after each attack)
    if math.random(2) == 1 then
      sol.audio.play_sound("wrong2")
      map:create_enemy(tBat)
    end
  elseif dist == snake then
  -- Chameleons (1 in 4 chance of spawning after each attack)
    if math.random(4) == 1 then
      sol.audio.play_sound("wrong2")
      map:create_enemy(tLiz)
    end

  elseif dist == ard then
  -- Goblins (1 in 3 chance of spawning after each attack)
    if math.random(3) == 1 then
      sol.audio.play_sound("wrong2")
      map:create_enemy(tGob)
    end

  elseif dist == octo then
  -- Cyan Slime (1 in 3 chance of spawning after each attack)
    if math.random(3) == 1 then
      sol.audio.play_sound("wrong2")
      map:create_enemy(tSli)
    end

  elseif dist == fish then
  -- Iceball (1 in 3 chance of spawning after each attack)
    if math.random(3) == 1 then
      sol.audio.play_sound("wrong2")
      map:create_enemy(tIce)
    end
  
  end
  end)

end


-- Runs when the boss starts his death animation:
-- Stops the timed spawner function to prevent any other enemy 
-- from spawning while the boss is dying
function enemy:on_dying()

  sol.timer.stop_all(map)

end


-- Runs when the boss ends his death animation:
-- Clears any existing enemies from the screen upon the boss's death,
-- plays a sound affect to slightly boost the effect of the despawn,
-- stops the music to emphasize show the boss is gone, and disables
-- the blockades

function enemy:on_dead()

  map:remove_entities("bat")
  map:remove_entities("lizard")
  map:remove_entities("goblin")
  map:remove_entities("ice")
  map:remove_entities("slime")
  sol.audio.play_sound("thunder_far")
  
  sol.audio.stop_music()

  map:get_entity("r1Bottom"):set_enabled(false)
  map:get_entity("r2Bottom"):set_enabled(false)
  map:get_entity("r1Top"):set_enabled(false)
  map:get_entity("r2Top"):set_enabled(false)
  map:get_entity("bossNearExit"):set_enabled(true)
  map:get_entity("bossFarExit"):set_enabled(true)
  
  
end