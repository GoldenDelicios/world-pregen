#Remove end gateway
tp @s 0 255 0
setblock 0 255 0 minecraft:air
tp @s ~ ~ ~

#Success
tellraw @s {"text":"Verified successfully", "color":"green", "hoverEvent":{"action":"show_text","value":"Verifying player was correctly teleported to starting position. This is needed to prevent errors."}}
tag @s remove WorldGenVerify
