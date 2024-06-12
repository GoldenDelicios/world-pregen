#Set to progress of current dimension
execute if score OriginX WorldPregen = OverworldOriginX WorldPregen if score OriginZ WorldPregen = OverworldOriginZ WorldPregen run scoreboard players operation @s WorldPregen = Overworld WorldPregen
function pregen:start/teleport

#Store Origin
scoreboard players operation OverworldOriginX WorldPregen = OriginX WorldPregen
scoreboard players operation OverworldOriginZ WorldPregen = OriginZ WorldPregen
