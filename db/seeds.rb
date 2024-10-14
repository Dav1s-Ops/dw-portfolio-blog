User.destroy_all
Category.destroy_all
Tag.destroy_all
Post.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('tags')
ActiveRecord::Base.connection.reset_pk_sequence!('posts')

admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

categories = Category.create!([
  { name: 'Ruby on Rails' },
  { name: 'JavaScript' },
  { name: 'Docker' },
  { name: 'DevOps' },
  { name: 'Hotwire' },
  { name: 'Tailwind CSS' }
])

tags = Tag.create!([
  { name: 'Tutorial' },
  { name: 'Guide' },
  { name: 'Tips' },
  { name: 'Best Practices' },
  { name: 'Performance' },
  { name: 'Security' }
])

10.times do |i|
  post = admin.posts.create!(
    title: "Sample Post #{i + 1}",
    content: <<~CONTENT,
      ## Introduction

      This is the content for **Sample Post #{i + 1}**. It's a great post about coding with Ruby on Rails.

      ```ruby
      def sample_method
        puts 'Hello, World!'
      end
      ```

      ### Conclusion

      Thank you for reading!
    CONTENT
    status: i.even? ? 'published' : 'draft'
  )

  post.categories << categories.sample(2)

  post.tags << tags.sample(3)
end

puts "Created #{User.count} user(s)."
puts "Created #{Category.count} categor(ies)."
puts "Created #{Tag.count} tag(s)."
puts "Created #{Post.count} post(s)."