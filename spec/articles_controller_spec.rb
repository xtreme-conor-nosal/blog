require 'rails_helper'

describe ArticlesController, type: :request do
  describe 'GET index' do
    it 'has a 200 status code' do
      get articles_path
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    context 'with valid credentials' do
      it 'creates an article' do
        expect do
          post articles_path, params: { article: { title: 'TESTING', text: 'DID YOU SEE IT?'}}, headers: { Authorization: 'Basic ZGhoOnNlY3JldA==' }
        end.to change { Article.count }.by(1)
      end
    end
    context 'without valid credentials' do
      it "doesn't create an article" do
        expect do
          post articles_path, params: { article: {title: 'TESTING', text: 'DID YOU NOT SEE IT?'}}
        end.to_not change { Article.count }
      end
    end
  end
end