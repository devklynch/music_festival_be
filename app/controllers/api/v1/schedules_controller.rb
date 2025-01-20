class Api::V1::SchedulesController < ApplicationController
    def show
        user = User.find(params[:user_id])
        schedule = user.schedule

        render json: ScheduleSerializer.format_schedule(schedule)
    end

    def remove_show
        schedule = Schedule.find(params[:schedule_id])
        show = schedule.shows.find(params[:show_id])

        schedule.shows.destroy(show)

        render json: ScheduleSerializer.format_schedule(schedule)
    end
end