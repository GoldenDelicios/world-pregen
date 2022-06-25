#Set to progress of current dimension
execute if score OriginX WorldPregen = PrevOriginX WorldPregen if score OriginZ WorldPregen = PrevOriginZ WorldPregen run scoreboard players operation @s WorldPregen = Overworld WorldPregen
function pregen:start/teleport
