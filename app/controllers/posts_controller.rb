class PostsController < ApplicationController
  def index
    @posts = Post.all.order( 'created_at DESC' )
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create( post_params )

    if @post.save
      flash[:notice] = 'Post successfully!'
      
      redirect_to root_path
    else 
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit( :name, :body, :url, :tag_list )
  end
end
