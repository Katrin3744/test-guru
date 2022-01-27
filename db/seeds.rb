# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

users = User.create!([{ name: "User_name1" }, { name: "User_name2" }])
categories = Category.create!([{ title: "Category_name1" }, { title: "Category_name2" }])
tests = Test.create!([{ title: "Title_name1", level: 1, author: users[1], category: categories[0] },
                      { title: "Title_name2", level: 0, author: users[1], category: categories[1] }])
tests_users = TestsUser.create!([{ user: users[0], test: tests[0] },
                                 { user: users[0], test: tests[1] }])
questions = Question.create!([{ body: "question_name11", test: tests[0] }, { body: "question_name12", test: tests[0] },
                              { body: "question_name13", test: tests[0] }, { body: "question_name14", test: tests[0] },
                              { body: "question_name21", test: tests[1] }, { body: "question_name22", test: tests[1] },
                              { body: "question_name23", test: tests[1] }, { body: "question_name24", test: tests[1] }])
answers_query = []
i = 0
questions.each do |question|
  j = 0
  while j < 4 do
    answer_name = "Answer_name#{i}#{j}"
    j % 2 == 1 ? answer_correct = true : answer_correct = false
    answers_query.push({ body: answer_name, correct: answer_correct, question: questions[i] })
    j += 1
  end
  i += 1
end
answers = Answer.create!(answers_query)
