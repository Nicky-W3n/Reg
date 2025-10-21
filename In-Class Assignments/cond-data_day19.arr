use context dcic2024

data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end

payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26")
payment-3 = checking("987654321", "111", 55)

fun display-payment(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
end

fun payment-summary(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Cash Payment"
    | credit(cn, exp) => "Card Ending in " + string-substring(cn, 15, 19)
    | checking(acc, rout, num) => "Checking #" + num-to-string(num)
  end
end