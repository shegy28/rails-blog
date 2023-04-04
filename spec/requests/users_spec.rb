require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response and renders the index template' do
      get root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      get root_path
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response and renders the show template' do
      user = User.create(name: 'John Doe', id: '123')
      get user_path(user)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      user = User.create(name: 'John Doe', id: '123')
      get user_path(user)
      expect(response.body).to include('Show a particular user')
    end
  end
end
