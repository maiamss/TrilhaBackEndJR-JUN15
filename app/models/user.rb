class User < ApplicationRecord
        has_many :tasks
        
        validates :name, presence: true
        validates :cpf, presence: true, uniqueness: true
        validates :email, presence: true, uniqueness: true
        validates :password_digest, presence: true
     
end
