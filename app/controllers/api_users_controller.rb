class ApiUsersController < ApplicationController
  def index
    #render json: Topic.where('owner_id = ?', @user.id)
    @users = User.all
    logger.info "rendering users json"
    render json: @users , :root => 'users'
  end

  def show
    token = params[:token].to_s.encode("UTF-8")
    logger.info "Encoding: #{token.encoding.name}"
    @user = User.where(:token => token).first rescue nil
    
    logger.info "Welcome #{@user.name}!" if @user
    
    render json: @user
    
  end
end
