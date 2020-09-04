# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all
Commentupvote.destroy_all
Comment.destroy_all
Themeupvote.destroy_all
Theme.destroy_all
Topic.destroy_all
User.destroy_all

puts "Creating user..."

user1 = User.create!(
    username: "kaabo",
    email: "kaabo@kaabo.com",
    password: "12345678"
)

puts "Creating topic..."

# Topic.create!(category: "Health")
# Topic.create!(category: "Jobs")
# Topic.create!(category: "Housing")
# Topic.create!(category: "Finance")
# Topic.create!(category: "Food")
# Topic.create!(category: "Education")
# Topic.create!(category: "Visa")
# Topic.create!(category: "Legal services")

puts "Creating 10 articles..."



puts "Done with articles!"

puts "Creating 10 themes(threads)..."
topic_categories = ["Health", "Jobs", "Housing", "Finance", "Food", "Education", "Visa", "Legal services"]
count = 0
8.times do
    topic = Topic.new(
        category: topic_categories[count]
    )
    topic.save

    count += 1

    10.times do
        article = Article.new(
          title: Faker::Book.title,
          content: Faker::Lorem.paragraph(sentence_count: 10),
          date: Faker::Date.between(from: 10.days.ago, to: Date.today),
          image_url: "https://source.unsplash.com/500x400/?#{topic.category}",
          topic_id: topic.id)
        article.save
    end

    10.times do
        theme = Theme.new(
        title: Faker::Lorem.question,
        date: Faker::Date.between(from: 10.days.ago, to: Date.today),
        topic_id: topic.id,
        user_id: user1.id)
        theme.save

        puts "Creating 10 comments for #{theme.title}..."

        10.times do
            comment = Comment.new(
            content: Faker::Quote.matz,
            date: Faker::Date.between(from: 10.days.ago, to: Date.today),
            theme_id: theme.id)
            comment.save

            5.times do
                commentupvote = Commentupvote.new(
                user_id: user1.id,
                comment_id: comment.id)
                commentupvote.save
            end
        end

        5.times do
            themeupvote = Themeupvote.new(
            user_id: user1.id,
            theme_id: theme.id)
            themeupvote.save
        end
    end

end

puts "Done with themes(threads)!"
puts "Done with comments!"
