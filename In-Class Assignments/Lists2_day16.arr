use context dcic2024
import lists as L

fun my-doubles(num-list :: List<Number>) -> List<Number> block:
  var new-number = 0
  var new-list = [list:]
  for each(n from num-list) block:
    new-number := n * 2
    new-list.push(new-number)
  end
  new-list
where:
  my-doubles([list: 2, 4, 6, 8]) is [list: 4, 8, 12, 16]
end