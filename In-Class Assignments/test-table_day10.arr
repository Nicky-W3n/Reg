use context dcic2024

fun add-tax(t :: Table) -> Table:
  doc: "transforms price column to be tax column"
  transform-column(t, "price",
    lam(price :: Number) -> Number:
      price * 1.1
    end)
where:
  test-table =
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
    end

  add-tax(test-table) is
    table: price
      row: 55
      row: 132
      row: 88
      row: 44
    end
end