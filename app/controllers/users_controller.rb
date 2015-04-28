class UsersController < ApplicationController
  include UsersHelper
  include SessionsHelper

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    @success = false
    @user.save
    if @user.errors.empty?
      @success = true
      save_session_for_user(@user)
    else
      @success = false
    end
    respond_to do |format|
      format.html { 
        if @success
          redirect_to '/inventory'
        else
          render text: 'user was not successfully created'
        end
      }
      format.json {
        if @success
          render json: { success: true, route: '/inventory' } 
        else
          alerts = render_to_string(partial: 'shared/alert.html.erb', locals: { model: @user })
          render json: { errors: @user.errors.full_messages, success: @success, alerts: alerts }
        end
      }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
  
end
