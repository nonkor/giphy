module DataHelper
  # @return [Hash] list of channels matched by channel id
  def channels
    {
      '@snl' => 'Saturday Night Live'
    }
  end

  # @return [Hash] list of registered users
  def users
    {
      'TestAcc7819' => {
        email: 'homiso7819@mailsecv.com',
        password: 'testpass'
      }
    }
  end

  # @return [Hash] list of gifs available for upload
  def gifs
    {
      local: 'thinkaboutit.gif',
      url: 'https://media.tenor.com/images/71fec9bdb83f768a6915e6b8f591e75d/tenor.gif'
    }
  end

  def api
    'yxwYz2h8oGJTNHI7S5vFCWEdEBxIUz9X'
  end

  module_function :channels, :users, :gifs
end
