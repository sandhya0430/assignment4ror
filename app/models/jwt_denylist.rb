# app/models/jwt_denylist.rb
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'  # Specify the table name explicitly

  # If you want to customize the JWT denylist behavior, you can add additional methods or validations here.
end
