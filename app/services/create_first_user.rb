class CreateFirstUser
	def call
    user = User.create(email: 'user@example.org', password: 'foobarbaz',
    									 password_confirmation: 'foobarbaz', name: 'First User')
  end
end