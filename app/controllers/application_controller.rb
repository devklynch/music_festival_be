class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound do |e|
        clean_message = e.message.split(' [').first
        render json: ErrorSerializer.format_errors([clean_message]), status: :not_found
      end

    # rescue_from ActiveRecord::RecordInvalid do |e|
    #     render json: ErrorSerializer.format_errors([ e.message ]), status: :unprocessable_entity
    #   end
end
