module V1
  class Base < Grape::API
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end

    mount V1::Tasks
  end
end
