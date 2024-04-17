require './spec/spec_helper.rb'

describe Teams do
    before(:all) do
        team_path = './data/teams.csv'
        @teams = Teams.generate_teams(team_path)
    end

    describe "initialize" do
        it "creates a team object" do
            expect(Teams.all_teams[0]).to be_an_instance_of Teams
            expect(Teams.all_teams[0].team_id).to eq("1")
            expect(Teams.all_teams[0].franchise_id).to eq("23")
            expect(Teams.all_teams[0].team_name).to eq("Atlanta United")
            expect(Teams.all_teams[0].team_link).to eq("/api/v1/teams/1")
        end
    end

    describe "all_teams" do
        it "returns an array of all teams" do
            expect(Teams.all_teams).to be_an_instance_of Array
        end
    end

    describe "generate_teams" do
        it "creates team objects" do
            expect(Teams.all_teams.length).to eq(32)
        end
    end
end