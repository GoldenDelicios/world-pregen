#Config

#Make sure settings have valid values
scoreboard players add OriginX WorldPregen 0
scoreboard players add OriginZ WorldPregen 0
execute unless score Radius WorldPregen matches 0.. run scoreboard players set Radius WorldPregen 5000
execute unless score Dimension WorldPregen matches -1..1 run scoreboard players set Dimension WorldPregen 0
execute unless score Overworld WorldPregen matches 0.. run scoreboard players set Overworld WorldPregen 0
execute unless score Nether WorldPregen matches 0.. run scoreboard players set Nether WorldPregen 0
execute unless score End WorldPregen matches 0.. run scoreboard players set End WorldPregen 0

tellraw @s {"text":"\n\n\nWorld Pregen by GoldenDelicios","color":"dark_aqua","italic":true}
tellraw @s {"text":"Click here for help\n","color":"aqua","underlined":true,"clickEvent":{"action":"run_command","value":"/function pregen:help"},"hoverEvent":{"action":"show_text","value":"Get a user's manual"}}
tellraw @s [{"text":"Origin","color":"gold"},{"text":": ["},{"score":{"name":"OriginX","objective":"WorldPregen"},"color":"green","clickEvent":{"action":"suggest_command","value":"/scoreboard players set OriginX WorldPregen "},"hoverEvent":{"action":"show_text","value":"Change X value of world origin"}},{"text":"], ["},{"score":{"name":"OriginZ","objective":"WorldPregen"},"color":"green","clickEvent":{"action":"suggest_command","value":"/scoreboard players set OriginZ WorldPregen "},"hoverEvent":{"action":"show_text","value":"Change Z value of world origin"}},{"text":"]"}]
tellraw @s [{"text":"Radius","color":"gold"},{"text":": ["},{"score":{"name":"Radius","objective":"WorldPregen"},"color":"green","clickEvent":{"action":"suggest_command","value":"/scoreboard players set Radius WorldPregen "},"hoverEvent":{"action":"show_text","value":"Distance in number of blocks away from origin to be generated"}},{"text":"]"}]

execute if score Dimension WorldPregen matches 0 run tellraw @s [{"text":"Dimension","color":"gold"},{"text":": ["},{"text":"Overworld","color":"gold"},{"text":"] ["},{"text":"Nether","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen -1"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the Nether"}},{"text":"] ["},{"text":"End","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen 1"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the End"}},{"text":"]"}]
execute if score Dimension WorldPregen matches -1 run tellraw @s [{"text":"Dimension","color":"gold"},{"text":": ["},{"text":"Overworld","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen 0"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the Overworld"}},{"text":"] ["},{"text":"Nether","color":"gold"},{"text":"] ["},{"text":"End","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen 1"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the End"}},{"text":"]"}]
execute if score Dimension WorldPregen matches 1 run tellraw @s [{"text":"Dimension","color":"gold"},{"text":": ["},{"text":"Overworld","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen 0"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the Overworld"}},{"text":"] ["},{"text":"Nether","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set Dimension WorldPregen -1"},"hoverEvent":{"action":"show_text","value":"Select to generate chunks in the Nether"}},{"text":"] ["},{"text":"End","color":"gold"},{"text":"]"}]

tellraw @s [{"text":"\n"},{"text":"[Refresh] ","color":"green","clickEvent":{"action":"run_command","value":"/function pregen:config"},"hoverEvent":{"action":"show_text","value":"Update screen to show changed values"}},{"text":"[Start]","color":"green","clickEvent":{"action":"run_command","value":"/function pregen:start"},"hoverEvent":{"action":"show_text","value":"Start generating chunks"}}]
