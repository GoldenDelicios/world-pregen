#Verify player was teleported to starting position
execute if score VerifyAttempts WorldPregen matches 0 run tellraw @s {"text":"Verifying...", "color":"gold", "hoverEvent":{"action":"show_text","value":"Verifying player was correctly teleported to starting position. This is needed to prevent errors."}}

#Get player coordinates
execute store result score PosX WorldPregen run data get entity @s Pos[0]
execute store result score PosY WorldPregen run data get entity @s Pos[1]
execute store result score PosZ WorldPregen run data get entity @s Pos[2]

#Compare to Start coordinates, if matches, end verification and start
execute if score PosX WorldPregen = StartX WorldPregen if score PosY WorldPregen matches 200 if score PosZ WorldPregen = StartZ WorldPregen run tag @s add WorldGen

#After 10 unsuccessful attempts, tp back to end gateway
#After 50 unsuccessful attempts, show failure message
execute unless entity @s[tag=WorldGen] run scoreboard players add VerifyAttempts WorldPregen 1
execute unless entity @s[tag=WorldGen] if score VerifyAttempts WorldPregen matches 10 at @s run tp @s 0 255 0
execute unless entity @s[tag=WorldGen] if score VerifyAttempts WorldPregen matches 50.. run function pregen:failure

#Success
execute at @s[tag=WorldGen] run function pregen:success
