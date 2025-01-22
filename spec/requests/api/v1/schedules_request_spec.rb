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
        artist: "Chappell Roan",
        location: "Gobi",
        date: Date.new(2025, 4, 11),
        start_time: '12:00',
        end_time: '13:00')

        @show3 = Show.create!(
            artist: "Sabrina Carpenter",
            location: "Gobi",
            date: Date.new(2025, 4, 11),
            start_time: '10:00',
            end_time: '12:00'
        )

        @schedule1 = Schedule.create!(
        title: "Devlin's Schedule",
        date: Date.new(2025, 4, 11),
        user: @user11)

        @schedule2 = Schedule.create!(
        title: "Test Schedule",
        date: Date.new(2025, 4, 28),
        user: @user12)

        @schedule1.shows.push(@show1)
        @schedule2.shows.push(@show1,@show2, @show3)
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

    describe "Show a specific schedule" do
        it "can get a specific schedule" do
            get "/api/v1/schedules/#{@schedule2.id}"

            json = JSON.parse(response.body, symbolize_names: true)
       
            expect(response).to be_successful
            expect(json).to be_a(Hash)
            expect(json).to have_key(:data)
            expect(json[:data][0]).to have_key(:id)
            expect(json[:data][0]).to have_key(:type)
            expect(json[:data][0][:type]).to eq("schedule")
            expect(json[:data][0]).to have_key(:attributes)
            expect(json[:data][0][:attributes][:title]).to eq(@schedule2.title)
            expect(json[:data][0][:attributes][:date]).to eq("2025-04-28")
            expect(json[:data][0][:attributes][:user_id]).to eq(@user12.id)
            expect(json[:data][0][:attributes][:shows]).to be_a(Array)
            expect(json[:data][0][:attributes][:shows].count).to eq(3)
         end

        it "can sort shows by artist A-Z" do
            get "/api/v1/schedules/#{@schedule2.id}?sort_by=artist"

            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data][0][:attributes][:shows][0][:artist]).to eq("Chappell Roan")
            expect(json[:data][0][:attributes][:shows][1][:artist]).to eq("Sabrina Carpenter")
            expect(json[:data][0][:attributes][:shows][2][:artist]).to eq("Tyler, The Creator")
        end

        it "can sort shows by artist Z-A" do
            get "/api/v1/schedules/#{@schedule2.id}?sort_by=artist&order=desc"

            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data][0][:attributes][:shows][2][:artist]).to eq("Chappell Roan")
            expect(json[:data][0][:attributes][:shows][1][:artist]).to eq("Sabrina Carpenter")
            expect(json[:data][0][:attributes][:shows][0][:artist]).to eq("Tyler, The Creator")
        end

        it "can sort shows by start times by earliest" do
            get "/api/v1/schedules/#{@schedule2.id}?sort_by=start_time"

            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data][0][:attributes][:shows][1][:artist]).to eq("Chappell Roan")
            expect(json[:data][0][:attributes][:shows][0][:artist]).to eq("Sabrina Carpenter")
            expect(json[:data][0][:attributes][:shows][2][:artist]).to eq("Tyler, The Creator")
        end

        it "can sort shows by start times by latest" do
            get "/api/v1/schedules/#{@schedule2.id}?sort_by=start_time&order=desc"

            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data][0][:attributes][:shows][1][:artist]).to eq("Chappell Roan")
            expect(json[:data][0][:attributes][:shows][2][:artist]).to eq("Sabrina Carpenter")
            expect(json[:data][0][:attributes][:shows][0][:artist]).to eq("Tyler, The Creator")
        end

        it "returns an error if that schedule doesn't exist" do
            get "/api/v1/schedules/999999"

            expect(response).to have_http_status(:not_found)
        
            json = JSON.parse(response.body, symbolize_names: true)
            expect(json[:errors]).to eq(["Couldn't find Schedule with 'id'=999999"])
         end
    end

    describe "Remove a show" do
        it "can remove a show from a schedule" do
            delete "/api/v1/schedules/#{@schedule2.id}/shows/#{@show1.id}"
            
            json = JSON.parse(response.body, symbolize_names: true)
        
            expect(response).to be_successful
            expect(json[:data][0][:attributes][:shows].count).to eq(2)
            expect(json[:data][0][:attributes][:shows][0][:artist]).to eq("Chappell Roan")
            expect(json[:data][0][:attributes][:shows][1][:artist]).to eq("Sabrina Carpenter")
        end

        it "returns an error with an invalid schedule" do
            delete "/api/v1/schedules/9999999/shows/#{@show1.id}"

            expect(response).to have_http_status(:not_found)
        
            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:message]).to eq("Your query could not be completed")
            expect(json[:errors]).to eq(["Couldn't find Schedule with 'id'=9999999"])
        end


        it "returns an error with an invalid show" do
            delete "/api/v1/schedules/#{@schedule2.id}/shows/9999999"

            expect(response).to have_http_status(:not_found)
    
            json = JSON.parse(response.body, symbolize_names: true)
            expect(json[:message]).to eq("Your query could not be completed")
            expect(json[:errors]).to eq(["Couldn't find Show with 'id'=9999999"])
        end
    end
end