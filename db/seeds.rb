# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#x
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   endx

User.destroy_all
Show.destroy_all
Schedule.destroy_all

@user1 = User.create!(
    first_name:"Devlin",
    last_name: "Lynch",
    email: "dlynchtest@test.com")

user2 = User.create!(
    first_name:"Rupert",
    last_name:"TheDog",
    email:"dogcrime@google.com"
)

user3 = User.create!(
    first_name:"Courtney",
    last_name:"Boots",
    email:"spork@test.com"
)

user4 = User.create!(
    first_name:"Chuck",
    last_name:"Iversen",
    email:"bigdog@test.com"
)
user5 = User.create!(
    first_name:"Emma",
    last_name:"Girl",
    email:"anotheremail@test.com"
)

show1 = Show.create!(
    artist: "Tyler, The Creator",
    location: "Coachella",
    date: Date.new(2025, 4, 11),
    start_time: '16:00',
    end_time: '17:30'
)

show2 = Show.create!(
    artist: "Chappel Roan",
    location: "Gobi",
    date: Date.new(2025, 4, 11),
    start_time: '12:00',
    end_time: '13:00'
)
show3 = Show.create!(
    artist: "Jungle",
    location: "Outdoor Theatre",
    date: Date.new(2025, 4, 11),
    start_time: '20:00',
    end_time: '22:00'
)
show4 = Show.create!(
    artist: "Vampire Weekend",
    location: "Outdoor Theatre",
    date: Date.new(2025, 4, 11),
    start_time: '14:00',
    end_time: '16:00'
)
show5 = Show.create!(
    artist: "Sabrina Carpenter",
    location: "Gobi",
    date: Date.new(2025, 4, 11),
    start_time: '15:00',
    end_time: '16:00'
)
show6 = Show.create!(
    artist: "The Aquabats",
    location: "Sonora",
    date: Date.new(2025, 4, 11),
    start_time: '12:00',
    end_time: '13:00'
)
show7 = Show.create!(
    artist: "Renee Rapp",
    location: "Gobi",
    date: Date.new(2025, 4, 11),
    start_time: '12:00',
    end_time: '13:00'
)
show8 = Show.create!(
    artist: "Bleachers",
    location: "Mojave",
    date: Date.new(2025, 4, 11),
    start_time: '19:00',
    end_time: '21:00'
)
show9 = Show.create!(
    artist: "Dom Dolla",
    location: "Sahara",
    date: Date.new(2025, 4, 11),
    start_time: '12:00',
    end_time: '13:00'
)
show10 = Show.create!(
    artist: "Gorgon City",
    location: "Yuma",
    date: Date.new(2025, 4, 11),
    start_time: '14:30',
    end_time: '16:00'
)
show11 = Show.create!(
    artist: "No Doubt",
    location: "Coachella",
    date: Date.new(2025, 4, 11),
    start_time: '21:00',
    end_time: '24:00'
)



schedule1 = Schedule.create!(
    title: "Devlin's Schedule",
    date: Date.new(2025, 4, 11),
    user: user1
)

schedule2 = Schedule.create!(
    title: "Rupert's Schedule",
    date: Date.new(2025, 4, 11),
    user: user2
)

schedule3 = Schedule.create!(
    title: "Day 1 Schedule",
    date: Date.new(2025, 4, 11),
    user: user3
)
schedule4 = Schedule.create!(
    title: "Chuck's First Festival",
    date: Date.new(2025, 4, 11),
    user: user4
)
schedule5 = Schedule.create!(
    title: "Emma's List of Shows",
    date: Date.new(2025, 4, 11),
    user: user4
)

schedule1.shows.push(show1,show3,show4,show8,show9)

schedule2.shows.push(show2,show4,show5,show10,show11)
schedule3.shows.push(show6,show7)
schedule4.shows.push(show1,show2,show3,show8,show9,show10)