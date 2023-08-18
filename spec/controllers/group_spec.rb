require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'GET #index' do
    context 'when user is not signed in' do
      it 'redirects to new_user_session_path' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      let(:user) { User.create(name: "Tome", email: "email@gmail.com", password: "123123") }
      let(:group) { Group.create(name: "group", icon: "amazon", user: user) }

      before { sign_in user }

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns user\'s groups to @groups' do
        group # Create the group
        get :index
        expect(assigns(:groups)).to eq([group])
      end
    end
  end

  # Add more test cases for other controller actions (show, create, update, destroy) here
end
