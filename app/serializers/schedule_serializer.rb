class ScheduleSerializer

    def self.format_schedules(schedules, sorted_shows: nil)

        schedules = Array(schedules)

        {data: schedules.map do |schedule|
            {
                id: schedule.id,
                type: "schedule",
                attributes: {
                    title: schedule.title,
                    date: schedule.date,
                    user_id: schedule.user.id,
                    shows: (sorted_shows || schedule.shows).map do |show|
                        {
                            id: show.id,
                            artist: show.artist,
                            location: show.location,
                            start_time: show.start_time,
                            end_time: show.end_time
                        }
                    end
                }
            }
        end
        }
    end
end