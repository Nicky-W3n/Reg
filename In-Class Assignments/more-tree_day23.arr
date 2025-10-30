use context dcic2024

data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end
# Invariant: keys are unique, and all nodes in the left
# subtree have keys less than the key in the current node,
# all nodes in the right subtree have keys greater than
# the key in the current node

BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))

#|
fun bst-temp(bst :: BST) -> ???:
  cases (BST) bst:
    | empty-leaf => ...
    | node(k, v, left, right) => 
        ... k ...
        ... v ...
        ... bst-temp(left) ...
        ... bst-temp(right) ...
  end
end
|#

fun height(bst :: BST) -> Number:
  cases (BST) bst:
    | empty-leaf => 0
    | node(k, v, left, right) => 
        1 + num-max(height(left), height(right))
  end
where:
  height(BST0) is 0
  height(BST1) is 1
  height(BST2) is 2
  height(BST3) is 3
end

data StudentRecord:
    student-record(
      id :: Number,
      name :: String, 
      age :: Number, 
      major :: String, 
      gpa :: Number)
end

AM = student-record(175, "Alvaro Monge", 21, "Computer Science", 3.8)
ES = student-record(107, "Ellen Spertus", 22, "Computer Science", 3.95)
DP = student-record(298, "Daniel Patteron", 19, "Data Science", 3.89)
RS = student-record(301, "Rush Sanghrajka", 17, "Data Science", 3.91)
JP = student-record(103, "John Park", 23, "Informatics", 3.9)


#
# Let's organize these records in a BST!
# 

data BST:
  | empty-leaf
  | node(
      key :: Number, 
      value :: StudentRecord, 
      left :: BST, 
      right :: BST)
end


ES-node = node(107, ES, empty-leaf, empty-leaf)
AM-branch = node(175, AM, ES-node, empty-leaf)
JP-branch = node(103, JP, empty-leaf, AM-branch)
RS-node = node(301, RS, empty-leaf, empty-leaf)
root = node(298, DP, JP-branch, RS-node)

#      298
#     /    \
#  103      301
#     \
#     175
#     /
#    107

# The main goal of a BST is to be able to look up values at a given key. Design a function retrieve that takes a BST of StudentRecord and a key (a number) and returns Option<StudentRecord> if the given key exists as a key in the tree, your function should return some(v) where v is the StudentRecord value that is on the node with the key. If the given key doesn't exist, your function should return none.

fun retrieve(bst :: BST, key :: Number) -> Option<StudentRecord>:
  cases (BST) bst:
    | empty-leaf => none
    | node(k, v, left, right) => 
      if key == k:
        some(v)
      else if key < k:
        retrieve(left, key)
      else:
        retrieve(right, key)
      end
        