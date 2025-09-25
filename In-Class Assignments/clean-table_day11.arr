use context dcic2024

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
  source: csv-table-file("voters.csv", default-options)
end

fun blank-to-indep(s :: String) -> String:
  doc: "replaces an empty string with Independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("blah") is "blah"
end
voters-with-indep = transform-column(voter-data, "Party", blank-to-indep)

# Look at the DOB column -- can you normalize these (to, say, YYYY-MM-DD) in the same way as you did phone numbers? Why or why not? Through a combination of manually editing the source and transforming the column with a function, normalize the DOB column.

voters-with-indep