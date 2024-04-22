require './spec/spec_helper.rb'

describe Teams do
    before(:all) do
        @csv = CSV.read('./data/teams.csv', headers: true).first
    end

    describe "initialize" do
        it "creates a team object" do
            team = Teams.new(@csv)

            expect(team).to be_a(Teams)
            expect(team.team_id).to eq("1")
            expect(team.franchise_id).to eq("23")
            expect(team.team_name).to eq("Atlanta United")
            expect(team.team_link).to eq("/api/v1/teams/1")
        end
    end

    describe "all_teams" do
        it "returns an array of all teams" do
            expect(Teams.all_teams).to be_an_instance_of Array
        end
    end
end