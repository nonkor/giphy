class LoginPage
  include BasicPage

  text_field :email, name: 'email'
  text_field :password, name: 'password'
  button :confirm, text: 'Log in'

  def login(email, pass)
    self.email = email
    self.password = pass
    confirm
  end
end
