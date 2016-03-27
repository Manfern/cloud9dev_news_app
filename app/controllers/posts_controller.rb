class PostsController < ApplicationController
  
  
  
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
    #carrier_wave_code
    @post_attachment = @post.post_attachments.build 
  end

  def create
    @post = Post.new(post_params)

   respond_to do |format|
     if @post.save
       params[:post_attachments]['iamge'].each do |a|
          @post_attachment = @post.post_attachments.create!(:image => a)
       end
       format.html { redirect_to @post, notice: 'Post was successfully created.' }
     else
       format.html { render action: 'new' }
     end
    end
  end

  def show
    @post=Post.find(params[:id])
    @post_attachments = @post.post_attachments.all
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
    params.require(:post).permit(:title, post_attachments_attributes: [:id, :post_id, :image])
  end
  
end
