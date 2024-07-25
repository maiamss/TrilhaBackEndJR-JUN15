# Classe que herda de ApplicationController, responsável por gerenciar as sessões de usuário (autenticação).

class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        token = encode_token(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: 'Unauthorized user' }, status: :unauthorized
      end
    end
  
    private
  
    def encode_token(payload) # gera um token JWT com base no user_id 
      JWT.encode(payload, Rails.application.secret_key_base)
    end
  end
  