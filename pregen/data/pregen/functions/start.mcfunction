#Start

function pregen:config

#Target = Radius / ChunkVar
scoreboard players set ChunkVar WorldPregen 160
scoreboard players operation Target WorldPregen = Radius WorldPregen
scoreboard players operation Target WorldPregen /= ChunkVar WorldPregen

#Set variables to 0
scoreboard players set toLeft WorldPregen 0
scoreboard players set toDown WorldPregen 0
scoreboard players set toRight WorldPregen 0
scoreboard players set toUp WorldPregen 0

#Set to progress of current dimension
#	Get dimension progress
execute if score Dimension WorldPregen matches 0 run scoreboard players operation @s WorldPregen = Overworld WorldPregen
execute if score Dimension WorldPregen matches -1 run scoreboard players operation @s WorldPregen = Nether WorldPregen
execute if score Dimension WorldPregen matches 1 run scoreboard players operation @s WorldPregen = End WorldPregen
#	Calculate coordinates: Start = Progress * ChunkVar + Origin
scoreboard players operation StartX WorldPregen = ChunkVar WorldPregen
scoreboard players operation StartX WorldPregen *= @s WorldPregen
scoreboard players operation StartZ WorldPregen = StartX WorldPregen
scoreboard players operation StartX WorldPregen += OriginX WorldPregen
scoreboard players operation StartZ WorldPregen += OriginZ WorldPregen
#	Teleport to coordinates
gamemode spectator @s
summon minecraft:area_effect_cloud ~ 250 ~ {Duration:1, Tags:["VarTp"]}
execute store result entity @e[tag=VarTp,limit=1] Pos[0] double 1 run scoreboard players get StartX WorldPregen
execute store result entity @e[tag=VarTp,limit=1] Pos[2] double 1 run scoreboard players get StartZ WorldPregen
tp @s @e[tag=VarTp,limit=1]
kill @e[tag=VarTp]
#	Teleport to correct dimension
execute at @s if score Dimension WorldPregen matches 0 in minecraft:overworld run tp @s ~ ~ ~ 0 90
execute at @s if score Dimension WorldPregen matches -1 in minecraft:the_nether run tp @s ~ ~ ~ 0 90
execute at @s if score Dimension WorldPregen matches 1 in minecraft:the_end run tp @s ~ ~ ~ 0 90

#Set progress bar, calculate progress
bossbar add pregen:worldgen {"text":"World Gen Progress"}
bossbar set pregen:worldgen players @s
#	ProgressMax = ChunkVar * ((2t+1)^2 - (2t))
scoreboard players operation ProgressMax WorldPregen = Target WorldPregen
scoreboard players operation ProgressMax WorldPregen += Target WorldPregen
scoreboard players add ProgressMax WorldPregen 1
scoreboard players operation ProgressMax WorldPregen *= ProgressMax WorldPregen
scoreboard players operation ProgressMax WorldPregen -= Target WorldPregen
scoreboard players operation ProgressMax WorldPregen -= Target WorldPregen
scoreboard players operation ProgressMax WorldPregen *= ChunkVar WorldPregen
execute store result bossbar pregen:worldgen max run scoreboard players get ProgressMax WorldPregen
#	ProgressValue = ChunkVar * ((2s+1)^2 - (2s))
scoreboard players operation ProgressValue WorldPregen = @s WorldPregen
scoreboard players operation ProgressValue WorldPregen += @s WorldPregen
scoreboard players add ProgressValue WorldPregen 1
scoreboard players operation ProgressValue WorldPregen *= ProgressValue WorldPregen
scoreboard players operation ProgressValue WorldPregen -= @s WorldPregen
scoreboard players operation ProgressValue WorldPregen -= @s WorldPregen
scoreboard players operation ProgressValue WorldPregen *= ChunkVar WorldPregen
execute store result bossbar pregen:worldgen value run scoreboard players get ProgressValue WorldPregen

#Tag as WorldGen
tag @s add WorldGen
