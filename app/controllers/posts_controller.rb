class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def create
        @posts = Post.new(post_params)
        if @posts.save
            flash[:notice] = 'El post ha sido creado con éxito'
            redirect_to posts_path
        else
            flash[:alert] = 'Algo falló, el post no fue creado'
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
            flash[:notice] = 'El post ha sido actualizado con éxito'
            redirect_to posts_path
        else
            flash[:alert] = 'Algo salió mal, El post no fue actualizado'
            render :edit
        end
    end

    def destroy
        @posts = Post.find(params[:id])
        @posts.destroy

        flash[:notice] = 'El post ha sido Eliminado con éxito'
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:author, :title, :description)
        end
end
