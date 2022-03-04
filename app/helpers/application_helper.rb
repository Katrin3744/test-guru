module ApplicationHelper
  def this_year_helper
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message_helper
    html = ""
    flash.each do |key, msg|
      html << (content_tag :p, sanitize(msg,  { attributes: %w(target href)}), :id => key, :class => 'flash ' + key)
    end
    html.html_safe
  end
end
