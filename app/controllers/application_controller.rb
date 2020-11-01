class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  private

  def basic_auth
    authenticate_or_request_with_http_basic_ do |username, password|
      username == 'yohey' && password == '2600'
    end
  end  
end
