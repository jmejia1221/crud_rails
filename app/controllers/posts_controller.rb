class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def create
        @posts = Post.new(post_params)
        if @posts.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def new
        @posts = Post.new
    end

    def show
        @posts = Post.find(params[:id])
    end

    def edit
        @posts = Post.find(params[:id])
    end

    def update
        @posts = Post.find(params[:id])

        if @posts.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @posts = Post.find(params[:id])
        @posts.destroy

        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:author, :title, :description)
        end
end
