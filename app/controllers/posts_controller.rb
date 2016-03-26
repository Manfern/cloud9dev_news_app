class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.create(post_params)
  end

  def show
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.save
      "successfully saved"
    else
      render 'new'
    end
  end

  def edit
    @post=Post.find(params[:id])
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
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
