use context dcic2024
fun discount-calc(price :: Number, discount-percentage :: Number) -> Number:
  doc: "New discounted price"
  if price <= 0 or discount-percentage <= 0:
    "Invalid price / discount"
  discount-decimal = 1 - (discount-percentage * 0.01)
  new-price = price * discount-decimal
  new-price
where:
  discount-calc(100, 10) is 90
  discount-calc(82.2, 12) is 72.336
end