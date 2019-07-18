# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all

10.times do
    User.create(
      first_name: Faker::Name.unique.name,
      last_name: Faker::Name.unique.name,
      email: "#{Faker::Name.first_name.downcase}.#{Faker::Name.last_name.downcase}@example.com",
      password: "supersecret"
    )
end
  
users = User.all

50.times do
  t = Faker::Alphanumeric.alphanumeric 10
  p = Post.create(
    title: t,
    body: Faker::Hipster.paragraphs,
    user: users.sample
  )
  
  if p.valid?
    p.comments = rand(0..10).times.map do
      c = Faker::Alphanumeric.alphanumeric 10
      Comment.new(body: c, user: users.sample)
    end
    p.save
  end
end


posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{ posts.count } posts",:frogs)
puts Cowsay.say("Generated #{ comments.count } comments", :tux)
puts Cowsay.say("Generated #{ users.count } users", :stegosaurus)
