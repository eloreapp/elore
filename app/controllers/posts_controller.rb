class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build( post_params )

    if @post.save
      redirect_to root_path, notice: 'Post wass successfully created'
    else 
      render :new
    end
  end

  def edit
    @post = Post.find( params[:id] )
  end
  
  def update
    @post = Post.find( params[:id] )

    if @post.update(post_params)
			redirect_to @post, notice: "Post was successfully updated"
		else
			render 'edit'
		end
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
