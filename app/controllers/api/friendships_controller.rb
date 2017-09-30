module Api
	class FriendshipsController < ApplicationController
	 #  def create
	 #  	@user = User.find(params[:to_user_id])
	 #  	if current_user.friend?(@user)
		# 	redirect_to root_path
		# else
	 #  	  @friendships = Friendship.create(from_user_id: current_user.id, to_user_id: params[:to_user_id])
		#   	if @friendships.save
		# 	  	render json: @friendships.to_json, status:200
		# 	else
	 #            render json: {message: "create error"}.to_json, status:400
		# 	end
		# end
	 #  end

	  def create
    	@friendship = current_user.friendships_of_from_user.build(friendship_params)
    	if @friendship.save
      	  render json: { status: 200, friendship: @friendship }
    	else
      	  render json: { status: 200, friendship: @friendship }
    	end
  	  end

  	  def destroy
  	  	# destroy_user = current_user.friendships_of_from_user(destroy_user_params)
    	  destroy_user = current_user.friend_by_id(destroy_user_params)
    	if destroy_user.destroy
      	  render json: { status: 200, user: current_user.as_json(methods: 'friends') }
    	else
      	  render json: { status: 400, user: current_user.as_json(methods: 'friends') }
    	end
  	  end

  	  private

  	  def friendship_params
    	params.require(:friendship).permit(:to_user_id)
  	  end

  	  def destroy_user_params
    	ActionController::Parameters.new(params).permit(:to_user_id)
  	  end

	end
end