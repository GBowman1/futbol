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

    describe 'Team count' do
        it 'can count the number of teams' do
            expect(@stat_tracker.count_of_teams).to eq(32)
        end
    end

    describe 'Best Offense' do
        it 'can find the best offense' do
            expect(@stat_tracker.best_offense).to eq("FC Dallas")
        end
    end

    describe 'Worst Offense' do
        it 'can find the worst offense' do
            expect(@stat_tracker.worst_offense).to eq("Sporting Kansas City")
        end
    end

    describe 'scoring ranks' do
        it 'can find the the team who scores most when away' do
            expect(@stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
        end

        it 'can find the the team who scores most when home' do
            expect(@stat_tracker.highest_scoring_home_team).to eq("LA Galaxy")
        end

        it 'can find the the team who scores least when away' do
            expect(@stat_tracker.lowest_scoring_visitor).to eq("Sporting Kansas City")
        end

        it 'can find the the team who scores least when home' do
            expect(@stat_tracker.lowest_scoring_home_team).to eq("Sporting Kansas City")
        end
    end

    describe 'Coach Stats' do
        it 'can find the winningest coaches' do
            expect(@stat_tracker.winningest_coach('20122013')).to eq("Claude Julien")
        end
    end

    describe 'worst_coach' do
        it "Name of the Coach with the worst win percentage for the season" do
            expect(@stat_tracker.worst_coach("20122013")).to eq "Paul MacLean"
        end
    end

    describe '#most_accurate_team' do
        it "Name of the Team with the best ratio of shots to goals for the season" do
            expect(@stat_tracker.most_accurate_team("20122013")).to eq "FC Dallas"
        end
    end

    describe '#least_accurate_team' do
        it "Name of the Team with the worst ratio of shots to goals for the season" do
            expect(@stat_tracker.least_accurate_team("20122013")).to eq "Sporting Kansas City"
        end
    end

    describe '#most_tackles' do
        it "Name of the Team with the most tackles in the season" do
            expect(@stat_tracker.most_tackles("20122013")).to eq "FC Dallas"
        end
    end

    describe '#fewest_tackles' do
        it "Name of the Team with the fewest tackles in the season" do
            expect(@stat_tracker.fewest_tackles("20122013")).to eq "New York City FC"
        end
    end

    describe '#calculate_team_tackles' do
        it "calculates the number of tackles for a team" do
            expect(@stat_tracker.calculate_team_tackles("20122013")).to eq ({"16"=>178, "17"=>219, "3"=>179, "5"=>150, "6"=>271, "8"=>61, "9"=>57})
        end
    end

    describe '#calculate_team_accuracy' do
        it "calculates the number of tackles for a team" do
            expect(@stat_tracker.calculate_team_accuracy("20122013")).to eq ({"16"=>{:goals=>10, :shots=>58}, "17"=>{:goals=>13, :shots=>46}, "3"=>{:goals=>8, :shots=>38}, "5"=>{:goals=>2, :shots=>32}, "6"=>{:goals=>24, :shots=>76}, "8"=>{:goals=>5, :shots=>20}, "9"=>{:goals=>3, :shots=>14}})
        end
    end
end