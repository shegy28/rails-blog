require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response and renders the index template' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response and renders the show template' do
      post = Post.create(title: 'First Post', id: 1)
      get user_post_path(user_id: 1, id: post.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      post = Post.create(title: 'First Post', id: 1)
      get user_post_path(user_id: 1, id: post.id)
      expect(response.body).to include('Show a particular post')
    end
  end
end
