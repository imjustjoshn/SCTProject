class DirectoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_directory, only: [:show]

    def index
      @directories = Directory.all
    end
  
    def new
      @directory = Directory.new
    end
  
    def create
      @directory = Directory.new(directory_params)
      if @directory.save
        redirect_to directories_path, notice: "Directory created successfully."
      else
        render :new
      end
    end
  
    def edit
      @directory = Directory.find(params[:id])
    end
  
    def update
      @directory = Directory.find(params[:id])
      if @directory.update(directory_params)
        redirect_to directories_path, notice: "Directory updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @directory = Directory.find(params[:id])
      @directory.destroy
      redirect_to directories_path, notice: "Directory deleted successfully."
    end

    def show
      @directory = Directory.find(params[:id])
      if current_user.can_access_directory?(@directory)
        @post = @directory.posts.first
        if @post
          redirect_to directory_post_path(@directory, @post)
        else
          redirect_to directories_path, notice: 'No posts found for this directory.'
        end
      else
        render 'access_denied'
    end
  
    private
  
    def directory_params
      params.require(:directory).permit(:name)
    end
end
