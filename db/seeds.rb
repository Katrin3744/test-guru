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

question11 = Question.create!(question: "question_name11", test_id: test1.id)
question12 = Question.create!(question: "question_name12", test_id: test1.id)
question13 = Question.create!(question: "question_name13", test_id: test1.id)
question14 = Question.create!(question: "question_name14", test_id: test1.id)

question21 = Question.create!(question: "question_name21", test_id: test2.id)
question22 = Question.create!(question: "question_name22", test_id: test2.id)
question23 = Question.create!(question: "question_name23", test_id: test2.id)
question24 = Question.create!(question: "question_name24", test_id: test2.id)

answer111 = Answer.create!(answer: "Answer_name111", correct: false, question_id: question11.id)
answer112 = Answer.create!(answer: "Answer_name112", correct: true, question_id: question11.id)
answer113 = Answer.create!(answer: "Answer_name113", correct: false, question_id: question11.id)
answer114 = Answer.create!(answer: "Answer_name114", correct: false, question_id: question11.id)

answer121 = Answer.create!(answer: "Answer_name121", correct: false, question_id: question12.id)
answer122 = Answer.create!(answer: "Answer_name122", correct: true, question_id: question12.id)
answer123 = Answer.create!(answer: "Answer_name123", correct: false, question_id: question12.id)
answer124 = Answer.create!(answer: "Answer_name124", correct: false, question_id: question12.id)

answer131 = Answer.create!(answer: "Answer_name131", correct: false, question_id: question13.id)
answer132 = Answer.create!(answer: "Answer_name132", correct: true, question_id: question13.id)
answer133 = Answer.create!(answer: "Answer_name133", correct: false, question_id: question13.id)
answer134 = Answer.create!(answer: "Answer_name134", correct: false, question_id: question13.id)

answer141 = Answer.create!(answer: "Answer_name141", correct: false, question_id: question14.id)
answer142 = Answer.create!(answer: "Answer_name142", correct: true, question_id: question14.id)
answer143 = Answer.create!(answer: "Answer_name143", correct: false, question_id: question14.id)
answer144 = Answer.create!(answer: "Answer_name144", correct: false, question_id: question14.id)

answer211 = Answer.create!(answer: "Answer_name211", correct: false, question_id: question21.id)
answer212 = Answer.create!(answer: "Answer_name212", correct: true, question_id: question21.id)
answer213 = Answer.create!(answer: "Answer_name213", correct: false, question_id: question21.id)
answer214 = Answer.create!(answer: "Answer_name214", correct: false, question_id: question21.id)

answer221 = Answer.create!(answer: "Answer_name221", correct: false, question_id: question22.id)
answer222 = Answer.create!(answer: "Answer_name222", correct: true, question_id: question22.id)
answer223 = Answer.create!(answer: "Answer_name223", correct: false, question_id: question22.id)
answer224 = Answer.create!(answer: "Answer_name224", correct: false, question_id: question22.id)

answer231 = Answer.create!(answer: "Answer_name231", correct: false, question_id: question23.id)
answer232 = Answer.create!(answer: "Answer_name232", correct: true, question_id: question23.id)
answer233 = Answer.create!(answer: "Answer_name233", correct: false, question_id: question23.id)
answer234 = Answer.create!(answer: "Answer_name234", correct: false, question_id: question23.id)

answer241 = Answer.create!(answer: "Answer_name241", correct: false, question_id: question24.id)
answer242 = Answer.create!(answer: "Answer_name242", correct: true, question_id: question24.id)
answer243 = Answer.create!(answer: "Answer_name243", correct: false, question_id: question24.id)
answer244 = Answer.create!(answer: "Answer_name244", correct: false, question_id: question24.id)

a_u11 = AnswerUser.create!(user_id: user1.id, answer_id: answer111.id)
a_u12 = AnswerUser.create!(user_id: user1.id, answer_id: answer122.id)
a_u13 = AnswerUser.create!(user_id: user1.id, answer_id: answer133.id)
a_u14 = AnswerUser.create!(user_id: user1.id, answer_id: answer144.id)

a_u21 = AnswerUser.create!(user_id: user1.id, answer_id: answer211.id)
a_u22 = AnswerUser.create!(user_id: user1.id, answer_id: answer223.id)
a_u23 = AnswerUser.create!(user_id: user1.id, answer_id: answer233.id)
a_u24 = AnswerUser.create!(user_id: user1.id, answer_id: answer241.id)
