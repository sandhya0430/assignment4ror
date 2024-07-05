# config/initializers/devise.rb
Devise.setup do |config|
  config.jwt do |jwt|
    # Access jwt_secret_key from Rails credentials
    jwt.secret = Rails.application.credentials.dig(:devise, :jwt_secret_key)
    
    # Define which requests should be treated as dispatch (sign-in and sign-up)
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/auth/sign_in$}],
      ['POST', %r{^/api/v1/auth/sign_up$}]
    ]
    
    # Define which request should revoke tokens (sign-out)
    jwt.revocation_requests = [
      ['DELETE', %r{^/api/v1/auth/sign_out$}]
    ]
    
    # # Set the strategy for token revocation
    jwt.revocation_strategy = JwtDenylist
  end
end
