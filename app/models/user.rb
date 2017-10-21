class User < ApplicationRecord
	has_secure_password validations: true

	before_create do|user|
		user.access_token = user.generate_auth_token
	end

	def generate_auth_token
		loop do
			token = SecureRandom.base64.tr('+/=', 'Qrt')
			break token unless User.exists?(access_token: token)
		end
	end

  validates :email, presence: true, uniqueness: true
end
