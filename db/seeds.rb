puts "Destroying old database..."

List.destroy_all

puts "Creating 3 lists"

chores = List.create(title: "Chores")
entertainment = List.create(title: "Entertainment")
random = List.create(title: "Random")

puts "Finished creating lists"

puts "Creating tasks for each list"

Task.create(description: "Laundry", list: chores)
Task.create(description: "Dishes", list: chores)
Task.create(description: "Go see toy story 4", list: entertainment)
Task.create(description: "Meet John Doe", list: entertainment)
Task.create(description: "Book flight to Israel", list: entertainment)
Task.create(description: "Sleep 8 hours", list: random)

puts "Finished creating tasks"