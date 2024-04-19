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
            expect(@stat_tracker.highest_total_score).to eq(8)
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
    
    describe "percentage_visitor_wins" do  
        it	'percentage of games that an away team has won' do
            expect(@stat_tracker.percentage_visitor_wins).to eq(0.28)
        end
    end

    describe "percentage_ties" do
        it 'percentage of games that tied' do
            expect(@stat_tracker.percentage_ties).to eq(0.06)
        end
    end

    describe "#count_of_games_by_season" do
        it 'can count the number of games played in a season' do
            expected_season = {
            "20122013"=>25,
            "20152016"=>12,
            "20162017"=>12,
            "20172018"=>9
        }
            expect(@stat_tracker.count_of_games_by_season).to eq(expected_season)
        end
    end

    describe "#average_goals_per_game" do
        it 'can calculate the average goals per game' do
            expect(@stat_tracker.average_goals_per_game).to eq(4.4)
        end
    end

    describe "#average_goals_by_season" do
        it 'can calculate the average goals per season' do
            expected = {
            '20122013'=>3.84,
            '20152016'=>4.83,
            '20162017'=>4.75,
            '20172018'=>4.89

        }
            expect(@stat_tracker.average_goals_by_season).to eq(expected)
        end
    end
end