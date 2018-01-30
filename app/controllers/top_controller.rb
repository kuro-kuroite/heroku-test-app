class TopController < ApplicationController
  before_action :forbidden_login_user
  def index
    render layout: 'top_page'
  end
end
