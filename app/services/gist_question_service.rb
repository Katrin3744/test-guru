class GistQuestionService
  Response = Struct.new(:url) do
    def success?
      !url.empty?
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    Response.new result[:html_url]
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true,
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: Rails.application.credentials.github_api_key)
  end
end
