class PostsController < ApplicationController
	before_action :signed_in?, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		if @post.save
			@post.users_id = current_user.id
			flash[:success] = "Post created."
			redirect_to root_path
		else
			flash[:danger] = "Invalid submission"
			render :new
		end
	end

	def index
		@posts = Post.all
	end

end
