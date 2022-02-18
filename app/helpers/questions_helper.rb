module QuestionsHelper
  def question_header(source)
    if !source.is_a?(Question)
      "Create New #{source.first.title} Question"
    else
      "Edit #{source.test.title} Question"
    end
  end
end
