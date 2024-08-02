# Classe que herda de ApplicationController, responsável por gerenciar as sessões de usuário (autenticação).

class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password_digest])
        token = encode_token(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: 'Unauthorized user' }, status: :unauthorized
      end
    end
  
    private
  
    def encode_token(payload) # gera um token JWT com base no user_id 
      secret_key = Rails.application.credentials.jwt[:secret_key]
      JWT.encode(payload, secret_key)
    end
  end
  