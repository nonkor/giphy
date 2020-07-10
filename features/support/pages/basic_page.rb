module BasicPage
  include Watirsome

  def self.included(klass)
    klass.include Watirsome
  end

  body :body
  div :searchbar, id: 'searchbar'
  text_field :keyword, class: 'Input-sc-w75cdz'

  a :go_to_upload, text: 'Upload'
  a :go_to_login, text: 'Log In'

  def initialize
    super(Base.browser)
  end

  def body
    body_body.text
  end

  def logged_in?
    !go_to_login_a.present?
  end
end
