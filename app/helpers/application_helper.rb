module ApplicationHelper
  def this_year_helper
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map { |key, msg| (content_tag :p, sanitize(msg, { attributes: %w(target href) }),
                                        :id => key, :class => 'flash ' + key) }.join.html_safe
  end
end
