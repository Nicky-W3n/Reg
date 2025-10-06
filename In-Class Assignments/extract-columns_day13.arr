use context dcic2024

employee-table = load-table:
  Name :: String,
  Department :: String,
  Title :: String,
  Total-Earnings :: Number
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end