use context dcic2024

data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(8)
stream-c = stream(3)
merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

fun total-flow(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    | stream(flow) => 0
  end
where:
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end

fun has-large-stream(r :: River) -> Boolean:
  cases (River) r:
    | merge(width, left, right) => 
      has-large-stream(left) or has-large-stream(right)
    | stream(flow-rate) =>
      flow-rate > 6
  end
where:
  has-large-stream(stream-a) is false
  has-large-stream(merge-1) is true
end

fun count-streams(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end
where:
  count-streams(stream-b) is 1
  count-streams(merge-1) is 2
  count-streams(main-river) is 3
end