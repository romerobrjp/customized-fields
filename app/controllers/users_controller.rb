class UsersController < ApplicationController
  before_filter :require_authentication

  def index

  end
end
