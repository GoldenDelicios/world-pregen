#Start

function pregen:config

#Target = Radius / ChunkVar (round to nearest int)
scoreboard players set ChunkVar WorldPregen 160
scoreboard players set Target WorldPregen 80
scoreboard players operation Target WorldPregen += Radius WorldPregen
scoreboard players operation Target WorldPregen /= ChunkVar WorldPregen

#Set variables to 0
scoreboard players set toLeft WorldPregen 0
scoreboard players set toDown WorldPregen 0
scoreboard players set toRight WorldPregen 0
scoreboard players set toUp WorldPregen 0
scoreboard players set @s WorldPregen 0
scoreboard players set TimeElapsed WorldPregen 0
scoreboard players set StepsCompleted WorldPregen 0

#Set to progress of current dimension
execute at @s if score Dimension WorldPregen matches 0 in minecraft:overworld run function pregen:start/overworld
execute at @s if score Dimension WorldPregen matches -1 in minecraft:the_nether run function pregen:start/nether
execute at @s if score Dimension WorldPregen matches 1 in minecraft:the_end run function pregen:start/end

#Set progress bar, calculate progress
bossbar add pregen:worldgen {"text":"World Gen Progress"}
bossbar set pregen:worldgen style notched_10
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

#Tag for verification
scoreboard players set VerifyAttempts WorldPregen 0
tag @s add WorldGenVerify
