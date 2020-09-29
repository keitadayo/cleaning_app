class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    
  end

  def search
    @posts = Post.search(params[:keyword])
  end


  private
  def post_params
    params.require(:post).permit(:title, :text, images: []).merge(user_id: current_user.id)
  end

end
