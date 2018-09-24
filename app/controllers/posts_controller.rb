class PostsController < ApplicationController
  def index
    @posts = if params[:tag]
      Post.tagged_with(params[:tag])
    else
      Post.all.order( 'created_at DESC' )
    end
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

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end

  private

  def post_params
    params.require(:post).permit( :name, :body, :url, :tag_list, :image )
  end
end
