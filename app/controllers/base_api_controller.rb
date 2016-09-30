class BaseApiController < ApplicationController
  before_filter :parse_request, :authenticate_user_from_token!

  private
    def authenticate_user_from_token!
      
      if !@json['api_token']
        render nothing: true, status: :unauthorized
      else
        #@user = nil
        #User.find_each do |u|
        #  if Devise.secure_compare(u.api_token, @json['api_token'])
        #    @user = u
        #  end
        #end
        @status = false
        begin
          @graph = Koala::Facebook::API.new(@json['api_token'])
          logger.info @graph.to_s
          @profile = @graph.get_object("me")
          logger.info @profile.to_s
          @status = true if @profile
          logger.info @status
          @status
        rescue
          logger.warn "render nothing"
          render nothing: true, status: :unauthorized
        end
         
         
       end
     end

     def parse_request
     logger.info request.env
     #logger.info request.http_data
        logger.debug request.body.read.to_s
       @json = JSON.parse(request.body.read)
       logger.debug "JSON:" + @json.to_s
     end
  end