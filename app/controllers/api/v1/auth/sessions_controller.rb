module Api
  module V1
    module Auth
      class SessionsController < Devise::SessionsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          render json: { message: 'Logged in successfully.' }, status: :ok
        end

        def respond_to_on_destroy
          jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.devise[:jwt_secret_key]).first
          current_user = User.find(jwt_payload['sub'])
          if current_user
            render json: { message: 'Logged out successfully.' }, status: :ok
          else
            render json: { message: 'Logged out failure.' }, status: :unauthorized
          end
        end
      end

      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          if resource.persisted?
            render json: { message: 'Signed up successfully.' }, status: :ok
          else
            render json: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
