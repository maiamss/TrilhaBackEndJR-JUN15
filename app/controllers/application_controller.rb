class ApplicationController < ActionController::API
    before_action :authenticate_user, if: :require_authentication?

  
    def authenticate_user
      token = request.headers['Authorization']&.split(' ')&.last
      decoded_token = decode_token(token)
  
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @current_user = User.find_by(id: user_id)
      else
        render json: { error: 'Token inválido' }, status: :unauthorized
      end
    end
  
    private
  
    def require_authentication?
      # Autenticar apenas para requisições POST
      request.method_symbol == :post
    end

    def decode_token(token)
      JWT.decode(token, Rails.application.secret_key_base)  # [0] extrai o payload
    rescue JWT::DecodeError
      nil
    end
  
  
end
