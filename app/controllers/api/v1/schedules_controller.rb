class Api::V1::SchedulesController < ApplicationController

    def index
        render json: ScheduleSerializer.format_schedules(Schedule.all)
    end
    def show
        schedule = Schedule.find(params[:id])

        render json: ScheduleSerializer.format_schedules(schedule)
    end

    def remove_show
        schedule = Schedule.find(params[:schedule_id])
        show = schedule.shows.find(params[:show_id])

        schedule.shows.destroy(show)

        render json: ScheduleSerializer.format_schedules(schedule)
    end
end