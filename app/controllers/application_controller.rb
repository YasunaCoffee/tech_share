class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==Rails.application.credentials[:basic][:user_name] && password == Rails.application.credentials[:basic][:password]
    end
  end
end