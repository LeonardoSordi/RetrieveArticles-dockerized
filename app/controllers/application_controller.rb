class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, only: [:create_article, :destroy]

end
