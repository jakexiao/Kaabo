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
    password: "12345678",
    admin: true
)

user2 = User.create!(
    username: "Rohaan",
    email: "rohaan@kaabo.com",
    password: "12345678"
)

user3 = User.create!(
    username: "Ana Moura",
    email: "anamoura@kaabo.com",
    password: "12345678"
)

user4 = User.create!(
    username: "António Zambujo",
    email: "zambujo@kaabo.com",
    password: "12345678"
)

user5 = User.create!(
    username: "Jacky",
    email: "jacky@kaabo.com",
    password: "12345678"
)

user6 = User.create!(
    username: "Seu Jorge",
    email: "seujorge@kaabo.com",
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
          topic_id: topic.id,
          user_id: user1.id)
        article.save
    end

    10.times do
        theme = Theme.new(
        title: Faker::Lorem.question,
        content: Faker::Quote.matz,
        date: Faker::Date.between(from: 10.days.ago, to: Date.today),
        topic_id: topic.id,
        user_id: user1.id)
        theme.save

        puts "Creating 10 comments for #{theme.title}..."

        10.times do
            comment = Comment.create!(
            content: Faker::Quote.matz,
            date: Faker::Date.between(from: 10.days.ago, to: Date.today),
            user_id: user1.id,
            theme_id: theme.id)
            # comment.save

            5.times do
                commentupvote = Commentupvote.create!(
                user_id: user1.id,
                comment_id: comment.id)
               # commentupvote.save
            end
        end

        5.times do
            themeupvote = Themeupvote.create(
            user_id: user1.id,
            theme_id: theme.id)
            # themeupvote.save
        end
    end

end

puts "Done with themes(threads)!"
puts "Done with comments!"

# main_theme = Theme.create!(
#         title: "Help with my Visa",
#         content: "Guys, I had my SEF appointment cancelled during the pandemics. I need to reschedule it, but I'm not being able to do it through the phone. Any tips?",
#         date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#         topic_id: topic.id,
#         user_id: user2.id)


# comment1 = Comment.create!(
#         content: "Hi Rohaan! You can do it through SEF website. The URL is https://www.sef.pt/pt/Pages/homepage.aspx",
#         date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#         user_id: user3.id,
#         theme_id: main_theme.id)

# comment2 = Comment.create!(
#     content: "Thanks, Ana! I'll try to get my appointment!",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user2.id,
#     theme_id: main_theme.id)

# comment3 = Comment.create!(
#     content: "This part is pretty simple. The problem is to get a good date: it is hard to get appointments until the end of the year.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user4.id,
#     theme_id: main_theme.id)

# comment4 = Comment.create!(
#     content: "Rohaan, make an appointment to whenever they have and keep and eye on their website: a lot of people cancel or loose their dates, so you can try to fill in.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user5.id,
#     theme_id: main_theme.id)

# comment5 = Comment.create!(
#     content: "You can also try to get to their office early in the morning. It is not guaranteed, but some times there are a few spots missing in that day and you can try to fill them.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user3.id,
#     theme_id: main_theme.id)

# comment6 = Comment.create!(
#     content: "Thanks, Ana! I will go there on monday and try to figure this out.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user2.id,
#     theme_id: main_theme.id)

# comment7 = Comment.create!(
#     content: "Hey, don't forget to bring your work contract. It turns everything way easier.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user6.id,
#     theme_id: main_theme.id)

# comment8 = Comment.create!(
#     content: "I'll be there on Monday as well! Good luck to us!",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user5.id,
#     theme_id: main_theme.id)

# comment9 = Comment.create!(
#     content: "Guys, don't forget to post here updates on what happen!",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user4.id,
#     theme_id: main_theme.id)

# comment10 = Comment.create!(
#     content: "Ah, if they ask anything different or set a new schedule, let us know so Kaabo can edit their articles",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user3.id,
#     theme_id: main_theme.id)

# comment11 = Comment.create!(
#     content: "Okay! I'll keep you guys posted!",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     user_id: user2.id,
#     theme_id: main_theme.id)

# article = Article.new(
#     title: "Government grants residence to immigrants and asylum seekers",
#     content: "The Government’s official Order established that immigrants and asylum seekers with pending residence applications in SEF are granted residence status, until 30 of June of 2020, and have access to the same rights and supports, including health, social support, employment and housing.",
#     date: Faker::Date.between(from: 10.days.ago, to: Date.today),
#     image_url: "https://source.unsplash.com/500x400/?#{topic.category}",
#     topic_id: 15,
#     user_id: user1.id)
#     article.save





