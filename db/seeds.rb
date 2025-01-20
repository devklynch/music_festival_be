# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Show.destroy_all
Schedule.destroy_all

user1 = User.create!(
    first_name:"Devlin",
    last_name: "Lynch",
    email: "dlynchtest@test.com")

show1 = Show.create!(
    artist: "Tyler, The Creator",
    location: "Mojave",
    date: Date.new(2025, 4, 11),
    start_time: '16:00',
    end_time: '17:30'
)

schedule1 = Schedule.create!(
    title: "Devlin's Schedule",
    date: Date.new(2025, 4, 11),
    user: user1,
    show: show1
)