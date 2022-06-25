#Recalculate

#Progress update
#	Area generated:
scoreboard players operation Area WorldPregen = @s WorldPregen
scoreboard players operation Area WorldPregen *= ChunkVar WorldPregen
scoreboard players operation Area WorldPregen += Area WorldPregen

#	Estimated time remaining:
#	Hours = (ProgressMax - ProgressValue) / 72000
#	Minutes = (ProgressMax - ProgressValue) / 1200 % 60
scoreboard players operation Hours WorldPregen = ProgressMax WorldPregen
scoreboard players operation Hours WorldPregen -= ProgressValue WorldPregen
scoreboard players operation Minutes WorldPregen = Hours WorldPregen
scoreboard players set TimeVar WorldPregen 72000
scoreboard players operation Hours WorldPregen /= TimeVar WorldPregen
scoreboard players set TimeVar WorldPregen 1200
scoreboard players operation Minutes WorldPregen /= TimeVar WorldPregen
scoreboard players set TimeVar WorldPregen 60
scoreboard players operation Minutes WorldPregen %= TimeVar WorldPregen

#	Post progress update
tellraw @s {"text":"Progress update:","color":"dark_aqua"}
tellraw @s [{"text":"","hoverEvent":{"action":"show_text","value":"The radius is half the length of the area"}},{"text":"Generated a "},{"score":{"name":"Area","objective":"WorldPregen"},"color":"green"},{"text":"x"},{"score":{"name":"Area","objective":"WorldPregen"},"color":"green"},{"text":" area."}]
tellraw @s [{"text":"","hoverEvent":{"action":"show_text","value":"May be faster or slower depending on your hardware"}},{"text":"Estimated time remaining: "},{"score":{"name":"Hours","objective":"WorldPregen"},"color":"green"},{"text":"h"},{"score":{"name":"Minutes","objective":"WorldPregen"},"color":"green"},{"text":"m "},{"text":"[Stop]","color":"red","clickEvent":{"action":"run_command","value":"/tag @s add WorldGenStop"},"hoverEvent":{"action":"show_text","value":"Save progress and stop early"}}]

#Calculate moves for next cycle:
#	toLeft = toDown = (2s+1) * ChunkVar
#	toRight = toUp = (2s+2) * ChunkVar
scoreboard players set toLeft WorldPregen 1
scoreboard players operation toLeft WorldPregen += @s WorldPregen
scoreboard players operation toLeft WorldPregen += @s WorldPregen
scoreboard players operation toRight WorldPregen = toLeft WorldPregen
scoreboard players add toRight WorldPregen 1
scoreboard players operation toLeft WorldPregen *= ChunkVar WorldPregen
scoreboard players operation toRight WorldPregen *= ChunkVar WorldPregen
scoreboard players operation toDown WorldPregen = toLeft WorldPregen
scoreboard players operation toUp WorldPregen = toRight WorldPregen

#Increase dimension progress
scoreboard players add @s WorldPregen 1

#Check conditions to stop
execute if score @s WorldPregen > Target WorldPregen run tag @s add WorldGenStop
