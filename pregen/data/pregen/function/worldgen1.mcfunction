#Check movement
scoreboard players set CanMove WorldPregen 0
execute at @s if blocks ~-80 ~ ~-80 ~-80 ~ ~-80 ~-80 ~ ~-80 masked run scoreboard players add CanMove WorldPregen 1
execute at @s if blocks ~-80 ~ ~80 ~-80 ~ ~80 ~-80 ~ ~80 masked run scoreboard players add CanMove WorldPregen 1
execute at @s if blocks ~80 ~ ~-80 ~80 ~ ~-80 ~80 ~ ~-80 masked run scoreboard players add CanMove WorldPregen 1
execute at @s if blocks ~80 ~ ~80 ~80 ~ ~80 ~80 ~ ~80 masked run scoreboard players add CanMove WorldPregen 1

execute if score CanMove WorldPregen matches ..3 run scoreboard players add WaitingForChunks WorldPregen 1
execute if score WaitingForChunks WorldPregen matches 300 run tellraw @s {"text":"Waiting for chunks to load...\nCheck that your render distance is 5 or higher"}

execute if score CanMove WorldPregen matches 4 run function pregen:move
execute if score CanMove WorldPregen matches 4 run scoreboard players set WaitingForChunks WorldPregen 0
execute at @s if score CanMove WorldPregen matches 4 run function pregen:worldgen1
