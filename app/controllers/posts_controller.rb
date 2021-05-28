class PostsController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.create(post_params)
		if post.save
			flash[:success] = 'Post Added successfully'
			redirect_to '/'

		else
			redirect_to '/add'
		end
	end
    
    def edit
    	@post = Post.find_by(params[:id])
    end

    def update

    	  @post = Post.find_by(params[:id])
    	 if current_user == @post.user_id
    		if @post.update_attribute(params[:post_edit_params])
    			flash[:success] = 'Posts updated successfully'
    			redirect_to '/'
    		else
    			redirect_to '/edit'
    		end
    	end
    	
    end 

    # def destroy
    # 	post = Post.find_by(params[:id])
    # 	if current_user.id == post.user_id
    # 		post.destroy
    # 	end
    # end
	
	private
		def post_params
			params.permit(:name, :content, :user_id)
		end 
		def post_edit_params
			params.permit(:name, :content)
		end
	
end
