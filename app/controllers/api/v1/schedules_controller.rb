class Api::V1::SchedulesController < ApplicationController

    def index
        render json: ScheduleSerializer.format_schedules(Schedule.all)
    end
    def show
        schedule = Schedule.find(params[:id])

        shows = schedule.shows

        if params[:sort_by] == 'start_time'
            order = params[:order] == 'desc' ? :desc : :asc
            shows = shows.order(start_time: order)
          elsif params[:sort_by] == 'artist'
            order = params[:order] == 'desc' ? :desc : :asc
            shows = shows.order(artist: order)
          end

        render json: ScheduleSerializer.format_schedules(schedule,sorted_shows: shows)
    end

    def remove_show
        schedule = Schedule.find(params[:schedule_id])
        show = schedule.shows.find(params[:show_id])

        schedule.shows.destroy(show)

        render json: ScheduleSerializer.format_schedules(schedule)
    end
end