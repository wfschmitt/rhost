module Rhost
  class PostsController < Rhost::ApplicationController

    before_action { params[:id] && @post = Post.find(params[:id]) }

    def index
      @posts = Post.order(:created_at => :desc)
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(safe_params)
      set_publication_date
      if @post.save
        redirect_to edit_post_path(@post)
      else
        render 'new'
      end
    end

    def update
      set_publication_date
      if @post.update(safe_params)
        redirect_to edit_post_path(@post)
      else
        render 'edit'
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

    def safe_params
      params.require(:post).permit(:title, :slug, :markdown)
    end

    def set_publication_date
      if params[:publish] && @post.draft?
        @post.published_at = Time.now
      elsif params[:unpublish] && @post.published?
        @post.published_at = nil
      end
    end

  end
end
