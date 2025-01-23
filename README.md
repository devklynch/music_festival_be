# Music Festival Scheduler

## Description

This project focused on a full stack app for Music Festival Organization Service with a Rails API and a React front end.

This focused on making an admin view for different users' festival schedules where you have access to see all schedules and look into the schedule's lineup as well as have the ability to remove a show from a user's schedule

This is the backend that holds the information for users, shows, and schedules and the different routes to provide the necessary information

## Set Up

Fork and clone the repo
Install Dependencies:
`bundle install`
Set up the database:
`rails db:create`
`rails db:migrate`
`rails db:seed`
Start Your rails server:
`rails server`

## Routes

GET http://localhost:3000/api/v1/schedules
Gets all schedules and the corresponding shows

GET http://localhost:3000/api/v1/schedules/SCHEDULE_ID
Gets a specific schedule and also has the ability to sort by artist by adding sort_by=artist or can sort by show start time by adding sort_by=artist

DELETE http://localhost:3000/api/v1/schedules/SCHEDULE_ID/shows/SHOW_ID
Removes a specified show from a specified schedule and returns the updated schedule

## Links

- **GitHub Front End Repo:** https://github.com/devklynch/music_festival_fe
- **GitHub Back End Repo:** https://github.com/devklynch/music_festival_be

## Additional Information

- LinkedIn https://www.linkedin.com/in/devlin-lynch
- GitHub Profile https://github.com/devklynch
