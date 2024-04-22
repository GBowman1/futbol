require './spec/spec_helper'
require './lib/game_teams'

RSpec.describe GameTeams do
    before(:each) do
        @csv = CSV.read('./data/test_game_teams.csv', headers: true).first
    end

    describe "initializing" do
        it "should initialize" do
            game1A = GameTeams.new(@csv)

            expect(game1A).to be_instance_of(GameTeams)
            expect(game1A.game_id).to eq("2012030221")
            expect(game1A.team_id).to eq("3")
            expect(game1A.hoa).to eq("away")
            expect(game1A.result).to eq("LOSS")
            expect(game1A.head_coach).to eq("John Tortorella")
            expect(game1A.goals).to eq("2")
            expect(game1A.shots).to eq("8")
            expect(game1A.tackles).to eq("44")
        end
        
        it "can game_box_score" do
            game_team = GameTeams.new(@csv)

            expect(GameTeams.game_box_score).to include(game_team)
        end
    end
end