require 'rails_helper'

RSpec.describe Core::TasksController, type: :controller do

  describe 'Accessing views' do
    it 'GET index' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
    end

    it 'GET new' do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template('new')
    end

    it 'Index should have zero task list' do
      get :index
      expect(assigns(:tasks).length).to eq(0)
    end
  end

  describe 'Creating Task' do
    context 'with valid attributes' do
      before(:each) do
        post :create, task: attributes_for(:task)
      end

      it 'redirect to task list' do
        expect(response).to redirect_to core_tasks_path
      end

      it 'count equals to 1' do
        expect(Task.count).to eq(1)
      end

      it 'Index should have zero task list' do
        get :index
        expect(assigns(:tasks).length).to eq(1)
      end

    end

    context 'with invalid attributes' do
      before(:each) do
        post :create, task: attributes_for(:task, :all_empty_fields)
      end

      it 'count equals to 0' do
        expect(Task.count).to eq(0)
      end

      it 'render the new form' do
        expect(response).to render_template('new')
      end
    end

  end

  describe 'Updating Task' do
    let(:valid) do
      {title: 'My valid task', descriptio: 'with description', date: '2016-09-14 20:03:55'}
    end

    let(:invalid) do
      {title: nil, descriptio: nil, date: nil }
    end

    before(:each) do
      @task = create(:task)
    end

    context 'update with valid attributes' do
      before(:each) do
        put :update, :id => @task.id, :task => valid
      end

      it 'redirect to task list' do
        expect(response).to redirect_to core_tasks_url
      end

      it 'expect response equals to 301' do
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'update with invalid attributes' do
      before(:each) do
        put :update, :id => @task.id, :task => invalid
      end

      it 'redirect to task list' do
        expect(response).to render_template('edit')
      end

    end
  end

  describe 'Deleting Task' do
    before(:each) do
      @task = create(:task)
    end

    it 'should redirect to task list' do
      delete :destroy, :id => @task.id
      expect(response).to redirect_to core_tasks_url
    end
  end

end
