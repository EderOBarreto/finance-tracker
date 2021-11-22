class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = User.find_by(first_name: params[:friend], email: params[:friend] )
      if @friend
        respond_to do |format|
          format.js { render partial: 'friends/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "User not found"
          format.js { render partial: 'friends/result' }
        end
      end
    else
      respond_to do |format| 
        flash.now[:alert] = "Please enter the name or email."
        format.js { render partial: 'friends/result' }
      end
    end
  end
end
