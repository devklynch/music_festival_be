class Api::V1::SchedulesController < ApplicationController
    def show
        user = User.find(params[:user_id])
        schedule = user.schedule

        render json: ScheduleSerializer.format_schedule(schedule)
    end
end