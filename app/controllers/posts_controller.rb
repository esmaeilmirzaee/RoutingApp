class PostsController < ApplicationController
	before_action :set_post, only: [:show]

	def index

	end

	def show
		respond_to do |format|
			if @post.nil?
				format.html { render :missing, notice: 'Page not found'}
			else
				format.html { render :show, notice: "#{@post.title}"}
			end
		end
	end

	def missing
	end

	private 
	def set_post
		@id = Integer(params[:id]) rescue false
		if @id and Post.all.ids.include?(@id)
		 	@post = Post.find(@id)
		end
	end
end