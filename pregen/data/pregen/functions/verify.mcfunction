#Verify player was teleported to starting position
tellraw @s {"text":"Verifying...", "color":"gold", "hoverEvent":{"action":"show_text","value":"Verifying player was correctly teleported to starting position. This is needed to prevent errors."}}

#Get player coordinates
execute store result score PosX WorldPregen run data get entity @s Pos[0]
execute store result score PosY WorldPregen run data get entity @s Pos[1]
execute store result score PosZ WorldPregen run data get entity @s Pos[2]

#Compare to Start coordinates, if matches, end verification and start
execute if score PosX WorldPregen = StartX WorldPregen if score PosY WorldPregen matches 200 if score PosZ WorldPregen = StartZ WorldPregen run tag @s add WorldGen
execute at @s[tag=WorldGen] run function pregen:success

#After ten unsuccessful attempts, show failure message
execute unless entity @s[tag=WorldGen] run scoreboard players add VerifyAttempts WorldPregen 1
execute if score VerifyAttempts WorldPregen matches 10.. run function pregen:failure
