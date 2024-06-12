#Move

#Move horizontally
execute if score toLeft WorldPregen matches 1.. run function pregen:move/left
execute if score toLeft WorldPregen matches 0 if score toDown WorldPregen matches 1.. run function pregen:move/down
execute if score toDown WorldPregen matches 0 if score toRight WorldPregen matches 1.. run function pregen:move/right
execute if score toRight WorldPregen matches 0 if score toUp WorldPregen matches 1.. run function pregen:move/up
execute if score toUp WorldPregen matches 0 run function pregen:move/recalculate

#Increment progress bar
scoreboard players add ProgressValue WorldPregen 1
execute store result bossbar pregen:worldgen value run scoreboard players get ProgressValue WorldPregen

#Increment StepsCompleted
scoreboard players add StepsCompleted WorldPregen 1
