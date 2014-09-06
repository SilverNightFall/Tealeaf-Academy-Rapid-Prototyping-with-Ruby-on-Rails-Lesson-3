module ApplicationHelper

  def fix_url(post_url)
    post_url.starts_with?('http://' || 'https://') ? post_url : "http://#{post_url}"
  end

  def show_datetime(datetime)
    datetime.strftime("%m/%d/%Y %l:%M%P %Z")
  end

end
