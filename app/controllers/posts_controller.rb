class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  layout 'admin'
  
  def index
    @posts=Post.all
    render layout: "application"
  end
  
  def second
    @posts=Post.all
    render layout: "second"
    # redirect_to "posts#second"
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
		if @post.save
		  redirect_to posts_path
	  else
		  render :new
	  end
  end

  def show
    @posts=Post.all
    @post=Post.find(params[:id])
    render layout: "application"
  end
  
  def edit
    @post=Post.find(params[:id])
    
  end
  def update
    @post=Post.find(params[:id])
    if @post.update!(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

 

  def destroy
    @post=Post.find(params[:id])
    if @post.destroy
       redirect_to root_path 
    else 
      render :edit
    end
  end
  
  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.
	# def set_post
	# 	@post = Post.find(params[:id])
	# end

	def post_params
	  params.require(:post).permit(:title, :content, :image)
	end
end
