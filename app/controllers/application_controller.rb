class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def top_page
    render html: "This is the top page!"
  end
end
