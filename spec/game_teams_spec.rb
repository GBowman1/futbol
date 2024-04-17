require './spec/spec_helper'
require './lib/game_teams'

RSpec.describe GameTeams do
    before(:each) do
        @csv = {
            game_id: "2012030221",
            team_id: "3",
            hoa: "away",
            result: "loss",
            head_coach: "John Tortorella",
            goals: "2",
            shots: "8",
            tackles: "44",
        }
    end

    describe "initializing" do
        it "should initialize" do
            game1A = GameTeams.new(@csv)

            expect(game1A).to be_instance_of(GameTeams)
        end
        
        it "can game_box_score" do
            game_team = GameTeams.new(@csv)

            expect(GameTeams.game_box_score).to include(game_team)
        end
        it "generates game_box_score" do
            game1A = GameTeams.new(@csv)
            GameTeams.generate_box_scores

            expect(GameTeams.game_box_score[0].game_id).to eq("2012030221")
            expect(GameTeams.game_box_score[0].team_id).to eq("3")
            expect(GameTeams.game_box_score[0].hoa).to eq("away")
            expect(GameTeams.game_box_score[0].result).to eq("loss")
            expect(GameTeams.game_box_score[0].head_coach).to eq("John Tortorella")
            expect(GameTeams.game_box_score[0].goals).to eq("2")
            expect(GameTeams.game_box_score[0].shots).to eq("8")
            expect(GameTeams.game_box_score[0].tackles).to eq("44")
        end
    end
end