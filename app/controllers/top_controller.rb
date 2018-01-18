class TopController < ApplicationController
  before_action :forbidden_login_user
  def index
  end
end
