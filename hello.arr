use context dcic2024

"hello CS2000!"
above(rectangle(100, 20, "solid", "red"),
  above(rectangle(100, 20, "solid", "blue"),
    rectangle(100, 20, "solid", "orange")))

overlay(regular-polygon(100, 8, "solid", "red"), regular-polygon(105, 8, "solid", "white"))

orange-triangle = triangle(35, "solid", "orange")
side-length = 60
color = "green"
square(side-length, "solid", color)

s-yellow-circle = circle(10, "solid", "yellow")
l-black-rect = rectangle(100, 100, "solid", "black")
img = above(beside(s-yellow-circle, s-yellow-circle), l-black-rect)

#white star
ws = star(7, "solid", "white")
two-stars = beside(ws, ws)
four-stars = beside(two-stars, two-stars)
five-stars = beside(four-stars, ws)
six-stars = beside(four-stars, two-stars)

#blue rectangle for white stars
br = rectangle(120, 50, "solid", "blue")

#white stripes / rectangle
wr = rectangle(10, 10, "solid", "white")

#red stripes / rectangle
rr = rectangle(10, 10, "solid", "red")

#U.S. Flag part 1
us_flag_1 = place-image-align(six-stars, br)