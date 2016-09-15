module V1
  class Tasks < Grape::API
    resource :task do
      desc 'Return all tasks'
      get '' do
        Task.all
      end

      desc 'Return a single task'
      get ':id' do
        Task.where(id: params[:id]).first!
      end
    end
  end
end
