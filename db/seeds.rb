# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user = User.create(name: "User_name")
category = Category.create(category: "Category_name")
test = Test.create(title: "Title_name", level: 1, author_id: user.id, category_id: category.id)
t_u=TestUser.create(user_id: user.id, test_id: test.id)
question = Question.create(question: "question_name", test_id: test.id)
answer=Answer.create(answer: "Answer_name", question_id: question.id)
a_u=AnswerUser.create(user_id: user.id, answer_id: answer.id)
