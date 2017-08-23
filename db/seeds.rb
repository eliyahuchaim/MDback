# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'Paul', username: 'paulyarabe', password: "coco", password_confirmation: "coco")
User.create(name: 'thomas', username: 'cheng', password: "password", password_confirmation: "password")
User.create(name: 'eli', username: 'elisings', password: "hi", password_confirmation: "hi")
Article.create(title: "Trump insults North Korea", content: "Trump was all like man f North Korea")
Post.create(article_id: 1, user_id: 1)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 2)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 3)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 3)
Reaction.create(point_1: "hi", point_2: "steak", point_3: "beeef", content: "chicken wings", article_id: 1, user_id: 1)
Card.create(reaction_id: 1)
