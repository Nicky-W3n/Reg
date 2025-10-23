use context dcic2024

fun add-till-zero(l :: List<Number>) -> Number:
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    end
where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end

# Problem 1

fun add-till-zero2(l :: List<Numbers>) -> Number block:
  var sum = 0
  for each(n from l):
    if n == 0:
      0
    else:
      sum := sum + n
    end
  end
  sum
end

# Problem 2

fun string-less-than(l :: List<String>) -> List<String>:
  cases(List) l:
    | empty => 0