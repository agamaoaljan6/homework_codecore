Comment.delete_all
Post.delete_all


100.times do
  t = Faker::Alphanumeric.alphanumeric 10
  p = Post.create(
    title: t,
    body: Faker::Hipster.paragraphs
  )
  if p.valid?
    p.comments = rand(0..10).times.map do
      c = Faker::Alphanumeric.alphanumeric 10
      Comment.new(body: c)
    end
    p.save
  end
end

comments = Comment.all
posts = Post.all

puts Cowsay.say("Generated #{posts.count} posts", :frogs)
puts Cowsay.say("Generated #{comments.count} comment", :tux)

# puts "Login with #{super_user.email} and password: #{PASSWORD}"
