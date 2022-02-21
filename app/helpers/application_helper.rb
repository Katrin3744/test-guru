module ApplicationHelper
  def this_year_helper
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
