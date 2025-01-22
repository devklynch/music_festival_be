require "rails_helper"

RSpec.describe "Schedules", type: :request do
    before :each do
        host! "localhost"
        @user11 = User.create!(
        first_name:"Devlin",
        last_name: "Lynch",
        email: "testtestt@test.com")

        @user12 = User.create!(
        first_name:"Rupert",
        last_name:"TheDog",
        email:"rspectest@google.com")

        @show1 = Show.create!(
        artist: "Tyler, The Creator",
        location: "Coachella",
        date: Date.new(2025, 4, 11),
        start_time: '16:00',
        end_time: '17:30')

        @show2 = Show.create!(
        artist: "Chappel Roan",
        location: "Gobi",
        date: Date.new(2025, 4, 11),
        start_time: '12:00',
        end_time: '13:00')

        @schedule1 = Schedule.create!(
        title: "Devlin's Schedule",
        date: Date.new(2025, 4, 11),
        user: @user11)

        @schedule2 = Schedule.create!(
        title: "Rupert's Schedule",
        date: Date.new(2025, 4, 11),
        user: @user12)

        @schedule1.shows.push(@show1,@show2)
        @schedule2.shows.push(@show2)
    end

    describe "Index for all schedules" do
        it "can get all schedules" do
            get "/api/v1/schedules", headers: { "ACCEPT" => "application/json" }
           
            json = JSON.parse(response.body, symbolize_names: true)

          
            expect(response).to be_successful
            expect(json).to be_a(Hash)
            expect(json).to have_key(:data)
            expect(json[:data][0]).to have_key(:id)
            expect(json[:data][0]).to have_key(:type)
            expect(json[:data][0][:type]).to eq("schedule")
            expect(json[:data][0]).to have_key(:attributes)
            expect(json[:data][0][:attributes][:title]).to eq(@schedule1.title)
            expect(json[:data][0][:attributes][:date]).to eq("2025-04-11")
            expect(json[:data][0][:attributes]).to have_key(:user_id)
            expect(json[:data][0][:attributes][:shows]).to be_a(Array)
        end
    end

    # describe "Show a specific schedule" do
    #     it "can get a specific schedule" do
    #         get "/api/v1/schedules/#{@schedule1.id}"

    #         json = JSON.parse(response.body, symbolize_names: true)

    #         binding.pry 
    #         expect(response).to be_successful
    #     end

    #     it "returns an error if that schedule doesn't exist" do
    #         get "/api/v1/schedules/999999"

    #         expect (response).to have_http_status(:not_found)

    #         json = JSON.parse(response.body, symbolize_names: true)
    #         expect(json[:error]).to eq("Schedule not found")
    #     end
    # end
end