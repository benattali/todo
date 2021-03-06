puts "Destroying old database..."
User.destroy_all

puts "Creating a user"

user = User.create(email: "user@email.com", password: "123456", password_confirmation: "123456")

puts "Finished creating a user"

puts "Creating 3 lists"

chores = List.create(title: "Chores", user: user)
entertainment = List.create(title: "Entertainment", user: user)
random = List.create(title: "Random", user: user)

puts "Finished creating lists"

puts "Creating tasks for each list"

Task.create(description: "Laundry", list: chores)
Task.create(description: "Dishes", list: chores)
Task.create(description: "Go see toy story 4", list: entertainment)
Task.create(description: "Meet John Doe", list: entertainment)
Task.create(description: "Book flight to Israel", list: entertainment)
Task.create(description: "Sleep 8 hours", list: random)

puts "Finished creating tasks"