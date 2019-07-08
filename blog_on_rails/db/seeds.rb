# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Post.destroy_all
Comment.destroy_all

50.times do
    created_at = Faker::Date.backward(365 * 5)
  p = Post.create(
    title: Faker::TvShows::HowIMetYourMother.character,
    body: Faker::TvShows::HowIMetYourMother.quote,
    created_at: created_at,
    updated_at: created_at,

  )
  if p.valid?
    p.comments = rand(0..2).times.map do
      Comment.new(body: Faker::TvShows::HowIMetYourMother.catch_phrase)
    end
end
end

comments = Comment.all
posts = Post.all

puts Cowsay.say("Generated #{posts.count} posts", :frogs)
puts Cowsay.say("Generated #{comments.count} comment", :tux)

# puts "Login with #{super_user.email} and password: #{PASSWORD}"
