class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false
    validates :username, :presence => true
    validates :email, :presence => true, uniqueness: true
    validates :password, :presence => true
    validates :password_confirmation, :presence => true
end