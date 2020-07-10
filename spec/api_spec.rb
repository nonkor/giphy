RSpec.describe 'Giphy API' do
  let(:auth) { {api_key: 'yxwYz2h8oGJTNHI7S5vFCWEdEBxIUz9X'} }
  let(:keyword) { 'show' }

  describe 'Searching gif by keyword' do
    let(:api) { 'api.giphy.com/v1/gifs/search' }

    it 'should return list of gifs' do
      get api, params: {q: keyword}.merge(auth)

      expect_status 200
      expect_json('data.*', type: 'gif')
      expect_json('pagination', total_count: /\d+/, count: /\d+/, offset: 0)
      expect(json_body[:data].count).to be > 0
    end

    context 'inside specific channel' do
      let(:channel) { '@snl' }

      it 'should return list of gifs' do
        get api, params: {q: channel + ' ' + keyword}.merge(auth)

        expect_status 200
        expect_json('data.*', type: 'gif', username: channel[1..-1])
        expect(json_body[:data].count).to be > 0
      end
    end
  end

  describe 'Retriving autocomplete options' do
    let(:api) { 'api.giphy.com/v1/gifs/search/tags' }

    it 'should return gif tags matched with specified keyword' do
      get api, params: {q: keyword}.merge(auth)

      expect_status 200
      expect_json('data.*', name: /show/)
      expect(json_body[:data].count).to be > 0
    end
  end

  describe 'Uploading gif from external source' do
    it 'should return success status' do
      post 'upload.giphy.com/v1/gifs',
        {
          source_image_url: 'https://i.pinimg.com/originals/49/d8/5a/49d85aa5961ff4dbe2962141f05294eb.gif',
          tags: 'stonks'
        },
        params: auth

      expect_status 200
      expect_json_types(data: {id: :string})
      expect_json('meta', msg: 'OK', status: 200)
    end
  end
end
