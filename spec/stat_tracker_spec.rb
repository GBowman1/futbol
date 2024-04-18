require './spec/spec_helper'

RSpec.describe StatTracker do
    before(:all) do
        game_path = './data/games.csv'
        team_path = './data/teams.csv'
        game_teams_path = './data/game_teams.csv'
    
        locations = {
            games: game_path,
            teams: team_path,
            game_teams: game_teams_path
        }

        @stat_tracker = StatTracker.from_csv(locations)
    end
    describe "initialize" do
        it "initilizes with file paths" do
        expect(@stat_tracker).to be_an_instance_of StatTracker
        end
    end

    describe "highest_total_score" do
        it "returns the highest total score of all games played" do
            expect(@stat_tracker.highest_total_score).to eq(11)
        end
    end

    describe "lowest_total_score" do
        it "returns the lowest total score of all games played" do
            expect(@stat_tracker.lowest_total_score).to eq(0)
        end
    end

    describe "percentage_home_wins" do  # this test is failing because anytime I try to hit an attribute the whole csv array is returned
        it	'percentage of games that a home team has won' do
            expect(@stat_tracker.percentage_home_wins).to eq(0.44)
        end
    end

end