use context dcic2024

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)


fun book-summary(b :: BookRecord) -> String:
  doc: "Produces a summary of a book"
  b.title + " by " + b.author + ", " + num-to-string(b.pages) + " pages"
where:
  book-summary(the-dispossessed) is "The Dispossessed by Ursula K. Le Guin, 387 pages"
end


fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "Determines if a book is long based on pages"
  b.pages > 350
where:
  is-long-book(brave-new-world) is false
end

data Podcast:
  | pod(title :: String, genre :: String, host :: String, avg-length :: Number)
end