use context dcic2024
include csv
include data-source

orders = table: time :: Number
  row: 8
  row: 10
  row: 5
  row: 4
  row: 9
  row: 6
end

fun is-morning(t :: Row) -> Boolean:
  doc: "Determines if the time is morning"
  t["time"] >= 6
where:
  is-morning(orders.row-n(2)) is false
  is-morning(orders.row-n(0)) is true
  is-morning(orders.row-n(5)) is true
end

order-by(orders, "time", false)

table = load-table: 
  Location :: String,
  Subject :: String,
  Date :: String
  sanitize Date using num-sanitizer
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end

fun forest(r :: Row) -> Boolean:
  doc: "Looks for forest"
  r["Subject"] == "Forest"
end

filtered-table = filter-with(table, forest)

order-by(filtered-table, "Date", false)