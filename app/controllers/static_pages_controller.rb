class StaticPagesController < ApplicationController

  def home
    # @response = get_access_token('hO0L3ihpxOhNmoUut34w')
    #Redirection from Login With Line returns these
    if params.has_key? (:code)
      code = params[:code]
      state = params[:state]
      friendship_status_changed = params[:friendship_status_changed]
      @response = get_access_token(code)
    end
  end

  private
  def get_access_token(code)
    uri = URI.parse("https://api.line.me/oauth2/v2.1/token")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/x-www-form-urlencoded"
    request.set_form_data(
      "client_id" => "1563433382",
      "client_secret" => "31274175a0eeb4b3f2ef4b6331fc553c
",
      "code" => code,
      "grant_type" => "authorization_code",
      "redirect_uri" => "https://linebot-staging.herokuapp.com/
",
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
end
