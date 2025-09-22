use context dcic2024

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
end

fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-to-rational(num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])))
where:
  calc-distance(items.row-n(0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
  calc-distance(items.row-n(3)) is-roughly num-sqrt(num-sqr(-9) + num-sqr(64))
end

items-with-dist = build-column(items, "distance", calc-distance)

fun scale-down-10-percent(cord :: Number) -> Number:
  doc: "Decrease x and y cordinates' distance"
  cord * 0.90
where: 
  scale-down-10-percent(10) is 9
  scale-down-10-percent(5) is 4.50
end

table-new-cords-x = transform-column(items-with-dist, "x-coordinate", scale-down-10-percent)
table-new-cords-x-y = transform-column(table-new-cords-x, "y-coordinate", scale-down-10-percent)


order-by(table-new-cords-x-y, "distance", true)

fun obfuscate(item :: String) -> String:
  doc:"X's of the same length as the item name"
  