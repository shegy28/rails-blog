require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @users = [
      @user1 = User.create(
        name: 'Derrick',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Fullstack Web developer from Uganda',
        posts_counter: 9
      ),
      @user2 = User.create(
        name: 'Lilly',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Poland.',
        posts_counter: 1
      ),
      @user3 = User.create(
        name: 'Tom',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    ]
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @users" do
      get :index
      expect(assigns(:users)).to eq(@users)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @user1.id }
      expect(response).to be_successful
    end

    it "assigns @user" do
      get :show, params: { id: @user1.id }
      expect(assigns(:user)).to eq(@user1)
    end
  end
end
