class UserInfoServices
  attr_accessor :code, :access_token

  def initialize code, access_token
    @access_token = access_token
    @code = code
  end

  def self.get_access_token code
    uri = URI.parse("https://api.line.me/oauth2/v2.1/token")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/x-www-form-urlencoded"
    request.set_form_data(
      "client_id" => "1563433382",
      "client_secret" => "31274175a0eeb4b3f2ef4b6331fc553c",
      "code" => code,
      "grant_type" => "authorization_code",
      "redirect_uri" => "https://linebot-staging.herokuapp.com/",
    )

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    # response.body
    return response.body
  end

  def self.get_user_info(access_token)
    uri = URI.parse("https://api.line.me/v2/profile")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{access_token}"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    return response.body
  end

end
