module ApplicationHelper
  def this_year_helper
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
