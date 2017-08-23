# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'Paul Yarabe', username: 'paulyarabe', password: "coco", password_confirmation: "coco")
User.create(name: 'Thomas Cheung', username: 'cheung', password: "password", password_confirmation: "password")
User.create(name: 'Eli Goldstein', username: 'elisings', password: "hi", password_confirmation: "hi")
Article.create(title: "Trump threatens North Korea", content: "Is anyone going to make significant progress in resolving the issues in North Korea?")
Post.create(article_id: 1, user_id: 1)

Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 2)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 3)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 3)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 1)
Reaction.create(point_1: "This is a problem", point_2: "For example, consider this point.", point_3: "Following this, we should consider the following options:", content: "Mmm. KFC chicken wings are the truth!  I totally recommend going to Popeyes or KFC, ordering a bucket of fried chicken, get some mashed potatoes and macaroni, and go down on it with your friends.  Great!", article_id: 1, user_id: 1)

Card.create(reaction_id: 1)
