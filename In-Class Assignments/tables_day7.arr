use context starter2024
include csv
include data-source

my-table = load-table:
  gss_code :: Number,
  gss_name :: String,
  year_ending_date :: Number,
  measure :: Number,
  geography :: String,
  source :: String,
  sex :: String,
  source_url :: String,
  value :: String
  sanitize value using num-sanitizer
  source: csv-table-url("https://data.london.gov.uk/download/0720a1d9-6b21-4f87-b70e-f577b206011f/227e9976-4f01-4f93-a9d1-d5644f135714/births_lad.csv", default-options)
end

my-table
my-table.row-n(1)
my-table.length()
my-table.row-n(14000)