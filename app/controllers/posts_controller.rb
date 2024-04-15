class PostsController < ApplicationController
    before_action :set_directory
    before_action :set_posts, only: [:index]

    def index
        if current_user.can_access_directory?(@directory)
            @directory = Directory.find(params[:directory_id])
            @posts = Post.includes(:directory).all
        else
            render 'access_denied'
        end
    end

    def new
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.build
    end

    def create
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.build(post_params)
        if @post.save
           redirect_to directory_path(@directory), notice: 'Post created successfully.'
        else
            render :new
        end
    end

    def edit
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.find(params[:id])
    end
      
    def update
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.find(params[:id])
        if @post.update(post_params)
          redirect_to directory_path(@directory), notice: 'Post updated successfully.'
        else
          render :edit
        end
    end

    def destroy
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.find(params[:id])
        @post.destroy
        redirect_to directory_path(@directory), notice: 'Post deleted successfully.'
    end

    def show
        @directory = Directory.find(params[:directory_id])
        @post = @directory.posts.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_directory
        @directory = Directory.find(params[:directory_id])
    end

    def set_posts
        @posts = @directory.posts
    end
end
