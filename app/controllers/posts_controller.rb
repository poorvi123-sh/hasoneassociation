class PostsController < ApplicationController
	def index
		@user=User.find(params[:user_id])
		@posts=@user.posts
	end

	def show
    @post=Post.find(params[:id])
	end

	def new
		@user=User.find(params[:user_id])
		@post=Post.new
	end

	def create
		@post=Post.new(post_params)
		@post.save
		redirect_to root_path
	end

	private
	def post_params
		params.require(:post).permit(:description,:user_id)
	end
end
