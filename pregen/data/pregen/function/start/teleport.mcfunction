#	Calculate coordinates: Start = Progress * ChunkVar + Origin
scoreboard players operation StartX WorldPregen = ChunkVar WorldPregen
scoreboard players operation StartX WorldPregen *= @s WorldPregen
scoreboard players operation StartZ WorldPregen = StartX WorldPregen
scoreboard players operation StartX WorldPregen += OriginX WorldPregen
scoreboard players operation StartZ WorldPregen += OriginZ WorldPregen

#	Teleport to 0,0
tp @s 0 255 0 0 90

#	Force-load 0,0
execute store success score WasNotForceLoaded WorldPregen run forceload add 0 0 0 0

#	Teleport to coordinates
gamemode spectator @s
execute at @s run setblock 0 255 0 minecraft:end_gateway{exit_portal: [I; 0, 200, 0], ExactTeleport:1b}
execute at @s store result block 0 255 0 exit_portal[0] double 1 run scoreboard players get StartX WorldPregen
execute at @s store result block 0 255 0 exit_portal[2] double 1 run scoreboard players get StartZ WorldPregen
gamemode creative @s

#	Unload 0,0
execute unless score WasNotForceLoaded WorldPregen matches 0 run forceload remove 0 0 0 0
