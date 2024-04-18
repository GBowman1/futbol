require './spec/spec_helper'

RSpec.describe StatTracker do
    before(:all) do
        game_path = './data/test_games.csv'
        team_path = './data/teams.csv'
        game_teams_path = './data/test_game_teams.csv'
    
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
            expect(@stat_tracker.highest_total_score).to eq(5)
        end
    end

    describe "lowest_total_score" do
        it "returns the lowest total score of all games played" do
            expect(@stat_tracker.lowest_total_score).to eq(1)
        end
    end

    describe "percentage_home_wins" do  
        it	'percentage of games that a home team has won' do
            expect(@stat_tracker.percentage_home_wins).to eq(0.67)
        end
    end
    
    describe "percentage_away_wins" do  
        it	'percentage of games that an away team has won' do
            expect(@stat_tracker.percentage_away_wins).to eq(0.28)
        end
    end

    describe "percentage_ties" do
        it 'percentage of games that tied' do
            expect(@stat_tracker.percentage_ties).to eq(0.06)
        end
    end

    describe "Season Games Count" do
        it 'can count the number of games played in a season' do
            expected_season = {
            "20122013"=>25
        }
            expect(@stat_tracker.season_games_count).to eq(expected_season)
        end
    end

    describe "Average Goals Per Game" do
        it 'can calculate the average goals per game' do
            expect(@stat_tracker.average_goals_per_game).to eq(3.84)
        end
    end
end