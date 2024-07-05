require 'rails_helper'

RSpec.describe 'Api::V1::Articles', type: :request do
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: :editor) }
  let(:admin) { create(:user, role: :admin) }
  let(:article) { create(:article, user: user) }

  describe 'GET /api/v1/articles' do
    it 'returns a list of articles' do
      get '/api/v1/articles'
      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(Article.count)
    end
  end

  describe 'GET /api/v1/articles/:id' do
    it 'returns the specified article' do
      get "/api/v1/articles/#{article.id}"
      expect(response).to have_http_status(:ok)
      expect(json['id']).to eq(article.id)
    end
  end
end
