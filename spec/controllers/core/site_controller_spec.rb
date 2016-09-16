require 'rails_helper'

RSpec.describe Core::SiteController, type: :controller do
  describe 'access index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'and render index view' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
