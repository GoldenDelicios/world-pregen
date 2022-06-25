#Remove end gateway
tp @s 0 255 0
setblock 0 255 0 minecraft:air
tp @s ~ ~ ~
gamemode spectator @s

#Success
tellraw @s [{"text":"", "color":"green", "hoverEvent":{"action":"show_text","value":"Verifying player was correctly teleported to starting position. This is needed to prevent errors."}}, {"text":"Verified successfully after "}, {"score":{"name":"VerifyAttempts","objective":"WorldPregen"}}, {"text":" attempt(s)"}]
tag @s remove WorldGenVerify
