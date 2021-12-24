# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user1 = User.create!(name: "User_name1")
user2 = User.create!(name: "User_name2")
category = Category.create!(category: "Category_name1")
test1 = Test.create!(title: "Title_name1", level: 1, author_id: user2.id, category_id: category.id)
test2 = Test.create!(title: "Title_name2", level: 0, author_id: user2.id, category_id: category.id)

t_u1 = TestUser.create!(user_id: user1.id, test_id: test1.id)
t_u2 = TestUser.create!(user_id: user1.id, test_id: test2.id)

questions = Question.create!([{ question: "question_name11", test_id: test1.id }, { question: "question_name12", test_id: test1.id },
                              { question: "question_name13", test_id: test1.id }, { question: "question_name14", test_id: test1.id },
                              { question: "question_name21", test_id: test2.id }, { question: "question_name22", test_id: test2.id },
                              { question: "question_name23", test_id: test2.id }, { question: "question_name24", test_id: test2.id }])
answers_query = []
puts questions
i = 0
questions.each do |question|
  j = 0
  while j < 4 do
    answer_name = "Answer_name#{i}#{j}"
    j % 2 == 1 ? answer_correct = true : answer_correct = false
    answers_query.push({ answer: answer_name, correct: answer_correct, question_id: question.id })
    j += 1
  end
  i += 1
end
answers = Answer.create!(answers_query)
