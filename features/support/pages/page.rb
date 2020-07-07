class Page
  include Watirsome

  body :body
  div :searchbar, id: 'searchbar'
  text_field :keyword, class: 'Input-sc-w75cdz'

  def initialize
    super($browser)
  end

  def body
    body_body.text
  end
end
