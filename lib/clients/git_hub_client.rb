require 'octokit'

class GitHubClient
  ACCESS_TOKEN = Rails.application.credentials.github_api_key

  def initialize
    @http_client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def get_last_response
    @http_client.last_response
  end
end
