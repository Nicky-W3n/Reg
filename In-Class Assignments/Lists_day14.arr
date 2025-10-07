use context dcic2024

include csv
include data-source
import lists as L

employee = load-table:
  NAME :: String,
  DEPARTMENT_NAME :: String,
  TITLE :: String,
  REGULAR :: String,
  RETRO :: String,
  OTHER :: String,
  OVERTIME :: String,
  INJURED :: String,
  DETAIL :: String,
  QUINN_EDUCATION :: String,
  TOTAL_GROSS :: String,
  POSTAL :: String
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end

fun find-smith(r :: Row) -> Boolean:
  r["NAME"] == "Smith"
end

only-smith = L.filter(find-smith, employee.rows)