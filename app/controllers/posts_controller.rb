class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  layout 'admin'
  before_action :log_impression, only: [:show]

  # impressionist :actions=>[:show]

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
    # Comment.order('comments.impressions_count DESC').limit(5)
    @post=Post.find(params[:id])
    @posts2=Post.all
    # impressions = Impression.select("impressionable_id, count(*) as qty").where("impressionable_type = ?", 'Post').group('impressionable_type, impressionable_id').order('qty desc')
    # @posts=Post.joins(:impressions).where(impressions: {impressionable_id: impressions.map(&:impressionable_id)})
    @posts=Post.all.order('posts.views DESC')
    render layout: "application"
  end
  
  def log_impression
    @post = Post.find(params[:id])
    if @post.views
      @post.views+=1
    else @post.views=1
    end
    @post.save
    # this assumes you have a current_user method in your authentication system
    @post.impressions.create(ip_address: request.remote_ip,user_id:current_admin)
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
