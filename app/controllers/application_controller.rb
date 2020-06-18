class ApplicationController < ActionController::API
   
  def login
    # byebug
    if params[:username] == ENV["YC_ADMIN_USER"] && params[:password] == ENV["YC_ADMIN_PASSWORD"]
      render json: { token: issue_token({ admin: true }) }
    else
      render json: { error: "This is not the correct details." }
    end
  end

  def issue_token(payload)
    JWT.encode(payload, secret)
  end

  def decoded_token
    begin
      JWT.decode(token, secret, true)[0]
    rescue JWT::DecodeError
      { "admin": false }
    end
  end

  def authorised?
    if !decoded_token["admin"]
      render json: { error: "You do not have permission to perform this action" }
    end
  end

  private

  def secret
    ENV["YC_JWT_SECRET"] 
  end
    
  def token
    request.headers["Authorisation"]
  end

end
