class PersonController < ApplicationController
  include Secured
  def index
    @user = session[:userinfo]
  end
end
