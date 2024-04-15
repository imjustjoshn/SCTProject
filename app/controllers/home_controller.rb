class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @directories = Directory.all
  end
end
