# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all


200.times do |i|

  user = User.create!(email: "user#{i+1}@example.edu", name: "User ##{i + 1}", password: "#{i+1}")
  10.times do |j|
    user.posts.create(title: "Post ##{j+1}", body: "My super awesome body. Check it out.")
  end

  if (i + 1) % 3 == 0 && (i + 1) % 5 == 0
    tommy = User.create!(email: "tommy@duek.com", name: "Tommy ##{i+1}", password: "#{i+1}")
    20.times do |j|
      if j.even?
        tommy.posts.create!(title: "Tommy's rare post", body: "Check out my body. You won't see it often.")
      else
        tommy.posts.create!(title: "Tommy ##{i+1}'s #{j+1}", body: "Another inspired body.")
      end
    end
  end
end
