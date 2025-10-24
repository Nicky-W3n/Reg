use context dcic2024

data NumList:
| nl-empty
| nl-link(first :: Number, rest :: NumList)
end

nl-empty
nl-link(3, nl-empty)
nl-link(7, nl-link(3, nl-empty))
nl-link(2, nl-link(7, nl-link(3, nl-empty)))

#|
fun num-list-fun(nl :: NumList) -> ???:
  cases (NumList) nl:
    | nl-empty => ...
    | nl-link(first, rest) =>
      ... first ...
      ... num-list-fun(rest) ...
  end
end
|#

fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        1 + num-7s(rest)
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end

#Problem 4

data NumListList:
  | nll-empty
  | nll-link(first :: NumList, rest :: NumListList)
end

# Template
# fun total-sum-of-lists(nll :: NumListList) -> ???:
#   cases (NumListList) nll:
#     | nll-empty => ...
#     | nll-link(first, rest) =>
#         ... first ...
#         ... numlistlist-fun(rest) ...
#   end
# end

fun total-sum-of-lists(nll :: NumListList) -> List<Number>:
  cases (NumListList) nll:
    | nll-empty => nl-empty
    | nll-link(first, rest) =>
        nl-link(sum-numlist(first), total-sum-of-lists(rest))
  end
where:
  total-sum-of-lists(nll-empty) is nl-empty
  total-sum-of-lists(
    nll-link(nl-link(1, nl-link(2, nl-empty)),
      nll-link(nl-link(7, nl-link(3, nl-empty)), nll-empty))
    ) is nl-link(3, nl-link(10, nl-empty))
end