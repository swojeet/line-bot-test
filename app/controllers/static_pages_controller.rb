class StaticPagesController < ApplicationController

  def home
    # @response = get_access_token('hO0L3ihpxOhNmoUut34w')
    #Redirection from Login With Line returns these
    if params.has_key? (:code)
      code = params[:code]
      state = params[:state]
      friendship_status_changed = params[:friendship_status_changed]
      @response = JSON.parse(UserInfoServices.get_access_token(code))
      @access_token = @response['access_token']
      @id_token = @response['id_token']
      @user_info = JSON.parse(UserInfoServices.get_user_info(@access_token))
      puts "USER ID ========= " + @user_info['userId']
      puts @user_info['displayName']
      User.create(line_id: @user_info['userId'], line_name: @user_info['displayName']) unless (User.where(line_id: @user_info['userId']).exists?)

    end
  end

  # private
  # def get_access_token(code)
  #   uri = URI.parse("https://api.line.me/oauth2/v2.1/token")
  #   request = Net::HTTP::Post.new(uri)
  #   request.content_type = "application/x-www-form-urlencoded"
  #   request.set_form_data(
  #     "client_id" => "1563433382",
  #     "client_secret" => "31274175a0eeb4b3f2ef4b6331fc553c",
  #     "code" => code,
  #     "grant_type" => "authorization_code",
  #     "redirect_uri" => "https://linebot-staging.herokuapp.com/",
  #   )
  #
  #   req_options = {
  #     use_ssl: uri.scheme == "https",
  #   }
  #
  #   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #     http.request(request)
  #   end
  #
  #   # response.code
  #   # response.body
  #   return response.body
  # end
  #
  # def get_user_info(access_token)
  #   uri = URI.parse("https://api.line.me/v2/profile")
  #   request = Net::HTTP::Get.new(uri)
  #   request["Authorization"] = "Bearer #{access_token}"
  #
  #   req_options = {
  #     use_ssl: uri.scheme == "https",
  #   }
  #
  #   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #     http.request(request)
  #   end
  #
  #   # response.code
  #   response.body
  # end
end
