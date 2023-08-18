require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  describe 'GET #new' do
    it 'assigns a new entity as @entity' do
      get :new
      expect(assigns(:entity)).to be_a_new(Entity)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'does not create a new Entity' do
        expect {
          post :create, params: { entity: { name: nil, amount: 100 } }
        }.not_to change(Entity, :count)
      end

      it 'renders the new template with unprocessable entity' do
        post :create, params: { entity: { name: nil, amount: 100 } }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders the new template when no categories are selected' do
        post :create, params: { entity: { name: 'Example Entity', amount: 100 } }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(assigns(:entity).errors.full_messages).to include('At least one category must be selected')
      end
    end
  end
end
