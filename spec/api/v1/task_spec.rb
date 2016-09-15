require 'rails_helper'

RSpec.describe API, type: :request  do

  describe 'Access Task end point' do

    context 'get /api/v1/task' do
      before(:each) do
        get '/api/v1/task'
      end

      it 'return a 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should get a empty array' do
        expect(JSON.parse(response.body)).to eq []
      end
    end

    context 'get /api/v1/task/:id' do
      it 'should return a not found status' do
        get '/api/v1/task/1'
        expect(response.status).to eq(404)
      end

      it 'should return a task' do
        @task = FactoryGirl.create(:task)
        get '/api/v1/task/1'
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to_not eq []
      end
    end

  end


end
